import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';

const String kStaffOnlyGuildFeature = 'UNAVAILABLE_FOR_EVERYONE_BUT_STAFF';

bool isGuildOutageUnavailable({
  required String guildId,
  required Set<String> trackedUnavailableGuildIds,
  Guild? guild,
}) {
  return trackedUnavailableGuildIds.contains(guildId) ||
      (guild?.unavailable ?? false);
}

bool isGuildVisibleOnGuildRail({
  required String guildId,
  required Set<String> trackedUnavailableGuildIds,
  Guild? guild,
}) {
  return !isGuildOutageUnavailable(
    guildId: guildId,
    trackedUnavailableGuildIds: trackedUnavailableGuildIds,
    guild: guild,
  );
}

bool isGuildMissingForRoute({
  required String guildId,
  required Set<String> trackedUnavailableGuildIds,
  Guild? guild,
}) {
  return !isGuildOutageUnavailable(
        guildId: guildId,
        trackedUnavailableGuildIds: trackedUnavailableGuildIds,
        guild: guild,
      ) &&
      guild == null;
}

bool isGuildConfirmedMissingForRoute({
  required AsyncValue<Guild?> guildAsync,
  required String guildId,
  required Set<String> trackedUnavailableGuildIds,
}) {
  if (guildAsync.isLoading) {
    return false;
  }
  return isGuildMissingForRoute(
    guildId: guildId,
    trackedUnavailableGuildIds: trackedUnavailableGuildIds,
    guild: guildAsync.value,
  );
}

bool isGuildStaffOnlyAccessible(Guild? guild) {
  return guild?.features.contains(kStaffOnlyGuildFeature) ?? false;
}

int unavailableGuildCount({
  required Set<String> trackedUnavailableGuildIds,
  required List<Guild> guilds,
}) {
  final Set<String> ids = {
    ...trackedUnavailableGuildIds,
    ...guilds.where((guild) => guild.unavailable).map((guild) => guild.id),
  };
  return ids.length;
}
