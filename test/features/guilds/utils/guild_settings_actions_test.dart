import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Channel;
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/guilds/utils/guild_settings_actions.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

Future<FluxerDatabase> _databaseWithTimedGuildMute() async {
  final FluxerDatabase db = openTestDatabase();
  await db.userGuildSettingsDao.upsert(
    UserGuildSettingsTableCompanion(
      guildId: const Value('g1'),
      data: Value(
        jsonEncode(<String, Object?>{
          'guild_id': 'g1',
          'muted': true,
          'mute_config': <String, Object?>{
            'end_time': '2026-01-01T00:00:00.000Z',
            'selected_time_window': 900000,
          },
        }),
      ),
    ),
  );
  return db;
}

FluxerClient _recordingClient(List<Map<String, dynamic>> bodies) {
  final Dio dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler h) {
          final Map<String, dynamic> body = Map<String, dynamic>.from(
            options.data as Map,
          );
          bodies.add(body);
          h.resolve(
            Response<Map<String, dynamic>>(
              requestOptions: options,
              statusCode: 200,
              data: <String, dynamic>{
                'guild_id': 'g1',
                'message_notifications': 3,
                'muted': body['muted'] ?? false,
                'mute_config': null,
                'mobile_push': true,
                'suppress_everyone': false,
                'suppress_roles': false,
                'hide_muted_channels': false,
                'channel_overrides': null,
                'version': 2,
              },
            ),
          );
        },
      ),
    );
  return FluxerClient(dio);
}

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

    await markGuildAsRead('g1', db, FluxerClient(dio));

    expect((await db.readStateDao.getReadState('c1'))?.lastMessageId, '10');
    expect((await db.readStateDao.getReadState('t1'))?.lastMessageId, '11');
    expect(await db.readStateDao.getReadState('t2'), isNull);
    final ReadState? mentioned = await db.readStateDao.getReadState('t3');
    expect(mentioned?.lastMessageId, '13');
    expect(mentioned?.mentionCount, 0);
  });

  group('guild mute requests clear a stale mute_config', () {
    for (final GuildAction action in <GuildAction>[
      GuildAction.unmute,
      GuildAction.muteForever,
    ]) {
      test(
        'updateGuildUserSettings ${action.name} sends mute_config null',
        () async {
          final FluxerDatabase db = await _databaseWithTimedGuildMute();
          addTearDown(db.close);
          final List<Map<String, dynamic>> bodies = <Map<String, dynamic>>[];

          await updateGuildUserSettings(
            action,
            'g1',
            db,
            _recordingClient(bodies),
          );
          await pumpEventQueue();

          expect(bodies, hasLength(1));
          expect(bodies.single.containsKey('mute_config'), isTrue);
          expect(bodies.single['mute_config'], isNull);
        },
      );
    }

    test(
      'muteGuildForDuration without a duration sends mute_config null',
      () async {
        final FluxerDatabase db = await _databaseWithTimedGuildMute();
        addTearDown(db.close);
        final List<Map<String, dynamic>> bodies = <Map<String, dynamic>>[];

        await muteGuildForDuration(
          guildId: 'g1',
          durationMs: null,
          db: db,
          client: _recordingClient(bodies),
        );
        await pumpEventQueue();

        expect(bodies.single['muted'], isTrue);
        expect(bodies.single.containsKey('mute_config'), isTrue);
        expect(bodies.single['mute_config'], isNull);
      },
    );

    test('unmuteGuild sends mute_config null', () async {
      final FluxerDatabase db = await _databaseWithTimedGuildMute();
      addTearDown(db.close);
      final List<Map<String, dynamic>> bodies = <Map<String, dynamic>>[];

      await unmuteGuild(
        guildId: 'g1',
        db: db,
        client: _recordingClient(bodies),
      );
      await pumpEventQueue();

      expect(bodies.single['muted'], isFalse);
      expect(bodies.single.containsKey('mute_config'), isTrue);
      expect(bodies.single['mute_config'], isNull);
    });

    test(
      'the mute switch sends mute_config null and drops it locally',
      () async {
        final FluxerDatabase db = await _databaseWithTimedGuildMute();
        addTearDown(db.close);
        final List<Map<String, dynamic>> bodies = <Map<String, dynamic>>[];

        await updateGuildNotificationSetting(
          db: db,
          client: _recordingClient(bodies),
          guildId: 'g1',
          muted: true,
        );
        final UserGuildSettingsTableData? row = await db.userGuildSettingsDao
            .getByGuildId('g1');
        final Map<String, dynamic> stored =
            jsonDecode(row!.data) as Map<String, dynamic>;
        expect(stored.containsKey('mute_config'), isFalse);
        await Future<void>.delayed(const Duration(milliseconds: 3100));

        expect(bodies.single['muted'], isTrue);
        expect(bodies.single.containsKey('mute_config'), isTrue);
        expect(bodies.single['mute_config'], isNull);
      },
    );
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
