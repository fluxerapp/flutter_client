import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:riverpod/src/framework.dart' show Override;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('restores cached categories when switching back to a guild', () async {
    final Map<String, StreamController<List<Channel>>> controllers =
        <String, StreamController<List<Channel>>>{};
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        channelRepositoryProvider.overrideWithValue(
          _FakeChannelRepository(controllers),
        ),
        channelPermissionCacheProvider.overrideWithValue(<String, int>{
          'c1': Permission.viewChannel.value,
        }),
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
