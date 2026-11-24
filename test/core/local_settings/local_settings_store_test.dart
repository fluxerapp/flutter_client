import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/local_settings/local_setting_codec.dart';
import 'package:fluxer_app/core/local_settings/local_setting_id.dart';
import 'package:fluxer_app/core/local_settings/local_setting_key.dart';
import 'package:fluxer_app/core/local_settings/local_settings_legacy_import.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

const DeviceFlag _kFlag = DeviceFlag('flag', defaultValue: true);
const AccountFlag _kAccountFlag = AccountFlag('flag');
const DeviceSettingKey<String?> _kText = DeviceSettingKey<String?>(
  'text',
  defaultValue: null,
  codec: NullableStringSettingCodec(),
);
const DeviceSettingKey<List<String>> _kList = DeviceSettingKey<List<String>>(
  'list',
  defaultValue: <String>[],
  codec: StringListSettingCodec(),
);
const DeviceSettingKey<LocalSettingJson> _kJson =
    DeviceSettingKey<LocalSettingJson>(
      'json',
      defaultValue: <String, Object?>{},
      codec: JsonSettingCodec(),
    );

void main() {
  late FluxerDatabase db;

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    db = FluxerDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() => db.close());

  Future<LocalSettingsStore> open() async {
    final LocalSettingsStore store = LocalSettingsStore(() => db);
    addTearDown(store.dispose);
    await store.load();
    return store;
  }

  test('returns defaults until something is written', () async {
    final LocalSettingsStore store = await open();
    expect(store.read(_kFlag), isTrue);
    expect(store.read(_kText), isNull);
    expect(store.readAccount(_kAccountFlag, userId: 'a'), isFalse);
  });

  test('values survive a new store on the same database', () async {
    final LocalSettingsStore store = await open();
    store
      ..write(_kFlag, false)
      ..write(_kText, 'hello')
      ..write(_kList, <String>['a', 'b'])
      ..write(_kJson, <String, Object?>{'n': 1})
      ..writeAccount(_kAccountFlag, true, userId: 'a');
    await store.flush();

    final LocalSettingsStore reopened = await open();
    expect(reopened.read(_kFlag), isFalse);
    expect(reopened.read(_kText), 'hello');
    expect(reopened.read(_kList), <String>['a', 'b']);
    expect(reopened.read(_kJson), <String, Object?>{'n': 1});
    expect(reopened.readAccount(_kAccountFlag, userId: 'a'), isTrue);
  });

  test('device and account scopes with the same key stay apart', () async {
    final LocalSettingsStore store = await open();
    store.writeAccount(_kAccountFlag, true, userId: 'a');
    expect(store.readAccount(_kAccountFlag, userId: 'b'), isFalse);
    expect(store.read(const DeviceFlag('flag')), isFalse);
  });

  test('a malformed or mistyped value falls back to the default', () async {
    await db.localSettingsDao.apply(<LocalSettingId, String?>{
      kLocalSettingsLegacyImportId: '1',
      (scope: kDeviceLocalSettingScope, key: 'flag'): '{broken',
      (scope: kDeviceLocalSettingScope, key: 'text'): '42',
    });
    final LocalSettingsStore store = await open();
    expect(store.read(_kFlag), isTrue);
    expect(store.read(_kText), isNull);
  });

  test('remove deletes the stored row', () async {
    final LocalSettingsStore store = await open();
    store.writeAccount(_kAccountFlag, true, userId: 'a');
    await store.flush();
    store.removeAccount(_kAccountFlag, userId: 'a');
    await store.flush();
    expect(store.readAccount(_kAccountFlag, userId: 'a'), isFalse);
    expect((await open()).readAccount(_kAccountFlag, userId: 'a'), isFalse);
  });

  test('writes are coalesced and written after the delay', () async {
    final LocalSettingsStore store = await open();
    for (int i = 0; i < 20; i++) {
      store.write(_kText, 'v$i');
    }
    expect(
      (await db.localSettingsDao.loadAll()).keys.map(
        (LocalSettingId id) => id.key,
      ),
      isNot(contains('text')),
    );
    await Future<void>.delayed(
      kLocalSettingsWriteDelay + const Duration(milliseconds: 200),
    );
    expect((await open()).read(_kText), 'v19');
  });

  test('works in memory only when the database cannot be read', () async {
    final LocalSettingsStore store = LocalSettingsStore(
      () => throw StateError('no database'),
    );
    addTearDown(store.dispose);
    await store.load();
    store.write(_kFlag, false);
    await store.flush();
    expect(store.isPersistent, isFalse);
    expect(store.read(_kFlag), isFalse);
  });

  test('changes made before load win over stored values', () async {
    final LocalSettingsStore first = await open();
    first
      ..write(_kText, 'stored')
      ..write(_kFlag, false);
    await first.flush();

    final LocalSettingsStore store = LocalSettingsStore(() => db);
    addTearDown(store.dispose);
    store.write(_kText, 'early');
    await store.load();
    expect(store.read(_kText), 'early');
    expect(store.read(_kFlag), isFalse);
    await store.flush();
    expect((await open()).read(_kText), 'early');
  });

  test('settings survive signing out', () async {
    final LocalSettingsStore store = await open();
    store.writeAccount(_kAccountFlag, true, userId: 'a');
    await store.flush();
    await db.clearUserData('a');
    expect((await open()).readAccount(_kAccountFlag, userId: 'a'), isTrue);
  });
}
