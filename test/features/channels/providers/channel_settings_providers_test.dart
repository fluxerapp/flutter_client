import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_overview_update.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_overwrite_update.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_settings_providers.dart';
import 'package:riverpod/src/framework.dart' show Override;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const String channelId = 'channel-1';
  const String guildId = 'guild-1';
  const Channel channel = Channel(
    id: channelId,
    guildId: guildId,
    name: 'general',
  );

  group('ChannelSettingsActions', () {
    ProviderContainer createContainer(ChannelRepository repository) {
      return ProviderContainer(
        overrides: <Override>[
          channelRepositoryProvider.overrideWithValue(repository),
        ],
      );
    }

    test(
      'updateOverview completes when the provider has no listeners',
      () async {
        final ProviderContainer container = createContainer(
          _FakeChannelRepository(
            updatedChannel: channel,
            delay: const Duration(milliseconds: 10),
          ),
        );
        addTearDown(container.dispose);

        final ChannelSettingsActions notifier = container.read(
          channelSettingsActionsProvider(channelId).notifier,
        );
        final ChannelOverviewFormState current =
            ChannelOverviewFormState.fromChannel(channel);

        final Channel actual = await notifier.updateOverview(
          channel: channel,
          current: current,
          original: current,
          canManageChannel: true,
          canUpdateRtcRegion: false,
        );

        expect(actual, equals(channel));
      },
    );

    test(
      'updatePermissionOverwrites completes when the provider has no listeners',
      () async {
        final ProviderContainer container = createContainer(
          _FakeChannelRepository(
            updatedChannel: channel,
            delay: const Duration(milliseconds: 10),
          ),
        );
        addTearDown(container.dispose);

        final ChannelSettingsActions notifier = container.read(
          channelSettingsActionsProvider(channelId).notifier,
        );
        final List<ChannelPermissionOverwriteEntry> overwrites =
            <ChannelPermissionOverwriteEntry>[
              ChannelPermissionOverwriteEntry(
                id: 'role-1',
                type: 0,
                allow: BigInt.zero,
                deny: BigInt.zero,
                label: 'Role',
              ),
            ];

        final Channel actual = await notifier.updatePermissionOverwrites(
          channel: channel,
          overwrites: overwrites,
        );

        expect(actual, equals(channel));
      },
    );
  });
}

class _FakeChannelRepository implements ChannelRepository {
  _FakeChannelRepository({required this.updatedChannel, this.delay});

  final Channel updatedChannel;
  final Duration? delay;

  @override
  Future<Channel> updateChannelOverview({
    required Channel channel,
    required ChannelOverviewFormState current,
    required ChannelOverviewFormState original,
    required bool canManageChannel,
    required bool canUpdateRtcRegion,
  }) async {
    if (delay != null) {
      await Future<void>.delayed(delay!);
    }
    return updatedChannel;
  }

  @override
  Future<Channel> updateChannelPermissionOverwrites({
    required Channel channel,
    required List<ChannelPermissionOverwriteEntry> overwrites,
  }) async {
    if (delay != null) {
      await Future<void>.delayed(delay!);
    }
    return updatedChannel;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
