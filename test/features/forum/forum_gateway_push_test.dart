import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/push/local_push_notifications.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/features/forum/providers/forum_post_unreads_provider.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

const ForumUnreadsEvent _event = ForumUnreadsEvent(
  guildId: 'g1',
  channelId: 'f1',
  threads: <ForumUnreadEntry>[
    ForumUnreadEntry(threadId: 'p1', count: 3),
    ForumUnreadEntry(threadId: 'p2', missing: true),
  ],
);

class _ForumGatewayConnection extends GatewayConnection {
  _ForumGatewayConnection() : super(token: 'test', dio: Dio());

  GatewayState current = GatewayState.disconnected;
  final List<Map<String, String>> sent = <Map<String, String>>[];

  @override
  GatewayState get state => current;

  @override
  void requestForumUnreads({
    required String guildId,
    required String channelId,
    required Map<String, String> ackMessageIds,
  }) {
    sent.add(ackMessageIds);
  }
}

void main() {
  test('unread counts only apply to the ack they were asked for', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(forumPostUnreadsProvider.notifier).apply(_event);
    expect(container.read(forumPostUnreadsProvider), isEmpty);

    const Map<String, ForumPostUnread> unreads = <String, ForumPostUnread>{
      'p1': ForumPostUnread(guildId: 'g1', count: 3, ackMessageId: '10'),
    };
    expect(
      forumPostUnreadCount(unreads, postId: 'p1', currentAckMessageId: '10'),
      3,
    );
    expect(
      forumPostUnreadCount(unreads, postId: 'p1', currentAckMessageId: '11'),
      0,
    );
    expect(
      forumPostUnreadCount(unreads, postId: 'p2', currentAckMessageId: '10'),
      0,
    );
  });

  test('unread requests sent while offline are retried once online', () async {
    final FluxerDatabase database = openTestDatabase();
    addTearDown(database.close);
    await database.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value('p1'),
        lastMessageId: Value('10'),
      ),
    );
    final _ForumGatewayConnection connection = _ForumGatewayConnection();
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        fluxerDatabaseProvider.overrideWithValue(database),
        gatewayConnectionProvider.overrideWithValue(connection),
      ],
    );
    addTearDown(container.dispose);
    final ForumPostUnreads unreads = container.read(
      forumPostUnreadsProvider.notifier,
    );
    Future<void> request() =>
        unreads.request(guildId: 'g1', forumId: 'f1', postIds: <String>['p1']);

    await request();
    expect(connection.sent, isEmpty);

    connection.current = GatewayState.connected;
    await request();
    await request();
    expect(connection.sent, <Map<String, String>>[
      <String, String>{'p1': '10'},
    ]);

    unreads.resetRequests();
    await request();
    expect(connection.sent, hasLength(2));
  });

  test('unread requests beyond one batch are paced under the rate limit', () {
    final FluxerDatabase database = openTestDatabase();
    final List<String> postIds = <String>[for (int i = 0; i < 200; i++) 'p$i'];
    final _ForumGatewayConnection connection = _ForumGatewayConnection()
      ..current = GatewayState.connected;
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        fluxerDatabaseProvider.overrideWithValue(database),
        gatewayConnectionProvider.overrideWithValue(connection),
      ],
    );
    addTearDown(container.dispose);
    fakeAsync((FakeAsync async) {
      unawaited(
        database.readStateDao.upsertReadStates(<ReadStatesCompanion>[
          for (final String id in postIds)
            ReadStatesCompanion(
              channelId: Value(id),
              lastMessageId: const Value('10'),
            ),
        ]),
      );
      async.flushMicrotasks();
      unawaited(
        container
            .read(forumPostUnreadsProvider.notifier)
            .request(guildId: 'g1', forumId: 'f1', postIds: postIds),
      );
      async.flushMicrotasks();
      expect(connection.sent, hasLength(4));
      expect(connection.sent.first, hasLength(40));

      async.elapse(const Duration(seconds: 5));
      expect(connection.sent, hasLength(5));
      expect(
        connection.sent.expand((Map<String, String> batch) => batch.keys),
        unorderedEquals(postIds),
      );
    });
  });

  group('forum thread created push', () {
    const Map<String, String> forumPush = <String, String>{
      'guild_id': 'g1',
      'channel_id': 'p1',
      'parent_id': 'f1',
      'notif_type_id': '9',
    };

    test('uses its own Android channel', () {
      expect(isForumThreadCreatedPushPayload(forumPush), isTrue);
      expect(androidPushChannelId(forumPush), 'fluxer_forum_thread_created');
    });

    test('other pushes keep their channels', () {
      final Map<String, String> threadMessage = Map<String, String>.of(
        forumPush,
      )..remove('notif_type_id');
      expect(isForumThreadCreatedPushPayload(threadMessage), isFalse);
      expect(androidPushChannelId(threadMessage), 'fluxer_messages');
      expect(
        androidPushChannelId(const <String, String>{
          'channel_id': 'dm',
          'notif_type_id': '9',
          'parent_id': 'f1',
        }),
        'fluxer_direct_messages',
      );
      expect(
        androidPushChannelId(const <String, String>{
          'guild_id': 'g1',
          'channel_id': 'c1',
        }),
        'fluxer_messages',
      );
    });
  });
}
