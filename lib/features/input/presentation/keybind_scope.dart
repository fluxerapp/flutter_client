import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_dispatch_context.dart';
import 'package:fluxer_app/features/input/providers/composer_focus_coordinator_provider.dart';
import 'package:fluxer_app/features/input/providers/focused_message_provider.dart';
import 'package:fluxer_app/features/input/providers/keybind_handler_registry.dart';
import 'package:fluxer_app/features/input/providers/keyboard_mode_provider.dart';
import 'package:fluxer_app/features/input/providers/message_keyboard_navigation_provider.dart';
import 'package:fluxer_app/features/input/services/keybind_dispatcher.dart';
import 'package:fluxer_app/features/input/services/keybind_handlers.dart';
import 'package:fluxer_app/features/quick_switcher/providers/quick_switcher_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/voice/providers/pending_incoming_voice_calls_provider.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:material_ui/material_ui.dart';

class KeybindScope extends ConsumerStatefulWidget {
  const KeybindScope({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<KeybindScope> createState() => _KeybindScopeState();
}

class _KeybindScopeState extends ConsumerState<KeybindScope> {
  final KeybindDispatcher _dispatcher = KeybindDispatcher();
  bool _handlersRegistered = false;

  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler(_handleKeyEvent);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_handlersRegistered) {
      registerKeybindHandlers(ref: ref, context: context);
      _handlersRegistered = true;
    }
  }

  bool _handleKeyEvent(KeyEvent event) {
    if (isTouchPrimaryInput(ref)) {
      return false;
    }
    if (event is! KeyDownEvent) {
      return false;
    }

    if (_isClipboardShortcut(event)) {
      return false;
    }

    if (event.logicalKey == LogicalKeyboardKey.tab &&
        !HardwareKeyboard.instance.isShiftPressed) {
      return _handleTabKey();
    }

    final KeybindDispatchContext contextState = _buildContext();
    final List<KeybindAction> actions = _dispatcher.matchActions(
      event: event,
      context: contextState,
    );
    if (actions.isEmpty) {
      return _handleKeyboardModeNavigation(event);
    }

    unawaited(_dispatchFirst(actions));
    return true;
  }

  bool _handleTabKey() {
    final bool wasKeyboardMode = ref.read(keyboardModeProvider);
    ref.read(keyboardModeProvider.notifier).enter();
    if (!wasKeyboardMode) {
      ref.read(focusedMessageProvider.notifier).clear();
      ref.read(composerFocusCoordinatorProvider).requestComposerFocus();
    }
    return true;
  }

  bool _handleKeyboardModeNavigation(KeyEvent event) {
    if (!ref.read(keyboardModeProvider)) {
      return false;
    }
    if (event.logicalKey != LogicalKeyboardKey.arrowUp &&
        event.logicalKey != LogicalKeyboardKey.arrowDown) {
      return false;
    }
    if (_hasShortcutModifier()) {
      return false;
    }
    if (ref.read(composerFocusCoordinatorProvider).composerHasFocus()) {
      return false;
    }
    if (_isTextInputFocused()) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    final MessageKeyboardNavigationCoordinator nav = ref.read(
      messageKeyboardNavigationProvider,
    );
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      nav.focusPrevious();
      return nav.hasHandlers;
    }
    nav.focusNext();
    return nav.hasHandlers;
  }

  bool _isClipboardShortcut(KeyEvent event) {
    final HardwareKeyboard keyboard = HardwareKeyboard.instance;
    if (!keyboard.isControlPressed && !keyboard.isMetaPressed) {
      return false;
    }
    if (keyboard.isAltPressed) {
      return false;
    }
    return event.logicalKey == LogicalKeyboardKey.keyC ||
        event.logicalKey == LogicalKeyboardKey.keyX ||
        event.logicalKey == LogicalKeyboardKey.keyV;
  }

  bool _hasShortcutModifier() {
    final HardwareKeyboard keyboard = HardwareKeyboard.instance;
    return keyboard.isAltPressed ||
        keyboard.isControlPressed ||
        keyboard.isMetaPressed ||
        keyboard.isShiftPressed;
  }

  bool _isTextInputFocused() {
    final FocusNode? focus = FocusManager.instance.primaryFocus;
    if (focus == null || !focus.hasFocus) {
      return false;
    }
    final BuildContext? focusContext = focus.context;
    if (focusContext == null) {
      return false;
    }
    return focusContext.findAncestorWidgetOfExactType<EditableText>() != null;
  }

  String _readEditableText() {
    final ComposerFocusCoordinator composer = ref.read(
      composerFocusCoordinatorProvider,
    );
    if (composer.composerHasFocus()) {
      return composer.readComposerText();
    }
    final FocusNode? focus = FocusManager.instance.primaryFocus;
    final BuildContext? focusContext = focus?.context;
    if (focusContext == null) {
      return '';
    }
    final EditableTextState? editableState = focusContext
        .findAncestorStateOfType<EditableTextState>();
    return editableState?.textEditingValue.text ?? '';
  }

  KeybindDispatchContext _buildContext() {
    final String? channelId = ref.read(activeChannelIdProvider);
    final bool channelHasUnread =
        channelId != null &&
        (ref.read(channelUnreadProvider(channelId)).value?.hasUnreadMessages ??
            false);
    return KeybindDispatchContext(
      keyboardModeEnabled: ref.read(keyboardModeProvider),
      hasMessageFocus: ref.read(focusedMessageProvider).hasFocus,
      editableHasFocus: _isTextInputFocused(),
      editableText: _readEditableText(),
      modalOpen: _isModalOpen(),
      fullscreenMediaOpen: false,
      hasIncomingCall: ref
          .read(pendingIncomingVoiceChannelIdsProvider)
          .isNotEmpty,
      channelHasUnread: channelHasUnread,
      quickSwitcherOpen: ref.read(quickSwitcherProvider).isOpen,
    );
  }

  bool _isModalOpen() {
    final BuildContext? rootContext = rootNavigatorKey.currentContext;
    if (rootContext == null) {
      return false;
    }
    return ModalRoute.of(rootContext)?.isCurrent != true ||
        Navigator.of(rootContext).canPop();
  }

  Future<void> _dispatchFirst(List<KeybindAction> actions) async {
    final KeybindHandlerRegistry registry = ref.read(
      keybindHandlerRegistryProvider,
    );
    for (final KeybindAction action in actions) {
      final bool handled = await registry.invoke(action);
      if (handled) {
        if (action == KeybindAction.messageFocusTextarea) {
          final bool escapeExits = ref.read(
            appearancePreferencesProvider.select(
              (state) => state.escapeExitsKeyboardMode,
            ),
          );
          if (escapeExits) {
            ref.read(keyboardModeProvider.notifier).exit();
          }
        }
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        if (ref.read(keyboardModeProvider)) {
          ref.read(keyboardModeProvider.notifier).exit();
          ref.read(focusedMessageProvider.notifier).clear();
        }
      },
      behavior: HitTestBehavior.translucent,
      child: widget.child,
    );
  }
}
