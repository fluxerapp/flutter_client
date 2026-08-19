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
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart' show UserSettingsResponse;
import 'package:fluxer_dart/gateway.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;
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

UserSettingsResponse _settingsWithLocale(sdk.Locale locale) {
  return UserSettingsResponse.fromJson(<String, Object?>{
    'status': 'online',
    'theme': 'dark',
    'locale': locale.json,
    'time_format': 0,
    'render_embeds': true,
    'render_reactions': true,
    'inline_attachment_media': true,
    'inline_embed_media': true,
    'gif_auto_play': true,
    'animate_emoji': true,
    'animate_stickers': 0,
    'render_spoilers': 0,
    'message_display_compact': false,
    'friend_source_flags': 0,
    'incoming_call_flags': 0,
    'group_dm_add_permission_flags': 0,
    'guild_folders': <Map<String, Object?>>[],
    'custom_status': null,
    'afk_timeout': 300,
    'default_share_voice_activity': false,
    'developer_mode': false,
    'trusted_domains': <String>[],
    'default_hide_muted_channels': false,
    'sensitive_content_friend_dm_filter': 0,
    'sensitive_content_non_friend_dm_filter': 0,
    'sensitive_content_guild_filter': 0,
    'suppress_unprivileged_self_mentions': false,
    'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
    'staff_dm_access_user_ids': <String>[],
    'profile_privacy': 0,
    'synced_preferences': '',
    'restricted_guilds': <String>[],
    'bot_restricted_guilds': <String>[],
    'default_guilds_restricted': false,
    'bot_default_guilds_restricted': false,
  });
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('reconnect toasts use app locale instead of system locale', () {
    fakeAsync((FakeAsync async) {
      final _TestGatewayConnection connection = _TestGatewayConnection();
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          gatewayConnectionProvider.overrideWithValue(connection),
          userSettingsStatusProvider.overrideWithValue(
            _settingsWithLocale(sdk.Locale.fr),
          ),
        ],
      );
      container.read(systemLocalesProvider.notifier).updateFromPlatform(
        const <Locale>[Locale('de', 'DE')],
      );
      container.read(gatewayReconnectToastListenerProvider);

      connection
        ..emit(GatewayState.connected)
        ..emit(GatewayState.reconnecting);

      expect(container.read(toastProvider), isEmpty);

      async.elapse(kReconnectToastDelay);

      ToastEntry entry = container.read(toastProvider).single;
      expect(entry.toast.message, 'Reconnexion…');
      expect(entry.toast.variant, FluxerToastVariant.info);
      expect(entry.toast.duration, const Duration(seconds: 5));

      connection.emit(GatewayState.connected);
      async.elapse(fluxerToastAnimationDuration);

      entry = container.read(toastProvider).single;
      expect(entry.isVisible, isTrue);
      expect(entry.toast.message, 'Connecté');
      expect(entry.toast.variant, FluxerToastVariant.success);

      container.dispose();
      unawaited(connection.dispose());
    });
  });

  test(
    'connected toast reads the latest locale without resetting listener',
    () {
      fakeAsync((FakeAsync async) {
        final _TestGatewayConnection connection = _TestGatewayConnection();
        final ProviderContainer container = ProviderContainer(
          overrides: <Override>[
            gatewayConnectionProvider.overrideWithValue(connection),
            appLocalizationsProvider.overrideWith(
              (Ref ref) =>
                  lookupFluxerLocalizations(ref.watch(_testLocaleProvider)),
            ),
          ],
        )..read(gatewayReconnectToastListenerProvider);

        connection
          ..emit(GatewayState.connected)
          ..emit(GatewayState.reconnecting);
        expect(container.read(toastProvider), isEmpty);

        async.elapse(kReconnectToastDelay);
        expect(
          container.read(toastProvider).single.toast.message,
          'Reconnexion…',
        );

        container
            .read(_testLocaleProvider.notifier)
            .updateLocale(const Locale('de'));
        connection.emit(GatewayState.connected);
        async.elapse(fluxerToastAnimationDuration);

        expect(container.read(toastProvider).single.toast.message, 'Verbunden');

        container.dispose();
        unawaited(connection.dispose());
      });
    },
  );

  test('session-expired toast retains the locale active before sign-out', () {
    fakeAsync((FakeAsync async) {
      final _TestGatewayConnection connection = _TestGatewayConnection();
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          gatewayConnectionProvider.overrideWithValue(connection),
          accountManagerProvider.overrideWith(_ExpiringAccountManager.new),
          appLocalizationsProvider.overrideWith(
            (Ref ref) =>
                lookupFluxerLocalizations(ref.watch(_testLocaleProvider)),
          ),
        ],
      );
      container.read(authStateProvider.notifier).setAuthenticated(value: true);
      container.read(gatewayStateListenerProvider);

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

  test('quick reconnect does not show reconnect toast', () {
    fakeAsync((FakeAsync async) {
      final _TestGatewayConnection connection = _TestGatewayConnection();
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          gatewayConnectionProvider.overrideWithValue(connection),
        ],
      );
      container.read(gatewayReconnectToastListenerProvider);

      connection
        ..emit(GatewayState.connected)
        ..emit(GatewayState.reconnecting)
        ..emit(GatewayState.connected);

      async.elapse(kReconnectToastDelay);
      expect(container.read(toastProvider), isEmpty);

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
