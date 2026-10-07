import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Channel;
import 'package:fluxer_app/features/guilds/utils/guild_settings_actions.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  test('marking a guild read acks joined and mentioned threads', () async {
    final FluxerDatabase db = openTestDatabase();
    addTearDown(db.close);
    final Dio dio = Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler h) {
            h.resolve(Response<void>(requestOptions: options, statusCode: 204));
          },
        ),
      );
    ChannelsCompanion channel(String id, int type, String lastMessageId) =>
        ChannelsCompanion.insert(
          id: id,
          guildId: 'g1',
          name: id,
          type: Value(type),
          parentId: type == 0 ? const Value.absent() : const Value('c1'),
          lastMessageId: Value(lastMessageId),
        );
    await db.channelDao.upsertChannels(<ChannelsCompanion>[
      channel('c1', 0, '10'),
      channel('t1', 11, '11'),
      channel('t2', 11, '12'),
      channel('t3', 11, '13'),
    ]);
    await db.threadDao.upsertMember(
      ThreadMembersCompanion.insert(threadId: 't1', guildId: 'g1'),
    );
    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value('t3'),
        lastMessageId: Value('5'),
        mentionCount: Value(2),
      ),
    );

    await markGuildAsRead('g1', db, FluxerClient(dio), threadsActive: true);

    expect((await db.readStateDao.getReadState('c1'))?.lastMessageId, '10');
    expect((await db.readStateDao.getReadState('t1'))?.lastMessageId, '11');
    expect(await db.readStateDao.getReadState('t2'), isNull);
    final ReadState? mentioned = await db.readStateDao.getReadState('t3');
    expect(mentioned?.lastMessageId, '13');
    expect(mentioned?.mentionCount, 0);
  });

  test('marking a guild read outside the experiment skips threads', () async {
    final FluxerDatabase db = openTestDatabase();
    addTearDown(db.close);
    final Dio dio = Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler h) {
            h.resolve(Response<void>(requestOptions: options, statusCode: 204));
          },
        ),
      );
    await db.channelDao.upsertChannels(<ChannelsCompanion>[
      ChannelsCompanion.insert(
        id: 'c1',
        guildId: 'g1',
        name: 'c1',
        type: const Value(0),
        lastMessageId: const Value('10'),
      ),
      ChannelsCompanion.insert(
        id: 't1',
        guildId: 'g1',
        name: 't1',
        type: const Value(11),
        parentId: const Value('c1'),
        lastMessageId: const Value('11'),
      ),
    ]);
    await db.threadDao.upsertMember(
      ThreadMembersCompanion.insert(threadId: 't1', guildId: 'g1'),
    );

    await markGuildAsRead('g1', db, FluxerClient(dio));

    expect((await db.readStateDao.getReadState('c1'))?.lastMessageId, '10');
    expect(await db.readStateDao.getReadState('t1'), isNull);
  });

  group('resolveGuildMessageNotificationsForDisplay', () {
    test('returns explicit stored levels unchanged', () {
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.onlyMentions,
        ),
        1,
      );
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.noMessages,
        ),
        2,
      );
    });

    test('resolves inherit to community default', () {
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.inherit,
          defaultMessageNotifications: 1,
        ),
        1,
      );
    });

    test('resolves inherit to all messages by default', () {
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.inherit,
        ),
        0,
      );
    });

    test('treats unknown stored values like inherit', () {
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.$unknown,
          defaultMessageNotifications: 1,
        ),
        1,
      );
    });

    test('resolves inherit to mentions only for large guilds', () {
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.inherit,
          memberCount: 251,
        ),
        1,
      );
      expect(
        resolveGuildMessageNotificationsForDisplay(
          stored: UserNotificationSettings.inherit,
          features: const ['LARGE_GUILD_OVERRIDE'],
        ),
        1,
      );
    });
  });
}
