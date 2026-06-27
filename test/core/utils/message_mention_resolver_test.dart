import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  Future<FluxerDatabase> seededGuildDb({
    bool suppressEveryone = false,
    bool suppressRoles = false,
    List<String> memberRoles = const ['role-1'],
    List<String> blockedUserIds = const [],
  }) async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
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

    test('own author never mentions, even with @everyone and a role', () {
      expect(
        messageMentionsUser(
          ctx,
          authorId: 'me',
          mentionedUserIds: const ['me'],
          mentionEveryone: true,
          mentionRoleIds: const ['role-1'],
        ),
        isFalse,
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
      addTearDown(db.close);
      expect(await resolve(db, mentionRoleIds: const ['role-1']), isTrue);
    });

    test('role mention is suppressed by suppressRoles', () async {
      final db = await seededGuildDb(suppressRoles: true);
      addTearDown(db.close);
      expect(await resolve(db, mentionRoleIds: const ['role-1']), isFalse);
    });

    test('role mention without the role is not a mention', () async {
      final db = await seededGuildDb(memberRoles: const ['role-2']);
      addTearDown(db.close);
      expect(await resolve(db, mentionRoleIds: const ['role-1']), isFalse);
    });

    test('@everyone mentions when not suppressed', () async {
      final db = await seededGuildDb();
      addTearDown(db.close);
      expect(await resolve(db, mentionEveryone: true), isTrue);
    });

    test('@everyone is suppressed by suppressEveryone', () async {
      final db = await seededGuildDb(suppressEveryone: true);
      addTearDown(db.close);
      expect(await resolve(db, mentionEveryone: true), isFalse);
    });

    test('blocked author suppresses an @everyone mention', () async {
      final db = await seededGuildDb(blockedUserIds: const ['other']);
      addTearDown(db.close);
      expect(await resolve(db, mentionEveryone: true), isFalse);
    });

    test('direct mention is a mention even without a role match', () async {
      final db = await seededGuildDb(memberRoles: const ['role-2']);
      addTearDown(db.close);
      expect(await resolve(db, mentionedUserIds: const ['me']), isTrue);
    });

    test('missing channel (DM) falls back to @everyone passthrough', () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
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
}
