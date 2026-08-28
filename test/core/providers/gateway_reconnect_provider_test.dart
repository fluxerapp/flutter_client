import 'dart:async';
import 'dart:ui' show Locale;

import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

final NotifierProvider<_TestLocale, Locale> _testLocaleProvider =
    NotifierProvider<_TestLocale, Locale>(_TestLocale.new);

class _TestLocale extends Notifier<Locale> {
  @override
  Locale build() => const Locale('fr');

  void updateLocale(Locale value) {
    if (state != value) {
      state = value;
    }
  }
}

class _TestGatewayConnection extends GatewayConnection {
  _TestGatewayConnection() : super(token: 'test', dio: Dio());

  final StreamController<GatewayState> _states =
      StreamController<GatewayState>.broadcast(sync: true);
  GatewayState _current = GatewayState.disconnected;

  @override
  GatewayState get state => _current;

  @override
  Stream<GatewayState> get stateChanges => _states.stream;

  void emit(GatewayState value) {
    _current = value;
    _states.add(value);
  }

  @override
  Future<void> dispose() async {
    await _states.close();
    await super.dispose();
  }
}

class _NudgeGatewayConnection extends GatewayConnection {
  _NudgeGatewayConnection({this.suspended = false})
    : super(token: 'test', dio: Dio());

  final bool suspended;
  int reconnectNowCalls = 0;
  int unsuspendCalls = 0;

  @override
  bool get isReconnectSuspended => suspended;

  @override
  Future<void> reconnectNow() async {
    reconnectNowCalls++;
  }

  @override
  Future<void> unsuspendAndReconnect() async {
    unsuspendCalls++;
  }
}

class _ExpiringAccountManager extends AccountManager {
  @override
  Future<bool> expireSessionIfInvalid() async {
    ref.read(_testLocaleProvider.notifier).updateLocale(const Locale('de'));
    return true;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('reconnect banner stays visible until connected', () {
    fakeAsync((FakeAsync async) {
      final _TestGatewayConnection connection = _TestGatewayConnection();
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          gatewayConnectionProvider.overrideWithValue(connection),
        ],
      )..read(gatewayReconnectBannerListenerProvider);

      connection
        ..emit(GatewayState.connected)
        ..emit(GatewayState.reconnecting);

      expect(
        container.read(gatewayReconnectBannerProvider),
        GatewayReconnectBannerPhase.hidden,
      );

      async.elapse(kReconnectBannerDelay);
      expect(
        container.read(gatewayReconnectBannerProvider),
        GatewayReconnectBannerPhase.reconnecting,
      );

      async.elapse(const Duration(seconds: 20));
      expect(
        container.read(gatewayReconnectBannerProvider),
        GatewayReconnectBannerPhase.reconnecting,
      );

      connection.emit(GatewayState.connected);
      expect(
        container.read(gatewayReconnectBannerProvider),
        GatewayReconnectBannerPhase.connected,
      );

      async.elapse(kReconnectBannerSuccessHold);
      expect(
        container.read(gatewayReconnectBannerProvider),
        GatewayReconnectBannerPhase.hidden,
      );

      container.dispose();
      unawaited(connection.dispose());
    });
  });

  test('drop during connected celebration returns to reconnecting', () {
    fakeAsync((FakeAsync async) {
      final _TestGatewayConnection connection = _TestGatewayConnection();
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          gatewayConnectionProvider.overrideWithValue(connection),
        ],
      )..read(gatewayReconnectBannerListenerProvider);

      connection
        ..emit(GatewayState.connected)
        ..emit(GatewayState.reconnecting);
      async.elapse(kReconnectBannerDelay);
      connection.emit(GatewayState.connected);
      expect(
        container.read(gatewayReconnectBannerProvider),
        GatewayReconnectBannerPhase.connected,
      );

      connection.emit(GatewayState.reconnecting);
      expect(
        container.read(gatewayReconnectBannerProvider),
        GatewayReconnectBannerPhase.reconnecting,
      );

      async.elapse(kReconnectBannerSuccessHold);
      expect(
        container.read(gatewayReconnectBannerProvider),
        GatewayReconnectBannerPhase.reconnecting,
      );

      container.dispose();
      unawaited(connection.dispose());
    });
  });

  test('session-expired toast retains the locale active before sign-out', () {
    fakeAsync((FakeAsync async) {
      final _TestGatewayConnection connection = _TestGatewayConnection();
      final ProviderContainer container =
          ProviderContainer(
              overrides: <Override>[
                gatewayConnectionProvider.overrideWithValue(connection),
                accountManagerProvider.overrideWith(
                  _ExpiringAccountManager.new,
                ),
                appLocalizationsProvider.overrideWith(
                  (Ref ref) =>
                      lookupFluxerLocalizations(ref.watch(_testLocaleProvider)),
                ),
              ],
            )
            ..read(authStateProvider.notifier).setAuthenticated(value: true)
            ..read(gatewayStateListenerProvider);

      connection.emit(GatewayState.failed);
      async.flushMicrotasks();

      expect(container.read(_testLocaleProvider), const Locale('de'));
      expect(
        container.read(toastProvider).single.toast.message,
        lookupFluxerLocalizations(const Locale('fr')).sessionExpiredToast,
      );

      container.dispose();
      unawaited(connection.dispose());
    });
  });

  test('quick reconnect does not show reconnect banner', () {
    fakeAsync((FakeAsync async) {
      final _TestGatewayConnection connection = _TestGatewayConnection();
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          gatewayConnectionProvider.overrideWithValue(connection),
        ],
      )..read(gatewayReconnectBannerListenerProvider);

      connection
        ..emit(GatewayState.connected)
        ..emit(GatewayState.reconnecting)
        ..emit(GatewayState.connected);

      async.elapse(kReconnectBannerDelay);
      expect(
        container.read(gatewayReconnectBannerProvider),
        GatewayReconnectBannerPhase.hidden,
      );

      container.dispose();
      unawaited(connection.dispose());
    });
  });

  test('connection failure hides reconnect banner', () {
    fakeAsync((FakeAsync async) {
      final _TestGatewayConnection connection = _TestGatewayConnection();
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          gatewayConnectionProvider.overrideWithValue(connection),
        ],
      )..read(gatewayReconnectBannerListenerProvider);

      connection
        ..emit(GatewayState.connected)
        ..emit(GatewayState.reconnecting);
      async.elapse(kReconnectBannerDelay);
      expect(
        container.read(gatewayReconnectBannerProvider),
        GatewayReconnectBannerPhase.reconnecting,
      );

      container
          .read(gatewayConnectionFailedProvider.notifier)
          .setFailed(value: true);
      expect(
        container.read(gatewayReconnectBannerProvider),
        GatewayReconnectBannerPhase.hidden,
      );

      container.dispose();
      unawaited(connection.dispose());
    });
  });

  test(
    'computeIsLikelyStale treats fresh connection without ack as healthy',
    () {
      final DateTime now = DateTime.utc(2026, 1, 1, 12);
      const Duration interval = Duration(seconds: 30);

      expect(
        GatewayConnection.computeIsLikelyStale(
          lastAckAt: null,
          heartbeatInterval: interval,
          connectedAt: now.subtract(const Duration(seconds: 10)),
          now: now,
        ),
        isFalse,
      );
      expect(
        GatewayConnection.computeIsLikelyStale(
          lastAckAt: null,
          heartbeatInterval: interval,
          connectedAt: now.subtract(const Duration(seconds: 50)),
          now: now,
        ),
        isTrue,
      );
      expect(
        GatewayConnection.computeIsLikelyStale(
          lastAckAt: null,
          heartbeatInterval: null,
          connectedAt: now,
          now: now,
        ),
        isFalse,
      );
    },
  );

  test('gatewayConnectionFailed tracks failure and reset', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(gatewayConnectionFailedProvider), isFalse);
    container
        .read(gatewayConnectionFailedProvider.notifier)
        .setFailed(value: true);
    expect(container.read(gatewayConnectionFailedProvider), isTrue);
    container.read(gatewayConnectionFailedProvider.notifier).reset();
    expect(container.read(gatewayConnectionFailedProvider), isFalse);
  });

  test('marking failed clears serverReachable', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(serverReachableProvider.notifier).setReachable(value: true);
    container
        .read(gatewayConnectionFailedProvider.notifier)
        .setFailed(value: true);
    container.read(serverReachableProvider.notifier).setReachable(value: false);

    expect(container.read(serverReachableProvider), isFalse);
    expect(container.read(gatewayConnectionFailedProvider), isTrue);
  });

  test('gatewayResumeReconnectInFlight tracks resume nudge state', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(gatewayResumeReconnectInFlightProvider), isFalse);
    container
        .read(gatewayResumeReconnectInFlightProvider.notifier)
        .setInFlight(value: true);
    expect(container.read(gatewayResumeReconnectInFlightProvider), isTrue);
    container
        .read(gatewayResumeReconnectInFlightProvider.notifier)
        .setInFlight(value: false);
    expect(container.read(gatewayResumeReconnectInFlightProvider), isFalse);
  });

  test('gatewaySessionRecovery increments on bump', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(gatewaySessionRecoveryProvider), 0);
    container.read(gatewaySessionRecoveryProvider.notifier).bump();
    expect(container.read(gatewaySessionRecoveryProvider), 1);
    container.read(gatewaySessionRecoveryProvider.notifier).bump();
    expect(container.read(gatewaySessionRecoveryProvider), 2);
  });

  test('shouldKeepGatewayConnectedForVoiceFromState', () {
    expect(
      shouldKeepGatewayConnectedForVoiceFromState(
        isInVoice: true,
        pendingIncomingChannelIds: const <String>[],
      ),
      isTrue,
    );
    expect(
      shouldKeepGatewayConnectedForVoiceFromState(
        isInVoice: false,
        pendingIncomingChannelIds: const <String>['channel-1'],
      ),
      isTrue,
    );
    expect(
      shouldKeepGatewayConnectedForVoiceFromState(
        isInVoice: false,
        pendingIncomingChannelIds: const <String>[],
      ),
      isFalse,
    );
  });

  group('isPendingNavigationReady', () {
    test('requires auth, gateway ready, and no connection failure', () {
      expect(
        isPendingNavigationReady(
          isAuthenticated: false,
          isGatewayReady: true,
          isConnectionFailed: false,
        ),
        isFalse,
      );
      expect(
        isPendingNavigationReady(
          isAuthenticated: true,
          isGatewayReady: false,
          isConnectionFailed: false,
        ),
        isFalse,
      );
      expect(
        isPendingNavigationReady(
          isAuthenticated: true,
          isGatewayReady: true,
          isConnectionFailed: true,
        ),
        isFalse,
      );
      expect(
        isPendingNavigationReady(
          isAuthenticated: true,
          isGatewayReady: true,
          isConnectionFailed: false,
        ),
        isTrue,
      );
    });
  });

  group('nudgeGatewayReconnectAfterResume', () {
    test('reconnects immediately when connectivity is already up', () {
      fakeAsync((FakeAsync async) {
        final connection = _NudgeGatewayConnection();
        final List<bool> inFlightLog = <bool>[];
        unawaited(
          nudgeGatewayReconnectAfterResume(
            connection,
            onResumeReconnectInFlight: ({required bool inFlight}) =>
                inFlightLog.add(inFlight),
            hasConnectivity: () async => true,
          ),
        );
        async.flushMicrotasks();
        expect(connection.reconnectNowCalls, 1);
        expect(inFlightLog, [true]);
      });
    });

    test('waits one beat and retries when connectivity is initially down', () {
      fakeAsync((FakeAsync async) {
        final connection = _NudgeGatewayConnection();
        var probes = 0;
        unawaited(
          nudgeGatewayReconnectAfterResume(
            connection,
            hasConnectivity: () async => ++probes > 1,
          ),
        );
        async.flushMicrotasks();
        expect(connection.reconnectNowCalls, 0);
        async.elapse(kResumeReconnectDelay);
        expect(connection.reconnectNowCalls, 1);
        expect(probes, 2);
      });
    });

    test('skips when the retry also reports no connectivity', () {
      fakeAsync((FakeAsync async) {
        final connection = _NudgeGatewayConnection();
        final List<bool> inFlightLog = <bool>[];
        unawaited(
          nudgeGatewayReconnectAfterResume(
            connection,
            onResumeReconnectInFlight: ({required bool inFlight}) =>
                inFlightLog.add(inFlight),
            hasConnectivity: () async => false,
          ),
        );
        async.elapse(kResumeReconnectDelay);
        expect(connection.reconnectNowCalls, 0);
        expect(connection.unsuspendCalls, 0);
        expect(inFlightLog, [true, false]);
      });
    });

    test('unsuspends a suspended connection', () {
      fakeAsync((FakeAsync async) {
        final connection = _NudgeGatewayConnection(suspended: true);
        unawaited(
          nudgeGatewayReconnectAfterResume(
            connection,
            hasConnectivity: () async => true,
          ),
        );
        async.flushMicrotasks();
        expect(connection.unsuspendCalls, 1);
        expect(connection.reconnectNowCalls, 0);
      });
    });
  });
}
