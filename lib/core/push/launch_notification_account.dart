import 'package:fluxer_app/core/database/daos/auth_session_dao.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/features/auth/domain/auth_session.dart';

/// Marks [payloadJson]'s account active when that session is still valid.
Future<bool> selectStoredAccountForLaunchPayload({
  required String? payloadJson,
  required AuthSessionDao dao,
  required Future<AuthSession?> Function(String userId) readSession,
}) async {
  final String? targetUserId = targetUserIdFromPushPayloadJson(payloadJson);
  if (targetUserId == null) {
    return false;
  }
  final row = await dao.getSession(targetUserId);
  if (row == null || !row.isValid) {
    return false;
  }
  final AuthSession? session = await readSession(targetUserId);
  if (session == null) {
    return false;
  }
  await dao.touchSession(targetUserId);
  return true;
}
