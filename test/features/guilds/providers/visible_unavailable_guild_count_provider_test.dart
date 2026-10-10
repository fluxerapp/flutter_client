import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/visible_unavailable_guild_count_provider.dart';

void main() {
  group('VisibleUnavailableGuildCount', () {
    test('lingers after recovery before hiding', () async {
      final container = ProviderContainer();
      container.read(guildAvailabilityProvider.notifier).loadFromReady([
        {'id': 'g1', 'unavailable': true},
      ]);
      expect(container.read(visibleUnavailableGuildCountProvider), 1);

      container
          .read(guildAvailabilityProvider.notifier)
          .handleGuildAvailability('g1', unavailable: false);
      expect(container.read(visibleUnavailableGuildCountProvider), 1);

      await Future<void>.delayed(const Duration(milliseconds: 1600));
      expect(container.read(visibleUnavailableGuildCountProvider), 0);
      container.dispose();
    });

    test('a hidden unavailable guild does not raise the indicator', () {
      final container = ProviderContainer(
        overrides: [
          guildListViewModelProvider.overrideWithValue(
            const GuildListViewState(
              guilds: [Guild(id: 'g1', name: 'Hidden', unavailable: true)],
            ),
          ),
        ],
      );
      addTearDown(container.dispose);
      container
          .read(guildAvailabilityProvider.notifier)
          .handleGuildAvailability(
            'g1',
            unavailable: true,
            unavailableHidden: true,
          );

      expect(container.read(visibleUnavailableGuildCountProvider), 0);
    });
  });
}
