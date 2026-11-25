import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/domain/global_shortcut_matcher.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/providers/global_shortcuts_provider.dart';
import 'package:fluxer_app/features/input/providers/keybind_preferences_provider.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

import '../../../helpers/fake_mac_permissions.dart';

class _FakeHook implements MacInputHook {
  MacInputHookStartResult result = MacInputHookStartResult.ok;
  int starts = 0;
  int stops = 0;
  List<int> keycodes = <int>[];
  void Function(MacInputEvent event)? emit;
  void Function()? releaseAll;

  @override
  Future<MacInputHookStartResult> start({
    required void Function(MacInputEvent event) onEvent,
    required void Function() onReleaseAll,
  }) async {
    starts++;
    emit = onEvent;
    releaseAll = onReleaseAll;
    return result;
  }

  @override
  Future<void> stop() async => stops++;

  @override
  Future<void> setFilter({
    required List<int> keycodes,
    required List<int> buttons,
    required bool modifiers,
  }) async => this.keycodes = keycodes;

  @override
  void onEvent(MacInputEvent event) {}

  @override
  void onReleaseAll() {}
}

class _FakePreferences extends KeybindPreferences {
  @override
  KeybindPreferencesState build() => KeybindPreferencesState(
    disableBuiltinKeybinds: true,
    customKeybinds: <CustomKeybindEntry>[
      CustomKeybindEntry(
        id: 'ptt',
        action: keybindActionId(KeybindAction.voicePushToTalk),
        combo: const StoredKeybindCombo(key: 'v', code: 'KeyV', global: true),
      ),
    ],
  );
}

MacInputEvent _event(MacInputEventType type) => MacInputEvent(
  type: type,
  keycode: 0x09,
  button: 0,
  ctrl: false,
  alt: false,
  shift: false,
  meta: false,
);

void main() {
  late FakeMacPermissions permissions;
  late _FakeHook hook;
  late ProviderContainer container;
  late List<String> log;

  void listener(GlobalShortcutTransition transition) =>
      log.add(transition.toString());

  setUp(() {
    permissions = installFakeMacPermissions();
    hook = _FakeHook();
    log = <String>[];
    container = ProviderContainer(
      overrides: [
        macInputHookProvider.overrideWithValue(hook),
        keybindPreferencesProvider.overrideWith(_FakePreferences.new),
      ],
    );
  });

  tearDown(() {
    container.dispose();
    resetMacPermissions();
  });

  Future<void> grant() async {
    permissions.statuses[MacPermissionKind.inputMonitoring] =
        MacPermissionStatus.granted;
    await macPermissions.refreshKind(MacPermissionKind.inputMonitoring);
    await pumpEventQueue();
  }

  test('never prompts and starts once access is granted', () async {
    container.read(globalShortcutsProvider.notifier).attach(listener);
    await pumpEventQueue();
    expect(hook.starts, 0);
    expect(permissions.requested, isEmpty);

    await grant();
    expect(hook.starts, 1);
    expect(hook.keycodes, <int>[0x09]);
    expect(container.read(globalShortcutsProvider).running, isTrue);

    hook
      ..emit!(_event(MacInputEventType.keyDown))
      ..emit!(_event(MacInputEventType.keyUp));
    expect(log, <String>['ptt:press', 'ptt:release']);
  });

  test('release all ends a held shortcut', () async {
    container.read(globalShortcutsProvider.notifier).attach(listener);
    await grant();
    hook.emit!(_event(MacInputEventType.keyDown));
    hook.releaseAll!();
    expect(log, <String>['ptt:press', 'ptt:release']);
  });

  test('reports a failed start', () async {
    hook.result = MacInputHookStartResult.startFailed;
    container.read(globalShortcutsProvider.notifier).attach(listener);
    await grant();
    expect(
      container.read(globalShortcutsProvider),
      const GlobalShortcutsState(startFailed: true),
    );
  });

  test('detaching releases held shortcuts and stops the hook', () async {
    final GlobalShortcuts notifier = container.read(
      globalShortcutsProvider.notifier,
    )..attach(listener);
    await grant();
    hook.emit!(_event(MacInputEventType.keyDown));
    notifier.detach(listener);
    await pumpEventQueue();
    expect(log, <String>['ptt:press', 'ptt:release']);
    expect(hook.stops, 1);
    expect(container.read(globalShortcutsProvider).running, isFalse);
  });
}
