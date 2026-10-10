import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/features/notifications/providers/mention_filters_provider.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

String _snowflakeForUtc(DateTime utc) {
  return ((utc.millisecondsSinceEpoch - 1420070400000) << 22).toString();
}

MessageResponseSchema _message({
  required String id,
  bool mentionEveryone = false,
  List<String> mentionRoles = const [],
  List<UserPartialResponse> mentions = const [],
}) => MessageResponseSchema(
  id: id,
  channelId: 'channel-1',
  author: _user('other'),
  type: MessageType.valueDefault,
  flags: 0,
  content: 'hello',
  timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
  pinned: false,
  mentionEveryone: mentionEveryone,
  tts: false,
  mentions: mentions,
  mentionRoles: mentionRoles,
);

UserPartialResponse _user(String id) => UserPartialResponse(
  id: id,
  username: 'user-$id',
  discriminator: '0001',
  globalName: null,
  avatar: null,
  avatarColor: null,
  flags: 0,
);

Future<List<String>> _feedAfter(
  MentionFilters filters,
  MessageResponseSchema message,
) async {
  final FluxerDatabase db = openTestDatabase();
  await db.channelDao.upsertChannel(
    ChannelsCompanion.insert(
      id: 'channel-1',
      guildId: 'guild-1',
      name: 'general',
    ),
  );
  await db.memberDao.upsertMember(
    MembersCompanion.insert(
      userId: 'me',
      guildId: 'guild-1',
      roleIdsJson: const Value('["role-1"]'),
    ),
  );
  final GatewayEventHandler handler = GatewayEventHandler(
    database: db,
    currentUserId: 'me',
    resolveMentionFilters: () => filters,
  );
  await handler.handle(MessageCreateEvent(message: message));
  expect((await db.readStateDao.getReadState('channel-1'))?.mentionCount, 1);
  return <String>[
    for (final NotificationMentionFeedData row
        in await db.notificationDao.getMentionFeedOrdered())
      row.messageId,
  ];
}

void main() {
  final String id = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));

  test('role mention stays out of the feed when roles are filtered', () async {
    expect(
      await _feedAfter(
        const MentionFilters(includeRoles: false),
        _message(id: id, mentionRoles: const ['role-1']),
      ),
      isEmpty,
    );
  });

  test('everyone mention stays out when everyone is filtered', () async {
    expect(
      await _feedAfter(
        const MentionFilters(includeEveryone: false),
        _message(id: id, mentionEveryone: true),
      ),
      isEmpty,
    );
  });

  test('guild mention stays out when guilds are filtered', () async {
    expect(
      await _feedAfter(
        const MentionFilters(includeGuilds: false),
        _message(id: id, mentions: <UserPartialResponse>[_user('me')]),
      ),
      isEmpty,
    );
  });

  test('direct mention is kept when only roles are filtered', () async {
    expect(
      await _feedAfter(
        const MentionFilters(includeRoles: false),
        _message(id: id, mentions: <UserPartialResponse>[_user('me')]),
      ),
      <String>[id],
    );
  });
}
