import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/daos/favorite_channels_dao.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/favorites/data/favorite_channels_repository.dart';
import 'package:fluxer_app/features/favorites/data/favorites_sync_service.dart';

void main() {
  late FluxerDatabase database;
  late ProviderContainer container;
  late FavoriteChannelsRepository repository;

  setUp(() {
    database = FluxerDatabase.forTesting(NativeDatabase.memory());
    container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(database)],
    );
    repository = FavoriteChannelsRepository(
      database,
      container.read(favoritesSyncServiceProvider),
    );
  });

  tearDown(() async {
    container.dispose();
    await database.close();
  });

  test('addChannel persists channel metadata and ignores duplicates', () async {
    expect(
      await repository.addChannel(
        channelId: 'channel-1',
        guildId: 'guild-1',
        nickname: '  General  ',
      ),
      isTrue,
    );
    expect(
      await repository.addChannel(channelId: 'channel-1', guildId: 'guild-1'),
      isFalse,
    );

    final favorite = await database.favoriteChannelsDao.getChannel('channel-1');
    expect(favorite, isNotNull);
    expect(favorite!.guildId, 'guild-1');
    expect(favorite.nickname, 'General');
    expect(favorite.position, 0);
  });

  test('removeChannel compacts remaining positions', () async {
    await repository.addChannel(channelId: 'channel-1');
    await repository.addChannel(channelId: 'channel-2');
    await repository.addChannel(channelId: 'channel-3');

    expect(await repository.removeChannel('channel-2'), isTrue);

    final favorites = await database.favoriteChannelsDao.watchChannels().first;
    expect(favorites.map((favorite) => favorite.channelId), [
      'channel-1',
      'channel-3',
    ]);
    expect(favorites.map((favorite) => favorite.position), [0, 1]);
  });

  test('moveChannel can move channels into categories', () async {
    await repository.addCategory(id: 'category-1', name: 'Important');
    await repository.addChannel(channelId: 'channel-1');
    await repository.addChannel(channelId: 'channel-2');

    await repository.moveChannel(
      channelId: 'channel-2',
      parentId: 'category-1',
      position: 0,
    );

    final channel1 = await database.favoriteChannelsDao.getChannel('channel-1');
    final channel2 = await database.favoriteChannelsDao.getChannel('channel-2');

    expect(channel1!.parentId, isNull);
    expect(channel1.position, 0);
    expect(channel2!.parentId, 'category-1');
    expect(channel2.position, 0);
  });

  test(
    'removeCategory moves child channels back to root and compacts',
    () async {
      await repository.addCategory(id: 'category-1', name: 'Important');
      await repository.addChannel(channelId: 'channel-1');
      await repository.addChannel(
        channelId: 'channel-2',
        parentId: 'category-1',
      );

      expect(await repository.removeCategory('category-1'), isTrue);

      final favorites = await database.favoriteChannelsDao
          .watchChannels()
          .first;
      expect(favorites.map((favorite) => favorite.parentId), [null, null]);
      expect(favorites.map((favorite) => favorite.position), [0, 1]);
    },
  );

  test('settings persist collapsed categories and mute flags', () async {
    await repository.setCollapsedCategoryIds([
      'category-1',
      ' category-1 ',
      '',
      'category-2',
    ]);
    await repository.setHideMuted(value: true);
    await repository.setMuted(value: true);

    final settings = await database.favoriteChannelsDao.getSettings();

    expect(favoriteSettingsCollapsedCategoryIds(settings), [
      'category-1',
      'category-2',
    ]);
    expect(settings.hideMuted, isTrue);
    expect(settings.muted, isTrue);
  });
}
