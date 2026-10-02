import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/session_authorization_header.dart';
import 'package:fluxer_app/core/push/push_notification_reply.dart';
import 'package:fluxer_app/core/talker.dart';

enum ForeignCallRingStop { decline, ignore }

Future<void> stopForeignAccountCallRing({
  required String userId,
  required String channelId,
  required ForeignCallRingStop stop,
  Future<PushReplyAccount?> Function(String userId)? lookupAccount,
}) async {
  if (userId.isEmpty || channelId.isEmpty) {
    return;
  }
  final PushReplyAccount? account =
      await (lookupAccount ?? lookupPushReplyAccount)(userId);
  if (account == null || account.token.isEmpty || account.apiBaseUrl.isEmpty) {
    return;
  }
  final Map<String, dynamic> body = stop == ForeignCallRingStop.ignore
      ? <String, dynamic>{
          'recipients': <String>[userId],
        }
      : <String, dynamic>{};
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: account.apiBaseUrl,
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: <String, String>{
        'Authorization': formatSessionAuthorizationHeader(account.token),
        'Content-Type': 'application/json',
      },
    ),
  );
  try {
    final String encoded = Uri.encodeComponent(channelId);
    await dio.post<void>('/channels/$encoded/call/stop-ringing', data: body);
  } on Object catch (error) {
    talker.warning('[VoiceCallKit] stop ring failed: $error');
  } finally {
    dio.close();
  }
}
