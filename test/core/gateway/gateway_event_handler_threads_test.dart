import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

const String _guildId = 'g1';
const String _textId = '1000';
const String _forumId = '1001';
const String _announcementId = '1003';
const String _threadId = '2000';
const String _otherThreadId = '2001';

String _snowflakeForUtc(DateTime utc) =>
    ((utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22).toString();

class _Harness {
  _Harness(this.database, this.gate, this.handler, this.flips);

  final FluxerDatabase database;
  final ThreadsGate gate;
  final GatewayEventHandler handler;
  final List<({String guildId, bool active})> flips;
}

_Harness _build({
  MessageCreateCallback? onMessageCreate,
  ThreadActor? Function(String guildId, String parentId)?
  resolveParentThreadActor,
}) {
  final FluxerDatabase database = openTestDatabase();
  final ThreadsGate gate = ThreadsGate();
  final List<({String guildId, bool active})> flips =
      <({String guildId, bool active})>[];
  final GatewayEventHandler handler = GatewayEventHandler(
    database: database,
    currentUserId: '100',
    threadsGate: gate,
    resolveParentThreadActor: resolveParentThreadActor,
    onMessageCreate: onMessageCreate,
    onThreadGateChanged: (String guildId, {required bool active}) =>
        flips.add((guildId: guildId, active: active)),
  );
  return _Harness(database, gate, handler, flips);
}

Map<String, Object?> _channel(String id, int type, {String? parentId}) =>
    <String, Object?>{
      'id': id,
      'type': type,
      'guild_id': _guildId,
      'name': 'channel-$id',
      'position': 0,
      'parent_id': ?parentId,
    };

Map<String, Object?> _thread(
  String id, {
  String parentId = _textId,
  int type = 11,
  bool joined = true,
  bool archived = false,
  bool newlyCreated = false,
}) => <String, Object?>{
  'id': id,
  'type': type,
  'guild_id': _guildId,
  'parent_id': parentId,
  'owner_id': '100',
  'name': 'thread-$id',
  'message_count': 3,
  'total_message_sent': 3,
  'member_count': 2,
  'thread_metadata': <String, Object?>{
    'archived': archived,
    'auto_archive_duration': 4320,
    'archive_timestamp': '2026-09-27T10:00:00.000Z',
    'locked': false,
    'create_timestamp': '2026-09-27T09:00:00.000Z',
  },
  if (joined)
    'member': <String, Object?>{
      'join_timestamp': '2026-09-27T09:00:00.000Z',
      'flags': 2,
    },
  if (newlyCreated) 'newly_created': true,
};

Map<String, dynamic> _guildRaw({
  required bool withThreads,
  List<Map<String, Object?>>? threads,
}) => {
  'id': _guildId,
  'properties': {
    'id': _guildId,
    'name': 'Guild',
    'splash_card_alignment': 0,
    'owner_id': '999',
    'system_channel_flags': 0,
    'afk_timeout': 300,
    'features': <String>[],
    'verification_level': 0,
    'mfa_level': 0,
    'nsfw_level': 0,
    'nsfw': false,
    'content_warning_level': 0,
    'explicit_content_filter': 0,
    'default_message_notifications': 0,
    'disabled_operations': 0,
  },
  'channels': <Map<String, Object?>>[
    _channel(_textId, 0),
    _channel(_forumId, 15),
    _channel(_announcementId, 5),
  ],
  'members': <Map<String, Object?>>[],
  'roles': <Map<String, Object?>>[],
  'presences': <Map<String, Object?>>[],
  'voice_states': <Map<String, Object?>>[],
  'emojis': <Map<String, Object?>>[],
  'stickers': <Map<String, Object?>>[],
  if (withThreads)
    'threads': threads ?? <Map<String, Object?>>[_thread(_threadId)],
};

Future<void> _ready(
  GatewayEventHandler handler, {
  required bool withThreads,
  String sessionId = 'session-1',
  bool unavailable = false,
  List<Map<String, Object?>>? threads,
}) => handler.handle(
  ReadyEvent(
    sessionId: sessionId,
    user: _user(),
    guilds: const [],
    rawGuilds: [
      if (unavailable)
        {'id': _guildId, 'unavailable': true}
      else
        _guildRaw(withThreads: withThreads, threads: threads),
    ],
    privateChannels: const [],
    relationships: const [],
    readStates: const [],
    presences: const [],
  ),
);

Future<void> _guildCreate(
  GatewayEventHandler handler, {
  required bool withThreads,
  List<Map<String, Object?>>? threads,
}) async {
  await handler.handle(
    GuildCreateEvent(
      guild: GuildCreateData.fromJson(
        _guildRaw(withThreads: withThreads, threads: threads),
      ),
    ),
  );
  await Future<void>.delayed(const Duration(milliseconds: 50));
}

MessageResponseSchema _message(
  String id,
  String channelId, {
  bool mentionEveryone = false,
}) => MessageResponseSchema(
  id: id,
  channelId: channelId,
  author: const UserPartialResponse(
    id: '300',
    username: 'author',
    discriminator: '0001',
    globalName: null,
    avatar: null,
    avatarColor: null,
    flags: 0,
  ),
  type: MessageType.valueDefault,
  flags: 0,
  content: 'hello $id',
  timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
  pinned: false,
  mentionEveryone: mentionEveryone,
  tts: false,
  mentions: const [],
  mentionRoles: const [],
);

Future<void> _storeGuildSettings(
  FluxerDatabase database, {
  bool muted = false,
  Map<String, ChannelOverrides>? overrides,
}) => database.userGuildSettingsDao.upsert(
  UserGuildSettingsTableCompanion.insert(
    guildId: _guildId,
    data: jsonEncode(
      UserGuildSettingsResponse(
        guildId: _guildId,
        messageNotifications: UserNotificationSettings.allMessages,
        muted: muted,
        muteConfig: null,
        mobilePush: true,
        suppressEveryone: false,
        suppressRoles: false,
        hideMutedChannels: false,
        channelOverrides: overrides ?? const <String, ChannelOverrides>{},
        version: 1,
      ).toJson(),
    ),
  ),
);

void main() {
  group('gate off', () {
    test(
      'READY without threads drops gated channel types and stays inactive',
      () async {
        final _Harness h = _build();
        await _ready(h.handler, withThreads: false);

        expect(h.gate.isActive(_guildId), isFalse);
        expect(await h.database.channelDao.getChannelById(_textId), isNotNull);
        expect(await h.database.channelDao.getChannelById(_forumId), isNull);
        expect(await h.database.threadDao.getJoinedThreadIds(), isEmpty);
        final Server? server = await h.database.guildDao.getServerById(
          _guildId,
        );
        expect(server?.threadChannelsActive, isFalse);
      },
    );

    test('thread events and gated channel upserts are dropped', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: false);

      await h.handler.handle(
        ThreadCreateEvent(
          channel: ChannelResponse.fromJson(_thread(_threadId)),
        ),
      );
      await h.handler.handle(
        ChannelCreateEvent(
          channel: ChannelResponse.fromJson(_channel('1002', 16)),
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 20));

      expect(await h.database.channelDao.getChannelById(_threadId), isNull);
      expect(await h.database.channelDao.getChannelById('1002'), isNull);
      expect(await h.database.threadDao.getMember(_threadId), isNull);
    });

    test('GUILD_CREATE without threads drops every gated type', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: false);
      await _guildCreate(h.handler, withThreads: false);

      expect(h.gate.isActive(_guildId), isFalse);
      expect(h.flips, isEmpty);
      expect(await h.database.channelDao.getChannelById(_textId), isNotNull);
      expect(await h.database.channelDao.getChannelById(_forumId), isNull);
      expect(
        await h.database.channelDao.getChannels(_guildId, includeThreads: true),
        hasLength(2),
      );
    });

    test('bulk channel updates drop every gated type', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: false);

      await h.handler.handle(
        ChannelUpdateBulkEvent(
          channels: <ChannelResponse>[
            for (final int type in <int>[10, 11, 12, 15, 16])
              ChannelResponse.fromJson(
                _channel('30$type', type, parentId: _textId),
              ),
            ChannelResponse.fromJson(_channel('3000', 0)),
          ],
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 20));

      final List<Channel> stored = await h.database.channelDao.getChannels(
        _guildId,
        includeThreads: true,
      );
      expect(
        stored.map((Channel c) => c.type).toSet().intersection(<int>{
          10,
          11,
          12,
          15,
          16,
        }),
        isEmpty,
      );
      expect(await h.database.channelDao.getChannelById('3000'), isNotNull);
    });

    test('thread list, member and delete events write nothing', () async {
      final List<ThreadMemberListUpdateEvent> memberLists =
          <ThreadMemberListUpdateEvent>[];
      final List<String> deleted = <String>[];
      final FluxerDatabase database = openTestDatabase();
      final GatewayEventHandler handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
        threadsGate: ThreadsGate(),
        onThreadMemberListUpdate: memberLists.add,
        onChannelDelete: deleted.add,
      );
      await _ready(handler, withThreads: false);

      await handler.handle(
        ThreadListSyncEvent(
          guildId: _guildId,
          threads: <ChannelResponse>[
            ChannelResponse.fromJson(_thread(_threadId)),
          ],
          members: const <ThreadMemberResponse>[],
        ),
      );
      await handler.handle(
        ThreadUpdateEvent(
          channel: ChannelResponse.fromJson(_thread(_threadId)),
        ),
      );
      await handler.handle(
        const ThreadMembersUpdateEvent(
          id: _threadId,
          guildId: _guildId,
          memberCount: 4,
        ),
      );
      await handler.handle(
        const ThreadDeleteEvent(
          id: _threadId,
          guildId: _guildId,
          parentId: _textId,
          type: ChannelType.publicThread,
        ),
      );
      await handler.handle(
        const ThreadMemberListUpdateEvent(
          guildId: _guildId,
          threadId: _threadId,
          members: <ThreadMemberEntry>[],
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 20));

      expect(
        await database.channelDao.getChannels(_guildId, includeThreads: true),
        hasLength(2),
      );
      expect(await database.threadDao.getJoinedThreadIds(), isEmpty);
      expect(memberLists, isEmpty);
      expect(deleted, isEmpty);
    });

    test('a message in an unknown channel creates no thread state', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: false);

      await h.handler.handle(
        MessageCreateEvent(
          message: _message(
            _snowflakeForUtc(DateTime.utc(2026, 9, 28, 3)),
            _threadId,
          ),
          guildId: _guildId,
          channelType: 11,
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 20));

      expect(await h.database.channelDao.getChannelById(_threadId), isNull);
      expect(await h.database.threadDao.getMember(_threadId), isNull);
    });

    test('a handler without a gate never activates', () async {
      final FluxerDatabase database = openTestDatabase();
      final GatewayEventHandler handler = GatewayEventHandler(
        database: database,
        currentUserId: '100',
      );
      await _ready(handler, withThreads: true);

      expect(await database.channelDao.getChannelById(_forumId), isNull);
      expect(await database.channelDao.getChannelById(_threadId), isNull);
    });
  });

  group('gate on', () {
    test('READY with threads stores threads, forums and membership', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: true);

      expect(h.gate.isActive(_guildId), isTrue);
      final Channel? thread = await h.database.channelDao.getChannelById(
        _threadId,
      );
      expect(thread?.type, 11);
      expect(thread?.parentId, _textId);
      expect(thread?.messageCount, 3);
      expect(thread?.threadArchived, isFalse);
      expect(await h.database.channelDao.getChannelById(_forumId), isNotNull);
      expect(await h.database.threadDao.getMember(_threadId), isNotNull);
      expect(
        (await h.database.guildDao.getServerById(
          _guildId,
        ))?.threadChannelsActive,
        isTrue,
      );
      final List<String> listed = <String>[
        for (final Channel c in await h.database.channelDao.getChannels(
          _guildId,
        ))
          c.id,
      ];
      expect(listed, isNot(contains(_threadId)));
      expect(listed, contains(_forumId));
      expect(
        (await h.database.channelDao.getChannels(
          _guildId,
          includeThreads: true,
        )).map((Channel c) => c.id),
        contains(_threadId),
      );
    });

    test(
      'a reconnect READY keeps unjoined active threads and their messages',
      () async {
        final _Harness h = _build();
        await _ready(
          h.handler,
          withThreads: true,
          threads: <Map<String, Object?>>[
            _thread(_threadId),
            _thread(_otherThreadId, joined: false),
          ],
        );
        final String messageId = _snowflakeForUtc(DateTime.utc(2026, 9, 28, 1));
        await h.handler.handle(
          MessageCreateEvent(
            message: _message(messageId, _otherThreadId),
            guildId: _guildId,
          ),
        );

        await _ready(
          h.handler,
          withThreads: true,
          sessionId: 'session-2',
          threads: <Map<String, Object?>>[_thread(_threadId)],
        );

        expect(
          await h.database.channelDao.getChannelById(_otherThreadId),
          isNotNull,
        );
        expect(await h.database.messageDao.getMessage(messageId), isNotNull);
        expect(
          await h.database.channelDao.getChannelById(_threadId),
          isNotNull,
        );
        expect(await h.database.threadDao.getMember(_threadId), isNotNull);
      },
    );

    test(
      'a reconnect READY drops a joined thread it no longer lists',
      () async {
        final _Harness h = _build();
        await _ready(h.handler, withThreads: true);
        await h.database.messageDao.upsertMessage(
          MessagesCompanion.insert(
            id: '9002',
            channelId: _threadId,
            authorId: '300',
            content: 'in thread',
            timestamp: DateTime.utc(2026, 9, 27),
          ),
        );

        await _ready(
          h.handler,
          withThreads: true,
          sessionId: 'session-2',
          threads: <Map<String, Object?>>[],
        );

        expect(await h.database.channelDao.getChannelById(_threadId), isNull);
        expect(await h.database.threadDao.getMember(_threadId), isNull);
        expect(await h.database.messageDao.getMessage('9002'), isNull);
        expect(await h.database.channelDao.getChannelById(_textId), isNotNull);
      },
    );

    test(
      'GUILD_CREATE drops unlisted joined threads and keeps listed ones',
      () async {
        final _Harness h = _build();
        await _ready(h.handler, withThreads: true);

        await _guildCreate(
          h.handler,
          withThreads: true,
          threads: <Map<String, Object?>>[_thread(_otherThreadId)],
        );

        expect(await h.database.channelDao.getChannelById(_threadId), isNull);
        expect(await h.database.threadDao.getMember(_threadId), isNull);
        expect(
          await h.database.channelDao.getChannelById(_otherThreadId),
          isNotNull,
        );
      },
    );

    test(
      'thread message notifications follow membership and every mute layer',
      () async {
        final List<MessagePersistSnapshot> snapshots =
            <MessagePersistSnapshot>[];
        final _Harness h = _build(
          onMessageCreate: (MessageCreateDispatch d) =>
              snapshots.add(d.snapshot),
        );
        await _ready(
          h.handler,
          withThreads: true,
          threads: <Map<String, Object?>>[
            _thread(_threadId),
            _thread(_otherThreadId, joined: false),
          ],
        );
        await _storeGuildSettings(h.database);
        int minute = 0;
        Future<MessagePersistSnapshot> send(String channelId) async {
          minute += 1;
          await h.handler.handle(
            MessageCreateEvent(
              message: _message(
                _snowflakeForUtc(DateTime.utc(2026, 9, 28, 2, minute)),
                channelId,
              ),
              guildId: _guildId,
            ),
          );
          return snapshots.last;
        }

        MessagePersistSnapshot snapshot = await send(_threadId);
        expect(
          snapshot.notificationLevel,
          UserNotificationSettings.allMessages,
        );
        expect(snapshot.isChannelMuted, isFalse);

        snapshot = await send(_otherThreadId);
        expect(
          snapshot.notificationLevel,
          UserNotificationSettings.onlyMentions,
        );

        await _storeGuildSettings(
          h.database,
          overrides: <String, ChannelOverrides>{
            _textId: const ChannelOverrides(
              muted: true,
              muteConfig: null,
              collapsed: false,
              messageNotifications: UserNotificationSettingsInput.inherit,
            ),
          },
        );
        expect((await send(_threadId)).isChannelMuted, isTrue);

        await _storeGuildSettings(h.database);
        await h.database.threadDao.upsertMember(
          const ThreadMembersCompanion(
            threadId: Value(_threadId),
            guildId: Value(_guildId),
            flags: Value(2),
            muted: Value(true),
          ),
        );
        expect((await send(_threadId)).isChannelMuted, isTrue);
      },
    );

    test(
      'a message in an unknown thread never counts @everyone or writes read state',
      () async {
        final List<MessagePersistSnapshot> snapshots =
            <MessagePersistSnapshot>[];
        final _Harness h = _build(
          onMessageCreate: (MessageCreateDispatch d) =>
              snapshots.add(d.snapshot),
        );
        await _ready(h.handler, withThreads: true);
        await _storeGuildSettings(h.database, muted: true);
        const String unknownThreadId = '2999';

        await h.handler.handle(
          MessageCreateEvent(
            message: _message(
              _snowflakeForUtc(DateTime.utc(2026, 9, 28, 3)),
              unknownThreadId,
              mentionEveryone: true,
            ),
            guildId: _guildId,
          ),
        );

        final MessagePersistSnapshot snapshot = snapshots.single;
        expect(snapshot.mentionsCurrentUser, isFalse);
        expect(snapshot.isChannelMuted, isTrue);
        expect(
          snapshot.notificationLevel,
          UserNotificationSettings.onlyMentions,
        );
        expect(
          await h.database.notificationDao.getMentionFeedOrdered(),
          isEmpty,
        );
        expect(
          await h.database.readStateDao.getReadState(unknownThreadId),
          isNull,
        );
      },
    );

    test(
      'a message in an unknown text channel is not taken for a thread',
      () async {
        final List<MessagePersistSnapshot> snapshots =
            <MessagePersistSnapshot>[];
        final _Harness h = _build(
          onMessageCreate: (MessageCreateDispatch d) =>
              snapshots.add(d.snapshot),
        );
        await _ready(h.handler, withThreads: true);
        const String unknownTextId = '2998';

        await h.handler.handle(
          MessageCreateEvent(
            message: _message(
              _snowflakeForUtc(DateTime.utc(2026, 9, 28, 3)),
              unknownTextId,
              mentionEveryone: true,
            ),
            guildId: _guildId,
            channelType: 0,
          ),
        );

        expect(snapshots.single.mentionsCurrentUser, isTrue);
        expect(
          await h.database.readStateDao.getReadState(unknownTextId),
          isNotNull,
        );
      },
    );

    test('THREAD_CREATE in a forum bumps the forum last message id', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: true);
      final String postId = _snowflakeForUtc(DateTime.utc(2026, 9, 28));

      await h.handler.handle(
        ThreadCreateEvent(
          channel: ChannelResponse.fromJson(
            _thread(postId, parentId: _forumId),
          ),
          newlyCreated: true,
        ),
      );

      expect(await h.database.channelDao.getChannelById(postId), isNotNull);
      expect(
        (await h.database.channelDao.getChannelById(_forumId))?.lastMessageId,
        postId,
      );
      expect(await h.database.threadDao.getMember(postId), isNotNull);
    });

    test('THREAD_DELETE removes the thread and keeps its read state', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: true);
      await h.database.readStateDao.upsertReadState(
        const ReadStatesCompanion(channelId: Value(_threadId), flags: Value(3)),
      );
      await h.database.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: _threadId,
          channelId: _textId,
          authorId: '300',
          content: 'source',
          timestamp: DateTime.utc(2026, 9, 27),
          threadJson: const Value('{"id":"2000"}'),
        ),
      );

      await h.handler.handle(
        const ThreadDeleteEvent(
          id: _threadId,
          guildId: _guildId,
          parentId: _textId,
          type: ChannelType.publicThread,
        ),
      );

      expect(await h.database.channelDao.getChannelById(_threadId), isNull);
      expect(await h.database.threadDao.getMember(_threadId), isNull);
      expect(await h.database.readStateDao.getReadState(_threadId), isNotNull);
      expect(
        (await h.database.messageDao.getMessage(_threadId))?.threadJson,
        isNull,
      );
    });

    test('THREAD_LIST_SYNC replaces unjoined active threads only', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: true);
      await h.handler.handle(
        ThreadCreateEvent(
          channel: ChannelResponse.fromJson(
            _thread(_otherThreadId, joined: false),
          ),
        ),
      );

      await h.handler.handle(
        const ThreadListSyncEvent(
          guildId: _guildId,
          channelIds: <String>[_textId],
          threads: <ChannelResponse>[],
          members: <ThreadMemberResponse>[],
        ),
      );

      expect(await h.database.channelDao.getChannelById(_threadId), isNotNull);
      expect(
        await h.database.channelDao.getChannelById(_otherThreadId),
        isNull,
      );
    });

    test(
      'a full THREAD_LIST_SYNC after a reconnect drops stale posts',
      () async {
        final _Harness h = _build();
        await _ready(
          h.handler,
          withThreads: true,
          threads: <Map<String, Object?>>[
            _thread(_threadId),
            _thread(_otherThreadId, joined: false),
          ],
        );
        await _ready(
          h.handler,
          withThreads: true,
          sessionId: 'session-2',
          threads: <Map<String, Object?>>[_thread(_threadId)],
        );

        await h.handler.handle(
          const ThreadListSyncEvent(
            guildId: _guildId,
            threads: <ChannelResponse>[],
            members: <ThreadMemberResponse>[],
          ),
        );

        expect(
          await h.database.channelDao.getChannelById(_threadId),
          isNotNull,
        );
        expect(
          await h.database.channelDao.getChannelById(_otherThreadId),
          isNull,
        );
      },
    );

    test(
      'MESSAGE_UPDATE of a thread source message keeps its thread',
      () async {
        final _Harness h = _build();
        await _ready(h.handler, withThreads: true);
        final String messageId = _snowflakeForUtc(DateTime.utc(2026, 9, 28, 2));
        await h.database.messageDao.upsertMessage(
          MessagesCompanion.insert(
            id: messageId,
            channelId: _textId,
            authorId: '300',
            content: 'source',
            timestamp: DateTime.utc(2026, 9, 28, 2),
            threadJson: const Value('{"id":"2000"}'),
          ),
        );

        await h.handler.handle(
          MessageUpdateEvent(message: _message(messageId, _textId)),
        );

        final stored = await h.database.messageDao.getMessage(messageId);
        expect(stored?.content, 'hello $messageId');
        expect(stored?.threadJson, '{"id":"2000"}');
      },
    );

    test('self removal from a private thread removes it locally', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: true);
      await h.handler.handle(
        ThreadCreateEvent(
          channel: ChannelResponse.fromJson(_thread(_otherThreadId, type: 12)),
        ),
      );
      await h.database.readStateDao.upsertReadState(
        const ReadStatesCompanion(channelId: Value(_otherThreadId)),
      );

      await h.handler.handle(
        const ThreadMembersUpdateEvent(
          id: _otherThreadId,
          guildId: _guildId,
          memberCount: 1,
          removedMemberIds: <String>['100'],
        ),
      );

      expect(
        await h.database.channelDao.getChannelById(_otherThreadId),
        isNull,
      );
      expect(await h.database.threadDao.getMember(_otherThreadId), isNull);
      expect(
        isThreadReadState(
          (await h.database.readStateDao.getReadState(_otherThreadId))?.flags,
        ),
        isTrue,
      );
    });

    test('a moderator removed from a private thread keeps it', () async {
      final List<(String, String)> asked = <(String, String)>[];
      final _Harness h = _build(
        resolveParentThreadActor: (String guildId, String parentId) {
          asked.add((guildId, parentId));
          return ThreadActor(permissions: Permission.manageThreads.value);
        },
      );
      await _ready(h.handler, withThreads: true);
      await h.handler.handle(
        ThreadCreateEvent(
          channel: ChannelResponse.fromJson(_thread(_otherThreadId, type: 12)),
        ),
      );

      await h.handler.handle(
        const ThreadMembersUpdateEvent(
          id: _otherThreadId,
          guildId: _guildId,
          memberCount: 1,
          removedMemberIds: <String>['100'],
        ),
      );

      expect(asked, <(String, String)>[(_guildId, _textId)]);
      expect(
        await h.database.channelDao.getChannelById(_otherThreadId),
        isNotNull,
      );
      expect(await h.database.threadDao.getMember(_otherThreadId), isNull);
    });

    test(
      'a timed-out moderator removed from a private thread drops it',
      () async {
        final _Harness h = _build(
          resolveParentThreadActor: (String guildId, String parentId) =>
              ThreadActor(permissions: Permission.manageThreads.value),
        );
        await _ready(h.handler, withThreads: true);
        await h.handler.handle(
          ThreadCreateEvent(
            channel: ChannelResponse.fromJson(
              _thread(_otherThreadId, type: 12),
            ),
          ),
        );
        await h.database.memberDao.upsertMember(
          MembersCompanion.insert(
            userId: '100',
            guildId: _guildId,
            communicationDisabledUntil: Value(
              DateTime.now().add(const Duration(hours: 1)),
            ),
          ),
        );

        await h.handler.handle(
          const ThreadMembersUpdateEvent(
            id: _otherThreadId,
            guildId: _guildId,
            memberCount: 1,
            removedMemberIds: <String>['100'],
          ),
        );

        expect(
          await h.database.channelDao.getChannelById(_otherThreadId),
          isNull,
        );
      },
    );

    test(
      'THREAD_MEMBERS_UPDATE records the member count and self join',
      () async {
        final _Harness h = _build();
        await _ready(h.handler, withThreads: true);
        await h.handler.handle(
          ThreadCreateEvent(
            channel: ChannelResponse.fromJson(
              _thread(_otherThreadId, joined: false),
            ),
          ),
        );

        await h.handler.handle(
          const ThreadMembersUpdateEvent(
            id: _otherThreadId,
            guildId: _guildId,
            memberCount: 7,
            addedMembers: <ThreadMemberEntry>[
              ThreadMemberEntry(userId: '100', flags: 4),
            ],
          ),
        );

        expect(
          (await h.database.channelDao.getChannelById(
            _otherThreadId,
          ))?.memberCount,
          7,
        );
        expect(
          (await h.database.threadDao.getMember(_otherThreadId))?.flags,
          4,
        );
      },
    );

    test('thread messages move the message counters', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: true);
      final String messageId = _snowflakeForUtc(DateTime.utc(2026, 9, 28, 1));

      await h.handler.handle(
        MessageCreateEvent(
          message: _message(messageId, _threadId),
          guildId: _guildId,
        ),
      );
      Channel? thread = await h.database.channelDao.getChannelById(_threadId);
      expect(thread?.messageCount, 4);
      expect(thread?.totalMessageSent, 4);

      await h.handler.handle(
        MessageDeleteEvent(
          channelId: _threadId,
          messageId: messageId,
          guildId: _guildId,
        ),
      );
      thread = await h.database.channelDao.getChannelById(_threadId);
      expect(thread?.messageCount, 3);
      expect(thread?.totalMessageSent, 4);

      await h.handler.handle(
        const MessageDeleteBulkEvent(
          channelId: _threadId,
          ids: <String>[_threadId, 'm1', 'm2'],
          guildId: _guildId,
        ),
      );
      thread = await h.database.channelDao.getChannelById(_threadId);
      expect(thread?.messageCount, 1);
      expect(thread?.totalMessageSent, 4);
    });

    test('deleting the parent cascades to its threads', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: true);

      await h.handler.handle(
        ChannelDeleteEvent(
          channel: ChannelResponse.fromJson(_channel(_textId, 0)),
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(await h.database.channelDao.getChannelById(_threadId), isNull);
      expect(await h.database.threadDao.getMember(_threadId), isNull);
    });

    for (final (String parentId, int parentType) in <(String, int)>[
      (_textId, 0),
      (_forumId, 15),
    ]) {
      test(
        'a passive delete of a type $parentType parent drops its threads',
        () async {
          final _Harness h = _build();
          await _ready(
            h.handler,
            withThreads: true,
            threads: <Map<String, Object?>>[
              _thread(_threadId, parentId: parentId),
            ],
          );
          expect(
            await h.database.channelDao.getChannelById(_threadId),
            isNotNull,
          );

          await h.handler.handle(
            PassiveUpdatesEvent(
              guildId: _guildId,
              channels: const <String, String>{},
              deletedChannelIds: <String>[parentId],
            ),
          );
          await Future<void>.delayed(const Duration(milliseconds: 50));

          expect(await h.database.channelDao.getChannelById(parentId), isNull);
          expect(await h.database.channelDao.getChannelById(_threadId), isNull);
          expect(await h.database.threadDao.getMember(_threadId), isNull);
        },
      );
    }
  });

  group('announcement threads', () {
    test(
      'READY without threads keeps the announcement channel and drops type 10',
      () async {
        final _Harness h = _build();
        await _ready(
          h.handler,
          withThreads: false,
          threads: <Map<String, Object?>>[
            _thread(_threadId, parentId: _announcementId, type: 10),
          ],
        );

        expect(
          (await h.database.channelDao.getChannelById(_announcementId))?.type,
          5,
        );
        expect(await h.database.channelDao.getChannelById(_threadId), isNull);

        await h.handler.handle(
          ThreadCreateEvent(
            channel: ChannelResponse.fromJson(
              _thread(_otherThreadId, parentId: _announcementId, type: 10),
            ),
            newlyCreated: true,
          ),
        );
        await Future<void>.delayed(const Duration(milliseconds: 20));

        expect(
          await h.database.channelDao.getChannelById(_otherThreadId),
          isNull,
        );
        expect(await h.database.threadDao.getMember(_otherThreadId), isNull);
      },
    );

    test(
      'type 10 threads are stored as threads of the announcement channel',
      () async {
        final _Harness h = _build();
        await _ready(
          h.handler,
          withThreads: true,
          threads: <Map<String, Object?>>[
            _thread(_threadId, parentId: _announcementId, type: 10),
          ],
        );

        final Channel? thread = await h.database.channelDao.getChannelById(
          _threadId,
        );
        expect(thread?.type, 10);
        expect(thread?.parentId, _announcementId);
        expect(await h.database.threadDao.getMember(_threadId), isNotNull);
        expect(
          (await h.database.channelDao.getChannels(
            _guildId,
          )).map((Channel c) => c.id),
          isNot(contains(_threadId)),
        );
        expect(
          (await h.database.threadDao.getThreadsForGuild(
            _guildId,
          )).map((Channel c) => c.id),
          contains(_threadId),
        );
      },
    );

    test('self removal from an announcement thread keeps it', () async {
      final _Harness h = _build();
      await _ready(
        h.handler,
        withThreads: true,
        threads: <Map<String, Object?>>[
          _thread(_threadId, parentId: _announcementId, type: 10),
        ],
      );

      await h.handler.handle(
        const ThreadMembersUpdateEvent(
          id: _threadId,
          guildId: _guildId,
          memberCount: 1,
          removedMemberIds: <String>['100'],
        ),
      );

      expect(await h.database.channelDao.getChannelById(_threadId), isNotNull);
      expect(await h.database.threadDao.getMember(_threadId), isNull);
    });

    test('deleting the announcement channel cascades to its threads', () async {
      final _Harness h = _build();
      await _ready(
        h.handler,
        withThreads: true,
        threads: <Map<String, Object?>>[
          _thread(_threadId, parentId: _announcementId, type: 10),
        ],
      );

      await h.handler.handle(
        ChannelDeleteEvent(
          channel: ChannelResponse.fromJson(_channel(_announcementId, 5)),
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(await h.database.channelDao.getChannelById(_threadId), isNull);
      expect(await h.database.threadDao.getMember(_threadId), isNull);
    });

    test('a thread retyped by a parent conversion keeps one row', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: true);

      await h.handler.handle(
        ChannelUpdateEvent(
          channel: ChannelResponse.fromJson(_channel(_textId, 5)),
        ),
      );
      await h.handler.handle(
        ThreadUpdateEvent(
          channel: ChannelResponse.fromJson(_thread(_threadId, type: 10)),
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 20));

      expect((await h.database.channelDao.getChannelById(_threadId))?.type, 10);
      expect((await h.database.channelDao.getChannelById(_textId))?.type, 5);
    });
  });

  group('flips', () {
    test('GUILD_CREATE without threads purges and reports the flip', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: true);

      await _guildCreate(h.handler, withThreads: false);

      expect(h.gate.isActive(_guildId), isFalse);
      expect(h.flips, [
        (guildId: _guildId, active: true),
        (guildId: _guildId, active: false),
      ]);
      expect(await h.database.channelDao.getChannelById(_threadId), isNull);
      expect(await h.database.channelDao.getChannelById(_forumId), isNull);
      expect(await h.database.channelDao.getChannelById(_textId), isNotNull);
      expect(await h.database.threadDao.getJoinedThreadIds(), isEmpty);
    });

    test('GUILD_CREATE with threads activates and reports the flip', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: false);

      await _guildCreate(h.handler, withThreads: true);

      expect(h.gate.isActive(_guildId), isTrue);
      expect(h.flips, [(guildId: _guildId, active: true)]);
      expect(await h.database.channelDao.getChannelById(_threadId), isNotNull);
      expect(await h.database.channelDao.getChannelById(_forumId), isNotNull);
    });

    test('READY with threads reports the activation', () async {
      final _Harness h = _build();

      await _ready(h.handler, withThreads: true);
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(h.gate.isActive(_guildId), isTrue);
      expect(h.flips, [(guildId: _guildId, active: true)]);
    });

    test('a reconnect READY reports only real flips', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: true);

      await _ready(h.handler, withThreads: true, sessionId: 'session-2');
      await _ready(h.handler, withThreads: false, sessionId: 'session-3');

      expect(h.flips, [
        (guildId: _guildId, active: true),
        (guildId: _guildId, active: false),
      ]);
    });

    test('an unchanged GUILD_CREATE reports nothing', () async {
      final _Harness h = _build();
      await _ready(h.handler, withThreads: false);

      await _guildCreate(h.handler, withThreads: false);

      expect(h.flips, isEmpty);
    });

    test(
      'a reconnect READY without threads purges stored thread data',
      () async {
        final _Harness h = _build();
        await _ready(h.handler, withThreads: true);

        await _ready(h.handler, withThreads: false, sessionId: 'session-2');

        expect(h.gate.isActive(_guildId), isFalse);
        expect(await h.database.channelDao.getChannelById(_threadId), isNull);
        expect(await h.database.channelDao.getChannelById(_forumId), isNull);
        expect(await h.database.threadDao.getJoinedThreadIds(), isEmpty);
        expect(
          (await h.database.guildDao.getServerById(
            _guildId,
          ))?.threadChannelsActive,
          isFalse,
        );
      },
    );

    test(
      'a cold start READY without threads purges stored thread data',
      () async {
        final _Harness h = _build();
        await _ready(h.handler, withThreads: true);
        await h.database.messageDao.upsertMessage(
          MessagesCompanion.insert(
            id: '9001',
            channelId: _threadId,
            authorId: '300',
            content: 'in thread',
            timestamp: DateTime.utc(2026, 9, 27),
          ),
        );

        final GatewayEventHandler restarted = GatewayEventHandler(
          database: h.database,
          currentUserId: '100',
        );
        await _ready(restarted, withThreads: false);

        expect(await h.database.channelDao.getChannelById(_threadId), isNull);
        expect(await h.database.channelDao.getChannelById(_forumId), isNull);
        expect(await h.database.channelDao.getChannelById(_textId), isNotNull);
        expect(await h.database.threadDao.getJoinedThreadIds(), isEmpty);
        expect(await h.database.messageDao.getMessage('9001'), isNull);
        expect(
          (await h.database.guildDao.getServerById(
            _guildId,
          ))?.threadChannelsActive,
          isFalse,
        );
      },
    );

    test(
      'a reconnect READY with the guild unavailable keeps thread data',
      () async {
        final _Harness h = _build();
        await _ready(h.handler, withThreads: true);

        await _ready(
          h.handler,
          withThreads: false,
          sessionId: 'session-2',
          unavailable: true,
        );

        expect(
          await h.database.channelDao.getChannelById(_threadId),
          isNotNull,
        );
        expect(await h.database.channelDao.getChannelById(_forumId), isNotNull);
      },
    );

    test(
      'GUILD_CREATE without threads after an unavailable READY purges stored thread data',
      () async {
        final _Harness h = _build();
        await _ready(h.handler, withThreads: true);
        await _ready(
          h.handler,
          withThreads: false,
          sessionId: 'session-2',
          unavailable: true,
        );

        await _guildCreate(h.handler, withThreads: false);

        expect(h.gate.isActive(_guildId), isFalse);
        expect(await h.database.channelDao.getChannelById(_threadId), isNull);
        expect(await h.database.channelDao.getChannelById(_forumId), isNull);
        expect(await h.database.channelDao.getChannelById(_textId), isNotNull);
        expect(await h.database.threadDao.getJoinedThreadIds(), isEmpty);
        expect(await h.database.threadDao.getMember(_threadId), isNull);
        expect(
          (await h.database.guildDao.getServerById(
            _guildId,
          ))?.threadChannelsActive,
          isFalse,
        );
      },
    );

    test(
      'a new connection purges thread data persisted by an earlier one',
      () async {
        final _Harness h = _build();
        await _ready(h.handler, withThreads: true);
        final ThreadsGate gate = ThreadsGate();
        final GatewayEventHandler next = GatewayEventHandler(
          database: h.database,
          currentUserId: '100',
          threadsGate: gate,
        );
        await _ready(
          next,
          withThreads: false,
          sessionId: 'session-2',
          unavailable: true,
        );

        await _guildCreate(next, withThreads: false);

        expect(gate.isActive(_guildId), isFalse);
        expect(await h.database.channelDao.getChannelById(_threadId), isNull);
        expect(await h.database.channelDao.getChannelById(_forumId), isNull);
        expect(await h.database.threadDao.getMember(_threadId), isNull);
      },
    );

    test(
      'GUILD_CREATE without a prior READY purges from the stored column',
      () async {
        final _Harness h = _build();
        await _ready(h.handler, withThreads: true);
        final GatewayEventHandler next = GatewayEventHandler(
          database: h.database,
          currentUserId: '100',
          threadsGate: ThreadsGate(),
        );

        await _guildCreate(next, withThreads: false);

        expect(await h.database.channelDao.getChannelById(_threadId), isNull);
        expect(await h.database.channelDao.getChannelById(_forumId), isNull);
      },
    );
  });
}

UserPrivateResponse _user() => UserPrivateResponse.fromJson({
  'id': '100',
  'username': 'tester',
  'discriminator': '0001',
  'global_name': null,
  'avatar': null,
  'avatar_color': null,
  'bot': false,
  'system': false,
  'flags': 0,
  'is_staff': false,
  'acls': <String>[],
  'traits': <String>[],
  'email': null,
  'phone': null,
  'bio': null,
  'pronouns': null,
  'accent_color': null,
  'banner': null,
  'banner_color': null,
  'mfa_enabled': false,
  'verified': true,
  'has_verified_phone': false,
  'premium_type': null,
  'premium_since': null,
  'premium_until': null,
  'premium_will_cancel': false,
  'premium_billing_cycle': null,
  'premium_lifetime_sequence': null,
  'premium_badge_hidden': false,
  'premium_badge_masked': false,
  'premium_badge_timestamp_hidden': false,
  'premium_badge_sequence_hidden': false,
  'premium_purchase_disabled': false,
  'premium_enabled_override': false,
  'premium_discriminator': false,
  'premium_perks_disabled': false,
  'password_last_changed_at': null,
  'required_actions': <String>[],
  'nsfw_allowed': true,
  'has_dismissed_premium_onboarding': false,
  'has_ever_purchased': false,
  'has_unread_gift_inventory': false,
  'unread_gift_inventory_count': 0,
  'used_mobile_client': true,
  'pending_bulk_message_deletion': null,
});
