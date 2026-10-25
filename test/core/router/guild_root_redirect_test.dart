import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/route_names.dart';

import '../../helpers/open_test_database.dart';

void main() {
  late FluxerDatabase db;

  setUp(() {
    db = openTestDatabase();
  });

  Future<void> addChannel(
    String id,
    String guildId, {
    int type = 0,
    int position = 0,
    String? parentId,
    String? permissionOverwritesJson,
  }) async {
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: id,
        guildId: guildId,
        name: id,
        type: Value(type),
        position: Value(position),
        parentId: Value(parentId),
        permissionOverwritesJson: Value(permissionOverwritesJson),
      ),
    );
  }

  Future<void> addMemberGuild(String guildId, String userId) async {
    await db.guildDao.upsertServer(
      ServersCompanion.insert(
        id: guildId,
        name: guildId,
        ownerId: const Value('owner'),
      ),
    );
    await db.roleDao.upsertRoles([
      RolesCompanion.insert(
        id: guildId,
        guildId: guildId,
        name: '@everyone',
        permissions: Value(Permission.viewChannel.value.toString()),
      ),
    ]);
    await db.memberDao.upsertMember(
      MembersCompanion.insert(userId: userId, guildId: guildId),
    );
  }

  String denyEveryoneView(String guildId) => jsonEncode(<Object?>[
    <String, Object?>{
      'id': guildId,
      'type': 0,
      'allow': '0',
      'deny': '${Permission.viewChannel.value}',
    },
  ]);

  group('resolveGuildMinimizeVoiceRedirect', () {
    const guildId = 'guild-1';

    test('restores persisted text channel while in voice', () async {
      await addChannel('general', guildId);
      await addChannel('voice', guildId, type: 2, position: 1);
      await db.guildLastChannelDao.setLastChannel(guildId, 'general');

      final result = await resolveGuildMinimizeVoiceRedirect(
        guildId: guildId,
        db: db,
        currentUserId: null,
        excludeChannelId: 'voice',
      );

      expect(result, RoutePaths.guildChannel(guildId, 'general'));
    });

    test(
      'falls back to first text channel when only voice is persisted',
      () async {
        await addChannel('general', guildId);
        await addChannel('voice', guildId, type: 2, position: 1);
        await db.guildLastChannelDao.setLastChannel(guildId, 'voice');

        final result = await resolveGuildMinimizeVoiceRedirect(
          guildId: guildId,
          db: db,
          currentUserId: null,
          excludeChannelId: 'voice',
        );

        expect(result, RoutePaths.guildChannel(guildId, 'general'));
      },
    );

    test(
      'uses remembered text channel when it is not the active voice channel',
      () async {
        await addChannel('general', guildId);
        await addChannel('other', guildId, position: 1);
        await db.guildLastChannelDao.setLastChannel(guildId, 'other');

        final result = await resolveGuildMinimizeVoiceRedirect(
          guildId: guildId,
          db: db,
          currentUserId: null,
          excludeChannelId: 'voice',
        );

        expect(result, RoutePaths.guildChannel(guildId, 'other'));
      },
    );

    test(
      'uses recent text channel visits when last persisted channel is voice',
      () async {
        await addChannel('top', guildId);
        await addChannel('general', guildId, position: 1);
        await addChannel('voice', guildId, type: 2, position: 2);
        await db.guildLastChannelDao.setLastChannel(guildId, 'voice');

        final result = await resolveGuildMinimizeVoiceRedirect(
          guildId: guildId,
          db: db,
          currentUserId: null,
          excludeChannelId: 'voice',
          recentChannelIdsInGuild: const <String>['voice', 'general'],
        );

        expect(result, RoutePaths.guildChannel(guildId, 'general'));
      },
    );
  });

  group('resolveGuildRootRedirect', () {
    const guildId = 'guild-1';

    test('restores the remembered channel', () async {
      await addChannel('chan-1', guildId);
      await db.guildLastChannelDao.setLastChannel(guildId, 'chan-1');

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        db: db,
        currentUserId: null,
      );

      expect(result, RoutePaths.guildChannel(guildId, 'chan-1'));
    });

    test(
      'skips invalid remembered channels and picks first eligible',
      () async {
        await addChannel('category', guildId, type: 4);
        await addChannel('text', guildId, position: 1);
        await db.guildLastChannelDao.setLastChannel(guildId, 'missing');

        final result = await resolveGuildRootRedirect(
          guildId: guildId,
          fullPath: RoutePaths.guild(guildId),
          db: db,
          currentUserId: null,
        );

        expect(result, RoutePaths.guildChannel(guildId, 'text'));
      },
    );

    test('picks first eligible channel by position', () async {
      await addChannel('category', guildId, type: 4);
      await addChannel('text', guildId, position: 1);

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        db: db,
        currentUserId: null,
      );

      expect(result, RoutePaths.guildChannel(guildId, 'text'));
    });

    test('falls back when the remembered channel was deleted', () async {
      await addChannel('general', guildId);
      await addChannel('chat', guildId, position: 1);
      await db.guildLastChannelDao.setLastChannel(guildId, 'chat');
      await db.channelDao.deleteChannel('chat');

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        db: db,
        currentUserId: null,
      );

      expect(result, RoutePaths.guildChannel(guildId, 'general'));
    });

    test(
      'falls back when the remembered channel is no longer readable',
      () async {
        await addMemberGuild(guildId, 'me');
        await addChannel('general', guildId);
        await addChannel(
          'staff',
          guildId,
          position: 1,
          permissionOverwritesJson: denyEveryoneView(guildId),
        );
        await db.guildLastChannelDao.setLastChannel(guildId, 'staff');

        final result = await resolveGuildRootRedirect(
          guildId: guildId,
          fullPath: RoutePaths.guild(guildId),
          db: db,
          currentUserId: 'me',
        );

        expect(result, RoutePaths.guildChannel(guildId, 'general'));
      },
    );

    test('defaults to the first readable text channel in list order', () async {
      await addMemberGuild(guildId, 'me');
      await addChannel('voice', guildId, type: 2);
      await addChannel('category', guildId, type: 4, position: 1);
      await addChannel(
        'hidden',
        guildId,
        position: 2,
        permissionOverwritesJson: denyEveryoneView(guildId),
      );
      await addChannel('in-category', guildId, parentId: 'category');
      await addChannel('top-level', guildId, position: 5);

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        db: db,
        currentUserId: 'me',
      );

      expect(result, RoutePaths.guildChannel(guildId, 'top-level'));
    });

    test('null guildId redirects to me', () async {
      final result = await resolveGuildRootRedirect(
        guildId: null,
        fullPath: '/channels',
        db: db,
        currentUserId: null,
      );

      expect(result, RoutePaths.me);
    });

    test('child route returns null', () async {
      await addChannel('chan-1', guildId);
      await db.guildLastChannelDao.setLastChannel(guildId, 'chan-1');

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guildChannel(guildId, 'chan-1'),
        db: db,
        currentUserId: null,
      );

      expect(result, isNull);
    });

    test('returns null when guild has no restorable channels', () async {
      await addChannel('category', guildId, type: 4);

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        db: db,
        currentUserId: null,
      );

      expect(result, isNull);
    });
  });

  group('shouldStayOnGuildChannelList', () {
    const guildId = 'guild-1';
    test('is true for list query', () {
      expect(
        shouldStayOnGuildChannelList(
          uri: Uri.parse(RoutePaths.guildChannelList(guildId)),
        ),
        isTrue,
      );
    });

    test('is true for extra', () {
      expect(
        shouldStayOnGuildChannelList(
          uri: Uri.parse(RoutePaths.guild(guildId)),
          extra: kGuildRootStayOnListExtra,
        ),
        isTrue,
      );
    });

    test('is false for a plain guild root', () {
      expect(
        shouldStayOnGuildChannelList(uri: Uri.parse(RoutePaths.guild(guildId))),
        isFalse,
      );
    });
  });

  group('resolveFavoritesRootRedirect', () {
    Future<void> addFavorite(
      String channelId, {
      String? guildId,
      int position = 0,
    }) async {
      await db.favoriteChannelsDao.addChannel(
        channelId: channelId,
        guildId: guildId,
        position: position,
      );
    }

    test('restores the remembered favorite', () async {
      await addFavorite('fav-1');
      await addFavorite('fav-2', position: 1);
      await db.guildLastChannelDao.setLastChannel(
        kFavoritesLastChannelKey,
        'fav-2',
      );

      final result = await resolveFavoritesRootRedirect(
        fullPath: RoutePaths.favoritesBase,
        db: db,
      );

      expect(result, RoutePaths.favoritesChannel('fav-2'));
    });

    test('skips removed favorites and picks first eligible', () async {
      await addFavorite('fav-1', guildId: 'g1');
      await addFavorite('fav-2', position: 1);
      await db.guildLastChannelDao.setLastChannel(
        kFavoritesLastChannelKey,
        'missing',
      );

      final result = await resolveFavoritesRootRedirect(
        fullPath: RoutePaths.favoritesBase,
        db: db,
      );

      expect(result, RoutePaths.favoritesChannel('fav-1'));
    });

    test('returns null when favorites are empty', () async {
      final result = await resolveFavoritesRootRedirect(
        fullPath: RoutePaths.favoritesBase,
        db: db,
      );

      expect(result, isNull);
    });

    test('child route returns null', () async {
      await addFavorite('fav-1');
      await db.guildLastChannelDao.setLastChannel(
        kFavoritesLastChannelKey,
        'fav-1',
      );

      final result = await resolveFavoritesRootRedirect(
        fullPath: RoutePaths.favoritesChannel('fav-1'),
        db: db,
      );

      expect(result, isNull);
    });
  });

  group('resolveDmRootRedirect', () {
    Future<void> addDm(String id) async {
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: id,
          recipientId: 'user-$id',
          type: const Value(1),
        ),
      ]);
    }

    test('restores the remembered dm', () async {
      await addDm('dm-1');
      await db.guildLastChannelDao.setLastChannel(kDmLastChannelKey, 'dm-1');

      final result = await resolveDmRootRedirect(
        fullPath: RoutePaths.me,
        db: db,
      );

      expect(result, RoutePaths.dmChannel('dm-1'));
    });

    test('child route returns null', () async {
      await addDm('dm-1');
      final result = await resolveDmRootRedirect(
        fullPath: RoutePaths.dmChannel('dm-1'),
        db: db,
      );
      expect(result, isNull);
    });
  });

  group('persistGuildChannelFromLocation', () {
    test('saves guild channel paths', () async {
      await addChannel('chan-1', 'guild-1');
      persistGuildChannelFromLocation(db, '/channels/guild-1/chan-1');
      await pumpEventQueue();
      expect(await db.guildLastChannelDao.getLastChannel('guild-1'), 'chan-1');
    });

    test('does not persist voice channels as the guild last channel', () async {
      await addChannel('text', 'guild-1');
      await addChannel('voice', 'guild-1', type: 2);
      persistGuildChannelFromLocation(db, '/channels/guild-1/text');
      await pumpEventQueue();
      persistGuildChannelFromLocation(db, '/channels/guild-1/voice');
      await pumpEventQueue();
      expect(await db.guildLastChannelDao.getLastChannel('guild-1'), 'text');
    });

    test('saves favorites channel paths', () async {
      persistGuildChannelFromLocation(db, '/channels/@favorites/fav-1');
      expect(
        await db.guildLastChannelDao.getLastChannel(kFavoritesLastChannelKey),
        'fav-1',
      );
    });

    test('saves dm channel paths', () async {
      persistGuildChannelFromLocation(db, '/channels/@me/dm-1');
      expect(
        await db.guildLastChannelDao.getLastChannel(kDmLastChannelKey),
        'dm-1',
      );
    });

    test('ignores message jumps for guild and favorites', () async {
      persistGuildChannelFromLocation(db, '/channels/guild-1/chan-1/msg-1');
      persistGuildChannelFromLocation(db, '/channels/@favorites/fav-1/msg-1');
      expect(await db.guildLastChannelDao.getLastChannel('guild-1'), isNull);
      expect(
        await db.guildLastChannelDao.getLastChannel(kFavoritesLastChannelKey),
        isNull,
      );
    });
  });
}
