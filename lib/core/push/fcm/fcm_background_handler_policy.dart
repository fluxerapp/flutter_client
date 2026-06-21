import 'package:fluxer_app/core/push/push_notification_path_resolver.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';

bool shouldSaveFcmTapPayloadCache(Map<String, String> payload) {
  final Map<String, String> normalized = normalizePushTapPayload(payload);
  return resolvePushNotificationPath(normalized) != null;
}
