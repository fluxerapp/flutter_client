import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';

import '../../../helpers/ready_guilds.dart';

void main() {
  group('GuildAvailability', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('loadFromReady tracks unavailable guilds', () {
      container
          .read(guildAvailabilityProvider.notifier)
          .loadFromReady(
            readyUnavailableGuilds([
              {'id': 'g1', 'unavailable': true},
              {'id': 'g2', 'unavailable': false},
            ]),
          );
      expect(container.read(guildAvailabilityProvider), {'g1'});
    });

    test('loadFromReady excludes unavailable_hidden guilds', () {
      container
          .read(guildAvailabilityProvider.notifier)
          .loadFromReady(
            readyUnavailableGuilds([
              {'id': 'g1', 'unavailable': true, 'unavailable_hidden': true},
              {'id': 'g2', 'unavailable': true},
            ]),
          );
      expect(container.read(guildAvailabilityProvider), {'g2'});
    });

    test('setGuildAvailable removes guild id', () {
      container
          .read(guildAvailabilityProvider.notifier)
          .loadFromReady(
            readyUnavailableGuilds([
              {'id': 'g1', 'unavailable': true},
            ]),
          );
      container
          .read(guildAvailabilityProvider.notifier)
          .setGuildAvailable('g1');
      expect(container.read(guildAvailabilityProvider), isEmpty);
    });

    test('handleGuildAvailability adds when unavailable', () {
      container
          .read(guildAvailabilityProvider.notifier)
          .handleGuildAvailability('g1', unavailable: true);
      expect(container.read(guildAvailabilityProvider), {'g1'});
    });

    test('handleGuildAvailability removes when available', () {
      container
          .read(guildAvailabilityProvider.notifier)
          .loadFromReady(
            readyUnavailableGuilds([
              {'id': 'g1', 'unavailable': true},
            ]),
          );
      container
          .read(guildAvailabilityProvider.notifier)
          .handleGuildAvailability('g1', unavailable: false);
      expect(container.read(guildAvailabilityProvider), isEmpty);
    });

    test('handleGuildAvailability ignores hidden unavailable guilds', () {
      container
          .read(guildAvailabilityProvider.notifier)
          .handleGuildAvailability(
            'g1',
            unavailable: true,
            unavailableHidden: true,
          );
      expect(container.read(guildAvailabilityProvider), isEmpty);
    });

    test('clear resets state', () {
      container
          .read(guildAvailabilityProvider.notifier)
          .loadFromReady(
            readyUnavailableGuilds([
              {'id': 'g1', 'unavailable': true},
            ]),
          );
      container.read(guildAvailabilityProvider.notifier).clear();
      expect(container.read(guildAvailabilityProvider), isEmpty);
    });
  });

  group('GuildDegraded', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('loadFromReady keeps only available degraded guilds', () {
      container
          .read(guildDegradedProvider.notifier)
          .loadFromReady(
            readyGuilds([
              {'id': 'g1', 'degraded': true},
              {'id': 'g2', 'degraded': true, 'unavailable': true},
              {'id': 'g3'},
            ]),
          );
      expect(container.read(guildDegradedProvider), {'g1'});
    });

    test('setDegraded toggles one guild', () {
      final GuildDegraded degraded = container.read(
        guildDegradedProvider.notifier,
      )..setDegraded('g1', degraded: true);
      expect(container.read(guildDegradedProvider), {'g1'});
      degraded.setDegraded('g1', degraded: false);
      expect(container.read(guildDegradedProvider), isEmpty);
    });
  });
}
