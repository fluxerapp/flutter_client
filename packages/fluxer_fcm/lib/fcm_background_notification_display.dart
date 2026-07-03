import 'package:fluxer_fcm/fcm_push_message.dart';
import 'package:fluxer_fcm/fcm_push_notification_ids.dart';

const String kFcmBackgroundNotificationFallbackTitle = 'Fluxer';
const String kFcmBackgroundNotificationFallbackBody = 'New message';

String resolveFcmBackgroundNotificationTitle(FcmPushMessage message) {
  return message.title ?? kFcmBackgroundNotificationFallbackTitle;
}

String resolveFcmBackgroundNotificationBody(FcmPushMessage message) {
  final String? body = message.body;
  if (body != null && body.isNotEmpty) {
    return body;
  }
  return kFcmBackgroundNotificationFallbackBody;
}

Map<String, String> buildFcmBackgroundTapPayload(FcmPushMessage message) {
  final Map<String, String> payload = Map<String, String>.from(message.payload);
  payload[kFcmLocalNotificationMessageIdKey] = message.id;
  return payload;
}
