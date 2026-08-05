import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';

const int _kGuildCategoryType = 4;
const int _kGuildLinkType = 998;

const String kFavoritesLastChannelKey = '@favorites';

Future<String?> resolveGuildRootRedirect({
  required String? guildId,
  required String fullPath,
  required FluxerDatabase db,
}) async {
  if (guildId == null) {
    return RoutePaths.me;
  }
  if (RegExp('^/channels/[^/]+/.+').hasMatch(fullPath)) {
    return null;
  }
  final String? lastChannelId = await db.guildLastChannelDao.getLastChannel(
    guildId,
  );
  if (lastChannelId != null &&
      await isRestorableGuildChannel(db, guildId, lastChannelId)) {
    return RoutePaths.guildChannel(guildId, lastChannelId);
  }
  final channels = await db.channelDao.getChannels(guildId);
  for (final channel in channels) {
    if (channel.type != _kGuildCategoryType &&
        channel.type != _kGuildLinkType) {
      return RoutePaths.guildChannel(guildId, channel.id);
    }
  }
  return null;
}

Future<bool> isRestorableGuildChannel(
  FluxerDatabase db,
  String guildId,
  String channelId,
) async {
  final channel = await db.channelDao.getChannelById(channelId);
  if (channel == null || channel.guildId != guildId) {
    return false;
  }
  return channel.type != _kGuildCategoryType && channel.type != _kGuildLinkType;
}

Future<String?> resolveFavoritesRootRedirect({
  required String fullPath,
  required FluxerDatabase db,
}) async {
  if (fullPath != RoutePaths.favoritesBase) {
    return null;
  }
  final channels = await db.favoriteChannelsDao.getChannels();
  if (channels.isEmpty) {
    return null;
  }
  final String? lastChannelId = await db.guildLastChannelDao.getLastChannel(
    kFavoritesLastChannelKey,
  );
  if (lastChannelId != null &&
      channels.any((channel) => channel.channelId == lastChannelId)) {
    return RoutePaths.favoritesChannel(lastChannelId);
  }
  final settings = await db.favoriteChannelsDao.getSettings();
  final hideMuted = settings.hideMuted;
  for (final favorite in channels) {
    if (!hideMuted || favorite.guildId == null) {
      return RoutePaths.favoritesChannel(favorite.channelId);
    }
  }
  return RoutePaths.favoritesChannel(channels.first.channelId);
}

void persistGuildChannelFromLocation(FluxerDatabase db, String location) {
  if (classifyRoute(location) != RouteKind.chat) {
    return;
  }
  final favoritesMatch = RegExp(
    r'^/channels/@favorites/([^/]+)$',
  ).firstMatch(location);
  if (favoritesMatch != null) {
    unawaited(
      db.guildLastChannelDao.setLastChannel(
        kFavoritesLastChannelKey,
        favoritesMatch.group(1)!,
      ),
    );
    return;
  }
  final match = RegExp(
    r'^/channels/([^@/][^/]*)/([^/]+)$',
  ).firstMatch(location);
  if (match == null) {
    return;
  }
  unawaited(
    db.guildLastChannelDao.setLastChannel(match.group(1)!, match.group(2)!),
  );
}
