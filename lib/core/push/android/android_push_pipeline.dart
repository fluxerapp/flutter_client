import 'dart:typed_data';

import 'package:fluxer_app/core/push/local_push_notifications.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_clear.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/push/web_push/web_push_decrypt.dart';
import 'package:fluxer_app/core/push/web_push/web_push_envelope.dart';
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';

enum AndroidPushIncomingAction { discard, handleClear, showLocally, emit }

AndroidPushIncomingAction resolveAndroidPushIncomingAction({
  required bool decrypted,
  required bool backgroundMode,
  required Map<String, String> payload,
}) {
  if (!decrypted) {
    return AndroidPushIncomingAction.discard;
  }
  if (isNotificationClearPayload(payload)) {
    return backgroundMode
        ? AndroidPushIncomingAction.handleClear
        : AndroidPushIncomingAction.emit;
  }
  if (backgroundMode) {
    return AndroidPushIncomingAction.showLocally;
  }
  return AndroidPushIncomingAction.emit;
}

class AndroidPushPipeline {
  const AndroidPushPipeline._();

  static Future<PushMessage?> handleCiphertext({
    required String ciphertextBase64,
    required bool backgroundMode,
    WebPushKeyStore? keyStore,
  }) async {
    final Uint8List? record = decodeWebPushCiphertext(ciphertextBase64);
    if (record == null) {
      return null;
    }
    final List<WebPushAccountKeys> keys;
    try {
      keys = await (keyStore ?? WebPushKeyStore()).readAll();
    } on Object {
      return null;
    }
    final DecryptedWebPush? decrypted = await decryptWebPushForAccounts(
      record: record,
      keys: keys,
      fallbackId: webPushFallbackId(),
    );
    if (decrypted == null) {
      return null;
    }
    return dispatch(
      message: decrypted.message,
      backgroundMode: backgroundMode,
      decrypted: true,
    );
  }

  static Future<PushMessage?> handlePlaintext({
    required String raw,
    required bool backgroundMode,
  }) {
    return dispatch(
      message: mapWebPushEnvelope(raw, fallbackId: webPushFallbackId()),
      backgroundMode: backgroundMode,
      decrypted: true,
    );
  }

  static Future<PushMessage?> dispatch({
    required PushMessage message,
    required bool backgroundMode,
    required bool decrypted,
  }) async {
    switch (resolveAndroidPushIncomingAction(
      decrypted: decrypted,
      backgroundMode: backgroundMode,
      payload: message.payload,
    )) {
      case AndroidPushIncomingAction.discard:
        return null;
      case AndroidPushIncomingAction.handleClear:
        await PushNotificationClear.handleClearPayload(message.payload);
        return null;
      case AndroidPushIncomingAction.showLocally:
        await LocalPushNotifications().showPushMessage(message);
        return null;
      case AndroidPushIncomingAction.emit:
        return message;
    }
  }
}
