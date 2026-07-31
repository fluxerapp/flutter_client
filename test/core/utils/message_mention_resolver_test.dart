import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';

void main() {
  Future<FluxerDatabase> seededGuildDb({
    bool suppressEveryone = false,
    bool suppressRoles = false,
    List<String> memberRoles = const ['role-1'],
    List<String> blockedUserIds = const [],
  }) async {
    final db = openTestDatabase();
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
        roleIdsJson: Value(jsonEncode(memberRoles)),
      ),
    );
    if (suppressEveryone || suppressRoles) {
      await db.userGuildSettingsDao.upsert(
        UserGuildSettingsTableCompanion.insert(
          guildId: 'guild-1',
          data: jsonEncode(
            UserGuildSettingsResponse(
              guildId: 'guild-1',
              messageNotifications: UserNotificationSettings.inherit,
              muted: false,
              muteConfig: null,
              mobilePush: true,
              suppressEveryone: suppressEveryone,
              suppressRoles: suppressRoles,
              hideMutedChannels: false,
              channelOverrides: const {},
              version: 1,
            ).toJson(),
          ),
        ),
      );
    }
    if (blockedUserIds.isNotEmpty) {
      await db.relationshipDao.upsertRelationships([
        for (final id in blockedUserIds)
          RelationshipsCompanion.insert(userId: id, type: 2),
      ]);
    }
    return db;
  }

  Future<bool> resolve(
    FluxerDatabase db, {
    String authorId = 'other',
    List<String> mentionedUserIds = const [],
    bool mentionEveryone = false,
    List<String> mentionRoleIds = const [],
    String? currentUserId = 'me',
    String channelId = 'channel-1',
  }) => resolveMessageMentionsUser(
    db,
    currentUserId: currentUserId,
    channelId: channelId,
    authorId: authorId,
    mentionedUserIds: mentionedUserIds,
    mentionEveryone: mentionEveryone,
    mentionRoleIds: mentionRoleIds,
  );

  group('messageMentionsUser (pure)', () {
    const ctx = MessageMentionContext(
      currentUserId: 'me',
      blockedUserIds: {'blocked'},
      channelExists: true,
      suppressEveryone: false,
      suppressRoles: false,
      currentUserRoleIds: {'role-1'},
    );

    test('own author direct mention highlights', () {
      expect(
        messageMentionsUser(
          ctx,
          authorId: 'me',
          mentionedUserIds: const ['me'],
          mentionEveryone: false,
          mentionRoleIds: const [],
        ),
        isTrue,
      );
    });

    test('own author role mention highlights', () {
      expect(
        messageMentionsUser(
          ctx,
          authorId: 'me',
          mentionedUserIds: const [],
          mentionEveryone: false,
          mentionRoleIds: const ['role-1'],
        ),
        isTrue,
      );
    });

    test('own author @everyone highlights when not suppressed', () {
      expect(
        messageMentionsUser(
          ctx,
          authorId: 'me',
          mentionedUserIds: const [],
          mentionEveryone: true,
          mentionRoleIds: const [],
        ),
        isTrue,
      );
    });

    test('blocked author never mentions', () {
      expect(
        messageMentionsUser(
          ctx,
          authorId: 'blocked',
          mentionedUserIds: const ['me'],
          mentionEveryone: true,
          mentionRoleIds: const ['role-1'],
        ),
        isFalse,
      );
    });

    test('direct mention wins regardless of roles', () {
      expect(
        messageMentionsUser(
          ctx,
          authorId: 'other',
          mentionedUserIds: const ['me'],
          mentionEveryone: false,
          mentionRoleIds: const [],
        ),
        isTrue,
      );
    });
  });

  group('resolveMessageMentionsUser (db-backed)', () {
    test('role mention with a matching, unsuppressed role mentions', () async {
      final db = await seededGuildDb();
      expect(await resolve(db, mentionRoleIds: const ['role-1']), isTrue);
    });

    test('role mention is suppressed by suppressRoles', () async {
      final db = await seededGuildDb(suppressRoles: true);
      expect(await resolve(db, mentionRoleIds: const ['role-1']), isFalse);
    });

    test('role mention without the role is not a mention', () async {
      final db = await seededGuildDb(memberRoles: const ['role-2']);
      expect(await resolve(db, mentionRoleIds: const ['role-1']), isFalse);
    });

    test('@everyone mentions when not suppressed', () async {
      final db = await seededGuildDb();
      expect(await resolve(db, mentionEveryone: true), isTrue);
    });

    test('@everyone is suppressed by suppressEveryone', () async {
      final db = await seededGuildDb(suppressEveryone: true);
      expect(await resolve(db, mentionEveryone: true), isFalse);
    });

    test('blocked author suppresses an @everyone mention', () async {
      final db = await seededGuildDb(blockedUserIds: const ['other']);
      expect(await resolve(db, mentionEveryone: true), isFalse);
    });

    test('direct mention is a mention even without a role match', () async {
      final db = await seededGuildDb(memberRoles: const ['role-2']);
      expect(await resolve(db, mentionedUserIds: const ['me']), isTrue);
    });

    test('own author direct mention highlights', () async {
      final db = await seededGuildDb();
      expect(
        await resolve(db, authorId: 'me', mentionedUserIds: const ['me']),
        isTrue,
      );
    });

    test('own author role mention highlights', () async {
      final db = await seededGuildDb();
      expect(
        await resolve(db, authorId: 'me', mentionRoleIds: const ['role-1']),
        isTrue,
      );
    });

    test('missing channel (DM) falls back to @everyone passthrough', () async {
      final db = openTestDatabase();
      expect(
        await resolve(db, channelId: 'dm-1', mentionEveryone: true),
        isTrue,
      );
      expect(
        await resolve(db, channelId: 'dm-1', mentionRoleIds: const ['role-1']),
        isFalse,
      );
    });
  });

  group('mergeMentionHighlightFlag', () {
    Message message({
      bool isMentioned = false,
      List<String> mentionedUserIds = const [],
    }) {
      return Message(
        id: 'message-1',
        channelId: 'channel-1',
        authorId: 'me',
        authorName: 'Me',
        content: 'hello',
        timestamp: DateTime.utc(2026, 5),
        isMentioned: isMentioned,
        mentionedUserIds: mentionedUserIds,
      );
    }

    test('keeps mention highlight from the previous row', () {
      final Message merged = mergeMentionHighlightFlag(
        incoming: message(),
        previous: message(isMentioned: true),
        currentUserId: 'me',
      );
      expect(merged.isMentioned, isTrue);
    });

    test('promotes direct self mentions from mentionedUserIds', () {
      final Message merged = mergeMentionHighlightFlag(
        incoming: message(mentionedUserIds: const ['me']),
        currentUserId: 'me',
      );
      expect(merged.isMentioned, isTrue);
    });

    test('batch merge leaves already-mentioned rows unchanged', () {
      final Message original = message(
        isMentioned: true,
        mentionedUserIds: const ['me'],
      );
      final List<Message> merged = mergeMentionHighlightFlags(<Message>[
        original,
      ], currentUserId: 'me');
      expect(identical(merged.single, original), isTrue);
    });
  });
}
