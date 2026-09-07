import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/providers/channel_member_count_cache_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/known_guild_bans_provider.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  test('ChannelMemberCountCache stores live channel counts', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    container
        .read(channelMemberCountCacheProvider.notifier)
        .applyUpdates(const <ChannelMemberCountEntry>[
          ChannelMemberCountEntry(
            guildId: 'g1',
            channelId: 'ch1',
            memberCount: 12,
            onlineCount: 4,
          ),
        ]);

    final ChannelMemberCounts? counts = container
        .read(channelMemberCountCacheProvider.notifier)
        .getCounts('g1', 'ch1');
    expect(counts?.memberCount, 12);
    expect(counts?.onlineCount, 4);

    final Map<String, ChannelMemberCounts> before = container.read(
      channelMemberCountCacheProvider,
    );
    container
        .read(channelMemberCountCacheProvider.notifier)
        .applyUpdates(const <ChannelMemberCountEntry>[
          ChannelMemberCountEntry(
            guildId: 'g1',
            channelId: 'ch1',
            memberCount: 12,
            onlineCount: 4,
          ),
        ]);
    expect(
      identical(container.read(channelMemberCountCacheProvider), before),
      isTrue,
    );
  });

  test('KnownGuildBans tracks add and remove', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    final KnownGuildBans bans = container.read(knownGuildBansProvider.notifier);
    expect(bans.isKnownBanned('g1', 'u1'), isFalse);
    bans.noteBan('g1', 'u1');
    expect(bans.isKnownBanned('g1', 'u1'), isTrue);
    bans.noteUnban('g1', 'u1');
    expect(bans.isKnownBanned('g1', 'u1'), isFalse);
  });
}
