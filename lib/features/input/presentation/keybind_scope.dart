import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/default_keybinds.dart';
import 'package:fluxer_app/features/input/domain/global_shortcut_matcher.dart';
import 'package:fluxer_app/features/input/domain/global_shortcut_press_deduper.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo_matcher.dart';
import 'package:fluxer_app/features/input/domain/keybind_dispatch_context.dart';
import 'package:fluxer_app/features/input/domain/keybind_resolution.dart';
import 'package:fluxer_app/features/input/domain/mouse_button_tracker.dart';
import 'package:fluxer_app/features/input/presentation/keybind_recorder.dart';
import 'package:fluxer_app/features/input/providers/composer_focus_coordinator_provider.dart';
import 'package:fluxer_app/features/input/providers/focused_message_provider.dart';
import 'package:fluxer_app/features/input/providers/global_shortcuts_provider.dart';
import 'package:fluxer_app/features/input/providers/keybind_handler_registry.dart';
import 'package:fluxer_app/features/input/providers/keybind_preferences_provider.dart';
import 'package:fluxer_app/features/input/providers/keyboard_mode_provider.dart';
import 'package:fluxer_app/features/input/providers/message_keyboard_navigation_provider.dart';
import 'package:fluxer_app/features/input/services/keybind_dispatcher.dart';
import 'package:fluxer_app/features/input/services/keybind_handlers.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/input/text_editing_shortcuts.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_layer_stack.dart';
import 'package:fluxer_app/features/ui/roving_focus/fluxer_roving_focus_list.dart';
import 'package:fluxer_app/features/voice/providers/pending_incoming_voice_calls_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class KeybindScope extends ConsumerStatefulWidget {
  const KeybindScope({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<KeybindScope> createState() => _KeybindScopeState();
}

class _KeybindScopeState extends ConsumerState<KeybindScope>
    with WidgetsBindingObserver {
  final KeybindDispatcher _dispatcher = KeybindDispatcher();
  final Set<KeybindAction> _heldActions = <KeybindAction>{};
  final Set<KeybindAction> _globallyHeldActions = <KeybindAction>{};
  final GlobalShortcutPressDeduper _pressDeduper = GlobalShortcutPressDeduper();
  final MouseButtonTracker _mouseButtons = MouseButtonTracker();
  late final GlobalShortcuts _globalShortcuts;
  late final KeybindHandlerRegistry _handlerRegistry;
  bool _handlersRegistered = false;
  final Stopwatch _clock = Stopwatch()..start();
  Duration? _windowFocusedAt;

  static const Duration _kRefocusPointerThreshold = Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();
    _handlerRegistry = ref.read(keybindHandlerRegistryProvider);
    HardwareKeyboard.instance.addHandler(_handleKeyEvent);
    GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointerEvent);
    WidgetsBinding.instance.addObserver(this);
    _applyKeybindPreferences(ref.read(keybindPreferencesProvider));
    ref.listenManual<KeybindPreferencesState>(
      keybindPreferencesProvider,
      (_, KeybindPreferencesState next) => _applyKeybindPreferences(next),
    );
    _globalShortcuts = ref.read(globalShortcutsProvider.notifier);
    ref.listenManual<GlobalShortcutsState>(
      globalShortcutsProvider,
      (_, GlobalShortcutsState next) => _setGlobalRouting(active: next.running),
      fireImmediately: true,
    );
    _globalShortcuts.attach(_handleGlobalShortcut);
  }

  void _setGlobalRouting({required bool active}) {
    if (_dispatcher.globalRoutingActive == active) {
      return;
    }
    _releaseHeldActions();
    _dispatcher.globalRoutingActive = active;
  }

  void _handleGlobalShortcut(GlobalShortcutTransition transition) {
    if (!mounted) {
      return;
    }
    final KeybindHandlerRegistry registry = ref.read(
      keybindHandlerRegistryProvider,
    );
    final KeybindAction action = transition.action;
    final bool hold = kHoldKeybindActions.contains(action);
    switch (transition.phase) {
      case GlobalShortcutPhase.press:
        if (hold) {
          _globallyHeldActions.add(action);
        } else if (_pressDeduper.isDuplicate(
          action,
          GlobalShortcutPressSource.hook,
        )) {
          return;
        }
        unawaited(registry.invoke(action));
      case GlobalShortcutPhase.release:
        if (_globallyHeldActions.remove(action)) {
          registry.invokeRelease(action);
        }
    }
  }

  void _applyKeybindPreferences(KeybindPreferencesState preferences) {
    _dispatcher.entries = resolveEffectiveKeybinds(
      defaults: buildDefaultKeybinds(),
      customKeybinds: preferences.customKeybinds,
      disableBuiltinKeybinds: preferences.disableBuiltinKeybinds,
    );
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    GestureBinding.instance.pointerRouter.removeGlobalRoute(
      _handlePointerEvent,
    );
    WidgetsBinding.instance.removeObserver(this);
    _globalShortcuts.detach(_handleGlobalShortcut);
    _releaseHeldActions();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _windowFocusedAt = _clock.elapsed;
      return;
    }
    _releaseHeldActions();
  }

  bool _isWithinWindowRefocus() {
    if (WidgetsBinding.instance.lifecycleState != AppLifecycleState.resumed) {
      return true;
    }
    final Duration? focusedAt = _windowFocusedAt;
    return focusedAt != null &&
        _clock.elapsed - focusedAt <= _kRefocusPointerThreshold;
  }

  void _releaseHeldActions() {
    for (final KeybindAction action in _heldActions) {
      _handlerRegistry.invokeRelease(action);
    }
    _heldActions.clear();
  }

  bool _handleHoldRelease(KeyEvent event) {
    if (_heldActions.isEmpty) {
      return false;
    }
    return _releaseHeld(_dispatcher.matchHoldActions(event));
  }

  bool _releaseHeld(List<KeybindAction> matched) {
    final List<KeybindAction> released = matched
        .where(_heldActions.contains)
        .toList();
    if (released.isEmpty) {
      return false;
    }
    final KeybindHandlerRegistry registry = ref.read(
      keybindHandlerRegistryProvider,
    );
    for (final KeybindAction action in released) {
      _heldActions.remove(action);
      registry.invokeRelease(action);
    }
    return true;
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
    if (KeybindRecorder.isRecording) {
      return false;
    }
    if (FluxerLayerStack.instance.handleEscape(event)) {
      return true;
    }
    if (isTouchPrimaryInput(ref)) {
      return false;
    }
    if (event is KeyUpEvent) {
      return _handleHoldRelease(event);
    }
    if (event is KeyRepeatEvent && _heldActions.isNotEmpty) {
      return _dispatcher.matchHoldActions(event).any(_heldActions.contains);
    }
    if (event is! KeyDownEvent) {
      return false;
    }
    if (event.logicalKey == LogicalKeyboardKey.escape && _isLayerOpen()) {
      return false;
    }

    final ComposerFocusCoordinator composer = ref.read(
      composerFocusCoordinatorProvider,
    );
    if (composer.composerClaimsKeyEvent(event)) {
      return false;
    }

    if (matchTextEditingShortcut(event) != null) {
      return false;
    }

    if (event.logicalKey == LogicalKeyboardKey.tab) {
      return _handleTabKey();
    }

    if (FluxerRovingFocusList.claimsKeyEvent(event) ||
        FluxerDesktopMenuNavigator.claimsKeyEvent(event)) {
      return false;
    }

    final KeybindDispatchContext contextState = _buildContext();
    final List<DefaultKeybind> entries = _dispatcher.matchEntries(
      event: event,
      context: contextState,
    );
    if (entries.isEmpty) {
      if (_handleArrowUpToComposer(event)) {
        return true;
      }
      return _handleKeyboardModeNavigation(event);
    }
    if (_dispatcher.globalRoutingActive &&
        entries.first.global &&
        _pressDeduper.isDuplicate(
          entries.first.action,
          GlobalShortcutPressSource.window,
        )) {
      return true;
    }
    if (entries.first.action == KeybindAction.chatFocusTextarea &&
        isAnyKeyFocusTextareaTrigger(event)) {
      if (event.character == ' ' && _controlHasFocus()) {
        return false;
      }
      return ref
          .read(composerFocusCoordinatorProvider)
          .typeIntoComposer(event.character!);
    }

    unawaited(
      _dispatchFirst(<KeybindAction>[
        for (final DefaultKeybind entry in entries) entry.action,
      ]),
    );
    return true;
  }

  void _handlePointerEvent(PointerEvent event) {
    final MouseButtonChange? change = _mouseButtons.track(event);
    if (change == null) {
      return;
    }
    for (final int button in change.released) {
      if (_heldActions.isNotEmpty) {
        _releaseHeld(_dispatcher.matchMouseHoldActions(button));
      }
    }
    if (KeybindRecorder.isRecording) {
      return;
    }
    change.pressed.forEach(_handleMouseButtonDown);
  }

  void _handleMouseButtonDown(int button) {
    final List<DefaultKeybind> entries = _dispatcher.matchMouseEntries(
      button: button,
      context: _buildContext(),
    );
    if (entries.isEmpty) {
      return;
    }
    if (_dispatcher.globalRoutingActive &&
        entries.first.global &&
        _pressDeduper.isDuplicate(
          entries.first.action,
          GlobalShortcutPressSource.window,
        )) {
      return;
    }
    unawaited(
      _dispatchFirst(<KeybindAction>[
        for (final DefaultKeybind entry in entries) entry.action,
      ]),
    );
  }

  bool _handleTabKey() {
    final bool wasKeyboardMode = ref.read(keyboardModeProvider);
    ref.read(keyboardModeProvider.notifier).enter();
    if (wasKeyboardMode || !_canRedirectTabToComposer()) {
      return false;
    }
    ref.read(focusedMessageProvider.notifier).clear();
    ref.read(composerFocusCoordinatorProvider).requestComposerFocus();
    return true;
  }

  bool _canRedirectTabToComposer() {
    final ComposerFocusCoordinator composer = ref.read(
      composerFocusCoordinatorProvider,
    );
    if (!composer.hasComposer || _isLayerOpen()) {
      return false;
    }
    return composer.composerHasFocus() || !_isTextInputFocused();
  }

  bool _handleArrowUpToComposer(KeyEvent event) {
    if (event.logicalKey != LogicalKeyboardKey.arrowUp ||
        _hasShortcutModifier()) {
      return false;
    }
    if (ref.read(keyboardModeProvider) ||
        _controlHasFocus() ||
        _isLayerOpen()) {
      return false;
    }
    final ComposerFocusCoordinator composer = ref.read(
      composerFocusCoordinatorProvider,
    );
    if (composer.readComposerText().trim().isNotEmpty) {
      return false;
    }
    if (!composer.composerHandleArrowUpEmpty()) {
      return false;
    }
    composer.requestComposerFocus();
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

  bool _hasShortcutModifier() {
    final HardwareKeyboard keyboard = HardwareKeyboard.instance;
    return keyboard.isAltPressed ||
        keyboard.isControlPressed ||
        keyboard.isMetaPressed ||
        keyboard.isShiftPressed;
  }

  bool _controlHasFocus() {
    final FocusNode? focus = FocusManager.instance.primaryFocus;
    return focus != null && focus is! FocusScopeNode;
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
    );
  }

  bool _isLayerOpen() => FluxerLayerStack.instance.hasLayers || _isModalOpen();

  bool _isModalOpen() {
    final BuildContext? rootContext = rootNavigatorKey.currentContext;
    if (rootContext == null) {
      return false;
    }
    return Navigator.of(rootContext).canPop();
  }

  Future<void> _dispatchFirst(List<KeybindAction> actions) async {
    final KeybindHandlerRegistry registry = ref.read(
      keybindHandlerRegistryProvider,
    );
    for (final KeybindAction action in actions) {
      final bool handled = await registry.invoke(action);
      if (handled && kHoldKeybindActions.contains(action)) {
        _heldActions.add(action);
      }
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
        if (ref.read(keyboardModeProvider) && !_isWithinWindowRefocus()) {
          ref.read(keyboardModeProvider.notifier).exit();
          ref.read(focusedMessageProvider.notifier).clear();
        }
      },
      behavior: HitTestBehavior.translucent,
      child: widget.child,
    );
  }
}
