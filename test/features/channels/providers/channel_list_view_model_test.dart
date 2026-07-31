import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:riverpod/src/framework.dart' show Override;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('restores cached categories when switching back to a guild', () async {
    final Map<String, StreamController<List<Channel>>> controllers =
        <String, StreamController<List<Channel>>>{};
    final Map<String, StreamController<Guild?>> guildControllers =
        <String, StreamController<Guild?>>{};
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        channelRepositoryProvider.overrideWithValue(
          _FakeChannelRepository(controllers),
        ),
        guildRepositoryProvider.overrideWithValue(
          _FakeGuildRepository(guildControllers),
        ),
        channelPermissionCacheProvider.overrideWithValue(
          ChannelPermissionCaches(
            effective: <String, int>{'c1': Permission.viewChannel.value},
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    final ChannelListViewModel notifier = container.read(
      channelListViewModelProvider.notifier,
    );
    const Guild guildA = Guild(id: 'guild-a', name: 'Guild A');
    const Guild guildB = Guild(id: 'guild-b', name: 'Guild B');
    final List<Channel> channelsA = <Channel>[
      const Channel(id: 'c1', guildId: 'guild-a', name: 'general'),
    ];
    final StreamController<List<Channel>> controllerA =
        StreamController<List<Channel>>.broadcast();
    addTearDown(controllerA.close);
    controllers['guild-a'] = controllerA;

    notifier.loadChannels('guild-a', guild: guildA);
    controllerA.add(channelsA);
    await Future<void>.delayed(Duration.zero);

    expect(container.read(channelListViewModelProvider).categories, isNotEmpty);
    expect(
      container
          .read(channelListViewModelProvider)
          .categories
          .first
          .channels
          .first
          .name,
      'general',
    );

    final StreamController<List<Channel>> controllerB =
        StreamController<List<Channel>>.broadcast();
    addTearDown(controllerB.close);
    controllers['guild-b'] = controllerB;
    notifier.loadChannels('guild-b', guild: guildB);

    expect(container.read(channelListViewModelProvider).categories, isEmpty);

    notifier.loadChannels('guild-a', guild: guildA);

    expect(container.read(channelListViewModelProvider).categories, isNotEmpty);
    expect(
      container
          .read(channelListViewModelProvider)
          .categories
          .first
          .channels
          .first
          .name,
      'general',
    );
  });

  test('updates guild when watched server changes', () async {
    final Map<String, StreamController<List<Channel>>> channelControllers =
        <String, StreamController<List<Channel>>>{};
    final Map<String, StreamController<Guild?>> guildControllers =
        <String, StreamController<Guild?>>{};
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        channelRepositoryProvider.overrideWithValue(
          _FakeChannelRepository(channelControllers),
        ),
        guildRepositoryProvider.overrideWithValue(
          _FakeGuildRepository(guildControllers),
        ),
        channelPermissionCacheProvider.overrideWithValue(
          const ChannelPermissionCaches(),
        ),
      ],
    );
    addTearDown(container.dispose);

    final ChannelListViewModel notifier = container.read(
      channelListViewModelProvider.notifier,
    );
    const Guild initialGuild = Guild(id: 'guild-a', name: 'Guild A');
    const Guild updatedGuild = Guild(
      id: 'guild-a',
      name: 'Guild A',
      banner: 'banner_hash',
    );
    final StreamController<List<Channel>> channelController =
        StreamController<List<Channel>>.broadcast();
    final StreamController<Guild?> guildController =
        StreamController<Guild?>.broadcast();
    addTearDown(channelController.close);
    addTearDown(guildController.close);
    channelControllers['guild-a'] = channelController;
    guildControllers['guild-a'] = guildController;

    notifier.loadChannels('guild-a', guild: initialGuild);
    channelController.add(const <Channel>[]);
    guildController.add(initialGuild);
    await Future<void>.delayed(Duration.zero);

    expect(container.read(channelListViewModelProvider).guild?.banner, isNull);

    guildController.add(updatedGuild);
    await Future<void>.delayed(Duration.zero);

    expect(
      container.read(channelListViewModelProvider).guild?.banner,
      'banner_hash',
    );
  });
}

class _FakeChannelRepository implements ChannelRepository {
  _FakeChannelRepository(this.controllers);

  final Map<String, StreamController<List<Channel>>> controllers;

  @override
  Stream<List<Channel>> watchChannels(String guildId) {
    return controllers
        .putIfAbsent(guildId, StreamController<List<Channel>>.broadcast)
        .stream;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeGuildRepository implements GuildRepository {
  _FakeGuildRepository(this.controllers);

  final Map<String, StreamController<Guild?>> controllers;

  @override
  Stream<Guild?> watchServerById(String id) {
    return controllers
        .putIfAbsent(id, StreamController<Guild?>.broadcast)
        .stream;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
