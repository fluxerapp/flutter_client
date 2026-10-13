import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/cloud_composer_attachments.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/menus/composer_attach_source_menu.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_attachment_area.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/announcement_follow_barrier.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/blocked_user_composer_barrier.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/channel_composer_barrier.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_input_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_send_and_voice_button.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/mobile_composer_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/slash_command_param_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/system_dm_composer_barrier.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recording_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recording_controller.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/reply_preview.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/composer/composer_watch_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/guild/guild_composer_access_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_indicator_shake_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_rate_limited_alert_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/services/composer_keyboard_session.dart';
import 'package:fluxer_app/features/chat/services/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/services/composer_slash_session.dart';
import 'package:fluxer_app/features/chat/services/composer_text_session.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_native_pickers.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validation_l10n.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/attachments/paste_text_attachment.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_command.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_command_execute.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_emoji_resolution.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_enter_send.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_expression_tabs.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_panel.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_scroll.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_sendable_content.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/channel_member_count_cache_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/input/providers/chat_keybind_effects_provider.dart';
import 'package:fluxer_app/features/input/providers/composer_focus_coordinator_provider.dart';
import 'package:fluxer_app/features/input/providers/physical_keyboard_provider.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kComposerDisabledOpacity = 0.6;

const double _kTouchComposerActionSpacing = 8;
const double _kDesktopComposerAttachIconSize = 26;
const double _kWideComposerActionExtent = WideComposerLayout.actionButtonExtent;
const double _kWideComposerIconSize = 24;

Widget _composerOpacity({
  required BuildContext context,
  required bool enabled,
  required Widget child,
  Key? key,
}) {
  return AnimatedOpacity(
    key: key,
    opacity: enabled ? 1 : _kComposerDisabledOpacity,
    duration: context.motion.panel,
    curve: context.motion.curve,
    child: child,
  );
}

Widget _composerSlot({
  required BuildContext context,
  required bool visible,
  required Alignment alignment,
  required Widget child,
}) {
  return AnimatedSize(
    duration: context.motion.panel,
    curve: context.motion.curve,
    alignment: alignment,
    child: visible ? child : const SizedBox.shrink(),
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
}) {
  return InputDecoration(
    hintText: hintText,
    hintMaxLines: 1,
    hintStyle: _composerInputHintStyle(context, enabled: enabled),
    hintFadeDuration: context.motion.panel,
    filled: true,
    fillColor: context.colors.backgroundTertiary,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    border: _composerTouchInputOutlineBorder(context, focused: false),
    enabledBorder: _composerTouchInputOutlineBorder(context, focused: false),
    focusedBorder: _composerTouchInputOutlineBorder(
      context,
      focused: !isFluxerMobileOs,
    ),
    disabledBorder: _composerTouchInputOutlineBorder(context, focused: false),
    isDense: true,
  );
}

InputDecoration _mobileComposerInputDecoration({
  required BuildContext context,
  required String hintText,
  required bool enabled,
}) {
  return InputDecoration(
    hintText: hintText,
    hintMaxLines: 1,
    hintStyle: _composerInputHintStyle(context, enabled: enabled),
    hintFadeDuration: Duration.zero,
    filled: false,
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: MobileComposerLayout.textInsetX,
      vertical: MobileComposerLayout.textInsetY,
    ),
    isDense: true,
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
  final ComposerSlashSession _slashSession = ComposerSlashSession();
  late FocusNode _focusNode;
  late final ComposerTextSession _textSession;
  late final ComposerKeyboardSession _keyboardSession;
  final ScrollController _composerScrollController = ScrollController();
  final GlobalKey<ComposerAutocompleteFieldState> _composerFieldKey =
      GlobalKey<ComposerAutocompleteFieldState>();
  late final VoiceMessageRecordingController _voiceRecording;
  final _expressionPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();
  final _gifPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();
  final _mediaPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();
  final _stickerPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();

  bool _composerFocused = false;
  final ValueNotifier<bool> _showComposerCounter = ValueNotifier<bool>(false);

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
    required String tooltip,
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
      context: context,
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

  late final VoidCallback _requestComposerFocus;
  late final ComposerFocusCoordinator _composerFocus;
  ProviderSubscription<int>? _chatKeybindEffectsSubscription;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _composerFocus = ref.read(composerFocusCoordinatorProvider);
    _requestComposerFocus = () {
      if (_focusNode.canRequestFocus) {
        _focusNode.requestFocus();
      }
    };
    _composerFocus.register(
      requestFocus: _requestComposerFocus,
      readText: _sendableWireText,
      hasFocus: () => _focusNode.hasFocus,
    );
    _chatKeybindEffectsSubscription = listenChatKeybindEffects(
      ref,
      (_) {
        if (!mounted) {
          return;
        }
        unawaited(
          _pickAttachments(
            source:
                usesInlineAttachmentPanel(
                  isNativeMobileOs: isFluxerNativeMobileOs,
                  isMobileLayout: isMobileLayout(context),
                )
                ? ComposerAttachSource.gallery
                : ComposerAttachSource.files,
          ),
        );
      },
      where: (ChatKeybindEffect effect) =>
          effect == ChatKeybindEffect.triggerUpload,
    );
    WidgetsBinding.instance.addObserver(this);
    _controller = ComposerMentionController(ref: ref);
    _textSession = ComposerTextSession(
      ref: ref,
      controller: _controller,
      focusNode: _focusNode,
    );
    _keyboardSession = ComposerKeyboardSession(
      ref: ref,
      focusNode: _focusNode,
      isMounted: () => mounted,
      isMobileLayout: () => isMobileLayout(context),
      isSlashSessionActive: () => _slashSession.isActive,
      composerEntryFocused: _composerEntryFocused,
    );
    _focusNode.onKeyEvent = _handleComposerFieldKeyEvent;
    _composerFocused = _focusNode.hasFocus;
    _focusNode.addListener(_handleComposerFocusChange);
    _controller.addListener(_onComposerControllerChanged);
    _slashSession.addListener(_onSlashSessionChanged);
    _voiceRecording = VoiceMessageRecordingController(
      ref: ref,
      onPrepareUi: _prepareVoiceRecordingUi,
    );
    _textSession.onChannelChanged();
    unawaited(FluxerHaptics.warmSend());
  }

  void _onComposerControllerChanged() {
    _textSession.onControllerChanged();
    _syncComposerCounterPadding();
  }

  void _prepareVoiceRecordingUi() {
    if (!mounted) {
      return;
    }
    _focusNode.unfocus();
    ref.read(expressionPanelProvider.notifier).close();
    ref.read(attachmentPanelProvider.notifier).close();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _keyboardSession.handleAppLifecycle(state);
  }

  void _syncComposerCounterPadding() {
    final int maxMessageLength = ref.read(maxMessageLengthProvider);
    final bool show =
        _composerContentLength(_sendableWireText()) >
        (maxMessageLength * 0.8).floor();
    if (show == _showComposerCounter.value) {
      return;
    }
    _showComposerCounter.value = show;
  }

  void _resetComposerInputAfterSend() {
    _closeAttachmentPanelAfterSend();
    _clearSlashSession();
    if (_showComposerCounter.value) {
      _showComposerCounter.value = false;
    }
    _textSession.resetAfterSend();
  }

  void _closeAttachmentPanelAfterSend() {
    if (!ref.read(attachmentPanelProvider)) {
      return;
    }
    ref
        .read(composerPanelDismissRequestProvider.notifier)
        .requestAnimatedClose();
    if (!ref.read(composerPanelClosingProvider)) {
      ref.read(attachmentPanelProvider.notifier).close();
    }
  }

  void _onComposerChannelChanged() {
    if (_voiceRecording.isActive) {
      unawaited(_voiceRecording.cancel());
    }
    _keyboardSession.onChannelChanged();
    _textSession.onChannelChanged();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _keyboardSession.resyncViewInsetsFromContext(context);
    });
  }

  String _composerDisplayChannelId() {
    final String vmChannelId = ref.read(
      chatViewModelProvider.select((ChatViewState state) => state.channelId),
    );
    final String? routeChannelId = ref.read(activeChannelIdProvider);
    if (resolveGuildChannel(ref, vmChannelId)?.type == ChannelType.guildVoice) {
      return vmChannelId;
    }
    if (routeChannelId != null &&
        routeChannelId.isNotEmpty &&
        routeChannelId != vmChannelId) {
      return routeChannelId;
    }
    return vmChannelId;
  }

  void _onSlashSessionChanged() {
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  String _sendableWireText() {
    if (_slashSession.isActive) {
      return _slashSession.toWireText();
    }
    return stripPrivateUseCharacters(_controller.toWireText());
  }

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
    ref.read(expressionPanelProvider.notifier).close();
    ref.read(attachmentPanelProvider.notifier).close();
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

  void _handleComposerFocusChange() {
    final bool focused = _focusNode.hasFocus;
    if (_composerFocused != focused) {
      setState(() => _composerFocused = focused);
    }
    if (!focused) {
      _keyboardSession.handleFocusLost();
    }
  }

  bool _composerEntryFocused() {
    if (_slashSession.isActive) {
      return _slashSession.focus == ComposerSlashFocus.slot;
    }
    return _focusNode.hasFocus;
  }

  @override
  void activate() {
    super.activate();
    _keyboardSession.onComposerActivated(context);
  }

  @override
  void deactivate() {
    _keyboardSession.deactivate();
    super.deactivate();
  }

  @override
  void dispose() {
    _textSession.dispose();
    _keyboardSession.dispose();
    _chatKeybindEffectsSubscription?.close();
    _composerFocus.unregister(_requestComposerFocus);
    WidgetsBinding.instance.removeObserver(this);
    _focusNode
      ..removeListener(_handleComposerFocusChange)
      ..unfocus()
      ..dispose();
    _slashSession
      ..removeListener(_onSlashSessionChanged)
      ..dispose();
    _composerScrollController.dispose();
    _controller
      ..removeListener(_onComposerControllerChanged)
      ..dispose();
    _showComposerCounter.dispose();
    _voiceRecording.dispose();
    super.dispose();
  }

  bool get _enterSends => composerEnterSends(
    isNativeMobileOs: isFluxerNativeMobileOs,
    physicalKeyboardConnected:
        ref.read(physicalKeyboardConnectedProvider).value ?? false,
  );

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
    if (!_enterSends) {
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
    Color? cursorColor,
  }) {
    return _composerOpacity(
      context: context,
      enabled: perms.isComposerEnabled,
      child: ComposerInputField(
        channelId: channelId,
        controller: _controller,
        focusNode: _focusNode,
        composerScrollController: _composerScrollController,
        composerFieldKey: _composerFieldKey,
        slashSession: _slashSession,
        perms: perms,
        maxMessageLength: maxMessageLength,
        premiumMaxLength: premiumMaxLength,
        decoration: decoration,
        minLines: minLines,
        maxLines: maxLines,
        enterSends: _enterSends,
        showComposerCounter: _showComposerCounter,
        sendableWireLength: _composerContentLength(_sendableWireText()),
        hintSemanticsLabel: _resolveHintText(),
        onSendPressed: () => unawaited(_onSendPressed()),
        onComposerFieldTap: () => _keyboardSession.onComposerFieldTap(context),
        onPasteExceedsLimit: (String pastedText) =>
            unawaited(_handlePasteExceedsLimit(pastedText, channelId)),
        onPasteLostContent: _showCorruptedCustomEmojiToast,
        onValidationResult: _toastUploadValidation,
        onUpgradePressed: () => _showPlutoniumSheet(context),
        textAlignVertical: textAlignVertical,
        cursorColor: cursorColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isFluxerNativeMobileOs) {
      ref.watch(physicalKeyboardConnectedProvider);
    }
    ref
      ..listen<String>(
        chatViewModelProvider.select((state) => state.messageText),
        (_, String _) => _textSession.syncFromViewModelIfNeeded(),
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
      ..listen<int>(pendingComposerBackspaceProvider, (
        int? previous,
        int next,
      ) {
        if (previous == null || next <= previous) {
          return;
        }
        _controller.deleteBackward();
      })
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
          } else if (next == null && previous != null) {
            unawaited(
              _textSession.applyWireTextForEdit(
                stripPrivateUseCharacters(
                  ref.read(chatViewModelProvider).messageText,
                ),
              ),
            );
          }
        },
      );

    final channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final ComposerWatch? dm = ref.watch(composerWatchProvider(channelId));
    if (dm != null && dm.isSystemDm) {
      return const SystemDmComposerBarrier();
    }
    final bool directMessagesDisabled = ref.watch(
      instanceRuntimeConfigProvider.select(
        (InstanceRuntimeConfig config) => config.directMessagesDisabled,
      ),
    );
    if (directMessagesDisabled && dm != null && !dm.isPersonalNotes) {
      return SystemDmComposerBarrier(
        message: FluxerLocalizations.of(context).channelNoSendPermissionHint,
      );
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
          if (previous != null && previous != next && mounted) {
            _clearSlashSession();
            _onComposerChannelChanged();
          }
          final ComposerWatch? nextDm = ref.read(composerWatchProvider(next));
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
    ref.listen(channelMessagePermissionsProvider(channelId), (
      AsyncValue<ChannelMessagePermissions>? previous,
      AsyncValue<ChannelMessagePermissions> next,
    ) {
      final bool wasEnabled = channelMessagePermissionsForComposer(
        previous ?? const AsyncValue<ChannelMessagePermissions>.loading(),
      ).isComposerEnabled;
      final bool isEnabled = channelMessagePermissionsForComposer(
        next,
      ).isComposerEnabled;
      if (wasEnabled && !isEnabled) {
        _clearComposerForBlockedAccess();
      }
    });

    final GuildComposerAccess? composerAccess = composerAccessAsync.hasError
        ? GuildComposerAccess.allowed
        : composerAccessAsync.value;
    if (composerAccess == null) {
      return const SizedBox.shrink();
    }
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
    final Channel? composerChannel = ref
        .watch(channelByIdProvider(channelId))
        .value;
    if (composerChannel != null &&
        isGuildAnnouncementChannelType(composerChannel.type) &&
        perms.showsNoSendPermissionHint) {
      return AnnouncementFollowBarrier(channel: composerChannel);
    }
    final String guildId = ref.watch(
      channelListViewModelProvider.select(
        (ChannelListState state) =>
            findChannelById(state, channelId)?.guildId ?? '',
      ),
    );
    final bool mobileComposer = isMobileLayout(context);
    final bool isPanelOpen = isComposerPanelOpen(
      expressionPanelOpen: ref.watch(expressionPanelProvider),
      attachmentPanelOpen: ref.watch(attachmentPanelProvider),
    );
    final double bottomSlotHeight = ref.watch(
      bottomInputSlotProvider.select(
        (BottomInputSlotState state) => state.slotHeight,
      ),
    );
    final double safeAreaBottom = MediaQuery.paddingOf(context).bottom;
    final bool showComposerSafeBar =
        safeAreaBottom > 0 &&
        bottomSlotHeight <= 0 &&
        !isPanelOpen &&
        resolvedKeyboardInsetBottom(context) <= 0;
    final bool hasAttachments = ref.watch(
      cloudUploadControllerProvider(channelId).select(
        (CloudComposerAttachments attachments) => attachments.items.isNotEmpty,
      ),
    );
    final bool hasWideActionStack =
        !mobileComposer &&
        (replyTo != null ||
            editingMessage != null ||
            hasAttachments ||
            _slashSession.focusedSlot != null);
    final bool slashParamBarVisible = _slashSession.focusedSlot != null;
    final Widget composerInput = _buildComposerInput(
      context: context,
      chatNotifier: chatNotifier,
      perms: perms,
      channelId: channelId,
      isPanelOpen: isPanelOpen,
      mobileHeader:
          mobileComposer &&
              (slashParamBarVisible ||
                  replyTo != null ||
                  editingMessage != null)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (slashParamBarVisible)
                  SlashCommandParamBar(
                    session: _slashSession,
                    onClear: _clearSlashSession,
                  ),
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
              ],
            )
          : null,
    );

    if (mobileComposer) {
      final double mobileSafeBarHeight =
          safeAreaBottom - MobileComposerLayout.bottomGap;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChannelAttachmentArea(channelId: channelId),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              MobileComposerLayout.sideInset,
              MobileComposerLayout.topInset,
              MobileComposerLayout.sideInset,
              MobileComposerLayout.bottomGap,
            ),
            child: composerInput,
          ),
          if (showComposerSafeBar && mobileSafeBarHeight > 0)
            SizedBox(height: mobileSafeBarHeight),
        ],
      );
    }

    final Widget? composerSafeBar = showComposerSafeBar
        ? Container(
            height: safeAreaBottom,
            decoration: BoxDecoration(
              color: context.colors.backgroundSecondaryLighter,
            ),
          )
        : null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ColoredBox(
          color: context.colors.backgroundSecondaryLighter,
          child: Padding(
            padding: const EdgeInsets.all(WideComposerLayout.boxInset),
            child: ListenableBuilder(
              listenable: _voiceRecording,
              builder: (BuildContext context, Widget? _) {
                return WideComposerFloatingBox(
                  focused: _composerFocused && !isFluxerMobileOs,
                  clipBehavior: _voiceRecording.isActive
                      ? Clip.none
                      : Clip.antiAlias,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (hasWideActionStack)
                        _buildWideComposerActionStack(
                          context: context,
                          channelId: channelId,
                          guildId: guildId,
                          replyTo: replyTo,
                          editingMessage: editingMessage,
                          replyMentioning: replyMentioning,
                          chatNotifier: chatNotifier,
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: WideComposerLayout.densePaddingY,
                        ),
                        child: composerInput,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        ?composerSafeBar,
      ],
    );
  }

  Widget _buildWideComposerActionStack({
    required BuildContext context,
    required String channelId,
    required String guildId,
    required Message? replyTo,
    required Message? editingMessage,
    required bool replyMentioning,
    required ChatViewModel chatNotifier,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: wideComposerActionStackColor(context),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(WideComposerLayout.boxRadius),
        ),
        border: Border(
          bottom: BorderSide(
            color: wideComposerRingColor(context, focused: false),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (_slashSession.focusedSlot != null)
            SlashCommandParamBar(
              session: _slashSession,
              onClear: _clearSlashSession,
            ),
          if (replyTo != null)
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: WideComposerLayout.actionRowMinHeight,
              ),
              child: ReplyInputBar(
                replyTo: replyTo,
                guildId: guildId,
                shouldReplyMention: replyMentioning,
                onToggleMention: (bool mentioning) =>
                    chatNotifier.setReplyMentioning(mentioning: mentioning),
                onCancel: chatNotifier.cancelReply,
                wideComposerAction: true,
              ),
            ),
          if (editingMessage != null)
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: WideComposerLayout.actionRowMinHeight,
              ),
              child: EditingInputBar(
                onCancel: chatNotifier.cancelEdit,
                wideComposerAction: true,
              ),
            ),
          ChannelAttachmentArea(channelId: channelId, wideComposerAction: true),
        ],
      ),
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
    final String channelId = _composerDisplayChannelId();
    final Channel? channel = resolveGuildChannel(ref, channelId);
    if (channel != null) {
      return l10n.channelComposerHint(channel.name);
    }
    final ComposerWatch? dm = ref.read(composerWatchProvider(channelId));
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
      return l10n.dmComposerHint(dm.recipientDisplayName);
    }
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (currentUserId != null && channelId == currentUserId) {
      return l10n.personalNotesComposerHint;
    }
    return l10n.composerHint;
  }

  Widget _voiceComposerMorph({
    required bool recording,
    required Widget recordingChild,
    required Widget idleChild,
  }) {
    return FluxerConstrainedUiTextScale(
      child: AnimatedSwitcher(
        duration: context.motion.panel,
        switchInCurve: context.motion.emphasizedCurve,
        switchOutCurve: context.motion.curve,
        layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
          return Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: <Widget>[...previousChildren, ?currentChild],
          );
        },
        child: KeyedSubtree(
          key: ValueKey<bool>(recording),
          child: recording ? recordingChild : idleChild,
        ),
      ),
    );
  }

  Widget _buildLargeLayout(
    BuildContext context,
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
    final bool gifEnabled = ref.watch(
      instanceRuntimeConfigProvider.select(
        (InstanceRuntimeConfig config) => config.gifEnabled,
      ),
    );
    final List<ExpressionPickerTab> composerButtonTabs =
        composerInputButtonVisibleTabs(
          perms: perms,
          advanced: composerButtonPrefs,
          gifEnabled: gifEnabled,
        );
    final List<ExpressionPickerTab> popoutTabs = expressionPanelVisibleTabs(
      perms,
      gifEnabled: gifEnabled,
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
            hintFadeDuration: context.motion.panel,
            filled: false,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 2),
            isDense: true,
          );
    return ListenableBuilder(
      listenable: _voiceRecording,
      builder: (BuildContext context, Widget? _) {
        final bool recording = _voiceRecording.isActive;
        final FluxerButtonSize actionSize = touchActions
            ? FluxerButtonSize.small
            : FluxerButtonSize.compact;
        final double leadingGap = touchActions
            ? _kTouchComposerActionSpacing
            : WideComposerLayout.denseColumnGap;
        return _voiceComposerMorph(
          recording: recording,
          recordingChild: VoiceMessageRecordingBar(
            controller: _voiceRecording,
            actionSize: actionSize,
            trailing: ComposerSendAndVoiceButton(
              perms: perms,
              hasSendable: false,
              isOverCharacterLimit: false,
              useHoldToRecord: false,
              voiceRecording: _voiceRecording,
              onSend: () => unawaited(_onSendPressed()),
              onNoSendPermission: _showNoSendPermissionToast,
            ),
          ),
          idleChild: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: VoiceMessageRecordingBar.heightFor(actionSize),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                _composerSlot(
                  context: context,
                  visible: perms.canShowAttachControls,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Builder(
                        builder: (BuildContext attachContext) {
                          return _buildComposerActionButton(
                            context: context,
                            icon: touchActions
                                ? PhosphorIconsBold.plus
                                : PhosphorIconsFill.plusCircle,
                            iconSize: touchActions
                                ? 20
                                : _kDesktopComposerAttachIconSize,
                            tooltip: l10n.chatAttachmentSourceBrowse,
                            onPressed: perms.isAttachEnabled
                                ? () =>
                                      unawaited(_onAttachPressed(attachContext))
                                : null,
                          );
                        },
                      ),
                      SizedBox(width: leadingGap),
                    ],
                  ),
                ),
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
                SizedBox(
                  width: touchActions ? _kTouchComposerActionSpacing : 4,
                ),
                ListenableBuilder(
                  listenable: _controller,
                  builder: (BuildContext context, Widget? child) {
                    final String sendableWire = _sendableWireText();
                    final bool hasSendable =
                        composerHasSendableContent(
                          ref,
                          channelId,
                          sendableWire,
                        ) ||
                        _slashSession.isActive;
                    final bool isOverCharacterLimit =
                        _composerContentLength(sendableWire) > maxMessageLength;
                    return Wrap(
                      alignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: touchActions ? _kTouchComposerActionSpacing : 4,
                      children: <Widget>[
                        if (!hasSendable)
                          _composerSlot(
                            context: context,
                            visible: composerButtonTabs.isNotEmpty,
                            alignment: Alignment.centerRight,
                            child: _buildLargeExpressionPickerActions(
                              context: context,
                              channelId: channelId,
                              perms: perms,
                              composerButtonTabs: composerButtonTabs,
                              popoutTabs: popoutTabs,
                            ),
                          ),
                        if (!touchActions)
                          VerticalDivider(
                            color: context.colors.borderColor,
                            width: 16,
                            thickness: 1,
                          ),
                        ComposerSendAndVoiceButton(
                          perms: perms,
                          hasSendable: hasSendable,
                          isOverCharacterLimit: isOverCharacterLimit,
                          useHoldToRecord: false,
                          voiceRecording: _voiceRecording,
                          onSend: () => unawaited(_onSendPressed()),
                          onNoSendPermission: _showNoSendPermissionToast,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
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
    required Widget? mobileHeader,
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
      slashSession: _slashSession,
      onSelectGif: (GifPickerGif gif) {
        _handleGifSelection(FluxerSelectedGif(url: gif.url, autoSend: true));
      },
      onSelectSticker: _handleStickerSelection,
      onSelectMeme: (FavoriteMeme meme) {
        _handleFavoriteMemeSelection(
          FavoriteMemeSelection(meme: meme, autoSend: true),
        );
      },
      child: isMobileLayout(context)
          ? _buildMobileLayout(context, perms, header: mobileHeader)
          : _buildLargeLayout(context, perms),
    );
    final bool panelClosing = ref.watch(composerPanelClosingProvider);
    if (!isMobileLayout(context) || !isPanelOpen || panelClosing) {
      return composerField;
    }
    return ExcludeFocus(child: composerField);
  }

  Widget _buildMobileLayout(
    BuildContext context,
    ChannelMessagePermissions perms, {
    required Widget? header,
  }) {
    final String channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    ref.watch(
      cloudUploadControllerProvider(
        channelId,
      ).select((CloudComposerAttachments a) => a.items.length),
    );
    final bool isAttachmentPanelOpen = ref.watch(attachmentPanelProvider);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    final int maxMessageLength = ref.watch(maxMessageLengthProvider);
    final int premiumMaxLength = ref.watch(premiumMaxMessageLengthProvider);
    final InputDecoration mobileDecoration = _mobileComposerInputDecoration(
      context: context,
      hintText: perms.showsNoSendPermissionHint
          ? l10n.channelNoSendPermissionHint
          : _resolveHintText(),
      enabled: perms.isComposerEnabled,
    );
    return ListenableBuilder(
      listenable: _voiceRecording,
      builder: (BuildContext context, Widget? _) {
        final bool recording = _voiceRecording.isActive;
        return Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            MobileComposerBar(
              key: const ValueKey<String>('mobile-composer-bar'),
              header: header,
              child: _voiceComposerMorph(
                recording: recording,
                recordingChild: Padding(
                  padding: const EdgeInsets.all(4),
                  child: VoiceMessageRecordingBar(
                    controller: _voiceRecording,
                    actionSize: FluxerButtonSize.small,
                    trailing: ComposerSendAndVoiceButton(
                      perms: perms,
                      hasSendable: false,
                      isOverCharacterLimit: false,
                      size: FluxerButtonSize.small,
                      useHoldToRecord: true,
                      voiceRecording: _voiceRecording,
                      onSend: () => unawaited(_onSendPressed()),
                      onNoSendPermission: _showNoSendPermissionToast,
                    ),
                  ),
                ),
                idleChild: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    MobileComposerLayout.rowPaddingStart,
                    MobileComposerLayout.rowPaddingVertical,
                    MobileComposerLayout.rowPaddingEnd,
                    MobileComposerLayout.rowPaddingVertical,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      _composerSlot(
                        context: context,
                        visible: perms.canShowAttachControls,
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: MobileComposerLayout.attachGap,
                          ),
                          child: _mobileComposerButtonCell(
                            _composerOpacity(
                              context: context,
                              enabled: perms.isAttachEnabled,
                              child: MobileComposerIconButton(
                                key: const ValueKey<String>(
                                  'mobile-composer-attach',
                                ),
                                icon: PhosphorIconsBold.plus,
                                turns: isAttachmentPanelOpen
                                    ? MobileComposerLayout.attachOpenTurns
                                    : 0,
                                semanticLabel: isAttachmentPanelOpen
                                    ? l10n.composerCloseAttachmentPanel
                                    : l10n.chatAttachmentSourceBrowse,
                                onPressed: perms.isAttachEnabled
                                    ? () => unawaited(_onAttachPressed(context))
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: MobileComposerTextGrowth(
                          child: _buildComposerField(
                            context: context,
                            channelId: channelId,
                            perms: perms,
                            maxMessageLength: maxMessageLength,
                            premiumMaxLength: premiumMaxLength,
                            minLines: 1,
                            maxLines: MobileComposerLayout.maxLines,
                            decoration: mobileDecoration,
                            cursorColor: context.colors.interactiveNormal,
                          ),
                        ),
                      ),
                      const SizedBox(width: MobileComposerLayout.trailingGap),
                      _mobileComposerButtonCell(
                        _buildMobilePickerButton(context, perms),
                      ),
                      const SizedBox(width: MobileComposerLayout.trailingGap),
                      SizedBox.square(
                        dimension: MobileComposerLayout.sendExtent,
                        child: ListenableBuilder(
                          listenable: _controller,
                          builder: (BuildContext context, Widget? child) {
                            final String sendableWire = _sendableWireText();
                            final bool hasSendable =
                                composerHasSendableContent(
                                  ref,
                                  channelId,
                                  sendableWire,
                                ) ||
                                _slashSession.isActive;
                            final bool isOverCharacterLimit =
                                _composerContentLength(sendableWire) >
                                maxMessageLength;
                            return ComposerSendAndVoiceButton(
                              perms: perms,
                              hasSendable: hasSendable,
                              isOverCharacterLimit: isOverCharacterLimit,
                              size: FluxerButtonSize.small,
                              useHoldToRecord: true,
                              voiceRecording: _voiceRecording,
                              onSend: () => unawaited(_onSendPressed()),
                              onNoSendPermission: _showNoSendPermissionToast,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (recording && !_voiceRecording.isLocked)
              Positioned(
                right: 8,
                top: -52,
                child: VoiceMessageLockChip(controller: _voiceRecording),
              ),
          ],
        );
      },
    );
  }

  Widget _mobileComposerButtonCell(Widget child) {
    return SizedBox(
      width: MobileComposerLayout.buttonExtent,
      height: MobileComposerLayout.sendExtent,
      child: Center(child: child),
    );
  }

  void _handleGifSelection(FluxerSelectedGif selection) {
    if (selection.autoSend) {
      _clearSlashSession();
      _controller.clear();
      ref.read(chatViewModelProvider.notifier).updateMessageText('');
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
    _clearSlashSession();
    _controller.clear();
    ref.read(chatViewModelProvider.notifier).updateMessageText('');
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
    if (selection.autoSend) {
      _clearSlashSession();
      _controller.clear();
      ref.read(chatViewModelProvider.notifier).updateMessageText('');
    }
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

  void _clearSlashSession() {
    if (_slashSession.isActive) {
      _slashSession.clear();
    }
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
    final String rawWireText = _slashSession.isActive
        ? _slashSession.toWireText()
        : _controller.toWireText();
    final String wireText = _slashSession.isActive
        ? rawWireText
        : _sendableWireText();
    if (_slashSession.isActive && !_slashSession.isSubmitValid) {
      _slashSession.markRequiredError();
      return;
    }
    if (!_slashSession.isActive &&
        wireTextLostContentAfterSanitize(
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
      FluxerHaptics.send();
      _resetComposerInputAfterSend();
      unawaited(vm.sendMessage(text: wireText.trim()));
      return;
    }

    final ComposerCommand command = parseComposerCommand(wireText);

    if (composerCommandDispatchKind(command) ==
        ComposerCommandDispatch.blocked) {
      return;
    }

    if (command is ComposerReactionShorthand) {
      if (await _tryReactionShorthand(channelId, command) || !mounted) {
        return;
      }
    }

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
      _clearSlashSession();
      _controller.clear();
      vm.updateMessageText('');
      await vm.applyComposerReplace(
        source: command.source,
        replacement: command.replacement,
        global: command.global,
      );
      return;
    }

    if (composerCommandDispatchKind(command) ==
        ComposerCommandDispatch.executed) {
      FluxerHaptics.send();
      _clearSlashSession();
      _controller.clear();
      vm.updateMessageText('');
      final String? guildId = ref.read(contextualGuildIdProvider);
      await executeComposerSideEffect(
        ref: ref,
        command: command,
        channelId: channelId,
        guildId: guildId,
        l10n: FluxerLocalizations.of(context),
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
      ComposerReactionShorthand() => wireText,
      ComposerReplaceCommand() => wireText,
      ComposerNickCommand() ||
      ComposerKickCommand() ||
      ComposerBanCommand() ||
      ComposerMsgCommand() ||
      ComposerMediaSearchCommand() => wireText,
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
      ComposerReactionShorthand() => resolved,
      ComposerReplaceCommand() => resolved,
      ComposerNickCommand() ||
      ComposerKickCommand() ||
      ComposerBanCommand() ||
      ComposerMsgCommand() ||
      ComposerMediaSearchCommand() => resolved,
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
    FluxerHaptics.send();
    final bool proceed = await _confirmMentionsIfNeeded(channelId, baseContent);
    if (!proceed) {
      return;
    }

    _resetComposerInputAfterSend();
    unawaited(vm.sendMessage(text: baseContent.trim(), tts: tts));
  }

  Future<bool> _tryReactionShorthand(
    String channelId,
    ComposerReactionShorthand command,
  ) async {
    if (ref.read(cloudUploadControllerProvider(channelId)).items.isNotEmpty) {
      return false;
    }
    final _CustomEmojiSendContext emojiContext = _readCustomEmojiSendContext(
      channelId,
    );
    final ReactionShorthandEmoji? reaction = resolveReactionShorthand(
      command.token,
      unicodeByName: EmojiRegistry.resolveSync,
      unicodeBySurrogates: (String surrogates) =>
          EmojiRegistry.entryBySurrogates(surrogates) == null
          ? null
          : surrogates,
      customEmojiMarkdown: emojiContext.lookupMarkdown,
    );
    if (reaction == null) {
      return false;
    }
    final bool reacted = await ref
        .read(chatViewModelProvider.notifier)
        .reactWithShorthand(reaction);
    if (!reacted || !mounted) {
      return reacted;
    }
    _clearSlashSession();
    _controller.clear();
    ref.read(chatViewModelProvider.notifier).updateMessageText('');
    return true;
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
    final bool mentionsEveryone = content.contains('@everyone');
    final bool mentionsHere = content.contains('@here');
    if (!mentionsEveryone &&
        !mentionsHere &&
        !kRoleMentionWirePattern.hasMatch(content)) {
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
    if (mentionsEveryone || mentionsHere) {
      try {
        ref
            .read(gatewayConnectionProvider)
            .requestChannelMemberCounts(
              guildId: guildId,
              channelIds: <String>[channelId],
            );
      } on Object {
        // Fall back to stored guild counts.
      }
    }
    if (!mounted) {
      return false;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ChannelMemberCounts? liveCounts = ref
        .read(channelMemberCountCacheProvider.notifier)
        .getCounts(guildId, channelId);
    final int memberCount = liveCounts?.memberCount ?? guild.memberCount;
    final int onlineCount = liveCounts?.onlineCount ?? guild.onlineCount;
    String? description;
    if (canMentionEveryone &&
        mentionsEveryone &&
        memberCount > kMentionConfirmThreshold) {
      description = l10n.mentionConfirmEveryoneBody(memberCount);
    } else if (canMentionEveryone &&
        mentionsHere &&
        onlineCount > kMentionConfirmThreshold) {
      description = l10n.mentionConfirmHereBody(onlineCount);
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

  void _closeComposerPanelsAndFocusComposer() {
    _keyboardSession.closePanelsAndFocusComposer();
  }

  void _prepareComposerPanelFromKeyboard() {
    _keyboardSession.preparePanelFromKeyboard();
  }

  Future<void> _onAttachPressed(BuildContext context) async {
    if (usesInlineAttachmentPanel(
      isNativeMobileOs: isFluxerNativeMobileOs,
      isMobileLayout: isMobileLayout(context),
    )) {
      if (ref.read(attachmentPanelProvider)) {
        _closeComposerPanelsAndFocusComposer();
        return;
      }
      _prepareComposerPanelFromKeyboard();
      ref.read(expressionPanelProvider.notifier).close();
      ref.read(attachmentPanelProvider.notifier).open();
      FocusScope.of(context).unfocus();
      return;
    }
    ref.read(attachmentPanelProvider.notifier).close();
    final ComposerAttachSource? source = await showComposerAttachSourceMenu(
      context,
    );
    if (source == null || !mounted) {
      return;
    }
    await _pickAttachments(source: source);
  }

  void _focusComposerAfterReplyOrEdit({required bool forEdit}) {
    if (isComposerPanelOpen(
      expressionPanelOpen: ref.read(expressionPanelProvider),
      attachmentPanelOpen: ref.read(attachmentPanelProvider),
    )) {
      _closeComposerPanelsAndFocusComposer();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) {
        return;
      }
      if (forEdit) {
        await _textSession.applyWireTextForEdit(
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
      if (!_focusNode.hasFocus) {
        _focusNode.requestFocus();
      }
    });
  }

  Widget _buildMobilePickerButton(
    BuildContext context,
    ChannelMessagePermissions perms,
  ) {
    final bool isPanelOpen = ref.watch(expressionPanelProvider);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return _composerOpacity(
      context: context,
      enabled: perms.isComposerEnabled,
      child: MobileComposerIconButton(
        key: const ValueKey<String>('mobile-composer-emoji'),
        icon: isPanelOpen
            ? PhosphorIconsFill.keyboard
            : PhosphorIconsFill.smiley,
        semanticLabel: isPanelOpen
            ? l10n.composerShowKeyboard
            : l10n.composerOpenExpressionPicker,
        onPressed: !perms.isComposerEnabled
            ? null
            : () {
                if (isPanelOpen) {
                  _closeComposerPanelsAndFocusComposer();
                } else {
                  _prepareComposerPanelFromKeyboard();
                  ref.read(attachmentPanelProvider.notifier).close();
                  ref.read(expressionPanelProvider.notifier).open();
                  FocusScope.of(context).unfocus();
                }
              },
      ),
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

  Future<void> _pickAttachments({required ComposerAttachSource source}) async {
    switch (source) {
      case ComposerAttachSource.gallery:
        final String channelId = ref.read(chatViewModelProvider).channelId;
        final GallerySelectionChange change = await pickNativeGallerySelection(
          attachments: ref.read(cloudUploadControllerProvider(channelId)).items,
        );
        final FileUploadValidationResult result = await ref
            .read(cloudUploadControllerProvider(channelId).notifier)
            .applyGallerySelection(change);
        if (mounted) {
          _toastUploadValidation(result);
        }
      case ComposerAttachSource.files:
        await _addPickedFiles(await pickNativeFileUploads());
    }
  }

  void _toastUploadValidation(FileUploadValidationResult result) {
    if (!mounted) {
      return;
    }
    final String? message = fileUploadValidationMessage(
      FluxerLocalizations.of(context),
      result,
    );
    if (message == null) {
      return;
    }
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(message: message, variant: FluxerToastVariant.warning),
        );
  }
}
