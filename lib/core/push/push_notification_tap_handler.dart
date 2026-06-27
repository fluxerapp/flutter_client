import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/deep_links/deep_link_handler.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/push/push_notification_clear.dart';
import 'package:fluxer_app/core/push/push_notification_path_resolver.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_notification_tap_handler.g.dart';

enum PushNotificationTapSource { local, fcm }

@Riverpod(keepAlive: true)
class PushNotificationTapHandler extends _$PushNotificationTapHandler {
  @override
  void build() {}

  void handlePayloadJson(String? payloadJson) {
    if (payloadJson == null || payloadJson.isEmpty) {
      return;
    }
    try {
      final Object? decoded = jsonDecode(payloadJson);
      if (decoded is! Map<String, dynamic>) {
        return;
      }
      final Map<String, String> payload = decoded.map(
        (String key, dynamic value) =>
            MapEntry<String, String>(key, value?.toString() ?? ''),
      );
      handlePayload(payload, source: PushNotificationTapSource.local);
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[PushNotificationTap] payload parse failed: $e\n$st');
      }
    }
  }

  void handlePayload(
    Map<String, String> payload, {
    PushNotificationTapSource source = PushNotificationTapSource.fcm,
  }) {
    final Map<String, String> normalized = normalizePushTapPayload(payload);
    unawaited(PushNotificationClear.cancelForPayload(normalized));
    final String? path = resolvePushNotificationPath(normalized);
    if (path == null) {
      talker.warning(
        '[PushNotificationTap] no navigable path '
        '(source=${source.name}) in $normalized',
      );
      return;
    }
    _navigateToPath(path);
  }

  void _navigateToPath(String path) {
    final bool ready = isPendingNavigationReady(
      isAuthenticated: ref.read(authStateProvider),
      isGatewayReady: ref.read(gatewayReadyProvider),
      isConnectionFailed: ref.read(gatewayConnectionFailedProvider),
    );
    if (!ready) {
      ref.read(pendingPushNotificationPathProvider.notifier).store(path);
      return;
    }
    ref.read(deepLinkHandlerProvider.notifier).handlePath(path);
  }
}
