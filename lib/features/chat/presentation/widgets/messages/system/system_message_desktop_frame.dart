import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/system_message_actions_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/message_context_menu.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_loader.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_action_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/settings/providers/preferences/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class SystemMessageDesktopFrame extends ConsumerStatefulWidget {
  const SystemMessageDesktopFrame({
    required this.message,
    required this.guildId,
    required this.currentUserId,
    required this.isDmChannel,
    required this.canDelete,
    required this.canAddReactions,
    required this.canManageMessages,
    required this.child,
    super.key,
  });

  final Message message;
  final String? guildId;
  final String? currentUserId;
  final bool isDmChannel;
  final bool canDelete;
  final bool canAddReactions;
  final bool canManageMessages;
  final Widget child;

  @override
  ConsumerState<SystemMessageDesktopFrame> createState() =>
      _SystemMessageDesktopFrameState();
}

class _SystemMessageDesktopFrameState
    extends ConsumerState<SystemMessageDesktopFrame> {
  final ValueNotifier<bool> _hovered = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _barHovered = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _menuOpen = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _pickerOpen = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _shiftHeld = ValueNotifier<bool>(false);
  final GlobalKey<FluxerEmojiPickerPopoutState> _pickerKey =
      GlobalKey<FluxerEmojiPickerPopoutState>();
  final LayerLink _link = LayerLink();
  final OverlayPortalController _portal = OverlayPortalController();
  bool _listeningForShift = false;

  late final Listenable _activeState = Listenable.merge(<Listenable>[
    _hovered,
    _barHovered,
    _menuOpen,
    _pickerOpen,
  ]);

  late final Listenable _barContentState = Listenable.merge(<Listenable>[
    _shiftHeld,
    _pickerOpen,
    _menuOpen,
  ]);

  bool get _active =>
      _hovered.value ||
      _barHovered.value ||
      _menuOpen.value ||
      _pickerOpen.value;

  @override
  void initState() {
    super.initState();
    _activeState.addListener(_syncPortal);
  }

  @override
  void dispose() {
    _activeState.removeListener(_syncPortal);
    if (_listeningForShift) {
      HardwareKeyboard.instance.removeHandler(_handleShiftKey);
    }
    _hovered.dispose();
    _barHovered.dispose();
    _menuOpen.dispose();
    _pickerOpen.dispose();
    _shiftHeld.dispose();
    super.dispose();
  }

  void _syncPortal() {
    if (!mounted) {
      return;
    }
    final bool active = _active;
    if (active && !_portal.isShowing) {
      _portal.show();
    } else if (!active && _portal.isShowing) {
      _portal.hide();
    }
    _setShiftListening(active);
  }

  void _setShiftListening(bool listen) {
    if (listen == _listeningForShift) {
      return;
    }
    _listeningForShift = listen;
    if (listen) {
      _shiftHeld.value = HardwareKeyboard.instance.isShiftPressed;
      HardwareKeyboard.instance.addHandler(_handleShiftKey);
    } else {
      HardwareKeyboard.instance.removeHandler(_handleShiftKey);
      _shiftHeld.value = false;
    }
  }

  bool _handleShiftKey(KeyEvent event) {
    _shiftHeld.value = HardwareKeyboard.instance.isShiftPressed;
    return false;
  }

  bool get _canReact =>
      widget.canAddReactions && widget.message.supportsInteractiveActions;

  MessageActionPermissions get _permissions => MessageActionPermissions(
    isOwnMessage:
        widget.currentUserId != null &&
        widget.message.authorId == widget.currentUserId,
    isDmChannel: widget.isDmChannel,
    canDelete: widget.canDelete,
    canReport: false,
    canAddReactions: widget.canAddReactions,
    canPinMessage: false,
    canManageMessages: widget.canManageMessages,
    canSendMessages: false,
    developerMode: ref.read(
      userSettingsViewModelProvider.select((s) => s.developerMode),
    ),
  );

  void _quickReact(QuickReactionItem item) =>
      toggleSystemMessageQuickReaction(ref, widget.message, item);

  void _dispatch(
    MessageAction action, {
    FluxerKeyModifiers modifiers = FluxerKeyModifiers.none,
  }) {
    if (!mounted) {
      return;
    }
    if (action == MessageAction.addReaction) {
      _openPicker();
      return;
    }
    handleSystemMessageAction(
      context,
      ref,
      action: action,
      message: widget.message,
      guildId: widget.guildId,
      currentUserId: widget.currentUserId,
      modifiers: modifiers,
    );
  }

  void _openPicker() {
    _hovered.value = true;
    _pickerOpen.value = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !(_pickerKey.currentState?.isOpen ?? false)) {
        _pickerKey.currentState?.toggle();
      }
    });
  }

  Future<void> _showMenu(Offset position, {Rect? anchorRect}) async {
    if (_menuOpen.value) {
      return;
    }
    _menuOpen.value = true;
    MessageMenuSelection? selection;
    try {
      selection = await showMessageContextMenu(
        context,
        position: position,
        anchorRect: anchorRect,
        message: widget.message,
        permissions: _permissions,
        callbacks: const MessageActionCallbacks(),
        onQuickReaction: _quickReact,
        quickReactionChannelId: widget.message.channelId,
        quickReactionGuildId: widget.guildId,
      );
    } finally {
      if (mounted) {
        _hovered.value = false;
        _menuOpen.value = false;
      }
    }
    final MessageMenuSelection? picked = selection;
    if (picked == null) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _dispatch(picked.action, modifiers: picked.modifiers),
    );
  }

  void _openMoreMenu(BuildContext buttonContext) {
    final RenderObject? box = buttonContext.findRenderObject();
    if (box is! RenderBox || !box.hasSize) {
      return;
    }
    final Rect anchor = box.localToGlobal(Offset.zero) & box.size;
    unawaited(_showMenu(anchor.topLeft, anchorRect: anchor));
  }

  @override
  Widget build(BuildContext context) {
    final Color hoverTint = context.colors.backgroundModifierHover;
    return OverlayPortal(
      controller: _portal,
      overlayChildBuilder: _buildActionBarOverlay,
      child: CompositedTransformTarget(
        link: _link,
        child: FluxerGestureDetector(
          behavior: HitTestBehavior.translucent,
          cursor: MouseCursor.defer,
          onSecondaryTapUp: (TapUpDetails details) =>
              unawaited(_showMenu(details.globalPosition)),
          child: MouseRegion(
            onEnter: (_) => _hovered.value = true,
            onExit: (_) {
              if (!_menuOpen.value && !_pickerOpen.value) {
                _hovered.value = false;
              }
            },
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: ListenableBuilder(
                    listenable: _activeState,
                    builder: (BuildContext context, _) => _active
                        ? ColoredBox(color: hoverTint)
                        : const SizedBox.shrink(),
                  ),
                ),
                widget.child,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionBarOverlay(BuildContext overlayContext) {
    final TextDirection direction = Directionality.of(overlayContext);
    final Alignment topEnd = AlignmentDirectional.topEnd.resolve(direction);
    final Widget follower = CompositedTransformFollower(
      link: _link,
      showWhenUnlinked: false,
      targetAnchor: topEnd,
      followerAnchor: topEnd,
      offset: Offset(
        direction == TextDirection.rtl
            ? kMessageActionBarEndInset
            : -kMessageActionBarEndInset,
        kMessageActionBarTopOffset,
      ),
      child: Align(
        alignment: topEnd,
        child: MouseRegion(
          onEnter: (_) => _barHovered.value = true,
          onExit: (_) {
            if (mounted) {
              _barHovered.value = false;
            }
          },
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, _) {
              final (
                bool showBar,
                bool shiftExpand,
                bool onlyMore,
                bool quickReactions,
              ) = ref.watch(
                advancedPreferencesProvider.select(
                  (AdvancedPreferencesState s) => (
                    s.showMessageActionBar,
                    s.showMessageActionBarShiftExpand,
                    s.showMessageActionBarOnlyMoreButton,
                    s.showMessageActionBarQuickReactions,
                  ),
                ),
              );
              if (!showBar) {
                return const SizedBox.shrink();
              }
              return ListenableBuilder(
                listenable: _barContentState,
                builder: (BuildContext context, _) => MessageActionBar(
                  children: onlyMore
                      ? <Widget>[_moreButton(context)]
                      : _buttons(
                          context,
                          showFull: shiftExpand && _shiftHeld.value,
                          showQuickReactions: quickReactions,
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
    return clipMessageActionBarToViewport(
      rowContext: context,
      overlayContext: overlayContext,
      child: follower,
    );
  }

  Widget _moreButton(BuildContext context) => Builder(
    builder: (BuildContext buttonContext) => MessageActionBarButton(
      label: FluxerLocalizations.of(context).chatMessageMore,
      active: _menuOpen.value,
      onTap: () => _openMoreMenu(buttonContext),
      child: const PhosphorIcon(PhosphorIconsBold.dotsThree),
    ),
  );

  List<Widget> _buttons(
    BuildContext context, {
    required bool showFull,
    required bool showQuickReactions,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Message message = widget.message;
    final bool interactive = message.supportsInteractiveActions;
    return <Widget>[
      if (_canReact && showQuickReactions && !showFull)
        MessageQuickReactionItems(
          channelId: message.channelId,
          guildId: widget.guildId,
          reuseCached: true,
          builder: (BuildContext context, List<QuickReactionItem> items) => Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final QuickReactionItem item in items.take(3))
                MessageActionBarButton(
                  label: quickReactionShortcode(item),
                  onTap: () => _quickReact(item),
                  child: QuickReactionGlyph(
                    item: item,
                    size: kMessageActionBarIconSize,
                  ),
                ),
            ],
          ),
        ),
      if (showFull) ...<Widget>[
        MessageActionBarButton(
          label: l10n.chatMessageCopyMessageId,
          onTap: () => _dispatch(MessageAction.copyMessageId),
          child: const PhosphorIcon(PhosphorIconsRegular.snowflake),
        ),
        if (interactive)
          MessageActionBarButton(
            label: l10n.chatMessageCopyMessageLink,
            onTap: () => _dispatch(MessageAction.copyMessageLink),
            child: const PhosphorIcon(PhosphorIconsBold.link),
          ),
        MessageActionBarButton(
          label: l10n.chatMessageMarkAsUnread,
          onTap: () => _dispatch(MessageAction.markAsUnread),
          child: const PhosphorIcon(PhosphorIconsFill.envelopeOpen),
        ),
      ],
      if (_canReact)
        FluxerEmojiPickerPopout(
          key: _pickerKey,
          closeOnEmojiSelect: true,
          visibleTabs: const <ExpressionPickerTab>[ExpressionPickerTab.emojis],
          channelId: message.channelId,
          placement: FluxerEmojiPickerPlacement.leftStart,
          onClose: () {
            _pickerOpen.value = false;
            _hovered.value = false;
          },
          onEmojiSelected: (FluxerSelectedEmoji emoji) =>
              toggleSystemMessageReactionFromEmoji(ref, message, emoji),
          child: MessageActionBarButton(
            label: l10n.chatMessageAddReaction,
            active: _pickerOpen.value,
            onTap: () {
              _pickerKey.currentState?.toggle();
              _pickerOpen.value = _pickerKey.currentState?.isOpen ?? false;
            },
            child: const PhosphorIcon(PhosphorIconsFill.smiley),
          ),
        ),
      if (showFull && widget.canDelete)
        MessageActionBarButton(
          label: l10n.chatMessageDelete,
          danger: true,
          onSelect: (FluxerKeyModifiers modifiers) =>
              _dispatch(MessageAction.delete, modifiers: modifiers),
          child: const PhosphorIcon(PhosphorIconsFill.trash),
        )
      else
        _moreButton(context),
    ];
  }
}
