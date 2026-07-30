import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_channel_settings_providers.dart';
import 'package:riverpod/src/framework.dart' show Override;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const String guildId = 'guild-1';
  const ChannelMoveOperation operation = ChannelMoveOperation(
    channelId: 'text-1',
    newParentId: 'cat-1',
    precedingSiblingId: null,
    position: 0,
  );
  final List<Channel> currentChannels = <Channel>[
    const Channel(id: 'text-1', guildId: guildId, name: 'general'),
  ];
  final List<Channel> optimisticChannels = <Channel>[
    const Channel(
      id: 'text-1',
      guildId: guildId,
      name: 'general',
      parentId: 'cat-1',
    ),
  ];

  group('GuildChannelSettingsActions', () {
    ProviderContainer createContainer(_TrackingChannelRepository repository) {
      return ProviderContainer(
        overrides: <Override>[
          channelRepositoryProvider.overrideWithValue(repository),
        ],
      );
    }

    test('moveChannel completes when the provider has no listeners', () async {
      final _TrackingChannelRepository repository = _TrackingChannelRepository(
        delay: const Duration(milliseconds: 10),
      );
      final ProviderContainer container = createContainer(repository);
      addTearDown(container.dispose);

      final GuildChannelSettingsActions notifier = container.read(
        guildChannelSettingsActionsProvider(guildId).notifier,
      );

      await notifier.moveChannel(
        operation: operation,
        currentChannels: currentChannels,
        optimisticChannels: optimisticChannels,
      );

      expect(repository.moveChannelCallCount, 1);
      expect(repository.applyLocalChannelsCallCount, 1);
    });
  });
}

class _TrackingChannelRepository implements ChannelRepository {
  _TrackingChannelRepository({this.delay});

  final Duration? delay;
  int moveChannelCallCount = 0;
  int applyLocalChannelsCallCount = 0;

  @override
  Future<void> applyLocalChannels(
    String guildId,
    List<Channel> channels,
  ) async {
    applyLocalChannelsCallCount++;
    if (delay != null) {
      await Future<void>.delayed(delay!);
    }
  }

  @override
  Future<void> moveChannel({
    required String guildId,
    required ChannelMoveOperation operation,
    List<Channel>? rollbackChannels,
  }) async {
    moveChannelCallCount++;
    if (delay != null) {
      await Future<void>.delayed(delay!);
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
