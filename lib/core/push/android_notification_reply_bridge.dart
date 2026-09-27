import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const MethodChannel _kNotificationReplyChannel = MethodChannel(
  'fluxer_app/notification_reply',
);

Future<bool> attachAndroidNotificationReply({
  required int id,
  required String channelId,
  required String messageId,
  required String userId,
  required String title,
  required String hint,
  String? tag,
}) async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
    return false;
  }
  try {
    final bool? attached = await _kNotificationReplyChannel
        .invokeMethod<bool>('attachReplyAction', <String, Object?>{
          'id': id,
          'tag': tag,
          'channelId': channelId,
          'messageId': messageId,
          'userId': userId,
          'title': title,
          'hint': hint,
        });
    return attached ?? false;
  } on MissingPluginException {
    return false;
  } on PlatformException {
    return false;
  }
}
