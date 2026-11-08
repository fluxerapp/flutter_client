import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/app/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';

const Duration kStartupGatewayFallbackDelay = Duration(seconds: 6);

const Duration kStartupCacheFirstIndicatorDelay = Duration(seconds: 3);

const Duration kStartupOfflineConfirmDelay = Duration(seconds: 2);

enum StartupGatewayFallback { none, cacheFirst, cachedShell, unreachable }

extension StartupGatewayFallbackShell on StartupGatewayFallback {
  bool get showsShell =>
      this == StartupGatewayFallback.cacheFirst ||
      this == StartupGatewayFallback.cachedShell;
}

Future<bool> hasCachedShellData(FluxerDatabase database, String userId) async =>
    await database.userSettingsDao.getSettings(userId) != null;

class StartupGatewayFallbackNotifier extends Notifier<StartupGatewayFallback> {
  Timer? _timer;
  int _generation = 0;
  bool _armed = false;
  bool _apiUnreachable = false;

  @override
  StartupGatewayFallback build() {
    ref
      ..onDispose(_cancelTimer)
      ..listen<bool>(gatewayReadyProvider, (bool? previous, bool ready) {
        if (!ready) {
          return;
        }
        _disarm();
        state = StartupGatewayFallback.none;
      })
      ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
        if (!next) {
          _cancelTimer();
          return;
        }
        if (_armed &&
            (state == StartupGatewayFallback.none ||
                state == StartupGatewayFallback.cacheFirst)) {
          unawaited(_schedule(_generation));
        }
      });
    return StartupGatewayFallback.none;
  }

  void arm() {
    _disarm();
    state = StartupGatewayFallback.none;
    if (ref.read(gatewayReadyProvider)) {
      return;
    }
    _armed = true;
    if (ref.read(appUiForegroundProvider)) {
      unawaited(_schedule(_generation));
    }
  }

  void openFromCache() {
    if (!_armed || ref.read(gatewayReadyProvider)) {
      return;
    }
    state = StartupGatewayFallback.cacheFirst;
    if (_timer != null) {
      _cancelTimer();
      unawaited(_schedule(_generation));
    }
  }

  void apiUnreachable() {
    if (!_armed) {
      return;
    }
    _apiUnreachable = true;
    if (!ref.read(appUiForegroundProvider)) {
      return;
    }
    _cancelTimer();
    unawaited(_fallBack(_generation, deviceOffline: false));
  }

  void _disarm() {
    _armed = false;
    _apiUnreachable = false;
    _generation++;
    _cancelTimer();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  bool _isCurrent(int generation) =>
      ref.mounted &&
      generation == _generation &&
      _armed &&
      !ref.read(gatewayReadyProvider) &&
      ref.read(appUiForegroundProvider);

  Future<bool> _deviceOnline() async {
    final Future<bool> Function() check = ref.read(
      gatewayConnectivityCheckProvider,
    );
    if (await check()) {
      return true;
    }
    await Future<void>.delayed(kStartupOfflineConfirmDelay);
    return check();
  }

  Future<void> _schedule(int generation) async {
    final bool online = await _deviceOnline();
    if (!_isCurrent(generation)) {
      return;
    }
    if (!online) {
      await _fallBack(generation, deviceOffline: true);
      return;
    }
    if (_apiUnreachable) {
      await _fallBack(generation, deviceOffline: false);
      return;
    }
    _cancelTimer();
    _timer = Timer(
      state == StartupGatewayFallback.cacheFirst
          ? kStartupCacheFirstIndicatorDelay
          : kStartupGatewayFallbackDelay,
      () {
        _timer = null;
        unawaited(_fallBack(generation, deviceOffline: false));
      },
    );
  }

  Future<void> _fallBack(int generation, {required bool deviceOffline}) async {
    final String? userId = ref.read(currentUserIdProvider);
    final bool hasCache =
        userId != null &&
        await hasCachedShellData(ref.read(fluxerDatabaseProvider), userId);
    if (!_isCurrent(generation)) {
      return;
    }
    _armed = false;
    if (deviceOffline) {
      ref.read(gatewayDeviceOfflineProvider.notifier).setOffline(value: true);
    }
    talker.warning(
      '[Startup] ${_apiUnreachable ? 'API unreachable' : 'Gateway not ready'}, '
      '${hasCache ? 'opening cached shell' : 'no cached data'}'
      '${deviceOffline ? ' (device offline)' : ''}',
    );
    state = hasCache
        ? StartupGatewayFallback.cachedShell
        : StartupGatewayFallback.unreachable;
  }
}

final NotifierProvider<StartupGatewayFallbackNotifier, StartupGatewayFallback>
startupGatewayFallbackProvider =
    NotifierProvider<StartupGatewayFallbackNotifier, StartupGatewayFallback>(
      StartupGatewayFallbackNotifier.new,
    );

final Provider<bool> shellDataReadyProvider = Provider<bool>(
  (Ref ref) =>
      ref.watch(gatewayReadyProvider) ||
      ref.watch(startupGatewayFallbackProvider).showsShell,
);
