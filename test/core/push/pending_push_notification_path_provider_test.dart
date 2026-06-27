import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';

void main() {
  test('stores path when navigation is not ready', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(authStateProvider.notifier).setAuthenticated(value: true);
    container.read(gatewayReadyProvider.notifier).reset();

    container
        .read(pendingPushNotificationPathProvider.notifier)
        .store('/channels/@me/123');

    expect(
      container.read(pendingPushNotificationPathProvider)?.path,
      '/channels/@me/123',
    );
  });

  test('does not flush while connection failed', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(authStateProvider.notifier).setAuthenticated(value: true);
    container.read(gatewayReadyProvider.notifier).setReady();
    container
        .read(gatewayConnectionFailedProvider.notifier)
        .setFailed(value: true);
    container
        .read(pendingPushNotificationPathProvider.notifier)
        .store('/channels/@me/789');

    container.read(pendingPushNotificationPathProvider.notifier).flushIfReady();

    expect(
      container.read(pendingPushNotificationPathProvider)?.path,
      '/channels/@me/789',
    );
  });
}
