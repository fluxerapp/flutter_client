import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/utils/guild_outage_availability.dart';

Guild _guild({required String id, bool unavailable = false}) {
  return Guild(id: id, name: 'Guild $id', unavailable: unavailable);
}

void main() {
  group('guild outage availability', () {
    test('isGuildOutageUnavailable uses provider and db flag', () {
      expect(
        isGuildOutageUnavailable(
          guildId: 'g1',
          trackedUnavailableGuildIds: {'g1'},
        ),
        isTrue,
      );
      expect(
        isGuildOutageUnavailable(
          guildId: 'g2',
          trackedUnavailableGuildIds: {},
          guild: _guild(id: 'g2', unavailable: true),
        ),
        isTrue,
      );
      expect(
        isGuildOutageUnavailable(
          guildId: 'g3',
          trackedUnavailableGuildIds: {},
          guild: _guild(id: 'g3'),
        ),
        isFalse,
      );
    });

    test('isGuildVisibleOnGuildRail excludes outage guilds from navbar', () {
      expect(
        isGuildVisibleOnGuildRail(
          guildId: 'g1',
          trackedUnavailableGuildIds: {'g1'},
          guild: _guild(id: 'g1'),
        ),
        isFalse,
      );
      expect(
        isGuildVisibleOnGuildRail(
          guildId: 'g2',
          trackedUnavailableGuildIds: {},
          guild: _guild(id: 'g2', unavailable: true),
        ),
        isFalse,
      );
      expect(
        isGuildVisibleOnGuildRail(
          guildId: 'g3',
          trackedUnavailableGuildIds: {},
          guild: _guild(id: 'g3'),
        ),
        isTrue,
      );
    });

    test('staff-only feature does not count as outage unavailable', () {
      const guild = Guild(
        id: 'g1',
        name: 'Staff Guild',
        features: [kStaffOnlyGuildFeature],
      );
      expect(
        isGuildOutageUnavailable(
          guildId: 'g1',
          trackedUnavailableGuildIds: {},
          guild: guild,
        ),
        isFalse,
      );
      expect(isGuildStaffOnlyAccessible(guild), isTrue);
    });

    test('unavailableGuildCount unions provider and db flags', () {
      expect(
        unavailableGuildCount(
          trackedUnavailableGuildIds: {'g1'},
          guilds: [
            _guild(id: 'g2', unavailable: true),
            _guild(id: 'g3'),
          ],
        ),
        2,
      );
    });

    test('isGuildConfirmedMissingForRoute waits while loading', () {
      expect(
        isGuildConfirmedMissingForRoute(
          guildAsync: const AsyncLoading<Guild?>(),
          guildId: 'g1',
          trackedUnavailableGuildIds: {},
        ),
        isFalse,
      );
    });

    test('isGuildMissingForRoute excludes outage and missing guild', () {
      expect(
        isGuildMissingForRoute(
          guildId: 'g1',
          trackedUnavailableGuildIds: {'g1'},
        ),
        isFalse,
      );
      expect(
        isGuildMissingForRoute(guildId: 'g2', trackedUnavailableGuildIds: {}),
        isTrue,
      );
    });
  });
}
