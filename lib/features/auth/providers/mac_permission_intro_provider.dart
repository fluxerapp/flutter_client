import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_macos/fluxer_macos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mac_permission_intro_provider.g.dart';

@immutable
class MacPermissionIntroState {
  const MacPermissionIntroState({
    this.steps = const <MacPermissionKind>[],
    this.index = 0,
  });

  final List<MacPermissionKind> steps;
  final int index;

  MacPermissionKind? get current => index < steps.length ? steps[index] : null;

  @override
  bool operator ==(Object other) =>
      other is MacPermissionIntroState &&
      listEquals(other.steps, steps) &&
      other.index == index;

  @override
  int get hashCode => Object.hash(Object.hashAll(steps), index);
}

@Riverpod(keepAlive: true)
class MacPermissionIntro extends _$MacPermissionIntro {
  @override
  MacPermissionIntroState build() => const MacPermissionIntroState();

  LocalSettingsStore get _store => ref.read(localSettingsStoreProvider);

  bool get isPending =>
      macPermissions.isSupported &&
      !_store.read(LocalSettingKeys.macPermissionIntroCompleted);

  Future<void> start() async {
    if (!isPending || state.current != null) {
      return;
    }
    await macPermissions.refreshAll();
    if (!ref.mounted) {
      return;
    }
    final List<String> skipped = _store.read(
      LocalSettingKeys.macPermissionIntroSkipped,
    );
    final List<MacPermissionKind> settled = macPermissions.state.settledKinds;
    state = MacPermissionIntroState(
      steps: MacPermissionKind.values
          .where(
            (MacPermissionKind kind) =>
                !skipped.contains(kind.name) && !settled.contains(kind),
          )
          .toList(growable: false),
    );
  }

  void advance() {
    final MacPermissionKind? current = state.current;
    if (current == null ||
        !macPermissions.state.settledKinds.contains(current)) {
      return;
    }
    _moveNext();
  }

  void skip() {
    final MacPermissionKind? current = state.current;
    if (current == null) {
      return;
    }
    final List<String> skipped = _store.read(
      LocalSettingKeys.macPermissionIntroSkipped,
    );
    if (!skipped.contains(current.name)) {
      _store.write(LocalSettingKeys.macPermissionIntroSkipped, <String>[
        ...skipped,
        current.name,
      ]);
    }
    _moveNext();
  }

  void _moveNext() {
    final List<MacPermissionKind> settled = macPermissions.state.settledKinds;
    for (int next = state.index + 1; next < state.steps.length; next++) {
      if (!settled.contains(state.steps[next])) {
        state = MacPermissionIntroState(steps: state.steps, index: next);
        return;
      }
    }
    _store.write(LocalSettingKeys.macPermissionIntroCompleted, true);
    state = const MacPermissionIntroState();
  }
}
