import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/push/android/conversation/identity.dart';

void main() {
  late FluxerDatabase database;

  setUp(() {
    database = FluxerDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  Future<void> insertDm({
    required int type,
    String? name,
    String? icon,
    String recipientIds = '[]',
  }) {
    return database.dmChannelDao.upsertDmChannels(<DmChannelsCompanion>[
      DmChannelsCompanion.insert(
        id: 'c1',
        recipientId: 'u2',
        type: Value<int>(type),
        name: Value<String?>(name),
        icon: Value<String?>(icon),
        recipientIds: Value<String>(recipientIds),
      ),
    ]);
  }

  test('reads the name and icon of a named group dm', () async {
    await insertDm(type: 3, name: 'Weekend plans', icon: 'abc');
    final PushConversationIdentity identity =
        await readPushConversationIdentity(database, const <String, String>{
          'channel_id': 'c1',
        });
    expect(identity.name, 'Weekend plans');
    expect(identity.iconUrl, contains('icons/c1/abc.png'));
  });

  test('names an unnamed group dm after its other members', () async {
    await database.userDao.upsertUsers(<UsersCompanion>[
      UsersCompanion.insert(id: 'u1', username: 'me'),
      UsersCompanion.insert(id: 'u2', username: 'alice'),
    ]);
    await insertDm(type: 3, recipientIds: '["u1","u2"]');
    final PushConversationIdentity identity =
        await readPushConversationIdentity(database, const <String, String>{
          'channel_id': 'c1',
          'target_user_id': 'u1',
        });
    expect(identity.name, 'alice');
    expect(identity.iconUrl, isNull);
  });

  test('ignores channels that are not group dms', () async {
    await insertDm(type: 1, name: 'Not a group', icon: 'abc');
    final PushConversationIdentity identity =
        await readPushConversationIdentity(database, const <String, String>{
          'channel_id': 'c1',
        });
    expect(identity.name, isNull);
    expect(identity.iconUrl, isNull);
  });

  test('is empty for an unknown group dm', () async {
    final PushConversationIdentity identity =
        await readPushConversationIdentity(database, const <String, String>{
          'channel_id': 'missing',
        });
    expect(identity.name, isNull);
    expect(identity.iconUrl, isNull);
  });

  test('reads the guild icon', () async {
    await database.guildDao.upsertServer(
      ServersCompanion.insert(
        id: 'g1',
        name: 'My Server',
        icon: const Value<String?>('def'),
      ),
    );
    final PushConversationIdentity identity =
        await readPushConversationIdentity(database, const <String, String>{
          'guild_id': 'g1',
          'channel_id': 'c1',
        });
    expect(identity.name, isNull);
    expect(identity.iconUrl, contains('icons/g1/def.png'));
  });

  test('has no icon for an unknown guild', () async {
    final PushConversationIdentity identity =
        await readPushConversationIdentity(database, const <String, String>{
          'guild_id': 'g1',
        });
    expect(identity.iconUrl, isNull);
  });
}
