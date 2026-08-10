import 'dart:async';
import 'dart:io';
import 'dart:ui' show BoxWidthStyle;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/cloud_composer_attachments.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_attachment_area.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/blocked_user_composer_barrier.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/channel_composer_barrier.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_paste_scope.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_status_row.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/message_character_counter.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/system_dm_composer_barrier.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_composer_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recorder.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/reply_preview.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/guild/guild_composer_access_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_blocked_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_indicator_shake_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_rate_limited_alert_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer_command.dart';
import 'package:fluxer_app/features/chat/utils/composer_emoji_resolution.dart';
import 'package:fluxer_app/features/chat/utils/composer_expression_tabs.dart';
import 'package:fluxer_app/features/chat/utils/composer_scroll.dart';
import 'package:fluxer_app/features/chat/utils/composer_sendable_content.dart';
import 'package:fluxer_app/features/chat/utils/composer_upload_file.dart';
import 'package:fluxer_app/features/chat/utils/composer_voice_button_visibility.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/paste_text_attachment.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_app/shared/utils/keyboard_focus_restore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kComposerDisabledOpacity = 0.6;

const double _kMobileComposerSuffixHorizontalPadding = 7;
const double _kMobileComposerSuffixVerticalPadding = 4;
const double _kMobileComposerSuffixButtonExtent = 32;
const double _kMobileComposerSuffixWidth =
    _kMobileComposerSuffixHorizontalPadding * 2 +
    _kMobileComposerSuffixButtonExtent;
const double _kMobileComposerSuffixHeight =
    _kMobileComposerSuffixVerticalPadding * 2 +
    _kMobileComposerSuffixButtonExtent;
const double _kComposerTopPadding = 8;
const double _kMobileComposerTopPadding = 3;
const double _kDesktopComposerAttachIconSize = 26;
const double _kWideComposerActionExtent = 36;
const double _kWideComposerIconSize = 24;
const double _kTouchComposerActionSpacing = 6;

bool _useMobileAttachmentSheet() {
  return !kIsWeb && (Platform.isIOS || Platform.isAndroid);
}

Widget _composerOpacity({
  required bool enabled,
  required Widget child,
  Key? key,
}) {
  return Opacity(
    key: key,
    opacity: enabled ? 1 : _kComposerDisabledOpacity,
    child: child,
  );
}

TextStyle _composerInputHintStyle(
  BuildContext context, {
  required bool enabled,
}) {
  final TextStyle base = context.textStyles.inputHint;
  final double fontSize = base.fontSize ?? 16;
  return base.copyWith(
    color: enabled
        ? context.colors.textTertiaryMuted
        : context.colors.textTertiary,
    fontSize: enabled ? fontSize : fontSize * 0.875,
    overflow: TextOverflow.ellipsis,
  );
}

OutlineInputBorder _composerTouchInputOutlineBorder(
  BuildContext context, {
  required bool focused,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: BorderSide(
      color: focused
          ? context.colors.backgroundModifierAccentFocus
          : context.colors.backgroundModifierAccent,
    ),
  );
}

InputDecoration _composerTouchInputDecoration({
  required BuildContext context,
  required String hintText,
  required bool enabled,
  EdgeInsetsGeometry? contentPadding,
  Widget? suffixIcon,
  BoxConstraints? suffixIconConstraints,
}) {
  return InputDecoration(
    hintText: hintText,
    hintMaxLines: 1,
    hintStyle: _composerInputHintStyle(context, enabled: enabled),
    filled: true,
    fillColor: context.colors.backgroundTertiary,
    contentPadding:
        contentPadding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    border: _composerTouchInputOutlineBorder(context, focused: false),
    enabledBorder: _composerTouchInputOutlineBorder(context, focused: false),
    focusedBorder: _composerTouchInputOutlineBorder(context, focused: true),
    disabledBorder: _composerTouchInputOutlineBorder(context, focused: false),
    isDense: true,
    suffixIcon: suffixIcon,
    suffixIconConstraints: suffixIconConstraints,
  );
}

final RegExp _customEmojiIdPattern = RegExp(r'<a?:[^:]+:(\d+)>');

final class _CustomEmojiSendContext {
  const _CustomEmojiSendContext({
    required this.markdownByName,
    required this.knownIds,
    required this.usableIds,
  });
  const _CustomEmojiSendContext.empty()
    : markdownByName = const <String, String>{},
      knownIds = const <String>{},
      usableIds = const <String>{};

  final Map<String, String> markdownByName;
  final Set<String> knownIds;
  final Set<String> usableIds;

  String? lookupMarkdown(String nameLower) => markdownByName[nameLower];

  bool blocksContent(String content) {
    if (!content.contains('<') || knownIds.isEmpty) {
      return false;
    }
    for (final RegExpMatch match in _customEmojiIdPattern.allMatches(content)) {
      final String id = match.group(1)!;
      if (knownIds.contains(id) && !usableIds.contains(id)) {
        return true;
      }
    }
    return false;
  }
}

/// The chat input bar at the bottom of the chat area.
class ChannelTextarea extends ConsumerStatefulWidget {
  const ChannelTextarea({
    this.autocompletePanelHost,
    this.autocompletePanelScrollController,
    super.key,
  });

  final ComposerAutocompletePanelHost? autocompletePanelHost;
  final ScrollController? autocompletePanelScrollController;

  @override
  ConsumerState<ChannelTextarea> createState() => _ChannelTextareaState();
}

class _ChannelTextareaState extends ConsumerState<ChannelTextarea>
    with WidgetsBindingObserver {
  late final ComposerMentionController _controller;
  final FocusNode _focusNode = FocusNode();
  late final KeyboardFocusRestoreHandle _keyboardRestore;
  final ScrollController _composerScrollController = ScrollController();
  final GlobalKey<ComposerAutocompleteFieldState> _composerFieldKey =
      GlobalKey<ComposerAutocompleteFieldState>();
  final GlobalKey<ComposerPasteScopeState> _pasteScopeKey =
      GlobalKey<ComposerPasteScopeState>();
  final _expressionPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();
  final _gifPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();
  final _mediaPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();
  final _stickerPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();

  bool _enterToSendEnabled = false;
  bool _isApplyingWireText = false;
  String? _lastWireTextPushedToState;

  bool get _isDesktop => isFluxerDesktopOs;

  Widget _wideComposerIconButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback? onPressed,
    String? tooltip,
    double iconSize = _kWideComposerIconSize,
  }) {
    return IconButton(
      icon: PhosphorIcon(icon, size: iconSize),
      color: context.colors.interactiveNormal,
      tooltip: tooltip,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(
        minWidth: _kWideComposerActionExtent,
        minHeight: _kWideComposerActionExtent,
      ),
    );
  }

  Widget _buildComposerActionButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback? onPressed,
    String? tooltip,
    double iconSize = _kWideComposerIconSize,
    FluxerButtonSize touchSize = FluxerButtonSize.small,
    bool leadingTouchGap = false,
  }) {
    final Widget button = isTouchPrimaryInput(ref)
        ? FluxerButton.circleAlt(
            icon: icon,
            size: touchSize,
            iconSize: iconSize,
            semanticLabel: tooltip,
            onPressed: onPressed,
          )
        : _wideComposerIconButton(
            context: context,
            icon: icon,
            iconSize: iconSize,
            tooltip: tooltip,
            onPressed: onPressed,
          );
    final Widget wrapped = _composerOpacity(
      enabled: onPressed != null,
      child: button,
    );
    if (!leadingTouchGap) {
      return wrapped;
    }
    return Padding(
      padding: const EdgeInsets.only(left: _kTouchComposerActionSpacing),
      child: wrapped,
    );
  }

  bool _touchGapBeforeWideExpressionButton(
    List<ExpressionPickerTab> visibleTabs,
    ExpressionPickerTab tab,
  ) {
    if (!isTouchPrimaryInput(ref)) {
      return false;
    }
    const List<ExpressionPickerTab> order = <ExpressionPickerTab>[
      ExpressionPickerTab.gifs,
      ExpressionPickerTab.memes,
      ExpressionPickerTab.stickers,
      ExpressionPickerTab.emojis,
    ];
    final int index = order.indexOf(tab);
    for (int i = 0; i < index; i++) {
      if (visibleTabs.contains(order[i])) {
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _keyboardRestore = KeyboardFocusRestoreHandle(
      focusNode: _focusNode,
      shouldTrackOnBackground: _shouldTrackKeyboardRestore,
      canRestoreFocus: _canRestoreKeyboardFocus,
    );
    WidgetsBinding.instance.addObserver(this);
    _controller = ComposerMentionController(ref: ref);
    _focusNode.onKeyEvent = _handleComposerFieldKeyEvent;
    _controller.addListener(_syncStateFromController);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _keyboardRestore.handleLifecycleState(state);
  }

  bool _shouldTrackKeyboardRestore() {
    if (!mounted || !isMobileLayout(context)) {
      return false;
    }
    if (ref.read(expressionPanelProvider)) {
      return false;
    }
    if (!_focusNode.canRequestFocus) {
      return false;
    }
    if (_focusNode.hasFocus) {
      return true;
    }
    return ref.read(mobileKeyboardMetricsProvider).isKeyboardVisible;
  }

  bool _canRestoreKeyboardFocus() {
    if (!mounted || !isMobileLayout(context)) {
      return false;
    }
    if (ref.read(expressionPanelProvider)) {
      return false;
    }
    return _focusNode.canRequestFocus;
  }

  void _syncStateFromController() {
    if (_isApplyingWireText) {
      return;
    }
    final String wire = stripPrivateUseCharacters(_controller.toWireText());
    if (wire == _lastWireTextPushedToState) {
      return;
    }
    _lastWireTextPushedToState = wire;
    ref.read(chatViewModelProvider.notifier).updateMessageText(wire);
  }

  void _syncControllerFromStateIfNeeded() {
    if (_isApplyingWireText) {
      return;
    }
    final String messageText = ref.read(chatViewModelProvider).messageText;
    if (messageText == _lastWireTextPushedToState) {
      return;
    }
    final String wire = stripPrivateUseCharacters(messageText);
    if (wire == _lastWireTextPushedToState ||
        _controller.toWireText() == wire) {
      _lastWireTextPushedToState = wire;
      return;
    }
    unawaited(_applyWireTextFromState(wire));
  }

  Future<void> _applyWireTextFromState(String wire) async {
    _isApplyingWireText = true;
    try {
      await _controller.applyWireText(wire);
      _lastWireTextPushedToState = wire;
    } finally {
      _isApplyingWireText = false;
    }
  }

  String _sendableWireText() =>
      stripPrivateUseCharacters(_controller.toWireText());

  Duration? _activeSlowmodeRemainingForSend(String channelId) {
    final Channel? channel = ref.read(channelByIdProvider(channelId)).value;
    final int rateLimit = channel?.rateLimitPerUser ?? 0;
    if (rateLimit <= 0) {
      return null;
    }
    final int? cachedBits = ref.read(channelPermissionCacheProvider)[channelId];
    if (cachedBits != null && bypassesSlowmode(cachedBits)) {
      return null;
    }
    final Duration remaining = ref
        .read(slowmodeTrackerProvider.notifier)
        .remainingFor(channelId, rateLimit);
    return remaining > Duration.zero ? remaining : null;
  }

  void _showCorruptedCustomEmojiToast() {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.composerEmojiUnavailable,
            variant: FluxerToastVariant.warning,
          ),
        );
  }

  void _clearComposerForBlockedAccess() {
    _focusNode.unfocus();
    if (_controller.toWireText().isNotEmpty) {
      _controller.clear();
      ref.read(chatViewModelProvider.notifier).updateMessageText('');
    }
    final ChatViewModel chatNotifier = ref.read(chatViewModelProvider.notifier);
    if (ref.read(chatViewModelProvider).replyingTo != null) {
      chatNotifier.cancelReply();
    }
    if (ref.read(chatViewModelProvider).editingMessage != null) {
      chatNotifier.cancelEdit();
    }
  }

  Future<void> _handleUnblock(
    BuildContext context,
    String userId,
    String username,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool? confirmed = isMobileLayout(context)
        ? await FluxerConfirmSheet.show(
            context,
            title: l10n.blockedUsersUnblockTitle,
            description: l10n.blockedUsersUnblockDescription(username),
            confirmLabel: l10n.blockedUserComposerBarrierAction,
            onConfirm: () {},
          )
        : await FluxerConfirmModal.show(
            context,
            title: l10n.blockedUsersUnblockTitle,
            description: l10n.blockedUsersUnblockDescription(username),
            confirmLabel: l10n.blockedUserComposerBarrierAction,
            onConfirm: () {},
          );
    if (confirmed != true || !mounted) {
      return;
    }
    try {
      await ref.read(friendRepositoryProvider).removeRelationship(userId);
    } on Object catch (_) {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.dmUnblockFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _focusNode
      ..unfocus()
      ..dispose();
    _composerScrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  /// Enter sends, Shift+Enter inserts newline.
  KeyEventResult _handleComposerFieldKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.escape) {
      final bool escapeExitsKeyboardMode = ref.read(
        appearancePreferencesProvider.select((s) => s.escapeExitsKeyboardMode),
      );
      if (escapeExitsKeyboardMode) {
        node.unfocus();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.keyV &&
        (HardwareKeyboard.instance.isMetaPressed ||
            HardwareKeyboard.instance.isControlPressed)) {
      unawaited(_pasteScopeKey.currentState?.handlePaste());
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.keyC &&
        (HardwareKeyboard.instance.isMetaPressed ||
            HardwareKeyboard.instance.isControlPressed)) {
      unawaited(_pasteScopeKey.currentState?.handleCopy());
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.keyX &&
        (HardwareKeyboard.instance.isMetaPressed ||
            HardwareKeyboard.instance.isControlPressed)) {
      unawaited(_pasteScopeKey.currentState?.handleCut());
      return KeyEventResult.handled;
    }
    if (!_enterToSendEnabled) {
      return KeyEventResult.ignored;
    }
    final KeyEventResult navResult = handleComposerAutocompleteKey(
      _composerFieldKey.currentState,
      event,
    );
    if (navResult == KeyEventResult.handled) {
      return navResult;
    }
    if (!isComposerSubmitKey(event.logicalKey)) {
      return KeyEventResult.ignored;
    }
    if (event is KeyRepeatEvent) {
      return KeyEventResult.handled;
    }
    if (HardwareKeyboard.instance.isShiftPressed) {
      return KeyEventResult.ignored;
    }
    final channelId = ref.read(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final ChannelMessagePermissions perms =
        readChannelMessagePermissionsForComposer(ref, channelId);
    if (!perms.isComposerEnabled) {
      return KeyEventResult.ignored;
    }
    if (!composerHasSendableContent(ref, channelId, _sendableWireText())) {
      return KeyEventResult.ignored;
    }
    if (_isOverCharacterLimit(ref)) {
      return KeyEventResult.ignored;
    }
    unawaited(_onSendPressed());
    return KeyEventResult.handled;
  }

  int _composerContentLength(String sendableWire) => sendableWire.trim().length;

  bool _isOverCharacterLimit(WidgetRef ref) {
    final int maxMessageLength = ref.read(maxMessageLengthProvider);
    return _composerContentLength(_sendableWireText()) > maxMessageLength;
  }

  void _showPlutoniumSheet(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    unawaited(
      FluxerBottomSheet.show<void>(
        context,
        title: l10n.plutoniumNotAvailableTitle,
        builder: (sheetContext, _) => Padding(
          padding: EdgeInsets.all(sheetContext.layout.s4),
          child: Text(
            l10n.plutoniumNotAvailableBody,
            style: sheetContext.textStyles.bodyMedium.copyWith(
              color: sheetContext.colors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handlePasteExceedsLimit(
    String pastedText,
    String channelId,
  ) async {
    final FileUploadValidationResult result = await addPastedTextAsAttachment(
      ref: ref,
      channelId: channelId,
      text: pastedText,
    );
    if (mounted) {
      _toastUploadValidation(result);
    }
  }

  Widget _buildComposerField({
    required BuildContext context,
    required String channelId,
    required ChannelMessagePermissions perms,
    required int maxMessageLength,
    required int premiumMaxLength,
    required InputDecoration decoration,
    required int minLines,
    required int maxLines,
    TextAlignVertical? textAlignVertical,
  }) {
    final EdgeInsets basePadding = decoration.contentPadding is EdgeInsets
        ? decoration.contentPadding! as EdgeInsets
        : const EdgeInsets.symmetric(horizontal: 12, vertical: 10);
    final bool canUpgrade =
        maxMessageLength < premiumMaxLength &&
        ref.watch(shouldShowPremiumCommerceProvider);
    return ComposerPasteScope(
      key: _pasteScopeKey,
      channelId: channelId,
      controller: _controller,
      isAttachEnabled: perms.isAttachEnabled,
      maxMessageLength: maxMessageLength,
      canAttachOnExceed: () =>
          perms.canShowAttachControls && perms.isAttachEnabled,
      onPasteExceedsLimit: (String pastedText) =>
          unawaited(_handlePasteExceedsLimit(pastedText, channelId)),
      onValidationResult: _toastUploadValidation,
      builder: (BuildContext context, ComposerPasteScopeState pasteScope) {
        return ListenableBuilder(
          listenable: _controller,
          builder: (BuildContext context, Widget? child) {
            final int contentLength = _composerContentLength(
              _sendableWireText(),
            );
            final bool showCounter =
                contentLength > (maxMessageLength * 0.8).floor();
            final InputDecoration effectiveDecoration = decoration.copyWith(
              contentPadding: showCounter
                  ? basePadding + const EdgeInsets.only(right: 28, bottom: 18)
                  : basePadding,
            );
            return Stack(
              clipBehavior: Clip.none,
              children: [
                _composerOpacity(
                  enabled: perms.isComposerEnabled,
                  child: Semantics(
                    label: _resolveHintText(),
                    textField: true,
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      scrollController: _composerScrollController,
                      enabled: perms.isComposerEnabled,
                      style: context.textStyles.inputText,
                      minLines: minLines,
                      maxLines: maxLines,
                      selectionWidthStyle: BoxWidthStyle.tight,
                      decoration: effectiveDecoration,
                      textAlignVertical: textAlignVertical,
                      textCapitalization: TextCapitalization.sentences,
                      contextMenuBuilder: pasteScope.buildContextMenu,
                      onTap: () {
                        if (ref.read(expressionPanelProvider)) {
                          _closeExpressionPanelAndFocusComposer();
                        }
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: MessageCharacterCounter(
                    currentLength: contentLength,
                    maxLength: maxMessageLength,
                    canUpgrade: canUpgrade,
                    premiumMaxLength: premiumMaxLength,
                    onUpgradePressed: () => _showPlutoniumSheet(context),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _enterToSendEnabled = _isDesktop || (kIsWeb && isWideLayout(context));
    ref
      ..listen<String>(
        chatViewModelProvider.select((state) => state.messageText),
        (_, String _) => _syncControllerFromStateIfNeeded(),
      )
      ..listen<({String name, String surrogates})?>(
        pendingEmojiInsertProvider,
        (_, pending) {
          if (pending == null) {
            return;
          }
          ref.read(pendingEmojiInsertProvider.notifier).consume();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) {
              return;
            }
            _insertEmoji(pending.name, pending.surrogates);
          });
        },
      )
      ..listen<FluxerSelectedGif?>(pendingGifSelectionProvider, (_, pending) {
        if (pending == null) {
          return;
        }
        ref.read(pendingGifSelectionProvider.notifier).consume();
        _handleGifSelection(pending);
      })
      ..listen<StickerEntry?>(pendingStickerSelectionProvider, (_, pending) {
        if (pending == null) {
          return;
        }
        ref.read(pendingStickerSelectionProvider.notifier).consume();
        _handleStickerSelection(pending);
      })
      ..listen<FavoriteMemeSelection?>(pendingFavoriteMemeSelectionProvider, (
        _,
        pending,
      ) {
        if (pending == null) {
          return;
        }
        ref.read(pendingFavoriteMemeSelectionProvider.notifier).consume();
        _handleFavoriteMemeSelection(pending);
      })
      ..listen<Message?>(
        chatViewModelProvider.select((ChatViewState state) => state.replyingTo),
        (Message? previous, Message? next) {
          if (next != null && previous == null) {
            _focusComposerAfterReplyOrEdit(forEdit: false);
          }
        },
      )
      ..listen<Message?>(
        chatViewModelProvider.select(
          (ChatViewState state) => state.editingMessage,
        ),
        (Message? previous, Message? next) {
          if (next != null && previous == null) {
            _focusComposerAfterReplyOrEdit(forEdit: true);
          }
        },
      );

    final channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final dm = findDmById(
      ref.watch(dmViewModelProvider.select((s) => s.conversations)),
      channelId,
    );
    if (dm != null && isSystemDmConversation(dm)) {
      return const SystemDmComposerBarrier();
    }
    final Set<String> blockedUserIds = ref.watch(blockedUserIdsProvider);
    final bool isBlockedDmRecipient =
        dm != null &&
        !dm.isGroup &&
        !dm.isPersonalNotes &&
        blockedUserIds.contains(dm.recipientId);
    ref
      ..listen<Set<String>>(blockedUserIdsProvider, (
        Set<String>? previous,
        Set<String> next,
      ) {
        if (dm == null || dm.isGroup || dm.isPersonalNotes) {
          return;
        }
        final bool wasBlocked = previous?.contains(dm.recipientId) ?? false;
        final bool isBlocked = next.contains(dm.recipientId);
        if (!wasBlocked && isBlocked) {
          _clearComposerForBlockedAccess();
        }
      })
      ..listen<String>(
        chatViewModelProvider.select((ChatViewState state) => state.channelId),
        (String? previous, String next) {
          final DmConversation? nextDm = findDmById(
            ref.read(
              dmViewModelProvider.select(
                (DmViewState state) => state.conversations,
              ),
            ),
            next,
          );
          if (nextDm == null || nextDm.isGroup || nextDm.isPersonalNotes) {
            return;
          }
          final Set<String> blocked = ref.read(blockedUserIdsProvider);
          if (blocked.contains(nextDm.recipientId)) {
            _clearComposerForBlockedAccess();
          }
        },
      );
    if (isBlockedDmRecipient) {
      return BlockedUserComposerBarrier(
        username: dm.recipientName,
        onUnblock: () => unawaited(
          _handleUnblock(context, dm.recipientId, dm.recipientName),
        ),
      );
    }
    final AsyncValue<GuildComposerAccess> composerAccessAsync = ref.watch(
      guildComposerAccessProvider(channelId),
    );
    ref.listen<AsyncValue<GuildComposerAccess>>(
      guildComposerAccessProvider(channelId),
      (
        AsyncValue<GuildComposerAccess>? previous,
        AsyncValue<GuildComposerAccess> next,
      ) {
        final bool? wasAllowed = previous?.value?.canAccess;
        final bool isAllowed = next.value?.canAccess ?? true;
        if ((wasAllowed ?? true) && !isAllowed) {
          _clearComposerForBlockedAccess();
        }
      },
    );

    final GuildComposerAccess composerAccess = composerAccessAsync.when(
      skipLoadingOnReload: true,
      data: (GuildComposerAccess value) => value,
      error: (Object _, StackTrace _) => GuildComposerAccess.allowed,
      loading: () => GuildComposerAccess.allowed,
    );
    if (!composerAccess.canAccess) {
      return ChannelComposerBarrier(access: composerAccess);
    }

    final chatNotifier = ref.read(chatViewModelProvider.notifier);
    final Message? replyTo = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.replyingTo),
    );
    final Message? editingMessage = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.editingMessage),
    );
    final bool replyMentioning = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.replyMentioning),
    );
    final ChannelMessagePermissions perms =
        watchChannelMessagePermissionsForComposer(ref, channelId);
    final String guildId = ref.watch(
      channelListViewModelProvider.select(
        (ChannelListState state) =>
            findChannelById(state, channelId)?.guildId ?? '',
      ),
    );
    final bool mobileComposer = isMobileLayout(context);
    final bool isPanelOpen = ref.watch(expressionPanelProvider);
    final double bottomSlotHeight = ref.watch(
      bottomInputSlotProvider.select(
        (BottomInputSlotState state) => state.slotHeight,
      ),
    );
    final bool showComposerSafeBar =
        MediaQuery.paddingOf(context).bottom > 0 &&
        bottomSlotHeight <= 0 &&
        !isPanelOpen;
    final Color composerBackgroundColor = mobileComposer
        ? context.colors.chatInputBackground
        : context.colors.backgroundSecondaryLighter;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (replyTo != null)
          ReplyInputBar(
            replyTo: replyTo,
            guildId: guildId,
            shouldReplyMention: replyMentioning,
            onToggleMention: (bool mentioning) =>
                chatNotifier.setReplyMentioning(mentioning: mentioning),
            onCancel: chatNotifier.cancelReply,
          ),
        if (editingMessage != null)
          EditingInputBar(onCancel: chatNotifier.cancelEdit),
        ChannelAttachmentArea(channelId: channelId),
        DecoratedBox(
          decoration: BoxDecoration(
            color: composerBackgroundColor,
            border: Border(
              top: BorderSide(color: context.colors.userAreaDividerColor),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              mobileComposer ? 8 : 12,
              mobileComposer
                  ? _kMobileComposerTopPadding
                  : _kComposerTopPadding,
              mobileComposer ? 8 : 12,
              mobileComposer ? 8 : 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (mobileComposer) const ComposerStatusRow(),
                _buildComposerInput(
                  context: context,
                  chatNotifier: chatNotifier,
                  perms: perms,
                  channelId: channelId,
                  isPanelOpen: isPanelOpen,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: showComposerSafeBar
              ? MediaQuery.paddingOf(context).bottom
              : 0,
          decoration: BoxDecoration(color: composerBackgroundColor),
        ),
      ],
    );
  }

  String _resolveHintText() {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isEditing = ref.read(
      chatViewModelProvider.select((s) => s.editingMessage != null),
    );
    if (isEditing) {
      return l10n.chatEditMessageHint;
    }
    final channelId = ref.read(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final channelState = ref.read(channelListViewModelProvider);
    final channel = findChannelById(channelState, channelId);
    if (channel != null) {
      return l10n.channelComposerHint(channel.name);
    }
    final conversations = ref.read(
      dmViewModelProvider.select((s) => s.conversations),
    );
    final dm = findDmById(conversations, channelId);
    if (dm != null) {
      if (dm.isPersonalNotes) {
        return l10n.personalNotesComposerHint;
      }
      if (dm.isGroup) {
        final String? groupName = dm.name?.trim();
        if (groupName != null && groupName.isNotEmpty) {
          return l10n.groupDmNamedComposerHint(groupName);
        }
        return l10n.groupDmComposerHint;
      }
      return l10n.dmComposerHint(dm.recipientName);
    }
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (currentUserId != null && channelId == currentUserId) {
      return l10n.personalNotesComposerHint;
    }
    return l10n.composerHint;
  }

  Widget _buildLargeLayout(
    BuildContext context,
    ChatViewModel chatNotifier,
    ChannelMessagePermissions perms,
  ) {
    final String channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    ref.watch(
      cloudUploadControllerProvider(
        channelId,
      ).select((CloudComposerAttachments a) => a.items.length),
    );
    final int maxMessageLength = ref.watch(maxMessageLengthProvider);
    final int premiumMaxLength = ref.watch(premiumMaxMessageLengthProvider);
    final (
      bool showGifButton,
      bool showMemesButton,
      bool showStickersButton,
      bool showEmojiButton,
    ) = ref.watch(
      advancedPreferencesProvider.select(
        (AdvancedPreferencesState s) => (
          s.showGifButton,
          s.showMemesButton,
          s.showStickersButton,
          s.showEmojiButton,
        ),
      ),
    );
    final AdvancedPreferencesState composerButtonPrefs =
        AdvancedPreferencesState(
          showGifButton: showGifButton,
          showMemesButton: showMemesButton,
          showStickersButton: showStickersButton,
          showEmojiButton: showEmojiButton,
        );
    final bool showTextareaFocusRing = ref.watch(
      appearancePreferencesProvider.select((s) => s.showTextareaFocusRing),
    );
    final List<ExpressionPickerTab> composerButtonTabs =
        composerInputButtonVisibleTabs(
          perms: perms,
          advanced: composerButtonPrefs,
        );
    final List<ExpressionPickerTab> popoutTabs = expressionPanelVisibleTabs(
      perms,
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool touchInputStyle = isTouchPrimaryInput(ref);
    final bool touchActions = touchInputStyle;
    final bool composerEnabled = perms.isComposerEnabled;
    final String hintText = perms.showsNoSendPermissionHint
        ? l10n.channelNoSendPermissionHint
        : _resolveHintText();
    final InputDecoration inputDecoration = touchInputStyle
        ? _composerTouchInputDecoration(
            context: context,
            hintText: hintText,
            enabled: composerEnabled,
          )
        : InputDecoration(
            hintText: hintText,
            hintMaxLines: 1,
            hintStyle: _composerInputHintStyle(
              context,
              enabled: composerEnabled,
            ),
            filled: false,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: showTextareaFocusRing
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: context.colors.backgroundModifierAccentFocus,
                    ),
                  )
                : InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 2),
            isDense: true,
          );
    return Row(
      children: [
        if (perms.canShowAttachControls) ...[
          _buildComposerActionButton(
            context: context,
            icon: touchActions
                ? PhosphorIconsBold.plus
                : PhosphorIconsFill.plusCircle,
            iconSize: touchActions ? 20 : _kDesktopComposerAttachIconSize,
            tooltip: l10n.chatAttachmentSourceBrowse,
            onPressed: perms.isAttachEnabled
                ? () => unawaited(_pickAttachments(context))
                : null,
          ),
          SizedBox(width: touchActions ? _kTouchComposerActionSpacing : 8),
        ],
        Expanded(
          child: _buildComposerField(
            context: context,
            channelId: channelId,
            perms: perms,
            maxMessageLength: maxMessageLength,
            premiumMaxLength: premiumMaxLength,
            minLines: 1,
            maxLines: 5,
            decoration: inputDecoration,
          ),
        ),
        SizedBox(width: touchActions ? _kTouchComposerActionSpacing : 4),
        ListenableBuilder(
          listenable: _controller,
          builder: (BuildContext context, Widget? child) {
            final String sendableWire = _sendableWireText();
            final bool hasSendable = composerHasSendableContent(
              ref,
              channelId,
              sendableWire,
            );
            final bool isOverCharacterLimit =
                _composerContentLength(sendableWire) > maxMessageLength;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!hasSendable)
                  _buildLargeExpressionPickerActions(
                    context: context,
                    channelId: channelId,
                    perms: perms,
                    composerButtonTabs: composerButtonTabs,
                    popoutTabs: popoutTabs,
                  ),
                if (!touchActions)
                  SizedBox(
                    height: _kWideComposerActionExtent,
                    child: VerticalDivider(
                      color: context.colors.borderColor,
                      width: 16,
                      thickness: 1,
                    ),
                  )
                else
                  const SizedBox(width: _kTouchComposerActionSpacing),
                Padding(
                  padding: EdgeInsets.only(
                    left: touchActions && hasSendable
                        ? _kTouchComposerActionSpacing
                        : 0,
                  ),
                  child: _sendAndVoiceButton(
                    context,
                    chatNotifier,
                    perms: perms,
                    hasSendable: hasSendable,
                    isOverCharacterLimit: isOverCharacterLimit,
                    useHoldToRecord: false,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildLargeExpressionPickerActions({
    required BuildContext context,
    required String channelId,
    required ChannelMessagePermissions perms,
    required List<ExpressionPickerTab> composerButtonTabs,
    required List<ExpressionPickerTab> popoutTabs,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (composerButtonTabs.contains(ExpressionPickerTab.gifs))
          FluxerEmojiPickerPopout(
            key: _gifPickerKey,
            initialTab: ExpressionPickerTab.gifs,
            visibleTabs: popoutTabs,
            channelId: channelId,
            onEmojiSelected: (emoji) =>
                _insertEmoji(emoji.name, emoji.surrogates),
            onGifSelected: _handleGifSelection,
            onStickerSelected: (sticker) {
              _handleStickerSelection(sticker);
              _gifPickerKey.currentState?.close();
            },
            onFavoriteMemeSelected: (selection) {
              _handleFavoriteMemeSelection(selection);
              if (selection.autoSend) {
                _gifPickerKey.currentState?.close();
              }
            },
            child: _buildComposerActionButton(
              context: context,
              icon: PhosphorIconsFill.gif,
              tooltip: FluxerLocalizations.of(context).emojiTabGifs,
              leadingTouchGap: _touchGapBeforeWideExpressionButton(
                composerButtonTabs,
                ExpressionPickerTab.gifs,
              ),
              onPressed: perms.isComposerEnabled
                  ? () => _gifPickerKey.currentState?.toggle()
                  : null,
            ),
          ),
        if (composerButtonTabs.contains(ExpressionPickerTab.memes))
          FluxerEmojiPickerPopout(
            key: _mediaPickerKey,
            initialTab: ExpressionPickerTab.memes,
            visibleTabs: popoutTabs,
            channelId: channelId,
            onEmojiSelected: (emoji) =>
                _insertEmoji(emoji.name, emoji.surrogates),
            onGifSelected: _handleGifSelection,
            onStickerSelected: (sticker) {
              _handleStickerSelection(sticker);
              _mediaPickerKey.currentState?.close();
            },
            onFavoriteMemeSelected: (selection) {
              _handleFavoriteMemeSelection(selection);
              if (selection.autoSend) {
                _mediaPickerKey.currentState?.close();
              }
            },
            child: _buildComposerActionButton(
              context: context,
              icon: PhosphorIconsFill.image,
              tooltip: FluxerLocalizations.of(context).emojiTabMedia,
              leadingTouchGap: _touchGapBeforeWideExpressionButton(
                composerButtonTabs,
                ExpressionPickerTab.memes,
              ),
              onPressed: perms.isComposerEnabled
                  ? () => _mediaPickerKey.currentState?.toggle()
                  : null,
            ),
          ),
        if (composerButtonTabs.contains(ExpressionPickerTab.stickers))
          FluxerEmojiPickerPopout(
            key: _stickerPickerKey,
            initialTab: ExpressionPickerTab.stickers,
            visibleTabs: popoutTabs,
            channelId: channelId,
            onEmojiSelected: (emoji) =>
                _insertEmoji(emoji.name, emoji.surrogates),
            onGifSelected: _handleGifSelection,
            onStickerSelected: (sticker) {
              _handleStickerSelection(sticker);
              _stickerPickerKey.currentState?.close();
            },
            onFavoriteMemeSelected: (selection) {
              _handleFavoriteMemeSelection(selection);
              if (selection.autoSend) {
                _stickerPickerKey.currentState?.close();
              }
            },
            child: _buildComposerActionButton(
              context: context,
              icon: PhosphorIconsFill.sticker,
              tooltip: FluxerLocalizations.of(context).emojiTabStickers,
              leadingTouchGap: _touchGapBeforeWideExpressionButton(
                composerButtonTabs,
                ExpressionPickerTab.stickers,
              ),
              onPressed: perms.isComposerEnabled
                  ? () => _stickerPickerKey.currentState?.toggle()
                  : null,
            ),
          ),
        if (composerButtonTabs.contains(ExpressionPickerTab.emojis))
          FluxerEmojiPickerPopout(
            key: _expressionPickerKey,
            visibleTabs: popoutTabs,
            channelId: channelId,
            onEmojiSelected: (emoji) =>
                _insertEmoji(emoji.name, emoji.surrogates),
            onGifSelected: _handleGifSelection,
            onStickerSelected: (sticker) {
              _handleStickerSelection(sticker);
              _expressionPickerKey.currentState?.close();
            },
            onFavoriteMemeSelected: (selection) {
              _handleFavoriteMemeSelection(selection);
              if (selection.autoSend) {
                _expressionPickerKey.currentState?.close();
              }
            },
            child: _buildComposerActionButton(
              context: context,
              icon: PhosphorIconsFill.smiley,
              tooltip: FluxerLocalizations.of(context).emojiTabEmojis,
              leadingTouchGap: _touchGapBeforeWideExpressionButton(
                composerButtonTabs,
                ExpressionPickerTab.emojis,
              ),
              onPressed: perms.isComposerEnabled
                  ? () => _expressionPickerKey.currentState?.toggle()
                  : null,
            ),
          ),
      ],
    );
  }

  Widget _buildComposerInput({
    required BuildContext context,
    required ChatViewModel chatNotifier,
    required ChannelMessagePermissions perms,
    required String channelId,
    required bool isPanelOpen,
  }) {
    final Widget composerField = ComposerAutocompleteField(
      key: _composerFieldKey,
      controller: _controller,
      focusNode: _focusNode,
      channelId: channelId,
      enabled: perms.isComposerEnabled,
      renderMode: widget.autocompletePanelHost != null
          ? AutocompleteRenderMode.inStack
          : AutocompleteRenderMode.overlay,
      panelHost: widget.autocompletePanelHost,
      panelScrollController: widget.autocompletePanelScrollController,
      child: isMobileLayout(context)
          ? _buildMobileLayout(context, chatNotifier, perms)
          : _buildLargeLayout(context, chatNotifier, perms),
    );
    if (!isMobileLayout(context) || !isPanelOpen) {
      return composerField;
    }
    return ExcludeFocus(child: composerField);
  }

  Widget _buildMobileLayout(
    BuildContext context,
    ChatViewModel chatNotifier,
    ChannelMessagePermissions perms,
  ) {
    final String channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    ref.watch(
      cloudUploadControllerProvider(
        channelId,
      ).select((CloudComposerAttachments a) => a.items.length),
    );

    final int maxMessageLength = ref.watch(maxMessageLengthProvider);
    final int premiumMaxLength = ref.watch(premiumMaxMessageLengthProvider);
    final InputDecoration mobileDecoration = _composerTouchInputDecoration(
      context: context,
      hintText: perms.showsNoSendPermissionHint
          ? FluxerLocalizations.of(context).channelNoSendPermissionHint
          : _resolveHintText(),
      enabled: perms.isComposerEnabled,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      suffixIcon: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: _kMobileComposerSuffixVerticalPadding,
          horizontal: _kMobileComposerSuffixHorizontalPadding,
        ),
        child: _buildMobilePickerButton(context, perms),
      ),
      suffixIconConstraints: const BoxConstraints(
        minWidth: _kMobileComposerSuffixWidth,
        maxWidth: _kMobileComposerSuffixWidth,
        minHeight: _kMobileComposerSuffixHeight,
        maxHeight: _kMobileComposerSuffixHeight,
      ),
    );
    return Row(
      children: [
        if (perms.canShowAttachControls) ...[
          _composerOpacity(
            enabled: perms.isAttachEnabled,
            child: FluxerButton.circleAlt(
              icon: PhosphorIconsBold.plus,
              semanticLabel: FluxerLocalizations.of(
                context,
              ).chatAttachmentSourceBrowse,
              onPressed: perms.isAttachEnabled
                  ? () => unawaited(_pickAttachments(context))
                  : null,
            ),
          ),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: _buildComposerField(
            context: context,
            channelId: channelId,
            perms: perms,
            maxMessageLength: maxMessageLength,
            premiumMaxLength: premiumMaxLength,
            minLines: 1,
            maxLines: 6,
            decoration: mobileDecoration,
          ),
        ),
        const SizedBox(width: 8),
        ListenableBuilder(
          listenable: _controller,
          builder: (BuildContext context, Widget? child) {
            final String sendableWire = _sendableWireText();
            final bool hasSendable = composerHasSendableContent(
              ref,
              channelId,
              sendableWire,
            );
            final bool isOverCharacterLimit =
                _composerContentLength(sendableWire) > maxMessageLength;
            return Padding(
              padding: const EdgeInsetsGeometry.only(bottom: 1),
              child: _sendAndVoiceButton(
                context,
                chatNotifier,
                perms: perms,
                hasSendable: hasSendable,
                isOverCharacterLimit: isOverCharacterLimit,
                size: FluxerButtonSize.small,
                useHoldToRecord: true,
              ),
            );
          },
        ),
      ],
    );
  }

  void _handleGifSelection(FluxerSelectedGif selection) {
    if (selection.autoSend) {
      unawaited(
        ref
            .read(chatViewModelProvider.notifier)
            .sendStandaloneMessage(selection.url),
      );
      return;
    }

    _insertGifUrl(selection.url);
    _focusNode.requestFocus();
  }

  void _handleStickerSelection(StickerEntry sticker) {
    unawaited(
      ref.read(chatViewModelProvider.notifier).sendStickerMessage(sticker),
    );
    ref.read(expressionPanelProvider.notifier).close();
    _focusNode.requestFocus();
  }

  void _handleFavoriteMemeSelection(FavoriteMemeSelection selection) {
    unawaited(_processFavoriteMemeSelection(selection));
  }

  Future<void> _processFavoriteMemeSelection(
    FavoriteMemeSelection selection,
  ) async {
    final meme = selection.meme;
    if (!selection.autoSend) {
      _insertGifUrl(meme.shareUrl);
      _focusNode.requestFocus();
      return;
    }

    final perms = await _currentPermissions();
    if (_hasProviderShareUrl(meme)) {
      await ref
          .read(chatViewModelProvider.notifier)
          .sendStandaloneMessage(meme.shareUrl);
    } else if (perms.canShowAttachControls && perms.canShowEmbedControls) {
      await ref
          .read(chatViewModelProvider.notifier)
          .sendFavoriteMemeMessage(meme);
    } else {
      _insertGifUrl(meme.url);
    }

    ref.read(expressionPanelProvider.notifier).close();
    _focusNode.requestFocus();
  }

  bool _hasProviderShareUrl(FavoriteMeme meme) =>
      (meme.klipySlug?.trim().isNotEmpty ?? false) ||
      (meme.tenorSlugId?.trim().isNotEmpty ?? false);

  Future<ChannelMessagePermissions> _currentPermissions() async {
    final channelId = ref.read(
      chatViewModelProvider.select((state) => state.channelId),
    );
    return readChannelMessagePermissionsForComposer(ref, channelId);
  }

  void _insertGifUrl(String url) {
    final text = _controller.text;
    final selection = _controller.selection;
    final start = selection.isValid
        ? _clampOffset(selection.start, text.length)
        : text.length;
    final end = selection.isValid
        ? _clampOffset(selection.end, text.length)
        : text.length;
    final selectionStart = start < end ? start : end;
    final selectionEnd = start < end ? end : start;
    final needsLeadingSpace =
        selectionStart > 0 &&
        !_isWhitespace(text.substring(selectionStart - 1, selectionStart));
    final needsTrailingSpace =
        selectionEnd >= text.length ||
        !_isWhitespace(text.substring(selectionEnd, selectionEnd + 1));
    final insertText =
        '${needsLeadingSpace ? ' ' : ''}$url'
        '${needsTrailingSpace ? ' ' : ''}';
    final newText = text.replaceRange(selectionStart, selectionEnd, insertText);
    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(
        offset: selectionStart + insertText.length,
      ),
    );
  }

  bool _isWhitespace(String text) => text.trim().isEmpty;

  int _clampOffset(int value, int max) {
    if (value < 0) {
      return 0;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  void _insertEmoji(String name, String surrogates) {
    _controller.insertEmoji(name, surrogates);
    scheduleComposerScrollToEnd(
      _composerScrollController,
      isMounted: () => mounted,
    );
  }

  void _showNoSendPermissionToast() {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.channelNoSendPermissionHint,
            variant: FluxerToastVariant.warning,
          ),
        );
  }

  Future<void> _onSendPressed() async {
    final String channelId = ref.read(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final String rawWireText = _controller.toWireText();
    final String wireText = _sendableWireText();
    if (wireTextLostContentAfterSanitize(
      rawWireText: rawWireText,
      sanitizedWireText: wireText,
    )) {
      _showCorruptedCustomEmojiToast();
      return;
    }
    if (!composerHasSendableContent(ref, channelId, wireText)) {
      return;
    }
    if (_isOverCharacterLimit(ref)) {
      return;
    }
    final ChatViewModel vm = ref.read(chatViewModelProvider.notifier);
    final bool isEditing = ref.read(
      chatViewModelProvider.select((s) => s.editingMessage != null),
    );
    if (isEditing) {
      FluxerHaptics.light();
      unawaited(vm.sendMessage(text: wireText.trim()));
      return;
    }

    final ComposerCommand command = parseComposerCommand(wireText);

    if (command is! ComposerReplaceCommand) {
      final Duration? slowmodeRemaining = _activeSlowmodeRemainingForSend(
        channelId,
      );
      if (slowmodeRemaining != null) {
        ref.read(slowmodeIndicatorShakeProvider.notifier).requestShake();
        ref
            .read(slowmodeRateLimitedAlertProvider.notifier)
            .show(slowmodeRemaining);
        return;
      }
    }

    if (command is ComposerReplaceCommand) {
      _controller.clear();
      vm.updateMessageText('');
      await vm.applyComposerReplace(
        source: command.source,
        replacement: command.replacement,
        global: command.global,
      );
      return;
    }

    final _CustomEmojiSendContext emojiContext = _readCustomEmojiSendContext(
      channelId,
    );
    final String innerContent = switch (command) {
      ComposerMeCommand(:final content) => content,
      ComposerSpoilerCommand(:final content) => content,
      ComposerTtsCommand(:final content) => content,
      ComposerContentSend(:final content) => content,
      ComposerReplaceCommand() => wireText,
    };
    final String resolved = resolveTypedCustomEmojiShortcodes(
      innerContent,
      emojiContext.lookupMarkdown,
    );
    final String baseContent = switch (command) {
      ComposerMeCommand() => wrapMe(resolved),
      ComposerSpoilerCommand() => wrapSpoiler(resolved),
      ComposerTtsCommand() => resolved,
      ComposerContentSend() => resolved,
      ComposerReplaceCommand() => resolved,
    };
    final bool tts =
        command is ComposerTtsCommand &&
        ref.read(appearancePreferencesProvider).enableTtsCommand;

    if (emojiContext.blocksContent(baseContent)) {
      final FluxerLocalizations l10n = FluxerLocalizations.of(context);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.composerEmojiUnavailable,
              variant: FluxerToastVariant.warning,
            ),
          );
      return;
    }
    final bool proceed = await _confirmMentionsIfNeeded(channelId, baseContent);
    if (!proceed) {
      return;
    }

    FluxerHaptics.light();
    unawaited(vm.sendMessage(text: baseContent.trim(), tts: tts));
  }

  _CustomEmojiSendContext _readCustomEmojiSendContext(String channelId) {
    final List<GuildEmojiEntry> allEmojis =
        ref.read(allGuildEmojisForPickerProvider).value ?? const [];
    if (allEmojis.isEmpty) {
      return const _CustomEmojiSendContext.empty();
    }
    final String? currentUserId = ref.read(currentUserIdProvider);
    final bool isDirectChat =
        isPersonalNotesChannelRoute(
          channelId: channelId,
          currentUserId: currentUserId,
        ) ||
        findDmById(ref.read(dmViewModelProvider).conversations, channelId) !=
            null;
    final bool hasGlobalEmojiAccess =
        ref.read(
          instanceFeatureEnabledProvider(LimitKeys.featureGlobalExpressions),
        ) &&
        readChannelMessagePermissionsForComposer(
          ref,
          channelId,
        ).canUseExternalEmojis;
    final String? activeGuildId = ref.read(contextualGuildIdProvider);
    final Map<String, String> markdownByName = <String, String>{};
    final Set<String> knownIds = <String>{};
    final Set<String> usableIds = <String>{};
    for (final GuildEmojiEntry emoji in allEmojis) {
      knownIds.add(emoji.id);
      if (composerCanUseGuildEmoji(
        emoji: emoji,
        hasGlobalEmojiAccess: hasGlobalEmojiAccess,
        isDirectChat: isDirectChat,
        activeGuildId: activeGuildId,
      )) {
        usableIds.add(emoji.id);
        markdownByName.putIfAbsent(emoji.nameLower, () => emoji.markdown);
      }
    }
    return _CustomEmojiSendContext(
      markdownByName: markdownByName,
      knownIds: knownIds,
      usableIds: usableIds,
    );
  }

  Future<bool> _confirmMentionsIfNeeded(
    String channelId,
    String content,
  ) async {
    final String? guildId = ref.read(contextualGuildIdProvider);
    if (guildId == null || guildId.isEmpty) {
      return true;
    }
    Guild? guild;
    for (final Guild candidate in ref.read(guildListViewModelProvider).guilds) {
      if (candidate.id == guildId) {
        guild = candidate;
        break;
      }
    }
    if (guild == null) {
      return true;
    }
    final int bits = await readEffectiveGuildChannelPermissionBits(
      container: ref.container,
      channelId: channelId,
    );
    final bool canMentionEveryone = hasPermission(
      bits,
      Permission.mentionEveryone,
    );
    final bool mentionsEveryone = content.contains('@everyone');
    final bool mentionsHere = content.contains('@here');
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final List<db.Member> members = await database.memberDao.getMembers(
      guildId,
    );
    final List<db.Role> roles = await database.roleDao.getRoles(guildId);
    final Map<String, db.Role> roleById = <String, db.Role>{
      for (final db.Role role in roles) role.id: role,
    };
    final LargeRoleMentionImpact? roleImpact = largestLargeRoleMentionImpact(
      members: members,
      roleById: roleById,
      guildId: guildId,
      content: content,
      canMentionEveryone: canMentionEveryone,
    );
    if (!mentionsEveryone && !mentionsHere && roleImpact == null) {
      return true;
    }
    if (!mounted) {
      return false;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    String? description;
    if (canMentionEveryone &&
        mentionsEveryone &&
        guild.memberCount > kMentionConfirmThreshold) {
      description = l10n.mentionConfirmEveryoneBody(guild.memberCount);
    } else if (canMentionEveryone &&
        mentionsHere &&
        guild.onlineCount > kMentionConfirmThreshold) {
      description = l10n.mentionConfirmHereBody(guild.onlineCount);
    } else if (roleImpact != null) {
      description = l10n.mentionConfirmRoleBody(
        roleImpact.memberCount,
        roleImpact.roleName,
      );
    }
    if (description == null) {
      return true;
    }
    final bool? confirmed = isMobileLayout(context)
        ? await FluxerConfirmSheet.show(
            context,
            title: l10n.mentionConfirmTitle,
            description: description,
            confirmLabel: l10n.mentionConfirmButton,
            isDanger: true,
            onConfirm: () {},
          )
        : await FluxerConfirmModal.show(
            context,
            title: l10n.mentionConfirmTitle,
            description: description,
            confirmLabel: l10n.mentionConfirmButton,
            isDanger: true,
            onConfirm: () {},
          );
    return confirmed ?? false;
  }

  void _closeExpressionPanelAndFocusComposer() {
    if (!ref.read(expressionPanelProvider)) {
      return;
    }
    _beginExpressionPanelToKeyboardTransition();
    ref.read(expressionPanelProvider.notifier).close();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _focusNode.requestFocus();
    });
  }

  void _beginExpressionPanelToKeyboardTransition() {
    if (!isMobileLayout(context)) {
      return;
    }
    final MobileKeyboardMetricsState metrics = ref.read(
      mobileKeyboardMetricsProvider,
    );
    final double lockHeight =
        ref.read(expressionPanelHeightProvider) ??
        metrics.resolveAnchorHeight();
    ref
        .read(bottomInputSlotProvider.notifier)
        .beginKeyboardTransition(lockHeight);
  }

  void _focusComposerAfterReplyOrEdit({required bool forEdit}) {
    if (ref.read(expressionPanelProvider)) {
      _beginExpressionPanelToKeyboardTransition();
      ref.read(expressionPanelProvider.notifier).close();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) {
        return;
      }
      if (forEdit) {
        await _applyWireTextFromState(
          stripPrivateUseCharacters(
            ref.read(chatViewModelProvider).messageText,
          ),
        );
      } else {
        _controller.selection = TextSelection.collapsed(
          offset: _controller.text.length,
        );
      }
      scheduleComposerScrollToEnd(
        _composerScrollController,
        isMounted: () => mounted,
      );
      _focusNode.requestFocus();
    });
  }

  Widget _buildMobilePickerButton(
    BuildContext context,
    ChannelMessagePermissions perms,
  ) {
    final bool isPanelOpen = ref.watch(expressionPanelProvider);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return _composerOpacity(
      enabled: perms.isComposerEnabled,
      child: FluxerButton.ghost(
        icon: isPanelOpen
            ? PhosphorIconsFill.keyboard
            : PhosphorIconsFill.smiley,
        isSquare: true,
        size: FluxerButtonSize.compact,
        semanticLabel: isPanelOpen
            ? l10n.composerShowKeyboard
            : l10n.composerOpenExpressionPicker,
        onPressed: !perms.isComposerEnabled
            ? null
            : () {
                if (isPanelOpen) {
                  _closeExpressionPanelAndFocusComposer();
                } else {
                  final MobileKeyboardMetricsState metrics = ref.read(
                    mobileKeyboardMetricsProvider,
                  );
                  if (metrics.isKeyboardVisible) {
                    final double grossLock = resolveTransitionLockHeight(
                      liveKeyboardHeight: metrics.liveKeyboardHeight,
                      anchorHeight: metrics.resolveAnchorHeight(),
                    );
                    ref
                        .read(bottomInputSlotProvider.notifier)
                        .beginPanelTransition(grossLock);
                  }
                  ref.read(expressionPanelProvider.notifier).open();
                  FocusScope.of(context).unfocus();
                }
              },
      ),
    );
  }

  Widget _sendAndVoiceButton(
    BuildContext context,
    ChatViewModel chatNotifier, {
    required ChannelMessagePermissions perms,
    required bool hasSendable,
    required bool isOverCharacterLimit,
    required bool useHoldToRecord,
    FluxerButtonSize size = FluxerButtonSize.compact,
  }) {
    final channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final bool isEditing = ref.watch(
      chatViewModelProvider.select((s) => s.editingMessage != null),
    );
    final bool isSlowmodeBlocked =
        !isEditing &&
        (ref.watch(isSlowmodeBlockedProvider(channelId)).value ?? false);
    final bool canUseVoice = perms.isVoiceEnabled && !isSlowmodeBlocked;
    final bool showSendButtonPreference = ref.watch(
      advancedPreferencesProvider.select(
        (state) => state.showMessageSendButton,
      ),
    );
    final bool showVoiceButton = shouldShowComposerVoiceButton(
      permissions: perms,
      hasSendable: hasSendable,
      isEditing: isEditing,
      showMessageSendButtonPreference: showSendButtonPreference,
    );
    final bool showSendButton =
        hasSendable ||
        showSendButtonPreference ||
        shouldShowComposerSendButtonFallback(
          permissions: perms,
          hasSendable: hasSendable,
          isEditing: isEditing,
          showMessageSendButtonPreference: showSendButtonPreference,
        );
    final bool voiceDisabled =
        !canUseVoice || !perms.isComposerEnabled || isOverCharacterLimit;
    final VoidCallback? sendOnPressed = !hasSendable || isOverCharacterLimit
        ? null
        : perms.isComposerEnabled
        ? () => unawaited(_onSendPressed())
        : _showNoSendPermissionToast;
    final bool sendVisuallyEnabled =
        perms.isComposerEnabled && sendOnPressed != null && !isSlowmodeBlocked;
    final bool voiceVisuallyEnabled = !voiceDisabled;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (!useHoldToRecord) {
      final bool touchActions = isTouchPrimaryInput(ref);
      if (touchActions) {
        return AnimatedSwitcher(
          duration: context.motion.panel,
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: showSendButton
              ? _composerOpacity(
                  key: const ValueKey('send'),
                  enabled: sendVisuallyEnabled,
                  child: FluxerButton.circle(
                    icon: PhosphorIconsBold.arrowUp,
                    iconSize: 20,
                    size: FluxerButtonSize.small,
                    semanticLabel: l10n.permissionSendMessages,
                    onPressed: sendOnPressed,
                  ),
                )
              : showVoiceButton
              ? _composerOpacity(
                  key: const ValueKey('voice'),
                  enabled: voiceVisuallyEnabled,
                  child: FluxerButton.circleAlt(
                    icon: PhosphorIconsFill.microphone,
                    semanticLabel: l10n.voiceMessageTitle,
                    onPressed: voiceDisabled
                        ? null
                        : () => unawaited(
                            VoiceMessageComposerSheet.show(
                              context,
                              channelId: channelId,
                            ),
                          ),
                  ),
                )
              : const SizedBox.shrink(key: ValueKey('voice-hidden')),
        );
      }
      return SizedBox(
        width: _kWideComposerActionExtent,
        height: _kWideComposerActionExtent,
        child: AnimatedSwitcher(
          duration: context.motion.panel,
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: showSendButton
              ? _composerOpacity(
                  key: const ValueKey('send'),
                  enabled: sendVisuallyEnabled,
                  child: _wideComposerIconButton(
                    context: context,
                    icon: PhosphorIconsBold.arrowUp,
                    iconSize: 20,
                    tooltip: l10n.permissionSendMessages,
                    onPressed: sendOnPressed,
                  ),
                )
              : showVoiceButton
              ? _composerOpacity(
                  key: const ValueKey('voice'),
                  enabled: voiceVisuallyEnabled,
                  child: _wideComposerIconButton(
                    context: context,
                    icon: PhosphorIconsFill.microphone,
                    tooltip: l10n.voiceMessageTitle,
                    onPressed: voiceDisabled
                        ? null
                        : () => unawaited(
                            VoiceMessageComposerSheet.show(
                              context,
                              channelId: channelId,
                            ),
                          ),
                  ),
                )
              : const SizedBox.shrink(key: ValueKey('voice-hidden')),
        ),
      );
    }
    return AnimatedSwitcher(
      duration: context.motion.panel,
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: showSendButton
          ? _composerOpacity(
              key: const ValueKey('send'),
              enabled: sendVisuallyEnabled,
              child: FluxerButton.circle(
                icon: PhosphorIconsBold.arrowUp,
                iconSize: 20,
                size: size,
                semanticLabel: l10n.permissionSendMessages,
                onPressed: sendOnPressed,
              ),
            )
          : showVoiceButton
          ? _composerOpacity(
              key: const ValueKey('voice'),
              enabled: voiceVisuallyEnabled,
              child: useHoldToRecord
                  ? VoiceMessageRecorder(
                      channelId: channelId,
                      disabled: voiceDisabled,
                      buttonSize: size,
                    )
                  : FluxerButton.circleAlt(
                      icon: PhosphorIconsFill.microphone,
                      size: size,
                      semanticLabel: l10n.voiceMessageTitle,
                      onPressed: voiceDisabled
                          ? null
                          : () => unawaited(
                              VoiceMessageComposerSheet.show(
                                context,
                                channelId: channelId,
                              ),
                            ),
                    ),
            )
          : const SizedBox.shrink(key: ValueKey('voice-hidden')),
    );
  }

  Future<void> _addPickedFiles(List<ComposerUploadFile> files) async {
    final String channelId = ref.read(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final CloudUploadController notifier = ref.read(
      cloudUploadControllerProvider(channelId).notifier,
    );
    final FileUploadValidationResult result = await notifier.addFiles(files);
    if (mounted) {
      _toastUploadValidation(result);
    }
  }

  Future<void> _pickAttachments(BuildContext context) async {
    if (_useMobileAttachmentSheet()) {
      await FluxerBottomSheet.show<void>(
        context,
        variant: FluxerBottomSheetVariant.menu,
        builder: (BuildContext sheetContext, VoidCallback close) {
          final FluxerLocalizations l10n = FluxerLocalizations.of(sheetContext);
          return Padding(
            padding: FluxerBottomSheet.scrollViewPadding(
              sheetContext,
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: FluxerBottomSheetGroupColumn(
              children: [
                FluxerMenuGroup(
                  children: [
                    FluxerBottomSheetMenuItem(
                      icon: PhosphorIconsFill.image,
                      label: l10n.chatAttachmentSourceGallery,
                      onTap: () async {
                        close();
                        final ImagePicker picker = ImagePicker();
                        final List<XFile> media = await picker
                            .pickMultipleMedia(
                              limit: kMaxAttachmentsPerMessage,
                            );
                        if (media.isEmpty) {
                          return;
                        }
                        if (!mounted) {
                          return;
                        }
                        await _addPickedFiles(
                          composerUploadFilesFromImagePicker(media),
                        );
                      },
                    ),
                    FluxerBottomSheetMenuItem(
                      icon: PhosphorIconsFill.camera,
                      label: l10n.chatAttachmentSourceCamera,
                      onTap: () async {
                        close();
                        final ImagePicker picker = ImagePicker();
                        final XFile? image = await picker.pickImage(
                          source: ImageSource.camera,
                        );
                        if (image == null) {
                          return;
                        }
                        if (!mounted) {
                          return;
                        }
                        await _addPickedFiles(<ComposerUploadFile>[
                          composerUploadFileFromImagePicker(image),
                        ]);
                      },
                    ),
                    FluxerBottomSheetMenuItem(
                      icon: PhosphorIconsFill.folder,
                      label: l10n.chatAttachmentSourceBrowse,
                      onTap: () async {
                        close();
                        final FilePickerResult? res =
                            await FilePicker.pickFiles();
                        if (res == null) {
                          return;
                        }
                        if (!mounted) {
                          return;
                        }
                        final List<ComposerUploadFile> files =
                            composerUploadFilesFromPlatformFiles(res.files);
                        if (files.isEmpty) {
                          return;
                        }
                        await _addPickedFiles(files);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
      return;
    }
    final FilePickerResult? res = await FilePicker.pickFiles();
    if (res == null || !mounted) {
      return;
    }
    final List<ComposerUploadFile> files = composerUploadFilesFromPlatformFiles(
      res.files,
    );
    if (files.isEmpty) {
      return;
    }
    await _addPickedFiles(files);
  }

  void _toastUploadValidation(FileUploadValidationResult result) {
    if (result.isValid || !mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String msg = switch (result.error!) {
      FileUploadValidationError.tooManyAttachments =>
        l10n.chatAttachmentTooMany(kMaxAttachmentsPerMessage),
      FileUploadValidationError.fileTooLarge => l10n.chatAttachmentFileTooLarge,
      FileUploadValidationError.multipartRequestTooLarge =>
        l10n.chatAttachmentPayloadTooLarge,
      FileUploadValidationError.noFiles => '',
    };
    if (msg.isEmpty) {
      return;
    }
    ref
        .read(toastProvider.notifier)
        .show(FluxerToast(message: msg, variant: FluxerToastVariant.warning));
  }
}
