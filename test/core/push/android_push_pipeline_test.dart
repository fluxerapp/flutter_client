import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/android/android_push_pipeline.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_media.dart';
import 'package:fluxer_app/core/push/web_push/web_push_codec.dart';
import 'package:fluxer_app/core/push/web_push/web_push_crypto.dart';
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';
import 'package:image/image.dart' as img;

void main() {
  test('background ciphertext notifications show locally', () {
    expect(
      resolveAndroidPushIncomingAction(
        decrypted: true,
        backgroundMode: true,
        payload: const <String, String>{'channel_id': 'c'},
      ),
      AndroidPushIncomingAction.showLocally,
    );
  });

  test('foreground clears go to the coordinator', () {
    expect(
      resolveAndroidPushIncomingAction(
        decrypted: true,
        backgroundMode: false,
        payload: const <String, String>{
          'type': 'notification_clear',
          'channel_id': 'c',
        },
      ),
      AndroidPushIncomingAction.emit,
    );
  });

  test('background decrypt failure still shows a call', () {
    expect(
      resolveAndroidPushIncomingAction(
        decrypted: false,
        backgroundMode: true,
        payload: const <String, String>{},
      ),
      AndroidPushIncomingAction.showFallbackCall,
    );
  });

  test('call ring always shows an incoming call', () {
    const Map<String, String> ring = <String, String>{
      'type': 'call_ring',
      'channel_id': 'c',
      'message_id': 'm',
      'expires_at_ms': '9999999999999',
    };
    expect(
      resolveAndroidPushIncomingAction(
        decrypted: true,
        backgroundMode: false,
        payload: ring,
      ),
      AndroidPushIncomingAction.showIncomingCall,
    );
    expect(
      resolveAndroidPushIncomingAction(
        decrypted: true,
        backgroundMode: true,
        payload: ring,
      ),
      AndroidPushIncomingAction.showIncomingCall,
    );
  });

  test('an expired call ring is dropped', () {
    expect(
      resolveAndroidPushIncomingAction(
        decrypted: true,
        backgroundMode: true,
        payload: const <String, String>{
          'type': 'call_ring',
          'channel_id': 'c',
          'message_id': 'm',
          'expires_at_ms': '1',
        },
      ),
      AndroidPushIncomingAction.discard,
    );
  });

  test('background clears are handled locally', () {
    expect(
      resolveAndroidPushIncomingAction(
        decrypted: true,
        backgroundMode: true,
        payload: const <String, String>{
          'type': 'notification_clear',
          'channel_id': 'c',
        },
      ),
      AndroidPushIncomingAction.handleClear,
    );
  });

  test('foreground ciphertext is returned for the coordinator', () async {
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    final WebPushKeyStore store = WebPushKeyStore(
      storage: const FlutterSecureStorage(),
    );
    final WebPushAccountKeys keys = await store.ensureKeys('user-a');
    final WebPushKeyPair pair = _pairFrom(keys);
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode(
        '{"title":"Alice","body":"ping","message_id":"m","channel_id":"c"}',
      ),
      recipientPublicKey: pair.publicKey,
      authSecret: pair.authSecret,
    );
    final PushMessage? message = await AndroidPushPipeline.handleCiphertext(
      ciphertextBase64: encodeWebPushKey(record),
      backgroundMode: false,
      keyStore: store,
    );
    expect(message?.title, 'Alice');
    expect(message?.payload['channel_id'], 'c');
    expect(message?.payload['target_user_id'], 'user-a');
  });

  test('invalid ciphertext is dropped', () async {
    final PushMessage? message = await AndroidPushPipeline.handleCiphertext(
      ciphertextBase64: '!!!',
      backgroundMode: true,
    );
    expect(message, isNull);
  });

  test('avatar prefers author_avatar_url and skips non-http icons', () {
    expect(
      pushAuthorAvatarUrl(<String, String>{
        'author_avatar_url': 'https://cdn.example/a.png',
        'icon': 'https://cdn.example/b.png',
      }),
      'https://cdn.example/a.png?format=png&animated=false&size=160',
    );
    expect(
      pushAuthorAvatarUrl(<String, String>{'icon': '/icons/app.png'}),
      isNull,
    );
    expect(
      pushAttachmentImageUrl(<String, String>{
        'has_media': 'true',
        'image_url': 'https://cdn.example/pic.png',
        'image': 'https://cdn.example/other.png',
      }),
      'https://cdn.example/pic.png',
    );
    expect(
      pushAuthorAvatarUrl(<String, String>{
        'icon': 'https://cdn.example/a.webp?animated=true&size=4096',
      }),
      'https://cdn.example/a.webp?format=png&animated=false&size=160',
    );
  });

  test('notification images are scaled down before they are posted', () {
    final Uint8List source = Uint8List.fromList(
      img.encodePng(img.Image(width: 40, height: 10)),
    );
    final Uint8List? encoded = encodePushNotificationImage(source, maxEdge: 16);
    expect(encoded, isNotNull);
    final img.Image? decoded = img.decodeJpg(encoded!);
    expect(decoded, isNotNull);
    expect(decoded!.width, lessThanOrEqualTo(16));
    expect(decoded.height, lessThanOrEqualTo(16));
  });
}

WebPushKeyPair _pairFrom(WebPushAccountKeys keys) {
  return WebPushKeyPair(
    privateKey: decodeWebPushKey(keys.privateKey!),
    publicKey: decodeWebPushKey(keys.publicKey),
    authSecret: decodeWebPushKey(keys.authSecret),
  );
}
