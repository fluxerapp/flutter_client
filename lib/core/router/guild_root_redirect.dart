import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart'
    as db_row
    show Channel;
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Channel;
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/data/unread_permission_utils.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/utils/guild_outage_availability.dart';

const String kGuildRootStayOnListExtra = 'guild-root-list';

bool shouldStayOnGuildChannelList({required Uri uri, Object? extra}) {
  if (extra == kGuildRootStayOnListExtra) {
    return true;
  }
  return uri.queryParameters[RoutePaths.guildStayOnListQuery] == '1';
}

const String kFavoritesLastChannelKey = '@favorites';
const String kDmLastChannelKey = '@me';

Future<String?> resolveGuildRootRedirect({
  required String? guildId,
  required String fullPath,
  required FluxerDatabase db,
  required String? currentUserId,
  Set<String> trackedUnavailableGuildIds = const {},
}) async {
  if (guildId == null) {
    return RoutePaths.me;
  }
  if (RegExp('^/channels/[^/]+/.+').hasMatch(fullPath)) {
    return null;
  }
  final existing = await db.guildDao.getServerById(guildId);
  if (isGuildOutageUnavailable(
    guildId: guildId,
    trackedUnavailableGuildIds: trackedUnavailableGuildIds,
    guild: existing == null ? null : Guild.fromRow(existing),
  )) {
    return null;
  }
  final String? lastChannelId = await db.guildLastChannelDao.getLastChannel(
    guildId,
  );
  if (lastChannelId != null &&
      await isRestorableGuildChannel(
        db,
        guildId,
        lastChannelId,
        currentUserId: currentUserId,
      )) {
    return RoutePaths.guildChannel(guildId, lastChannelId);
  }
  final String? defaultChannelId = await _resolveDefaultGuildChannelId(
    db,
    guildId,
    currentUserId: currentUserId,
  );
  if (defaultChannelId == null) {
    return null;
  }
  return RoutePaths.guildChannel(guildId, defaultChannelId);
}

Future<String?> _resolveDefaultGuildChannelId(
  FluxerDatabase db,
  String guildId, {
  required String? currentUserId,
}) async {
  final List<db_row.Channel> rows = await db.channelDao.getChannels(guildId);
  final Map<String, db_row.Channel> rowsById = <String, db_row.Channel>{
    for (final db_row.Channel row in rows) row.id: row,
  };
  final List<ChannelCategory> categories = groupChannelsIntoCategories(
    rows.map(Channel.fromRow).toList(),
  );
  for (final ChannelCategory category in categories) {
    for (final Channel channel in category.channels) {
      if (channel.type != ChannelType.guildText &&
          channel.type != ChannelType.guildAnnouncement) {
        continue;
      }
      if (await canReadChannelForUnread(
        database: db,
        channel: rowsById[channel.id]!,
        currentUserId: currentUserId,
      )) {
        return channel.id;
      }
    }
  }
  return null;
}

Future<bool> isRestorableGuildChannel(
  FluxerDatabase db,
  String guildId,
  String channelId, {
  required String? currentUserId,
}) async {
  final db_row.Channel? channel = await db.channelDao.getChannelById(channelId);
  if (channel == null || channel.guildId != guildId) {
    return false;
  }
  final ChannelType type = ChannelType.fromWire(channel.type);
  if (type == ChannelType.guildCategory || type == ChannelType.guildLink) {
    return false;
  }
  return canReadChannelForUnread(
    database: db,
    channel: channel,
    currentUserId: currentUserId,
  );
}

Future<String?> resolveDmRootRedirect({
  required String fullPath,
  required FluxerDatabase db,
}) async {
  if (fullPath != RoutePaths.me) {
    return null;
  }
  final String? lastChannelId = await db.guildLastChannelDao.getLastChannel(
    kDmLastChannelKey,
  );
  if (lastChannelId != null &&
      await db.dmChannelDao.getDmChannelById(lastChannelId) != null) {
    return RoutePaths.dmChannel(lastChannelId);
  }
  final List<DmChannel> channels = await db.dmChannelDao.getDmChannels();
  if (channels.isEmpty) {
    return null;
  }
  return RoutePaths.dmChannel(channels.first.id);
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
  final dmMatch = RegExp('^/channels/@me/([^/]+)').firstMatch(location);
  if (dmMatch != null) {
    unawaited(
      db.guildLastChannelDao.setLastChannel(
        kDmLastChannelKey,
        dmMatch.group(1)!,
      ),
    );
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
