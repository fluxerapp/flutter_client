import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_dart/export.dart' show FluxerClient;
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/open_test_database.dart';

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

  test('hides forum and media channels while the thread gate is off', () async {
    final Map<String, StreamController<List<Channel>>> controllers =
        <String, StreamController<List<Channel>>>{};
    final Map<String, StreamController<Guild?>> guildControllers =
        <String, StreamController<Guild?>>{};
    final ThreadsGate gate = ThreadsGate();
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
            effective: <String, int>{
              'c1': Permission.viewChannel.value,
              'f1': Permission.viewChannel.value,
              'm1': Permission.viewChannel.value,
            },
          ),
        ),
        threadsGateProvider.overrideWithValue(gate),
      ],
    );
    addTearDown(container.dispose);

    final StreamController<List<Channel>> controller =
        StreamController<List<Channel>>.broadcast();
    addTearDown(controller.close);
    controllers['guild-a'] = controller;
    container
        .read(channelListViewModelProvider.notifier)
        .loadChannels(
          'guild-a',
          guild: const Guild(id: 'guild-a', name: 'A'),
        );
    controller.add(const <Channel>[
      Channel(id: 'c1', guildId: 'guild-a', name: 'general'),
      Channel(
        id: 'f1',
        guildId: 'guild-a',
        name: 'forum',
        type: ChannelType.guildForum,
      ),
      Channel(
        id: 'm1',
        guildId: 'guild-a',
        name: 'media',
        type: ChannelType.guildMedia,
      ),
    ]);
    await Future<void>.delayed(Duration.zero);

    List<String> visibleIds() => <String>[
      for (final ChannelCategory category
          in container.read(channelListViewModelProvider).categories)
        for (final Channel channel in category.channels) channel.id,
    ];

    expect(visibleIds(), <String>['c1']);

    gate.apply('guild-a', active: true);
    expect(visibleIds(), unorderedEquals(<String>['c1', 'f1', 'm1']));

    gate.resetConnection();
    expect(visibleIds(), <String>['c1']);
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

  test(
    'hasReceivedInitialChannelList is false until first channel watch emit',
    () async {
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
      const Guild guild = Guild(id: 'guild-a', name: 'Guild A');
      final StreamController<List<Channel>> controller =
          StreamController<List<Channel>>.broadcast();
      addTearDown(controller.close);
      controllers['guild-a'] = controller;
      guildControllers['guild-a'] = StreamController<Guild?>.broadcast();

      notifier.loadChannels('guild-a', guild: guild);

      expect(
        container
            .read(channelListViewModelProvider)
            .hasReceivedInitialChannelList,
        isFalse,
      );

      controller.add(const <Channel>[
        Channel(id: 'c1', guildId: 'guild-a', name: 'general'),
      ]);
      await Future<void>.delayed(Duration.zero);

      expect(
        container
            .read(channelListViewModelProvider)
            .hasReceivedInitialChannelList,
        isTrue,
      );
    },
  );

  test('member list stays closed when switching text channels', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    container
        .read(channelListViewModelProvider.notifier)
        .setMemberListVisible(isVisible: false);

    expect(
      container
          .read(channelListViewModelProvider)
          .isMemberListVisibleForChannel(
            channelId: 'channel-a',
            channelType: ChannelType.guildText,
          ),
      isFalse,
    );
    expect(
      container
          .read(channelListViewModelProvider)
          .isMemberListVisibleForChannel(
            channelId: 'channel-b',
            channelType: ChannelType.guildText,
          ),
      isFalse,
    );
  });

  test('voice channels hide member list unless explicitly opened', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    final ChannelListViewModel notifier = container.read(
      channelListViewModelProvider.notifier,
    );

    expect(
      container
          .read(channelListViewModelProvider)
          .isMemberListVisibleForChannel(
            channelId: 'voice-a',
            channelType: ChannelType.guildVoice,
          ),
      isFalse,
    );

    notifier.toggleMemberList(
      channelId: 'voice-a',
      channelType: ChannelType.guildVoice,
    );

    expect(
      container
          .read(channelListViewModelProvider)
          .isMemberListVisibleForChannel(
            channelId: 'voice-a',
            channelType: ChannelType.guildVoice,
          ),
      isTrue,
    );
    expect(
      container
          .read(channelListViewModelProvider)
          .isMemberListVisibleForChannel(
            channelId: 'voice-b',
            channelType: ChannelType.guildVoice,
          ),
      isFalse,
    );
  });

  group('ChannelRepository.watchChannels', () {
    late db.FluxerDatabase database;
    late List<List<Channel>> emissions;
    late StreamController<void> emitted;

    setUp(() async {
      database = openTestDatabase();
      await database.channelDao.upsertChannel(
        db.ChannelsCompanion.insert(
          id: 'c1',
          guildId: 'g1',
          name: 'general',
          lastMessageId: const Value('100'),
        ),
      );
      emissions = <List<Channel>>[];
      emitted = StreamController<void>.broadcast();
      final StreamSubscription<List<Channel>> sub =
          ChannelRepository(
            FluxerClient(Dio()),
            Dio(),
            database,
          ).watchChannels('g1').listen((List<Channel> rows) {
            emissions.add(rows);
            emitted.add(null);
          });
      addTearDown(sub.cancel);
      addTearDown(emitted.close);
    });

    Future<void> waitForEmissions(int count) async {
      while (emissions.length < count) {
        await emitted.stream.first;
      }
    }

    Future<void> rename(String name) => database.channelDao.upsertChannel(
      db.ChannelsCompanion.insert(id: 'c1', guildId: 'g1', name: name),
    );

    test(
      'a lastMessageId-only write does not re-emit the guild channel list (#713)',
      () async {
        await waitForEmissions(1);

        final Future<void> pointerSeen = database.channelDao
            .watchChannels('g1')
            .firstWhere(
              (List<db.Channel> rows) => rows.single.lastMessageId == '200',
            );
        await database.channelDao.updateLastMessageId('c1', '200');
        await pointerSeen;

        expect(emissions, hasLength(1));
      },
    );

    test('a channel rename still re-emits the guild channel list', () async {
      await waitForEmissions(1);

      await rename('renamed');
      await waitForEmissions(2);

      expect(emissions[0].single.name, 'general');
      expect(emissions[1].single.name, 'renamed');
    });
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
