import 'dart:convert';

import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/web_push/web_push_envelope.dart';
import 'package:unifiedpush/unifiedpush.dart' as up;

const String kUnifiedPushDefaultTitle = kWebPushDefaultTitle;

/// Maps a decrypted UnifiedPush payload into a [PushMessage].
PushMessage mapUnifiedPushMessage(up.PushMessage message) {
  assert(
    message.decrypted,
    'mapUnifiedPushMessage expects a decrypted UnifiedPush payload',
  );
  final String fallbackId = DateTime.now().microsecondsSinceEpoch.toString();
  final String raw = utf8.decode(message.content);
  return mapWebPushEnvelope(raw, fallbackId: fallbackId);
}
