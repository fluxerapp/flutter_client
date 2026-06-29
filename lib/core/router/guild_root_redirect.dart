import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/router/route_names.dart';

/// Destination for the bare `/channels/:guildId` route.
///
/// Mobile mirrors the web GuildChannelRouter `MobileLayout.enabled` guard:
/// never auto-open a channel, so the guild's channel list is shown. Desktop
/// restores the per-guild last channel, else the first non-category/non-link
/// channel by ascending position.
Future<String?> resolveGuildRootRedirect({
  required String? guildId,
  required String fullPath,
  required bool isMobile,
  required FluxerDatabase db,
}) async {
  if (guildId == null) {
    return RoutePaths.me;
  }
  if (RegExp('^/channels/[^/]+/.+').hasMatch(fullPath)) {
    return null;
  }
  if (isMobile) {
    return null;
  }
  final lastChannelId = await db.guildLastChannelDao.getLastChannel(guildId);
  if (lastChannelId != null) {
    return RoutePaths.guildChannel(guildId, lastChannelId);
  }
  final channels = await db.channelDao.getChannels(guildId);
  const categoryType = 4;
  const linkType = 998;
  for (final channel in channels) {
    if (channel.type != categoryType && channel.type != linkType) {
      return RoutePaths.guildChannel(guildId, channel.id);
    }
  }
  return null;
}
