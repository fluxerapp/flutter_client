import 'package:dio/dio.dart';
import 'package:fluxer_app/core/push/notification/localization.dart';
import 'package:fluxer_app/core/push/notification/payload.dart';
import 'package:fluxer_app/core/push/notification/reply.dart';

const String kPushMarkReadActionId = 'fluxer_mark_read';

enum PushMarkReadResult { sent, skipped, failed }

class PushMarkReadSend {
  const PushMarkReadSend({
    required this.apiBaseUrl,
    required this.token,
    required this.channelId,
    required this.messageId,
  });

  final String apiBaseUrl;
  final String token;
  final String channelId;
  final String messageId;

  String get path {
    final String channel = Uri.encodeComponent(channelId);
    final String message = Uri.encodeComponent(messageId);
    return '/channels/$channel/messages/$message/ack';
  }
}

bool isPushNotificationActionId(String? actionId) =>
    actionId == kPushReplyActionId || actionId == kPushMarkReadActionId;

String pushMarkReadActionTitle() {
  return pushNotificationLocalizations().dmMarkAsRead;
}

String pushMarkReadFailedBody() {
  return pushNotificationLocalizations().notificationMarkReadFailed;
}

Future<PushMarkReadResult> sendPushNotificationMarkRead({
  required Map<String, String> payload,
  Future<PushReplyAccount?> Function(String userId)? lookupAccount,
  Future<void> Function(PushMarkReadSend send)? post,
}) async {
  final String channelId = payload['channel_id'] ?? '';
  final String messageId = payload['message_id'] ?? '';
  final String userId = payload['target_user_id'] ?? '';
  if (channelId.isEmpty ||
      messageId.isEmpty ||
      userId.isEmpty ||
      isNotificationClearPayload(payload)) {
    return PushMarkReadResult.skipped;
  }
  try {
    final PushReplyAccount? account =
        await (lookupAccount ?? lookupPushReplyAccount)(userId);
    if (account == null ||
        account.token.isEmpty ||
        account.apiBaseUrl.isEmpty) {
      return PushMarkReadResult.failed;
    }
    await (post ?? postPushMarkRead)(
      PushMarkReadSend(
        apiBaseUrl: account.apiBaseUrl,
        token: account.token,
        channelId: channelId,
        messageId: messageId,
      ),
    );
  } on Object {
    return PushMarkReadResult.failed;
  }
  return PushMarkReadResult.sent;
}

Future<void> postPushMarkRead(PushMarkReadSend send) async {
  final Dio dio = pushReplyDio(apiBaseUrl: send.apiBaseUrl, token: send.token);
  try {
    await dio.post<void>(send.path, data: const <String, dynamic>{});
  } finally {
    dio.close();
  }
}
