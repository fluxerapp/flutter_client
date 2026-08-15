import 'dart:async';
import 'dart:ui' show BoxWidthStyle;

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/message_character_counter.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/slowmode_send_blocked_notice.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/forward_destination_avatar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/messages/forward_destinations_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/utils/slowmode_format.dart';
import 'package:fluxer_app/features/chat/utils/slowmode_utils.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Maximum number of destinations a single forward may target (web parity).
const int kForwardSelectionLimit = 5;

/// Opens the mobile-first forward sheet for [message]: a searchable,
/// multi-select destination picker (up to [kForwardSelectionLimit]) with an
/// optional rich comment.
Future<void> showForwardMessageSheet(
  BuildContext context, {
  required Message message,
}) {
  return _showForwardSheet(
    context,
    sourceChannelId: message.channelId,
    sourceMessageId: message.id,
    sourceHasEmbeds: messageHasForwardableEmbeds(message),
    sourceHasAttachments: messageHasForwardableAttachments(message),
  );
}

/// Opens the forward sheet to forward specific media (one or more attachments
/// or embeds) from a message, identified by ids. Used by the media viewer's
/// Forward action. Destination gating reflects only the selected media: an
/// attachment selection requires ATTACH_FILES, an embed selection EMBED_LINKS.
Future<void> showForwardMediaSheet(
  BuildContext context, {
  required String sourceChannelId,
  required String sourceMessageId,
  List<String>? attachmentIds,
  List<int>? embedIndices,
}) {
  return _showForwardSheet(
    context,
    sourceChannelId: sourceChannelId,
    sourceMessageId: sourceMessageId,
    sourceHasEmbeds: embedIndices?.isNotEmpty ?? false,
    sourceHasAttachments: attachmentIds?.isNotEmpty ?? false,
    attachmentIds: attachmentIds,
    embedIndices: embedIndices,
  );
}

Future<void> _showForwardSheet(
  BuildContext context, {
  required String sourceChannelId,
  required String sourceMessageId,
  required bool sourceHasEmbeds,
  required bool sourceHasAttachments,
  List<String>? attachmentIds,
  List<int>? embedIndices,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return FluxerBottomSheet.showScrollable<void>(
    context,
    title: l10n.forwardMessageTitle,
    builder: (sheetContext, scrollController, close) =>
        _ForwardMessageSheetBody(
          sourceChannelId: sourceChannelId,
          sourceMessageId: sourceMessageId,
          sourceHasEmbeds: sourceHasEmbeds,
          sourceHasAttachments: sourceHasAttachments,
          attachmentIds: attachmentIds,
          embedIndices: embedIndices,
          scrollController: scrollController,
          onClose: close,
        ),
  );
}

/// Whether the source [message] carries embeds (directly or via a forwarded
/// snapshot), gating EMBED_LINKS on guild destinations.
bool messageHasForwardableEmbeds(Message message) {
  return message.embeds.isNotEmpty ||
      message.messageSnapshots.any((MessageSnapshot s) => s.embeds.isNotEmpty);
}

/// Whether the source [message] carries attachments (directly or via a
/// forwarded snapshot), gating ATTACH_FILES on guild destinations.
bool messageHasForwardableAttachments(Message message) {
  return message.attachments.isNotEmpty ||
      message.messageSnapshots.any(
        (MessageSnapshot s) => s.attachments.isNotEmpty,
      );
}

class _ForwardMessageSheetBody extends ConsumerStatefulWidget {
  const _ForwardMessageSheetBody({
    required this.sourceChannelId,
    required this.sourceMessageId,
    required this.sourceHasEmbeds,
    required this.sourceHasAttachments,
    required this.scrollController,
    required this.onClose,
    this.attachmentIds,
    this.embedIndices,
  });

  final String sourceChannelId;
  final String sourceMessageId;
  final bool sourceHasEmbeds;
  final bool sourceHasAttachments;
  final List<String>? attachmentIds;
  final List<int>? embedIndices;
  final ScrollController scrollController;
  final VoidCallback onClose;

  @override
  ConsumerState<_ForwardMessageSheetBody> createState() =>
      _ForwardMessageSheetBodyState();
}

class _ForwardMessageSheetBodyState
    extends ConsumerState<_ForwardMessageSheetBody> {
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _selected = <String>{};
  String _query = '';

  late final ComposerMentionController _commentController;
  final FocusNode _commentFocus = FocusNode();
  final GlobalKey<ComposerAutocompleteFieldState> _commentFieldKey =
      GlobalKey<ComposerAutocompleteFieldState>();
  Timer? _slowmodeTicker;

  @override
  void initState() {
    super.initState();
    _commentController = ComposerMentionController(ref: ref);
    _commentFocus.onKeyEvent = (FocusNode node, KeyEvent event) {
      return handleComposerAutocompleteKey(
        _commentFieldKey.currentState,
        event,
      );
    };
    _searchController.addListener(_onSearchChanged);
    _commentController.addListener(_onCommentChanged);
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    _commentController
      ..removeListener(_onCommentChanged)
      ..dispose();
    _commentFocus.dispose();
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

  void _onCommentChanged() => setState(() {});

  void _toggle(ForwardDestination destination) {
    if (destination.isPermissionBlocked || _isCoolingDown(destination)) {
      return;
    }
    final bool isSelected = _selected.contains(destination.channelId);
    if (!isSelected && _selected.length >= kForwardSelectionLimit) {
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

  bool _isSendBlockedBySlowmode(List<ForwardDestination> destinations) {
    return isAnySelectedDestinationCoolingDown(
      tracker: ref.read(slowmodeTrackerProvider.notifier),
      destinations: destinations,
      selectedChannelIds: _selected,
    );
  }

  bool _isCoolingDown(ForwardDestination destination) {
    return isForwardDestinationCoolingDown(
      destination: destination,
      tracker: ref.read(slowmodeTrackerProvider.notifier),
    );
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

  String? _sourceGuildId() {
    final Channel? channel = ref
        .read(channelByIdProvider(widget.sourceChannelId))
        .value;
    if (channel == null || channel.guildId.isEmpty) {
      return null;
    }
    return channel.guildId;
  }

  Future<void> _navigateToDestination(String channelId) async {
    final Channel? channel = ref.read(channelByIdProvider(channelId)).value;
    final String? guildId = channel != null && channel.guildId.isNotEmpty
        ? channel.guildId
        : null;
    await navigateToChannelContent(
      context: context,
      ref: ref,
      channelId: channelId,
      guildId: guildId,
      channel: channel,
    );
  }

  Future<void> _forward(bool commentDisabled) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<String> destinations = _selected.toList();
    if (destinations.isEmpty) {
      return;
    }
    final String wireComment = _commentController.toWireText().trim();
    final String? comment = (commentDisabled || wireComment.isEmpty)
        ? null
        : wireComment;
    final String? sourceGuildId = _sourceGuildId();
    try {
      await ref
          .read(messageRepositoryProvider)
          .forwardMessage(
            sourceChannelId: widget.sourceChannelId,
            sourceMessageId: widget.sourceMessageId,
            attachmentIds: widget.attachmentIds,
            embedIndices: widget.embedIndices,
            sourceGuildId: sourceGuildId,
            destinationChannelIds: destinations,
            comment: comment,
          );
      final SlowmodeTracker tracker = ref.read(
        slowmodeTrackerProvider.notifier,
      );
      for (final String id in destinations) {
        tracker.recordSend(id);
      }
      if (!mounted) {
        return;
      }
      await _navigateToDestination(destinations.first);
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.forwardSuccessToast,
              variant: FluxerToastVariant.success,
            ),
          );
      widget.onClose();
    } on Object catch (error) {
      final SlowmodeTracker tracker = ref.read(
        slowmodeTrackerProvider.notifier,
      );
      for (final String channelId in destinations) {
        applySlowmodeRateLimitError(
          tracker: tracker,
          channelId: channelId,
          error: error,
        );
      }
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.forwardFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    final AsyncValue<List<ForwardDestination>> destinationsAsync = ref.watch(
      forwardDestinationsProvider(
        sourceChannelId: widget.sourceChannelId,
        sourceHasEmbeds: widget.sourceHasEmbeds,
        sourceHasAttachments: widget.sourceHasAttachments,
      ),
    );
    final List<ForwardDestination> allDestinations =
        destinationsAsync.value ?? const <ForwardDestination>[];
    ref.watch(slowmodeTrackerProvider);
    _ensureSlowmodeTicker(
      active: allDestinations.any((ForwardDestination d) => d.slowmodeEnabled),
    );
    final bool sendBlockedBySlowmode = _isSendBlockedBySlowmode(
      allDestinations,
    );
    final bool commentDisabled = allDestinations.any(
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
        _buildCommentArea(
          context,
          l10n,
          commentDisabled,
          sendBlockedBySlowmode,
        ),
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
    final bool atCap = _selected.length >= kForwardSelectionLimit;

    return ListView.builder(
      controller: widget.scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.zero,
      ),
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
            (!isSelected && atCap);
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

  Widget _buildCommentArea(
    BuildContext context,
    FluxerLocalizations l10n,
    bool commentDisabled,
    bool sendBlockedBySlowmode,
  ) {
    final int maxMessageLength = ref.watch(maxMessageLengthProvider);
    final int premiumMaxLength = ref.watch(premiumMaxMessageLengthProvider);
    final bool canSend = _selected.isNotEmpty && !sendBlockedBySlowmode;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FluxerBottomSheetFooter(
          showTopBorder: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (commentDisabled)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    l10n.forwardCommentSlowmodeDisabled,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ),
              if (sendBlockedBySlowmode && !commentDisabled)
                const SlowmodeSendBlockedNotice(),
              _buildCommentField(
                context,
                l10n,
                maxMessageLength,
                commentDisabled,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MessageCharacterCounter(
                    currentLength: _commentController
                        .toWireText()
                        .trim()
                        .length,
                    maxLength: maxMessageLength,
                    canUpgrade: maxMessageLength < premiumMaxLength,
                    premiumMaxLength: premiumMaxLength,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              FluxerButton.primary(
                label: l10n.forwardSendButton(
                  _selected.length,
                  kForwardSelectionLimit,
                ),
                onPressedAsync: canSend
                    ? () => _forward(commentDisabled)
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCommentField(
    BuildContext context,
    FluxerLocalizations l10n,
    int maxMessageLength,
    bool commentDisabled,
  ) {
    final colors = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.chatInputBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.backgroundHeaderSecondary),
      ),
      child: FluxerClipboardScope(
        controller: _commentController,
        focusNode: _commentFocus,
        builder:
            (
              BuildContext context,
              FluxerClipboardScopeState clipboardScope,
              FocusNode focusNode,
            ) {
              return ComposerAutocompleteField(
                key: _commentFieldKey,
                controller: _commentController,
                focusNode: focusNode,
                channelId: widget.sourceChannelId,
                enabled: !commentDisabled,
                child: TextField(
                  controller: _commentController,
                  focusNode: focusNode,
                  enabled: !commentDisabled,
                  style: context.textStyles.inputText,
                  minLines: 1,
                  maxLines: 4,
                  selectionWidthStyle: BoxWidthStyle.tight,
                  textCapitalization: TextCapitalization.sentences,
                  contextMenuBuilder: clipboardScope.buildContextMenu,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(maxMessageLength),
                  ],
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: l10n.forwardCommentHint,
                    hintStyle: context.textStyles.inputHint,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    suffixIcon: FluxerGestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: commentDisabled ? null : _openCommentEmojiPicker,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: PhosphorIcon(
                            PhosphorIconsFill.smiley,
                            size: 22,
                            color: commentDisabled
                                ? colors.textTertiaryMuted
                                : colors.textTertiary,
                          ),
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

  void _openCommentEmojiPicker() {
    FocusScope.of(context).unfocus();
    unawaited(
      FluxerEmojiPickerSheet.show(
        context,
        title: FluxerLocalizations.of(context).emojiPickerTitle,
        maxHeight: 0.88,
        channelId: widget.sourceChannelId,
        visibleTabs: const <ExpressionPickerTab>[ExpressionPickerTab.emojis],
        onEmojiSelected: (FluxerSelectedEmoji emoji) =>
            _commentController.insertEmoji(emoji.name, emoji.surrogates),
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
        border: Border.all(
          color: isSelected
              ? colors.brandPrimary
              : colors.backgroundHeaderSecondary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(11),
        color: isSelected ? colors.brandPrimary : Colors.transparent,
      ),
      child: isSelected
          ? Center(
              child: PhosphorIcon(
                PhosphorIconsBold.check,
                size: 13,
                color: colors.textOnBrandPrimary,
              ),
            )
          : null,
    );
  }
}
