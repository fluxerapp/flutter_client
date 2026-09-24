import 'dart:typed_data';

import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/web_push/web_push_codec.dart';
import 'package:fluxer_app/core/push/web_push/web_push_crypto.dart';
import 'package:fluxer_app/core/push/web_push/web_push_envelope.dart';
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';

class DecryptedWebPush {
  const DecryptedWebPush({required this.userId, required this.message});

  final String userId;
  final PushMessage message;
}

Future<DecryptedWebPush?> decryptWebPushForAccounts({
  required Uint8List record,
  required List<WebPushAccountKeys> keys,
  required String fallbackId,
}) async {
  for (final WebPushAccountKeys account in keys) {
    final String? privateKey = account.privateKey;
    if (privateKey == null || privateKey.isEmpty) {
      continue;
    }
    final Uint8List privateKeyBytes;
    final Uint8List authSecretBytes;
    try {
      privateKeyBytes = decodeWebPushKey(privateKey);
      authSecretBytes = decodeWebPushKey(account.authSecret);
    } on FormatException {
      continue;
    }
    final String? plaintext = await decryptWebPushRecord(
      record: record,
      privateKey: privateKeyBytes,
      authSecret: authSecretBytes,
    );
    if (plaintext == null) {
      continue;
    }
    final PushMessage message = mapWebPushEnvelope(
      plaintext,
      fallbackId: fallbackId,
    );
    final String? targetUserId = message.payload['target_user_id'];
    if (targetUserId == null || targetUserId.isEmpty) {
      message.payload['target_user_id'] = account.userId;
    }
    return DecryptedWebPush(userId: account.userId, message: message);
  }
  return null;
}

Uint8List? decodeWebPushCiphertext(String encoded) {
  if (encoded.length > 4096) {
    return null;
  }
  try {
    return decodeWebPushKey(encoded);
  } on FormatException {
    return null;
  }
}

String webPushFallbackId() {
  return DateTime.now().microsecondsSinceEpoch.toString();
}
