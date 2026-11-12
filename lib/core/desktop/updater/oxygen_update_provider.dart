import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/desktop/tray/desktop_tray.dart';
import 'package:fluxer_app/core/desktop/updater/oxygen_updater.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'oxygen_update_provider.g.dart';

const Duration kOxygenUpdateCheckInterval = Duration(minutes: 5);
const Duration kOxygenUpdateMinCheckInterval = Duration(minutes: 1);

enum OxygenUpdateStatus { none, available, updating }

@Riverpod(keepAlive: true)
class OxygenUpdate extends _$OxygenUpdate {
  DateTime? _lastCheckedAt;
  bool _checking = false;

  @override
  OxygenUpdateStatus build() {
    if (!OxygenUpdater.isInitialized) {
      return OxygenUpdateStatus.none;
    }
    final Timer timer = Timer.periodic(kOxygenUpdateCheckInterval, (_) {
      if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
        unawaited(checkForUpdates());
      }
    });
    final AppLifecycleListener lifecycle = AppLifecycleListener(
      onResume: () => unawaited(checkForUpdates()),
    );
    ref.onDispose(() {
      timer.cancel();
      lifecycle.dispose();
    });
    unawaited(Future<void>.microtask(() => checkForUpdates(force: true)));
    return OxygenUpdateStatus.none;
  }

  Future<void> checkForUpdates({bool force = false}) async {
    if (!OxygenUpdater.isInitialized ||
        _checking ||
        state == OxygenUpdateStatus.updating) {
      return;
    }
    final DateTime now = DateTime.now();
    final DateTime? last = _lastCheckedAt;
    if (!force &&
        last != null &&
        now.difference(last) < kOxygenUpdateMinCheckInterval) {
      return;
    }
    _checking = true;
    _lastCheckedAt = now;
    try {
      final bool available = await OxygenUpdater.isUpdateAvailable();
      if (!ref.mounted || state == OxygenUpdateStatus.updating) {
        return;
      }
      state = available
          ? OxygenUpdateStatus.available
          : OxygenUpdateStatus.none;
    } on Object catch (error) {
      talker.warning('[Oxygen] Update check failed: $error');
    } finally {
      _checking = false;
    }
  }

  Future<void> applyUpdate() async {
    if (state != OxygenUpdateStatus.available) {
      return;
    }
    state = OxygenUpdateStatus.updating;
    try {
      if (await OxygenUpdater.prepareUpdateOnExit()) {
        DesktopTray.quit();
        return;
      }
      if (ref.mounted) {
        state = OxygenUpdateStatus.none;
      }
    } on Object catch (error, stackTrace) {
      talker.error('[Oxygen] Update failed', error, stackTrace);
      if (ref.mounted) {
        state = OxygenUpdateStatus.available;
      }
    }
  }
}
