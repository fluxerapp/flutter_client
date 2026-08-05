import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';

const String kAppLastLocationKey = '@app_location';

const Set<String> _nonRestorableAppLocations = {
  '/login',
  '/loading',
  '/reconnecting',
};

bool isRestorableAppLocation(String location) {
  return location.isNotEmpty && !_nonRestorableAppLocations.contains(location);
}

void persistAppLocation(FluxerDatabase db, String location) {
  if (!isRestorableAppLocation(location)) {
    return;
  }
  unawaited(
    db.guildLastChannelDao.setLastChannel(kAppLastLocationKey, location),
  );
}

Future<String?> readPersistedAppLocation(FluxerDatabase db) async {
  final String? location = await db.guildLastChannelDao.getLastChannel(
    kAppLastLocationKey,
  );
  if (location != null && isRestorableAppLocation(location)) {
    return location;
  }
  return null;
}

Future<String> restoreAppLocation({
  required FluxerDatabase db,
  String? inMemory,
}) async {
  for (final String? candidate in <String?>[
    inMemory,
    await readPersistedAppLocation(db),
  ]) {
    if (candidate == null || !isRestorableAppLocation(candidate)) {
      continue;
    }
    final String? resolved = await _resolveValidAppLocation(db, candidate);
    if (resolved != null) {
      return resolved;
    }
  }
  return RoutePaths.me;
}

Future<String?> _resolveValidAppLocation(
  FluxerDatabase db,
  String location,
) async {
  final String path = location.split('?').first;
  if (!isRestorableAppLocation(path)) {
    return null;
  }

  switch (classifyRoute(path)) {
    case RouteKind.nonChannel:
    case RouteKind.discover:
      return path;
    case RouteKind.channelsRoot:
      return _resolveValidChannelsRoot(db, path);
    case RouteKind.guildMembers:
      return _resolveValidGuildMembers(db, path);
    case RouteKind.chat:
    case RouteKind.dmCall:
      return _resolveValidChatLocation(db, path);
  }
}

Future<bool> _guildExists(FluxerDatabase db, String guildId) async {
  return await db.guildDao.getServerById(guildId) != null;
}

Future<String?> _resolveValidChannelsRoot(
  FluxerDatabase db,
  String path,
) async {
  if (path == RoutePaths.me || path == RoutePaths.favoritesBase) {
    return path;
  }
  final String? guildId = extractGuildId(path);
  if (guildId == null || !await _guildExists(db, guildId)) {
    return null;
  }
  return await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: path,
        db: db,
      ) ??
      path;
}

Future<String?> _resolveValidGuildMembers(
  FluxerDatabase db,
  String path,
) async {
  final String? guildId = extractGuildId(path);
  if (guildId == null || !await _guildExists(db, guildId)) {
    return null;
  }
  return path;
}

Future<String?> _resolveValidChatLocation(
  FluxerDatabase db,
  String path,
) async {
  if (path.startsWith('${RoutePaths.me}/')) {
    final String? channelId = extractChannelId(path);
    if (channelId == null) {
      return null;
    }
    if (await db.dmChannelDao.getDmChannelById(channelId) == null) {
      return null;
    }
    return path;
  }

  if (path.startsWith('${RoutePaths.favoritesBase}/')) {
    final String? channelId = extractChannelId(path);
    if (channelId == null) {
      return null;
    }
    if (await db.favoriteChannelsDao.getChannel(channelId) != null) {
      return path;
    }
    return resolveFavoritesRootRedirect(
      fullPath: RoutePaths.favoritesBase,
      db: db,
    );
  }

  final String? guildId = extractGuildId(path);
  final String? channelId = extractChannelId(path);
  if (guildId == null || !await _guildExists(db, guildId)) {
    return null;
  }
  if (channelId != null &&
      await isRestorableGuildChannel(db, guildId, channelId)) {
    return path;
  }
  return resolveGuildRootRedirect(
    guildId: guildId,
    fullPath: RoutePaths.guild(guildId),
    db: db,
  );
}
