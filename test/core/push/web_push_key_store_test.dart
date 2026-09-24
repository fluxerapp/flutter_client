import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';

void main() {
  late WebPushKeyStore store;

  setUp(() {
    FlutterSecureStorage.setMockInitialValues(<String, String>{
      'unrelated': 'keep',
    });
    store = WebPushKeyStore(storage: const FlutterSecureStorage());
  });

  test('ensureKeys keeps the same keypair for an account', () async {
    final WebPushAccountKeys first = await store.ensureKeys('user-a');
    final WebPushAccountKeys second = await store.ensureKeys('user-a');
    expect(first.canDecrypt, isTrue);
    expect(second.publicKey, first.publicKey);
    expect(second.privateKey, first.privateKey);
    expect(second.authSecret, first.authSecret);
  });

  test('readAll returns every account and ignores other secrets', () async {
    await store.ensureKeys('user-a');
    await store.write(
      const WebPushAccountKeys(
        userId: 'user-b',
        publicKey: 'pub-b',
        authSecret: 'auth-b',
      ),
    );
    final List<WebPushAccountKeys> keys = await store.readAll();
    expect(keys.map((WebPushAccountKeys key) => key.userId), <String>[
      'user-a',
      'user-b',
    ]);
    final WebPushAccountKeys distributor = keys.firstWhere(
      (WebPushAccountKeys key) => key.userId == 'user-b',
    );
    expect(distributor.canDecrypt, isFalse);
  });

  test('voip keys stay out of the alert store', () async {
    final WebPushKeyStore voip = WebPushKeyStore(
      storage: const FlutterSecureStorage(),
      keyPrefix: kWebPushVoipKeysPrefix,
    );
    await store.ensureKeys('user-a');
    await voip.ensureKeys('user-a');
    final List<WebPushAccountKeys> alert = await store.readAll();
    final List<WebPushAccountKeys> calls = await voip.readAll();
    expect(alert, hasLength(1));
    expect(calls, hasLength(1));
    expect(alert.single.publicKey, isNot(calls.single.publicKey));
  });

  test('delete removes one account', () async {
    await store.ensureKeys('user-a');
    await store.delete('user-a');
    expect(await store.read('user-a'), isNull);
  });

  test('corrupt key json is ignored', () async {
    FlutterSecureStorage.setMockInitialValues(<String, String>{
      '${kWebPushKeysPrefix}user-a': '{',
    });
    expect(await store.read('user-a'), isNull);
    expect(await store.readAll(), isEmpty);
  });
}
