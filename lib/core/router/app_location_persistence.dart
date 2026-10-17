import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_path_patterns.dart';

const String kAppLastLocationKey = '@app_location';

const Set<String> _nonRestorableAppLocations = {
  '/login',
  '/loading',
  '/reconnecting',
};

const Set<String> _shellNonChannelPaths = {
  RoutePaths.notificationsPath,
  RoutePaths.youPath,
  RoutePaths.bookmarksPath,
  RoutePaths.mentionsPath,
};

String _appLocationPath(String location) => location.split('?').first;

bool isRestorableAppLocation(String location) {
  return location.isNotEmpty && !_nonRestorableAppLocations.contains(location);
}

bool isNavigableAppLocation(String location) {
  final String path = _appLocationPath(location);
  if (path.isEmpty) {
    return false;
  }
  if (_shellNonChannelPaths.contains(path)) {
    return true;
  }
  if (_isNavigableSettingsPath(path)) {
    return true;
  }
  if (!path.startsWith('/channels/')) {
    return false;
  }
  return _isNavigableChannelsPath(path);
}

bool _isNavigableSettingsPath(String path) {
  if (path.startsWith('/settings/guild/')) {
    final List<String> segments = _pathSegments(path);
    if (segments.length == 3) {
      return true;
    }
    if (segments.length == 4 &&
        kGuildSettingsPathSegments.contains(segments[3])) {
      return true;
    }
    return false;
  }
  if (path.startsWith('/settings/channel/')) {
    final List<String> segments = _pathSegments(path);
    if (segments.length == 3) {
      return true;
    }
    if (segments.length == 4 &&
        kChannelSettingsPathSegments.contains(segments[3])) {
      return true;
    }
    return false;
  }
  return false;
}

bool _isNavigableChannelsPath(String path) {
  if (path == RoutePaths.discover ||
      path == RoutePaths.me ||
      path == RoutePaths.favoritesBase) {
    return true;
  }
  if (kDmCallAppPath.hasMatch(path) || kDmMessageAppPath.hasMatch(path)) {
    return true;
  }
  if (kDmChannelAppPath.hasMatch(path)) {
    return _pathSegments(path).last != 'members';
  }
  if (kFavoritesChannelAppPath.hasMatch(path) ||
      kFavoritesMessageAppPath.hasMatch(path)) {
    return true;
  }
  if (path.startsWith('/channels/@')) {
    return false;
  }
  if (kGuildMembersAppPath.hasMatch(path)) {
    return true;
  }
  if (kGuildRootAppPath.hasMatch(path)) {
    return true;
  }
  if (kGuildChannelAppPath.hasMatch(path) && !path.endsWith('/members')) {
    return true;
  }
  if (kGuildMessageAppPath.hasMatch(path)) {
    return true;
  }
  return false;
}

List<String> _pathSegments(String path) {
  return path.split('/').where((String segment) => segment.isNotEmpty).toList();
}

void persistAppLocation(FluxerDatabase db, String location) {
  if (!isRestorableAppLocation(location) || !isNavigableAppLocation(location)) {
    return;
  }
  unawaited(
    db.guildLastChannelDao.setLastChannel(kAppLastLocationKey, location),
  );
}

Future<void> clearPersistedLocation(FluxerDatabase db, String location) async {
  final String path = _appLocationPath(location);
  await db.guildLastChannelDao.removeGuild(kAppLastLocationKey);
  if (path.startsWith('${RoutePaths.favoritesBase}/')) {
    await db.guildLastChannelDao.removeGuild(kFavoritesLastChannelKey);
    return;
  }
  final String? guildId = extractGuildId(path);
  if (guildId != null) {
    await db.guildLastChannelDao.removeGuild(guildId);
  }
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
  required String? currentUserId,
  String? inMemory,
}) async {
  final String? persisted = await readPersistedAppLocation(db);
  for (final String? candidate in <String?>[inMemory, persisted]) {
    if (candidate == null || !isRestorableAppLocation(candidate)) {
      continue;
    }
    final String? resolved = await _resolveValidAppLocation(
      db,
      candidate,
      currentUserId: currentUserId,
    );
    if (resolved != null) {
      return resolved;
    }
    if (persisted != null && candidate == persisted) {
      await clearPersistedLocation(db, candidate);
    }
  }
  return RoutePaths.me;
}

Future<String?> _resolveValidAppLocation(
  FluxerDatabase db,
  String location, {
  required String? currentUserId,
}) async {
  final String path = _appLocationPath(location);
  if (!isRestorableAppLocation(path)) {
    return null;
  }

  final String? resolved = switch (classifyRoute(path)) {
    RouteKind.nonChannel || RouteKind.discover => path,
    RouteKind.channelsRoot => await _resolveValidChannelsRoot(
      db,
      path,
      currentUserId: currentUserId,
    ),
    RouteKind.guildMembers => await _resolveValidGuildMembers(db, path),
    RouteKind.chat || RouteKind.dmCall => await _resolveValidChatLocation(
      db,
      path,
      currentUserId: currentUserId,
    ),
  };

  if (resolved == null || !isNavigableAppLocation(resolved)) {
    return null;
  }
  return resolved;
}

Future<bool> _guildExists(FluxerDatabase db, String guildId) async {
  return await db.guildDao.getServerById(guildId) != null;
}

Future<String?> _resolveValidChannelsRoot(
  FluxerDatabase db,
  String path, {
  required String? currentUserId,
}) async {
  if (path == RoutePaths.me) {
    return path;
  }
  if (path == RoutePaths.favoritesBase) {
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
        currentUserId: currentUserId,
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
  String path, {
  required String? currentUserId,
}) async {
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
      await isRestorableGuildChannel(
        db,
        guildId,
        channelId,
        currentUserId: currentUserId,
      )) {
    return path;
  }
  return resolveGuildRootRedirect(
    guildId: guildId,
    fullPath: RoutePaths.guild(guildId),
    db: db,
    currentUserId: currentUserId,
  );
}
