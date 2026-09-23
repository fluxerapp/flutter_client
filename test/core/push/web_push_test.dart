import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/push/web_push/web_push_codec.dart';
import 'package:fluxer_app/core/push/web_push/web_push_crypto.dart';
import 'package:fluxer_app/core/push/web_push/web_push_decrypt.dart';
import 'package:fluxer_app/core/push/web_push/web_push_envelope.dart';
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';
import 'package:fluxer_app/core/push/web_push/web_push_relay.dart';

void main() {
  test('round trips an aes128gcm record', () async {
    final WebPushKeyPair keys = generateWebPushKeyPair();
    const String plaintext = '{"title":"alice","body":"hello"}';
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode(plaintext),
      recipientPublicKey: keys.publicKey,
      authSecret: keys.authSecret,
    );
    expect(record.length, kWebPushRecordSize);
    expect(record.sublist(16, 20), <int>[0x00, 0x00, 0x0b, 0x00]);
    expect(record[20], 65);
    expect(record[21], 0x04);
    final String? clear = await decryptWebPushRecord(
      record: record,
      privateKey: keys.privateKey,
      authSecret: keys.authSecret,
    );
    expect(clear, plaintext);
  });

  test('wrong key does not decrypt', () async {
    final WebPushKeyPair recipient = generateWebPushKeyPair();
    final WebPushKeyPair other = generateWebPushKeyPair();
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode('{"title":"x"}'),
      recipientPublicKey: recipient.publicKey,
      authSecret: recipient.authSecret,
    );
    final String? clear = await decryptWebPushRecord(
      record: record,
      privateKey: other.privateKey,
      authSecret: recipient.authSecret,
    );
    expect(clear, isNull);
  });

  test('try-each-key returns the matching account', () async {
    final WebPushKeyPair first = generateWebPushKeyPair();
    final WebPushKeyPair second = generateWebPushKeyPair();
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode(
        '{"title":"bob","body":"hi","data":{"target_user_id":"user-b",'
        '"channel_id":"c","message_id":"m"}}',
      ),
      recipientPublicKey: second.publicKey,
      authSecret: second.authSecret,
    );
    final DecryptedWebPush? decrypted = await decryptWebPushForAccounts(
      record: record,
      fallbackId: 'fallback',
      keys: <WebPushAccountKeys>[
        WebPushAccountKeys(
          userId: 'user-a',
          publicKey: encodeWebPushKey(first.publicKey),
          privateKey: encodeWebPushKey(first.privateKey),
          authSecret: encodeWebPushKey(first.authSecret),
        ),
        WebPushAccountKeys(
          userId: 'user-b',
          publicKey: encodeWebPushKey(second.publicKey),
          privateKey: encodeWebPushKey(second.privateKey),
          authSecret: encodeWebPushKey(second.authSecret),
        ),
      ],
    );
    expect(decrypted?.userId, 'user-b');
    expect(decrypted?.message.payload['channel_id'], 'c');
    expect(decrypted?.message.payload['target_user_id'], 'user-b');
  });

  test('keeps trying after a corrupt account key', () async {
    final WebPushKeyPair keys = generateWebPushKeyPair();
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode('{"title":"ok","message_id":"m"}'),
      recipientPublicKey: keys.publicKey,
      authSecret: keys.authSecret,
    );
    final DecryptedWebPush? decrypted = await decryptWebPushForAccounts(
      record: record,
      fallbackId: 'fallback',
      keys: <WebPushAccountKeys>[
        const WebPushAccountKeys(
          userId: 'broken',
          publicKey: 'not-base64',
          privateKey: '!!!',
          authSecret: '!!!',
        ),
        WebPushAccountKeys(
          userId: 'ok',
          publicKey: encodeWebPushKey(keys.publicKey),
          privateKey: encodeWebPushKey(keys.privateKey),
          authSecret: encodeWebPushKey(keys.authSecret),
        ),
      ],
    );
    expect(decrypted?.userId, 'ok');
    expect(decrypted?.message.title, 'ok');
  });

  test('fills target_user_id from the account that decrypted', () async {
    final WebPushKeyPair keys = generateWebPushKeyPair();
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode('{"title":"n","channel_id":"c"}'),
      recipientPublicKey: keys.publicKey,
      authSecret: keys.authSecret,
    );
    final DecryptedWebPush? decrypted = await decryptWebPushForAccounts(
      record: record,
      fallbackId: 'fallback',
      keys: <WebPushAccountKeys>[
        WebPushAccountKeys(
          userId: 'user-a',
          publicKey: encodeWebPushKey(keys.publicKey),
          privateKey: encodeWebPushKey(keys.privateKey),
          authSecret: encodeWebPushKey(keys.authSecret),
        ),
      ],
    );
    expect(decrypted?.message.payload['target_user_id'], 'user-a');
  });

  test('fills target_user_id when the payload leaves it blank', () async {
    final WebPushKeyPair keys = generateWebPushKeyPair();
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode('{"title":"n","target_user_id":""}'),
      recipientPublicKey: keys.publicKey,
      authSecret: keys.authSecret,
    );
    final DecryptedWebPush? decrypted = await decryptWebPushForAccounts(
      record: record,
      fallbackId: 'fallback',
      keys: <WebPushAccountKeys>[
        WebPushAccountKeys(
          userId: 'user-a',
          publicKey: encodeWebPushKey(keys.publicKey),
          privateKey: encodeWebPushKey(keys.privateKey),
          authSecret: encodeWebPushKey(keys.authSecret),
        ),
      ],
    );
    expect(decrypted?.message.payload['target_user_id'], 'user-a');
  });

  test('skips accounts that have no private key', () async {
    final WebPushKeyPair keys = generateWebPushKeyPair();
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode('{"title":"n"}'),
      recipientPublicKey: keys.publicKey,
      authSecret: keys.authSecret,
    );
    final DecryptedWebPush? decrypted = await decryptWebPushForAccounts(
      record: record,
      fallbackId: 'fallback',
      keys: <WebPushAccountKeys>[
        WebPushAccountKeys(
          userId: 'distributor',
          publicKey: encodeWebPushKey(keys.publicKey),
          authSecret: encodeWebPushKey(keys.authSecret),
        ),
      ],
    );
    expect(decrypted, isNull);
  });

  test('round trips utf-8 text', () async {
    final WebPushKeyPair keys = generateWebPushKeyPair();
    const String plaintext = '{"body":"héllo 😀"}';
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode(plaintext),
      recipientPublicKey: keys.publicKey,
      authSecret: keys.authSecret,
    );
    final String? clear = await decryptWebPushRecord(
      record: record,
      privateKey: keys.privateKey,
      authSecret: keys.authSecret,
    );
    expect(clear, plaintext);
  });

  test('wrong auth secret does not decrypt', () async {
    final WebPushKeyPair keys = generateWebPushKeyPair();
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode('{"title":"x"}'),
      recipientPublicKey: keys.publicKey,
      authSecret: keys.authSecret,
    );
    final String? clear = await decryptWebPushRecord(
      record: record,
      privateKey: keys.privateKey,
      authSecret: Uint8List(kWebPushAuthSecretLength),
    );
    expect(clear, isNull);
  });

  test('keeps a trailing nul inside the plaintext', () async {
    final WebPushKeyPair keys = generateWebPushKeyPair();
    final Uint8List plaintext = Uint8List.fromList(<int>[
      ...utf8.encode('hello'),
      0,
      ...utf8.encode('world'),
    ]);
    final Uint8List record = await encryptWebPushRecord(
      plaintext: plaintext,
      recipientPublicKey: keys.publicKey,
      authSecret: keys.authSecret,
    );
    final String? clear = await decryptWebPushRecord(
      record: record,
      privateKey: keys.privateKey,
      authSecret: keys.authSecret,
    );
    expect(clear, 'hello\u0000world');
  });

  test('rejects a tampered record and a record past the size cap', () async {
    final WebPushKeyPair keys = generateWebPushKeyPair();
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode('{"title":"x"}'),
      recipientPublicKey: keys.publicKey,
      authSecret: keys.authSecret,
    );
    final Uint8List tampered = Uint8List.fromList(record);
    tampered[tampered.length - 1] ^= 0x01;
    expect(
      await decryptWebPushRecord(
        record: tampered,
        privateKey: keys.privateKey,
        authSecret: keys.authSecret,
      ),
      isNull,
    );
    expect(
      await decryptWebPushRecord(
        record: Uint8List.fromList(<int>[...record, 0]),
        privateKey: keys.privateKey,
        authSecret: keys.authSecret,
      ),
      isNull,
    );
  });

  test('rejects a private key or auth secret of the wrong length', () async {
    final WebPushKeyPair keys = generateWebPushKeyPair();
    final Uint8List record = await encryptWebPushRecord(
      plaintext: utf8.encode('{"title":"x"}'),
      recipientPublicKey: keys.publicKey,
      authSecret: keys.authSecret,
    );
    expect(
      await decryptWebPushRecord(
        record: record,
        privateKey: Uint8List.sublistView(keys.privateKey, 1),
        authSecret: keys.authSecret,
      ),
      isNull,
    );
    expect(
      await decryptWebPushRecord(
        record: record,
        privateKey: keys.privateKey,
        authSecret: Uint8List(15),
      ),
      isNull,
    );
  });

  test('refuses a plaintext that does not fit in the record', () async {
    final WebPushKeyPair keys = generateWebPushKeyPair();
    expect(
      () => encryptWebPushRecord(
        plaintext: Uint8List(kWebPushRecordSize),
        recipientPublicKey: keys.publicKey,
        authSecret: keys.authSecret,
      ),
      throwsArgumentError,
    );
  });

  test('maps a shrunk envelope and a clear', () {
    final PushMessage shrunk = mapWebPushEnvelope(
      '{"channel_id":"c","message_id":"m","target_user_id":"u",'
      '"notification_tag":"channel:c","url":"/channels/@me/c/m",'
      '"badge_count":2}',
      fallbackId: 'x',
    );
    expect(shrunk.title, kWebPushDefaultTitle);
    expect(shrunk.id, 'm');
    expect(shrunk.payload['target_user_id'], 'u');
    expect(shrunk.payload['badge_count'], '2');

    final PushMessage clear = mapWebPushEnvelope(
      '{"type":"notification_clear","action":"clear_channel",'
      '"data":{"channel_id":"c","target_user_id":"u"}}',
      fallbackId: 'x',
    );
    expect(clear.payload['type'], 'notification_clear');
    expect(clear.payload['action'], 'clear_channel');
    expect(clear.payload['target_user_id'], 'u');
  });

  test('maps a message envelope the way the relay sends it', () {
    const String raw =
        '{"web_push":8030,"title":"Alice","body":"ping",'
        '"icon":"https://cdn.example/icon.png","tag":"channel:c:m",'
        '"notification":{"title":"Alice","body":"ping",'
        '"icon":"https://cdn.example/icon.png","tag":"channel:c:m",'
        '"navigate":"/channels/@me/c/m","data":{"channel_id":"c",'
        '"message_id":"m","author_avatar_url":"https://cdn.example/a.png",'
        '"notification_tag":"channel:c","guild_id":null,"url":"/channels/@me/c/m",'
        '"badge_count":3,"target_user_id":"user-b","has_media":true,'
        '"image_url":"https://cdn.example/pic.png"}},'
        '"data":{"channel_id":"c","message_id":"m",'
        '"author_avatar_url":"https://cdn.example/a.png",'
        '"notification_tag":"channel:c","url":"/channels/@me/c/m",'
        '"badge_count":3,"target_user_id":"user-b","has_media":true,'
        '"image_url":"https://cdn.example/pic.png"}}';
    final PushMessage message = mapWebPushEnvelope(raw, fallbackId: 'x');
    expect(message.title, 'Alice');
    expect(message.body, 'ping');
    expect(message.id, 'm');
    expect(message.payload['channel_id'], 'c');
    expect(message.payload['tag'], 'channel:c:m');
    expect(message.payload['notification_tag'], 'channel:c');
    expect(message.payload['url'], '/channels/@me/c/m');
    expect(message.payload['badge_count'], '3');
    expect(message.payload['author_avatar_url'], 'https://cdn.example/a.png');
    expect(message.payload['image_url'], 'https://cdn.example/pic.png');
    expect(message.payload['has_media'], 'true');
    expect(message.payload.containsKey('guild_id'), isFalse);
    expect(resolvePushDisplayTag(message.payload), 'channel:c:m');
  });

  test('maps a channel clear so it matches every message in the channel', () {
    const String raw =
        '{"type":"notification_clear","action":"clear_channel",'
        '"silent":true,"tag":"channel:c","notification_tag":"channel:c",'
        '"badge_count":1,"web_push":8030,"data":{"type":"notification_clear",'
        '"action":"clear_channel","channel_id":"c","message_id":"m",'
        '"target_user_id":"user-b","notification_tag":"channel:c",'
        '"tag":"channel:c","badge_count":1}}';
    final PushMessage clear = mapWebPushEnvelope(raw, fallbackId: 'x');
    expect(isNotificationClearPayload(clear.payload), isTrue);
    expect(clear.payload['channel_id'], 'c');
    expect(clear.payload['badge_count'], '1');
    expect(clear.payload['target_user_id'], 'user-b');
    expect(resolvePushChannelId(clear.payload), 'c');
    expect(pushNotificationTagMatchesChannel('channel:c', 'c'), isTrue);
    expect(pushNotificationTagMatchesChannel('channel:c:m', 'c'), isTrue);
    expect(pushNotificationTagMatchesChannel('channel:other:m', 'c'), isFalse);
  });

  test('decodes base64url and standard base64 ciphertext', () {
    final Uint8List bytes = Uint8List.fromList(<int>[0xfb, 0xff, 0x00]);
    expect(decodeWebPushCiphertext(encodeWebPushKey(bytes)), bytes);
    expect(decodeWebPushCiphertext(base64.encode(bytes)), bytes);
    expect(decodeWebPushCiphertext('not ciphertext'), isNull);
  });

  test('encodes relay path segments', () {
    expect(
      fcmRelayUrl(appId: 'stable', deviceToken: 'abc:def'),
      'https://push.fluxer.com/relay/v1/fcm/stable/abc%3Adef',
    );
    expect(
      apnsRelayUrl(
        appId: 'stable',
        environment: 'production',
        deviceTokenHex: 'ab',
      ),
      'https://push.fluxer.com/relay/v1/apns/stable/production/ab',
    );
  });
}
