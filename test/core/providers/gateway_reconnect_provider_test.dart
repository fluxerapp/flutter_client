import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';

void main() {
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
}
