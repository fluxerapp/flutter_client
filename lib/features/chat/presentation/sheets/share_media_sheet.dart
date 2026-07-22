import 'dart:async';
import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/message_character_counter.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/forward_destination_avatar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/chat/providers/messages/forward_destinations_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/service/share_media_sender.dart';
import 'package:fluxer_app/features/chat/utils/slowmode_format.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input_clipboard_scope.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const int kShareMediaSelectionLimit = 5;

/// Opens the share sheet for [files]: a searchable, multi select destination
/// picker (up to [kShareMediaSelectionLimit]) with an optional message.
Future<void> showShareMediaSheet(
  BuildContext context, {
  required List<XFile> files,
  String? initialMessage,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return FluxerBottomSheet.showScrollable<void>(
    context,
    title: l10n.shareMediaTitle,
    builder: (sheetContext, scrollController, close) => _ShareMediaSheetBody(
      files: files,
      initialMessage: initialMessage,
      scrollController: scrollController,
      onClose: close,
    ),
  );
}

class _ShareMediaSheetBody extends ConsumerStatefulWidget {
  const _ShareMediaSheetBody({
    required this.files,
    required this.scrollController,
    required this.onClose,
    this.initialMessage,
  });

  final List<XFile> files;
  final String? initialMessage;
  final ScrollController scrollController;
  final VoidCallback onClose;

  @override
  ConsumerState<_ShareMediaSheetBody> createState() =>
      _ShareMediaSheetBodyState();
}

class _ShareMediaSheetBodyState extends ConsumerState<_ShareMediaSheetBody> {
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _selected = <String>{};
  String _query = '';

  late final ComposerMentionController _messageController;
  final FocusNode _messageFocus = FocusNode();
  final GlobalKey<ComposerAutocompleteFieldState> _messageFieldKey =
      GlobalKey<ComposerAutocompleteFieldState>();
  final GlobalKey<FluxerInputClipboardScopeState> _messageClipboardKey =
      GlobalKey<FluxerInputClipboardScopeState>();
  Timer? _slowmodeTicker;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _messageController = ComposerMentionController(ref: ref);
    final String? initialMessage = widget.initialMessage?.trim();
    if (initialMessage != null && initialMessage.isNotEmpty) {
      _messageController.text = initialMessage;
    }
    _messageFocus.onKeyEvent = (FocusNode node, KeyEvent event) {
      final KeyEventResult clipboardResult =
          _messageClipboardKey.currentState?.handleKeyboardShortcut(event) ??
          KeyEventResult.ignored;
      if (clipboardResult == KeyEventResult.handled) {
        return clipboardResult;
      }
      return handleComposerAutocompleteKey(
        _messageFieldKey.currentState,
        event,
      );
    };
    _searchController.addListener(_onSearchChanged);
    _messageController.addListener(_onMessageChanged);
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    _messageController
      ..removeListener(_onMessageChanged)
      ..dispose();
    _messageFocus.dispose();
    _slowmodeTicker?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    final String next = _searchController.text.trim();
    if (next == _query) {
      return;
    }
    setState(() => _query = next);
  }

  void _onMessageChanged() => setState(() {});

  void _toggle(ForwardDestination destination) {
    if (destination.isPermissionBlocked || _isCoolingDown(destination)) {
      return;
    }
    final bool isSelected = _selected.contains(destination.channelId);
    if (!isSelected && _selected.length >= kShareMediaSelectionLimit) {
      return;
    }
    setState(() {
      if (isSelected) {
        _selected.remove(destination.channelId);
      } else {
        _selected.add(destination.channelId);
      }
    });
  }

  bool _isCoolingDown(ForwardDestination destination) {
    if (!destination.slowmodeEnabled) {
      return false;
    }
    return ref
            .read(slowmodeTrackerProvider.notifier)
            .remainingFor(destination.channelId, destination.rateLimitPerUser) >
        Duration.zero;
  }

  void _ensureSlowmodeTicker({required bool active}) {
    if (active && _slowmodeTicker == null) {
      _slowmodeTicker = Timer.periodic(const Duration(seconds: 1), (_) {
        if (mounted) {
          setState(() {});
        }
      });
      return;
    }
    if (!active && _slowmodeTicker != null) {
      _slowmodeTicker!.cancel();
      _slowmodeTicker = null;
    }
  }

  Future<void> _share(bool messageDisabled) async {
    if (_isSending) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<String> destinations = _selected.toList();
    if (destinations.isEmpty) {
      return;
    }
    final String wireMessage = _messageController.toWireText().trim();
    final String? message = (messageDisabled || wireMessage.isEmpty)
        ? null
        : wireMessage;

    setState(() => _isSending = true);
    try {
      final int sentCount = await ShareMediaSender(
        ref: ref,
      ).send(channelIds: destinations, files: widget.files, message: message);
      if (!mounted) {
        return;
      }
      if (sentCount == destinations.length) {
        _showToast(l10n.shareMediaSuccessToast, FluxerToastVariant.success);
      } else if (sentCount > 0) {
        _showToast(
          l10n.shareMediaPartialSuccessToast(sentCount),
          FluxerToastVariant.warning,
        );
      } else {
        _showToast(l10n.shareMediaFailedToast, FluxerToastVariant.danger);
      }
      widget.onClose();
    } on Object {
      if (!mounted) {
        return;
      }
      _showToast(l10n.shareMediaFailedToast, FluxerToastVariant.danger);
    } finally {
      if (mounted) {
        setState(() => _isSending = false);
      }
    }
  }

  void _showToast(String message, FluxerToastVariant variant) {
    ref
        .read(toastProvider.notifier)
        .show(FluxerToast(message: message, variant: variant));
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    final AsyncValue<List<ForwardDestination>> destinationsAsync = ref.watch(
      forwardDestinationsProvider(
        sourceChannelId: '',
        sourceHasEmbeds: false,
        sourceHasAttachments: widget.files.isNotEmpty,
      ),
    );
    final List<ForwardDestination> allDestinations =
        destinationsAsync.value ?? const <ForwardDestination>[];
    ref.watch(slowmodeTrackerProvider);
    _ensureSlowmodeTicker(
      active: allDestinations.any((ForwardDestination d) => d.slowmodeEnabled),
    );
    final bool messageDisabled = allDestinations.any(
      (ForwardDestination d) =>
          _selected.contains(d.channelId) && d.slowmodeEnabled,
    );

    return Column(
      children: [
        PickerSearchInput(
          controller: _searchController,
          hintText: l10n.forwardSearchHint,
        ),
        Expanded(
          child: destinationsAsync.when(
            skipLoadingOnReload: true,
            data: (List<ForwardDestination> list) =>
                _buildList(context, l10n, list),
            loading: () => const Center(child: FluxerLoadingSpinner()),
            error: (Object _, StackTrace _) => _buildEmpty(context, l10n),
          ),
        ),
        _buildMessageArea(context, l10n, messageDisabled),
      ],
    );
  }

  Widget _buildList(
    BuildContext context,
    FluxerLocalizations l10n,
    List<ForwardDestination> all,
  ) {
    final List<ForwardDestination> filtered = _query.isEmpty
        ? all
        : all.where((ForwardDestination d) {
            final String q = _query.toLowerCase();
            return d.displayName.toLowerCase().contains(q) ||
                (d.guildName ?? '').toLowerCase().contains(q);
          }).toList();
    if (filtered.isEmpty) {
      return _buildEmpty(context, l10n);
    }

    final List<Object> items = _withSectionHeaders(filtered, l10n);
    final bool atCap = _selected.length >= kShareMediaSelectionLimit;

    return ListView.builder(
      controller: widget.scrollController,
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final Object item = items[index];
        if (item is String) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              item,
              style: context.textStyles.label.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          );
        }
        final ForwardDestination destination = item as ForwardDestination;
        final bool isSelected = _selected.contains(destination.channelId);
        final bool disabled =
            destination.isPermissionBlocked ||
            _isCoolingDown(destination) ||
            (!isSelected && atCap) ||
            _isSending;
        return _DestinationTile(
          destination: destination,
          isSelected: isSelected,
          disabled: disabled,
          disableReason: _disableReason(l10n, destination),
          onTap: () => _toggle(destination),
        );
      },
    );
  }

  List<Object> _withSectionHeaders(
    List<ForwardDestination> destinations,
    FluxerLocalizations l10n,
  ) {
    final List<Object> items = <Object>[];
    String? currentSection;
    for (final ForwardDestination d in destinations) {
      final String section = d.isGuildChannel
          ? (d.guildName ?? '')
          : l10n.forwardDirectMessagesSection;
      if (section != currentSection) {
        currentSection = section;
        if (section.isNotEmpty) {
          items.add(section);
        }
      }
      items.add(d);
    }
    return items;
  }

  String? _disableReason(FluxerLocalizations l10n, ForwardDestination d) {
    final String? permissionReason = switch (d.disable) {
      ForwardDestinationDisable.none => null,
      ForwardDestinationDisable.guildSendDisabled =>
        l10n.forwardDestinationGuildSendDisabled,
      ForwardDestinationDisable.memberTimedOut =>
        l10n.forwardDestinationTimedOut,
      ForwardDestinationDisable.noSendPermission =>
        l10n.forwardDestinationNoSendPermission,
      ForwardDestinationDisable.noEmbedPermission =>
        l10n.forwardDestinationNoEmbedPermission,
      ForwardDestinationDisable.noAttachPermission =>
        l10n.forwardDestinationNoAttachPermission,
    };
    if (permissionReason != null) {
      return permissionReason;
    }
    if (_isCoolingDown(d)) {
      final Duration remaining = ref
          .read(slowmodeTrackerProvider.notifier)
          .remainingFor(d.channelId, d.rateLimitPerUser);
      return l10n.forwardDestinationSlowmodeCoolingDown(
        formatSlowmodeCountdown(remaining),
      );
    }
    return null;
  }

  Widget _buildEmpty(BuildContext context, FluxerLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          l10n.forwardEmptyState,
          textAlign: TextAlign.center,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageArea(
    BuildContext context,
    FluxerLocalizations l10n,
    bool messageDisabled,
  ) {
    final int maxMessageLength = ref.watch(maxMessageLengthProvider);
    final int premiumMaxLength = ref.watch(premiumMaxMessageLengthProvider);
    final bool canSend = _selected.isNotEmpty && !_isSending;

    return FluxerBottomSheetFooter(
      showTopBorder: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (messageDisabled)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                l10n.forwardCommentSlowmodeDisabled,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildThumbnail(context),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMessageField(
                  context,
                  l10n,
                  maxMessageLength,
                  messageDisabled,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MessageCharacterCounter(
                currentLength: _messageController.toWireText().trim().length,
                maxLength: maxMessageLength,
                canUpgrade: maxMessageLength < premiumMaxLength,
                premiumMaxLength: premiumMaxLength,
              ),
            ],
          ),
          const SizedBox(height: 12),
          FluxerButton.primary(
            label: l10n.shareMediaSendButton,
            onPressedAsync: canSend ? () => _share(messageDisabled) : null,
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    if (widget.files.isEmpty) {
      return SizedBox(
        width: 48,
        height: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colors.backgroundHeaderSecondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            PhosphorIconsRegular.textAa,
            size: 24,
            color: context.colors.textSecondary,
          ),
        ),
      );
    }
    final XFile firstFile = widget.files.first;
    final bool isImage = _isImageFile(firstFile);

    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: context.colors.backgroundHeaderSecondary,
              borderRadius: BorderRadius.circular(8),
              image: isImage
                  ? DecorationImage(
                      image: FileImage(File(firstFile.path)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: isImage
                ? null
                : Icon(
                    PhosphorIconsRegular.filmStrip,
                    size: 24,
                    color: context.colors.textSecondary,
                  ),
          ),
          if (widget.files.length > 1)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: context.colors.backgroundHeaderSecondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '+${widget.files.length - 1}',
                  style: context.textStyles.label.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  bool _isImageFile(XFile file) {
    final String lower = file.path.toLowerCase();
    return lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.png') ||
        lower.endsWith('.gif') ||
        lower.endsWith('.webp') ||
        lower.endsWith('.heic');
  }

  Widget _buildMessageField(
    BuildContext context,
    FluxerLocalizations l10n,
    int maxMessageLength,
    bool messageDisabled,
  ) {
    final colors = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.chatInputBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.backgroundHeaderSecondary),
      ),
      child: FluxerInputClipboardScope(
        key: _messageClipboardKey,
        controller: _messageController,
        builder:
            (
              BuildContext context,
              FluxerInputClipboardScopeState clipboardScope,
            ) {
              return ComposerAutocompleteField(
                key: _messageFieldKey,
                controller: _messageController,
                focusNode: _messageFocus,
                enabled: !messageDisabled && !_isSending,
                child: TextField(
                  controller: _messageController,
                  focusNode: _messageFocus,
                  enabled: !messageDisabled && !_isSending,
                  style: context.textStyles.inputText,
                  minLines: 1,
                  maxLines: 4,
                  textCapitalization: TextCapitalization.sentences,
                  contextMenuBuilder: clipboardScope.buildContextMenu,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(maxMessageLength),
                  ],
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: l10n.shareMediaMessageHint,
                    hintStyle: context.textStyles.inputHint,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: messageDisabled ? null : _openEmojiPicker,
                        child: Icon(
                          PhosphorIconsFill.smiley,
                          size: 22,
                          color: messageDisabled || _isSending
                              ? colors.textTertiaryMuted
                              : colors.textTertiary,
                        ),
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                    ),
                  ),
                ),
              );
            },
      ),
    );
  }

  void _openEmojiPicker() {
    FocusScope.of(context).unfocus();
    unawaited(
      FluxerEmojiPickerSheet.show(
        context,
        title: FluxerLocalizations.of(context).emojiPickerTitle,
        maxHeight: 0.88,
        visibleTabs: const <ExpressionPickerTab>[ExpressionPickerTab.emojis],
        onEmojiSelected: (FluxerSelectedEmoji emoji) =>
            _messageController.insertEmoji(emoji.name, emoji.surrogates),
      ),
    );
  }
}

class _DestinationTile extends StatelessWidget {
  const _DestinationTile({
    required this.destination,
    required this.isSelected,
    required this.disabled,
    required this.disableReason,
    required this.onTap,
  });

  final ForwardDestination destination;
  final bool isSelected;
  final bool disabled;
  final String? disableReason;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final String? secondary = disableReason ?? destination.guildName;
    final Widget row = Opacity(
      opacity: disabled ? 0.45 : 1,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 56),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              _leading(context),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      destination.displayName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyles.username.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    if (secondary != null && secondary.isNotEmpty)
                      Text(
                        secondary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _checkbox(colors),
            ],
          ),
        ),
      ),
    );
    return FluxerTappable(
      onTap: disabled ? null : onTap,
      enabled: !disabled,
      builder: (BuildContext context, Set<WidgetState> states) => row,
    );
  }

  Widget _leading(BuildContext context) {
    return ForwardDestinationAvatar(destination: destination);
  }

  Widget _checkbox(FluxerColorTheme colors) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? colors.brandPrimary
              : colors.backgroundHeaderSecondary,
          width: 2,
        ),
        color: isSelected ? colors.brandPrimary : Colors.transparent,
      ),
      child: isSelected
          ? const Icon(PhosphorIconsBold.check, size: 14, color: Colors.white)
          : null,
    );
  }
}
