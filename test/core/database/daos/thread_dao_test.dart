import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';

import '../../../helpers/open_test_database.dart';

ChannelsCompanion _thread(
  String id, {
  String guildId = 'g1',
  String parentId = 'p1',
  bool archived = false,
  String archiveTimestamp = '2026-09-27T00:00:00.000Z',
}) => ChannelsCompanion.insert(
  id: id,
  guildId: guildId,
  name: 'thread $id',
  type: const Value(11),
  parentId: Value(parentId),
  threadArchived: Value(archived),
  threadArchiveTimestamp: Value(archiveTimestamp),
  messageCount: const Value(1),
);

ThreadMembersCompanion _member(String threadId, {String guildId = 'g1'}) =>
    ThreadMembersCompanion.insert(threadId: threadId, guildId: guildId);

void main() {
  test('channel lists exclude threads unless asked', () async {
    final FluxerDatabase db = openTestDatabase();
    await db.channelDao.upsertChannels(<ChannelsCompanion>[
      ChannelsCompanion.insert(id: 'p1', guildId: 'g1', name: 'general'),
      ChannelsCompanion.insert(
        id: 'f1',
        guildId: 'g1',
        name: 'forum',
        type: const Value(15),
      ),
      _thread('t1'),
    ]);

    expect(
      (await db.channelDao.getChannels('g1')).map((Channel c) => c.id),
      unorderedEquals(<String>['p1', 'f1']),
    );
    expect(
      (await db.channelDao.getAllChannels()).map((Channel c) => c.id),
      unorderedEquals(<String>['p1', 'f1']),
    );
    expect(
      (await db.channelDao.getChannels(
        'g1',
        includeThreads: true,
      )).map((Channel c) => c.id),
      unorderedEquals(<String>['p1', 'f1', 't1']),
    );
    expect(await db.channelDao.getChannelById('t1'), isNotNull);
  });

  test('reconcileJoined replaces the guild memberships only', () async {
    final FluxerDatabase db = openTestDatabase();
    await db.threadDao.upsertMember(_member('old'));
    await db.threadDao.upsertMember(_member('other', guildId: 'g2'));

    await db.threadDao.reconcileJoined(
      'g1',
      <ThreadMembersCompanion>[_member('t1')],
      listedIds: <String>{'t1'},
    );

    expect(
      await db.threadDao.getJoinedThreadIds(),
      unorderedEquals(<String>['t1', 'other']),
    );
  });

  test(
    'reconcileJoined drops active threads that were joined and are unlisted',
    () async {
      final FluxerDatabase db = openTestDatabase();
      await db.channelDao.upsertChannels(<ChannelsCompanion>[
        _thread('gone'),
        _thread('archived', archived: true),
        _thread('browsed'),
        _thread('kept'),
      ]);
      await db.threadDao.upsertMember(_member('gone'));
      await db.threadDao.upsertMember(_member('archived'));
      await db.threadDao.upsertMember(_member('kept'));

      final List<String> dropped = await db.threadDao.reconcileJoined(
        'g1',
        <ThreadMembersCompanion>[_member('kept')],
        listedIds: <String>{'kept'},
      );

      expect(dropped, <String>['gone']);
      expect(await db.channelDao.getChannelById('gone'), isNull);
      expect(await db.channelDao.getChannelById('archived'), isNotNull);
      expect(await db.channelDao.getChannelById('browsed'), isNotNull);
      expect(await db.threadDao.getJoinedThreadIds(), <String>{'kept'});
    },
  );

  test('message counters never go below zero', () async {
    final FluxerDatabase db = openTestDatabase();
    await db.channelDao.upsertChannels(<ChannelsCompanion>[_thread('t1')]);

    await db.threadDao.bumpMessageCounters('t1', delta: 1);
    Channel? row = await db.channelDao.getChannelById('t1');
    expect(row?.messageCount, 2);
    expect(row?.totalMessageSent, 1);

    await db.threadDao.bumpMessageCounters('t1', delta: -1);
    await db.threadDao.bumpMessageCounters('t1', delta: -1);
    await db.threadDao.bumpMessageCounters('t1', delta: -1);
    row = await db.channelDao.getChannelById('t1');
    expect(row?.messageCount, 0);
    expect(row?.totalMessageSent, 1);
  });

  test('pruneArchived drops old unjoined archived threads', () async {
    final FluxerDatabase db = openTestDatabase();
    await db.channelDao.upsertChannels(<ChannelsCompanion>[
      _thread(
        'old',
        archived: true,
        archiveTimestamp: '2026-09-01T00:00:00.000Z',
      ),
      _thread(
        'joined',
        archived: true,
        archiveTimestamp: '2026-09-01T00:00:00.000Z',
      ),
      _thread('recent', archived: true),
      _thread('active', archiveTimestamp: '2026-09-01T00:00:00.000Z'),
    ]);
    await db.threadDao.upsertMember(_member('joined'));

    final List<String> pruned = await db.threadDao.pruneArchived(
      now: DateTime.utc(2026, 9, 28),
    );

    expect(pruned, <String>['old']);
    expect(await db.channelDao.getChannelById('old'), isNull);
    expect(await db.channelDao.getChannelById('joined'), isNotNull);
    expect(await db.channelDao.getChannelById('recent'), isNotNull);
    expect(await db.channelDao.getChannelById('active'), isNotNull);
  });

  test('purgeGuild removes threads, forums, members and messages', () async {
    final FluxerDatabase db = openTestDatabase();
    await db.channelDao.upsertChannels(<ChannelsCompanion>[
      ChannelsCompanion.insert(id: 'p1', guildId: 'g1', name: 'general'),
      ChannelsCompanion.insert(
        id: 'f1',
        guildId: 'g1',
        name: 'forum',
        type: const Value(15),
      ),
      _thread('t1'),
      _thread('t2', guildId: 'g2'),
      ChannelsCompanion.insert(id: 'p2', guildId: 'g2', name: 'general'),
    ]);
    await db.threadDao.upsertMember(_member('t1'));
    await db.messageDao.upsertMessage(
      MessagesCompanion.insert(
        id: 'm1',
        channelId: 't1',
        authorId: 'u1',
        content: 'hi',
        timestamp: DateTime.utc(2026, 9, 27),
      ),
    );
    for (final (String id, String channelId, int type)
        in <(String, String, int)>[
          ('m2', 'p1', 18),
          ('m3', 'p1', 0),
          ('m4', 'p2', 18),
        ]) {
      await db.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: id,
          channelId: channelId,
          authorId: 'u1',
          content: '',
          timestamp: DateTime.utc(2026, 9, 27),
          type: Value(type),
        ),
      );
    }

    await db.readStateDao.upsertReadStates(<ReadStatesCompanion>[
      const ReadStatesCompanion(channelId: Value('f1')),
      const ReadStatesCompanion(channelId: Value('t1')),
      const ReadStatesCompanion(channelId: Value('p1')),
    ]);

    final List<String> purged = await db.threadDao.purgeGuild('g1');

    expect(purged, unorderedEquals(<String>['t1', 'f1']));
    expect(await db.channelDao.getChannelById('p1'), isNotNull);
    expect(await db.channelDao.getChannelById('t2'), isNotNull);
    expect(await db.threadDao.getMember('t1'), isNull);
    expect(await db.messageDao.getMessage('m1'), isNull);
    expect(await db.messageDao.getMessage('m2'), isNull);
    expect(await db.messageDao.getMessage('m3'), isNotNull);
    expect(await db.messageDao.getMessage('m4'), isNotNull);
    expect((await db.readStateDao.getReadState('f1'))?.flags, 2);
    expect((await db.readStateDao.getReadState('t1'))?.flags, 2);
    expect((await db.readStateDao.getReadState('p1'))?.flags, isNull);
  });
}
