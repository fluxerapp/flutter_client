import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/api/fluxer_api_features.dart';

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
  required String failureTitle,
  required String failureBody,
  required String markReadTitle,
  required String markReadFailureBody,
  required bool replyMention,
  String? tag,
}) async {
  if (defaultTargetPlatform != TargetPlatform.android) {
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
          'failureTitle': failureTitle,
          'failureBody': failureBody,
          'markReadTitle': markReadTitle,
          'markReadFailureBody': markReadFailureBody,
          'replyMention': replyMention,
          'features': buildFluxerApiFeaturesHeaderValue(),
        });
    return attached ?? false;
  } on MissingPluginException {
    return false;
  } on PlatformException {
    return false;
  }
}
