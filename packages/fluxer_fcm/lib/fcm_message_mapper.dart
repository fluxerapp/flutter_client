import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';

const String kFcmDefaultTitle = 'Fluxer';

String? extractFcmCiphertext(Map<String, dynamic> data) {
  final Object? value = data['p'];
  if (value is! String || value.isEmpty) {
    return null;
  }
  return value;
}

FcmPushMessage mapRemoteMessage(RemoteMessage message) {
  final String? ciphertext = extractFcmCiphertext(message.data);
  final String? messageId = message.messageId;
  final String id = messageId != null && messageId.isNotEmpty
      ? messageId
      : DateTime.now().microsecondsSinceEpoch.toString();
  if (ciphertext == null) {
    return FcmPushMessage(
      id: id,
      title: null,
      body: null,
      payload: const <String, String>{},
    );
  }
  return FcmPushMessage(
    id: id,
    title: null,
    body: null,
    payload: <String, String>{'p': ciphertext},
  );
}
