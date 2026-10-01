import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/favorites/domain/resolved_favorite_entry.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channel_groups_provider.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  test('resolveFavoriteEntries hides inaccessible favourites', () {
    final entries = resolveFavoriteEntries(
      favorites: const [
        db.FavoriteChannel(channelId: 'alive', guildId: 'g1', position: 0),
        db.FavoriteChannel(channelId: 'deleted', guildId: 'g1', position: 1),
      ],
      channelById: const {
        'alive': Channel(id: 'alive', guildId: 'g1', name: 'general'),
      },
      dmById: const {},
      guildById: const {},
    );

    expect(entries.map((e) => e.channelId).toList(), ['alive']);
  });

  test('resolveFavoriteEntries treats @me favorites as direct messages', () {
    final entries = resolveFavoriteEntries(
      favorites: const [
        db.FavoriteChannel(channelId: 'dm-1', guildId: '@me', position: 0),
      ],
      channelById: const {},
      dmById: {
        'dm-1': DmConversation(
          id: 'dm-1',
          type: ChannelType.dm.wireValue,
          recipientId: 'user-1',
          recipientName: 'Alex',
          lastMessage: '',
          lastMessageTime: DateTime(2020),
        ),
      },
      guildById: const {},
    );

    expect(entries, hasLength(1));
    expect(entries.single.guildId, isNull);
    expect(entries.single.dm?.id, 'dm-1');
  });

  group('favoriteResolvedEntriesProvider', () {
    late db.FluxerDatabase database;
    late ProviderContainer container;
    late List<List<ResolvedFavoriteEntry>> resolutions;
    late StreamController<void> resolved;

    setUp(() async {
      database = openTestDatabase();
      await database.channelDao.upsertChannels(<db.ChannelsCompanion>[
        db.ChannelsCompanion.insert(id: 'fav', guildId: 'g1', name: 'general'),
        db.ChannelsCompanion.insert(id: 'other', guildId: 'g1', name: 'off'),
      ]);
      container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(database),
          favoriteChannelsProvider.overrideWith(
            (Ref ref) => Stream.value(const <db.FavoriteChannel>[
              db.FavoriteChannel(channelId: 'fav', guildId: 'g1', position: 0),
            ]),
          ),
          dmViewModelProvider.overrideWithValue(
            const DmViewState(
              conversations: <DmConversation>[],
              friendsList: [],
              activeTab: FriendsTab.online,
              searchQuery: '',
            ),
          ),
          guildListViewModelProvider.overrideWith(_EmptyGuildListViewModel.new),
        ],
      );
      addTearDown(container.dispose);
      resolutions = <List<ResolvedFavoriteEntry>>[];
      resolved = StreamController<void>.broadcast();
      addTearDown(resolved.close);
      container.listen<List<ResolvedFavoriteEntry>>(
        favoriteResolvedEntriesProvider,
        (_, List<ResolvedFavoriteEntry> next) {
          resolutions.add(next);
          resolved.add(null);
        },
        fireImmediately: true,
      );
    });

    Future<void> waitForFavoriteNamed(String name) async {
      while (resolutions.isEmpty ||
          resolutions.last.singleOrNull?.channel?.name != name) {
        await resolved.stream.first;
      }
    }

    test(
      'a lastMessageId-only write does not re-resolve favorite entries (#713)',
      () async {
        await waitForFavoriteNamed('general');
        final int before = resolutions.length;

        final Future<void> pointerSeen = database.channelDao
            .watchChannelsByIds(<String>['fav'])
            .firstWhere(
              (List<db.Channel> rows) => rows.single.lastMessageId == '200',
            );
        await database.channelDao.updateLastMessageId('fav', '200');
        await database.channelDao.updateLastMessageId('other', '300');
        await pointerSeen;
        container.read(favoriteResolvedEntriesProvider);

        expect(resolutions, hasLength(before));
      },
    );

    test(
      'renaming a favorited channel still updates its favorite entry',
      () async {
        await waitForFavoriteNamed('general');

        await database.channelDao.upsertChannel(
          db.ChannelsCompanion.insert(
            id: 'fav',
            guildId: 'g1',
            name: 'renamed',
          ),
        );
        await waitForFavoriteNamed('renamed');

        expect(resolutions.last.single.channelId, 'fav');
      },
    );
  });
}

class _EmptyGuildListViewModel extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(guilds: <Guild>[]);
}
