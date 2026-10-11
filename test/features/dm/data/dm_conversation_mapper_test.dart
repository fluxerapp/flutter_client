import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/data/dm_conversation_mapper.dart';
import 'package:fluxer_app/features/dm/data/dm_repository.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

import '../../../helpers/open_test_database.dart';

Future<void> _insertSoloGroup(db.FluxerDatabase database) async {
  await database.userDao.upsertUser(
    db.UsersCompanion.insert(id: 'self', username: 'Self'),
  );
  await database.dmChannelDao.upsertDmChannels(<db.DmChannelsCompanion>[
    dmChannelCompanionFromChannelResponse(
      ChannelResponse.fromJson(<String, Object?>{
        'id': '300',
        'type': ChannelType.groupDm.wireValue,
        'name': null,
        'icon': null,
        'owner_id': 'self',
        'last_message_id': null,
      }),
    )!,
  ]);
}

Future<DmConversation> _conversation(db.FluxerDatabase database) async {
  final db.DmChannel? row = await database.dmChannelDao.getDmChannelById('300');
  return buildDmConversationFromChannelRow(database, row!);
}

void main() {
  test('solo group DM has no remote recipients', () async {
    final db.FluxerDatabase database = openTestDatabase();
    await _insertSoloGroup(database);

    final DmConversation conversation = await _conversation(database);

    expect(conversation.remoteRecipientIds, isEmpty);
  });

  test('watchDmChannels gives a solo group DM no remote recipients', () async {
    final db.FluxerDatabase database = openTestDatabase();
    await _insertSoloGroup(database);
    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(database)],
    );
    addTearDown(container.dispose);
    final DmRepository repo = DmRepository(
      FluxerClient(Dio()),
      database,
      container.read(guildUserSettingsRepositoryProvider),
    );

    final List<DmConversation> conversations = await repo
        .watchDmChannels()
        .first;

    expect(
      conversations
          .singleWhere((DmConversation c) => c.id == '300')
          .remoteRecipientIds,
      isEmpty,
    );
  });

  test(
    'solo group DM lists only the added user after CHANNEL_RECIPIENT_ADD',
    () async {
      final db.FluxerDatabase database = openTestDatabase();
      await _insertSoloGroup(database);
      await database.userDao.upsertUser(
        db.UsersCompanion.insert(id: 'other', username: 'Other'),
      );

      await database.dmChannelDao.addRecipientId('300', 'other');
      final DmConversation conversation = await _conversation(database);

      expect(conversation.remoteRecipientIds, <String>['other']);
      expect(conversation.recipientId, 'other');
      expect(conversation.recipientCount, 2);
    },
  );

  test('group DM drops a removed first recipient', () async {
    final db.FluxerDatabase database = openTestDatabase();
    await database.dmChannelDao.upsertDmChannels(<db.DmChannelsCompanion>[
      dmChannelCompanionFromChannelResponse(
        ChannelResponse.fromJson(<String, Object?>{
          'id': '300',
          'type': ChannelType.groupDm.wireValue,
          'owner_id': 'self',
          'last_message_id': null,
          'recipients': <Map<String, Object?>>[
            <String, Object?>{
              'id': 'a',
              'username': 'a',
              'discriminator': '0001',
              'global_name': null,
              'avatar': null,
              'avatar_color': null,
              'flags': 0,
            },
          ],
        }),
      )!,
    ]);

    await database.dmChannelDao.removeRecipientId('300', 'a');
    final DmConversation conversation = await _conversation(database);

    expect(conversation.remoteRecipientIds, isEmpty);
  });

  test('1:1 DM keeps the recipient as remote recipient', () async {
    final db.FluxerDatabase database = openTestDatabase();
    await database.dmChannelDao.upsertDmChannels(<db.DmChannelsCompanion>[
      db.DmChannelsCompanion.insert(id: '400', recipientId: 'other'),
    ]);

    final db.DmChannel? row = await database.dmChannelDao.getDmChannelById(
      '400',
    );
    final DmConversation conversation = await buildDmConversationFromChannelRow(
      database,
      row!,
    );

    expect(conversation.remoteRecipientIds, <String>['other']);
  });
}
