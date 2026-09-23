import 'dart:ui' show Locale, PlatformDispatcher;

import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_app/core/api/session_authorization_header.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const String kPushReplyActionId = 'fluxer_reply';

enum PushReplyResult { sent, skipped, failed }

class PushReplyAccount {
  const PushReplyAccount({required this.token, required this.apiBaseUrl});

  final String token;
  final String apiBaseUrl;
}

class PushReplySend {
  const PushReplySend({
    required this.apiBaseUrl,
    required this.token,
    required this.channelId,
    required this.body,
  });

  final String apiBaseUrl;
  final String token;
  final String channelId;
  final Map<String, dynamic> body;
}

bool pushNotificationCanReply(Map<String, String> payload) {
  if (isNotificationClearPayload(payload)) {
    return false;
  }
  final String? channelId = _nonEmpty(payload['channel_id']);
  final String? messageId = _nonEmpty(payload['message_id']);
  return channelId != null && messageId != null;
}

List<AndroidNotificationAction> androidPushReplyActions(
  Map<String, String> payload, {
  required String title,
  required String hint,
}) {
  if (!pushNotificationCanReply(payload)) {
    return const <AndroidNotificationAction>[];
  }
  return <AndroidNotificationAction>[
    AndroidNotificationAction(
      kPushReplyActionId,
      title,
      // ignore: avoid_redundant_argument_values
      showsUserInterface: false,
      cancelNotification: false,
      semanticAction: SemanticAction.reply,
      inputs: <AndroidNotificationActionInput>[
        AndroidNotificationActionInput(label: hint),
      ],
    ),
  ];
}

String pushReplyActionTitle() {
  return _pushReplyLocalizations().chatMessageReply;
}

String pushReplyHint() {
  return _pushReplyLocalizations().notificationReplyPlaceholder;
}

String pushReplyFailedBody() {
  return _pushReplyLocalizations().notificationReplyFailed;
}

Future<PushReplyResult> sendPushNotificationReply({
  required Map<String, String> payload,
  required String? text,
  Future<PushReplyAccount?> Function(String userId)? lookupAccount,
  Future<void> Function(PushReplySend send)? post,
}) async {
  final String? content = _nonEmpty(text?.trim());
  final String? channelId = _nonEmpty(payload['channel_id']);
  final String? messageId = _nonEmpty(payload['message_id']);
  final String? userId = _nonEmpty(payload['target_user_id']);
  if (content == null ||
      channelId == null ||
      messageId == null ||
      userId == null ||
      isNotificationClearPayload(payload)) {
    return PushReplyResult.skipped;
  }
  final Future<PushReplyAccount?> Function(String userId) lookup =
      lookupAccount ?? lookupPushReplyAccount;
  final PushReplyAccount? account = await lookup(userId);
  if (account == null || account.token.isEmpty || account.apiBaseUrl.isEmpty) {
    return PushReplyResult.failed;
  }
  final PushReplySend send = PushReplySend(
    apiBaseUrl: account.apiBaseUrl,
    token: account.token,
    channelId: channelId,
    body: buildMessageCreateBody(content: content, replyToId: messageId),
  );
  try {
    await (post ?? postPushReply)(send);
  } on Object {
    return PushReplyResult.failed;
  }
  return PushReplyResult.sent;
}

Future<PushReplyAccount?> lookupPushReplyAccount(
  String userId, {
  AuthTokenStorage? tokenStorage,
}) async {
  final AuthTokenStorage storage = tokenStorage ?? SecureAuthTokenStorage();
  final String? token = await storage.readToken(userId);
  if (token == null || token.isEmpty) {
    return null;
  }
  final String? stored = await storage.readApiBaseUrl(userId);
  if (stored == null || stored.isEmpty) {
    return null;
  }
  return PushReplyAccount(token: token, apiBaseUrl: stored);
}

Future<void> postPushReply(PushReplySend send) async {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: send.apiBaseUrl,
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: <String, String>{
        'Authorization': formatSessionAuthorizationHeader(send.token),
        'Content-Type': 'application/json',
      },
    ),
  );
  try {
    final String channelId = Uri.encodeComponent(send.channelId);
    await dio.post<void>('/channels/$channelId/messages', data: send.body);
  } finally {
    dio.close();
  }
}

FluxerLocalizations _pushReplyLocalizations() {
  try {
    return lookupFluxerLocalizations(PlatformDispatcher.instance.locale);
  } on Object {
    return lookupFluxerLocalizations(const Locale('en'));
  }
}

String? _nonEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}
