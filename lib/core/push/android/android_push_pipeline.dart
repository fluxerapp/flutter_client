import 'dart:typed_data';

import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:fluxer_app/core/push/local_push_notifications.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_clear.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/push/web_push/web_push_decrypt.dart';
import 'package:fluxer_app/core/push/web_push/web_push_envelope.dart';
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';
import 'package:fluxer_app/features/voice/utils/voice_call_ring.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_params.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:uuid/uuid.dart';

enum AndroidPushIncomingAction {
  discard,
  handleClear,
  showLocally,
  emit,
  showIncomingCall,
  showFallbackCall,
}

AndroidPushIncomingAction resolveAndroidPushIncomingAction({
  required bool decrypted,
  required bool backgroundMode,
  required Map<String, String> payload,
}) {
  if (!decrypted) {
    return backgroundMode
        ? AndroidPushIncomingAction.showFallbackCall
        : AndroidPushIncomingAction.discard;
  }
  if (isCallRingPayload(payload)) {
    if (callRingWindowHasClosed(
      expiresAtMs: readCallRingEpochMs(payload, 'expires_at_ms'),
      nowMs: DateTime.now().millisecondsSinceEpoch,
    )) {
      return AndroidPushIncomingAction.discard;
    }
    return AndroidPushIncomingAction.showIncomingCall;
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
      return _fallbackIfBackground(backgroundMode);
    }
    final List<WebPushAccountKeys> keys;
    try {
      keys = await (keyStore ?? WebPushKeyStore()).readAll();
    } on Object {
      return _fallbackIfBackground(backgroundMode);
    }
    final DecryptedWebPush? decrypted = await decryptWebPushForAccounts(
      record: record,
      keys: keys,
      fallbackId: webPushFallbackId(),
    );
    if (decrypted == null) {
      return _fallbackIfBackground(backgroundMode);
    }
    return dispatch(
      message: decrypted.message,
      backgroundMode: backgroundMode,
      decrypted: true,
    );
  }

  static Future<PushMessage?> _fallbackIfBackground(bool backgroundMode) {
    if (!backgroundMode) {
      return Future<PushMessage?>.value();
    }
    return dispatch(
      message: PushMessage(
        id: webPushFallbackId(),
        title: null,
        body: null,
        payload: const <String, String>{},
      ),
      backgroundMode: true,
      decrypted: false,
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
        if (await collidesWithVisibleCall(message.payload)) {
          return null;
        }
        await LocalPushNotifications().showPushMessage(message);
        return null;
      case AndroidPushIncomingAction.showIncomingCall:
        await _showIncomingCall(message, fallback: false);
        return null;
      case AndroidPushIncomingAction.showFallbackCall:
        await _showIncomingCall(message, fallback: true);
        return null;
      case AndroidPushIncomingAction.emit:
        return message;
    }
  }

  static Future<bool> collidesWithVisibleCall(
    Map<String, String> payload,
  ) async {
    final String? messageId = payload['message_id'];
    if (messageId == null || messageId.isEmpty) {
      return false;
    }
    try {
      final calls = await FlutterCallkitIncoming.activeCalls();
      final List<String> ringing = <String>[];
      for (final call in calls) {
        final Object? id = call.extra?[kVoiceCallKitExtraMessageId];
        if (id is String && id.isNotEmpty) {
          ringing.add(id);
        }
      }
      return payloadCollidesWithCallRing(
        payload: payload,
        activeCallMessageIds: ringing,
      );
    } on Object {
      return false;
    }
  }

  static Future<void> _showIncomingCall(
    PushMessage message, {
    required bool fallback,
  }) async {
    final int nowMs = DateTime.now().millisecondsSinceEpoch;
    final CallRingDisplay display = fallback
        ? CallRingDisplay(
            nameCaller: kCallRingFallbackName,
            handle: kCallRingFallbackHandle,
            durationMs: kVoiceCallKitRingDuration.inMilliseconds,
          )
        : resolveCallRingDisplay(payload: message.payload, nowMs: nowMs);
    final String? messageId = message.payload['message_id'];
    final String callKitId;
    if (!fallback && messageId != null && messageId.isNotEmpty) {
      callKitId = callKitIdForMessageId(messageId);
    } else {
      callKitId = const Uuid().v4();
    }
    try {
      await FlutterCallkitIncoming.showCallkitIncoming(
        buildIncomingCallRingParams(
          callKitId: callKitId,
          display: display,
          channelId: message.payload['channel_id'],
          messageId: messageId,
          showMissedCall: !fallback,
        ),
      );
    } on Object {
      return;
    }
    if (messageId != null && messageId.isNotEmpty) {
      await LocalPushNotifications().cancelForPayload(message.payload);
    }
  }
}
