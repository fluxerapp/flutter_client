import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_provider.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_state.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/input/domain/default_keybinds.dart';
import 'package:fluxer_app/features/input/domain/global_shortcut_binding.dart';
import 'package:fluxer_app/features/input/domain/global_shortcut_matcher.dart';
import 'package:fluxer_app/features/input/domain/global_shortcut_resolution.dart';
import 'package:fluxer_app/features/input/domain/keybind_dom_codes.dart';
import 'package:fluxer_app/features/input/domain/mac_key_codes.dart';
import 'package:fluxer_app/features/input/presentation/keybind_recorder.dart';
import 'package:fluxer_app/features/input/providers/keybind_preferences_provider.dart';
import 'package:fluxer_macos/fluxer_macos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_shortcuts_provider.g.dart';

typedef GlobalShortcutListener =
    void Function(GlobalShortcutTransition transition);

@immutable
class GlobalShortcutsState {
  const GlobalShortcutsState({this.running = false, this.startFailed = false});

  final bool running;
  final bool startFailed;

  @override
  bool operator ==(Object other) =>
      other is GlobalShortcutsState &&
      other.running == running &&
      other.startFailed == startFailed;

  @override
  int get hashCode => Object.hash(running, startFailed);
}

@Riverpod(keepAlive: true)
MacInputHook macInputHook(Ref ref) => MacInputHook();

@Riverpod(keepAlive: true)
class GlobalShortcuts extends _$GlobalShortcuts {
  final GlobalShortcutMatcher _matcher = GlobalShortcutMatcher();
  List<GlobalShortcutBinding> _bindings = const <GlobalShortcutBinding>[];
  GlobalShortcutListener? _listener;
  MacInputHook? _hook;
  Future<void> _queue = Future<void>.value();

  @override
  GlobalShortcutsState build() {
    if (!macPermissions.isSupported) {
      return const GlobalShortcutsState();
    }
    ref
      ..listen<KeybindPreferencesState>(
        keybindPreferencesProvider,
        (_, KeybindPreferencesState next) => _applyPreferences(next),
      )
      ..listen<bool>(
        macPermissionStatusesProvider.select(
          (MacPermissionsState state) =>
              state.isGranted(MacPermissionKind.inputMonitoring),
        ),
        (_, _) => _enqueueSync(),
      )
      ..onDispose(() {
        _listener = null;
        unawaited(_stopHook());
      });
    return const GlobalShortcutsState();
  }

  void attach(GlobalShortcutListener listener) {
    if (!macPermissions.isSupported) {
      return;
    }
    _listener = listener;
    _applyPreferences(ref.read(keybindPreferencesProvider));
  }

  void detach(GlobalShortcutListener listener) {
    if (_listener != listener) {
      return;
    }
    _emit(_matcher.releaseAll());
    _listener = null;
    _enqueueSync();
  }

  void _applyPreferences(KeybindPreferencesState preferences) {
    _bindings = resolveGlobalShortcutBindings(
      defaults: buildDefaultKeybinds(),
      customKeybinds: preferences.customKeybinds,
      disableBuiltinKeybinds: preferences.disableBuiltinKeybinds,
      isMacOS: true,
    );
    _emit(_matcher.setBindings(_bindings));
    _enqueueSync();
  }

  bool get _wantsHook =>
      _listener != null &&
      _bindings.isNotEmpty &&
      macPermissions.state.isGranted(MacPermissionKind.inputMonitoring);

  void _enqueueSync() {
    _queue = _queue.then((_) => _sync());
  }

  Future<void> _sync() async {
    if (!ref.mounted) {
      return;
    }
    try {
      if (!_wantsHook) {
        if (state.running) {
          await _stopHook();
          _emit(_matcher.releaseAll());
        }
        _setState(const GlobalShortcutsState());
        return;
      }
      final MacInputHook hook = ref.read(macInputHookProvider);
      _hook = hook;
      await hook.setFilter(
        keycodes: _filterKeycodes(),
        buttons: _filterButtons(),
        modifiers: _bindings.any(
          (GlobalShortcutBinding binding) =>
              binding.trigger is ModifierShortcutTrigger,
        ),
      );
      if (!ref.mounted || state.running) {
        return;
      }
      final MacInputHookStartResult result = await hook.start(
        onEvent: _handleEvent,
        onReleaseAll: _handleReleaseAll,
      );
      if (result != MacInputHookStartResult.ok) {
        talker.warning('[GlobalShortcuts] Hook did not start: ${result.name}');
      }
      _setState(
        GlobalShortcutsState(
          running: result == MacInputHookStartResult.ok,
          startFailed: result == MacInputHookStartResult.startFailed,
        ),
      );
    } on Object catch (error, stackTrace) {
      talker.warning('[GlobalShortcuts] Sync failed', error, stackTrace);
      _setState(const GlobalShortcutsState(startFailed: true));
    }
  }

  Future<void> _stopHook() async {
    try {
      await _hook?.stop();
    } on Object catch (error, stackTrace) {
      talker.warning('[GlobalShortcuts] Stop failed', error, stackTrace);
    }
  }

  List<int> _filterKeycodes() => <int>[
    for (final GlobalShortcutBinding binding in _bindings)
      if (binding.trigger case KeyShortcutTrigger(:final String code))
        ?kMacKeyCodeForDomCode[code],
  ];

  List<int> _filterButtons() => <int>[
    for (final GlobalShortcutBinding binding in _bindings)
      if (binding.trigger case MouseShortcutTrigger(:final int button)) button,
  ];

  void _handleEvent(MacInputEvent event) {
    final bool releaseOnly = KeybindRecorder.isRecording;
    final Set<KeybindModifier> modifiers = <KeybindModifier>{
      if (event.ctrl) KeybindModifier.ctrl,
      if (event.alt) KeybindModifier.alt,
      if (event.shift) KeybindModifier.shift,
      if (event.meta) KeybindModifier.meta,
    };
    switch (event.type) {
      case MacInputEventType.keyDown:
      case MacInputEventType.keyUp:
        _emit(
          _matcher.handleKey(
            GlobalShortcutKeyEvent(
              down: event.type == MacInputEventType.keyDown,
              keycode: event.keycode,
              code: kMacKeyCodes[event.keycode],
              modifiers: modifiers,
            ),
            releaseOnly: releaseOnly,
          ),
        );
      case MacInputEventType.mouseDown:
      case MacInputEventType.mouseUp:
        _emit(
          _matcher.handleMouse(
            GlobalShortcutMouseEvent(
              down: event.type == MacInputEventType.mouseDown,
              button: event.button,
              modifiers: modifiers,
            ),
            releaseOnly: releaseOnly,
          ),
        );
    }
  }

  void _handleReleaseAll() => _emit(_matcher.releaseAll());

  void _emit(List<GlobalShortcutTransition> transitions) {
    final GlobalShortcutListener? listener = _listener;
    if (listener != null) {
      transitions.forEach(listener);
    }
  }

  void _setState(GlobalShortcutsState next) {
    if (ref.mounted) {
      state = next;
    }
  }
}
