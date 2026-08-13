import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/deep_links/deep_link_handler.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/push/push_notification_tap_handler.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';

final class _RecordingDeepLinkHandler extends DeepLinkHandler {
  final List<String> handledPaths = <String>[];

  @override
  void build() {}

  @override
  void handlePath(String path) {
    handledPaths.add(path);
  }
}

void main() {
  test('FCM tap payload queues navigation until shell is ready', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(authStateProvider.notifier).setAuthenticated(value: true);
    container.read(gatewayReadyProvider.notifier).reset();
    container
        .read(pushNotificationTapHandlerProvider.notifier)
        .handlePayload(<String, String>{
          'url': '/channels/@me/dm-1/msg-9',
          'channel_id': 'dm-1',
          'message_id': 'msg-9',
        });
    expect(
      container.read(pendingPushNotificationPathProvider)?.path,
      '/channels/@me/dm-1/msg-9',
    );
  });

  test('FCM tap payload with channel ids resolves DM path', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(authStateProvider.notifier).setAuthenticated(value: true);
    container.read(gatewayReadyProvider.notifier).reset();
    container.read(pushNotificationTapHandlerProvider.notifier).handlePayload(
      <String, String>{
        'channel_id': 'dm-2',
        'message_id': 'msg-3',
        'guild_id': '@me',
      },
    );
    expect(
      container.read(pendingPushNotificationPathProvider)?.path,
      '/channels/@me/dm-2/msg-3',
    );
  });

  test('FCM tap payload navigates immediately when shell is ready', () {
    final _RecordingDeepLinkHandler recordingHandler =
        _RecordingDeepLinkHandler();
    final ProviderContainer container = ProviderContainer(
      overrides: [deepLinkHandlerProvider.overrideWith(() => recordingHandler)],
    );
    addTearDown(container.dispose);
    container.read(authStateProvider.notifier).setAuthenticated(value: true);
    container.read(gatewayReadyProvider.notifier).setReady();
    container
        .read(gatewayConnectionFailedProvider.notifier)
        .setFailed(value: false);
    container.read(pushNotificationTapHandlerProvider.notifier).handlePayload(
      <String, String>{'url': '/channels/@me/dm-1/msg-9'},
    );
    expect(container.read(pendingPushNotificationPathProvider), isNull);
    expect(recordingHandler.handledPaths, <String>['/channels/@me/dm-1/msg-9']);
  });
}
