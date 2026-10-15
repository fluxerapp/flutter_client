import 'package:fluxer_app/core/deep_links/deep_link_path_policy.dart';
import 'package:fluxer_app/core/observability/measure_log_redaction.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_path_patterns.dart';

const Map<String, String> _guildSettingsScreenNames = {
  'overview': RouteNames.guildSettingsOverview,
  'moderation': RouteNames.guildSettingsModeration,
  'audit-log': RouteNames.guildSettingsAuditLog,
  'bans': RouteNames.guildSettingsBans,
  'members': RouteNames.guildSettingsMembers,
  'invites': RouteNames.guildSettingsInvites,
  'webhooks': RouteNames.guildSettingsWebhooks,
  'discovery': RouteNames.guildSettingsDiscovery,
  'channels': RouteNames.guildSettingsChannels,
  'roles': RouteNames.guildSettingsRoles,
  'emoji': RouteNames.guildSettingsEmoji,
  'stickers': RouteNames.guildSettingsStickers,
};

const Map<String, String> _channelSettingsScreenNames = {
  'overview': RouteNames.channelSettingsOverview,
  'permissions': RouteNames.channelSettingsPermissions,
  'invites': RouteNames.channelSettingsInvites,
  'webhooks': RouteNames.channelSettingsWebhooks,
};

String? normalizeMeasureScreenName(String? raw) {
  if (raw == null || raw.isEmpty) {
    return raw;
  }
  if (!raw.startsWith('/')) {
    return raw;
  }
  final String path = normalizeDeepLinkPath(raw.split('?').first);
  final String? settingsName = _settingsScreenName(path);
  if (settingsName != null) {
    return settingsName;
  }
  if (path == RoutePaths.me) {
    return RouteNames.dms;
  }
  if (path == RoutePaths.favoritesBase) {
    return RouteNames.favorites;
  }
  if (path == RoutePaths.discover) {
    return RouteNames.discover;
  }
  if (path == RoutePaths.notificationsPath) {
    return RouteNames.notifications;
  }
  if (path == RoutePaths.youPath) {
    return RouteNames.you;
  }
  if (path == RoutePaths.bookmarksPath) {
    return RouteNames.bookmarks;
  }
  if (path == RoutePaths.mentionsPath) {
    return RouteNames.mentions;
  }
  if (path.startsWith('/invite/')) {
    return RouteNames.invite;
  }
  if (path.startsWith('/gift/')) {
    return RouteNames.gift;
  }
  if (kDmCallAppPath.hasMatch(path)) {
    return RouteNames.dmChannelCall;
  }
  if (kDmMessageAppPath.hasMatch(path)) {
    return RouteNames.dmMessage;
  }
  if (kDmChannelAppPath.hasMatch(path)) {
    return RouteNames.dmChannel;
  }
  if (kFavoritesMessageAppPath.hasMatch(path)) {
    return RouteNames.favoritesMessage;
  }
  if (kFavoritesChannelAppPath.hasMatch(path)) {
    return RouteNames.favoritesChannel;
  }
  if (kGuildMembersAppPath.hasMatch(path)) {
    return RouteNames.guildMembers;
  }
  if (kGuildMessageAppPath.hasMatch(path)) {
    return RouteNames.message;
  }
  if (kGuildChannelAppPath.hasMatch(path)) {
    return RouteNames.channel;
  }
  if (kGuildRootAppPath.hasMatch(path)) {
    return RouteNames.guild;
  }
  return scrubPathForMeasure(path);
}

String? _settingsScreenName(String path) {
  if (path.startsWith('/settings/guild/')) {
    final List<String> segments = _pathSegments(path);
    if (segments.length == 3) {
      return RouteNames.guildSettings;
    }
    if (segments.length == 4) {
      return _guildSettingsScreenNames[segments[3]] ?? RouteNames.guildSettings;
    }
    return null;
  }
  if (path.startsWith('/settings/channel/')) {
    final List<String> segments = _pathSegments(path);
    if (segments.length == 3) {
      return RouteNames.channelSettings;
    }
    if (segments.length == 4) {
      return _channelSettingsScreenNames[segments[3]] ??
          RouteNames.channelSettings;
    }
    return null;
  }
  return null;
}

List<String> _pathSegments(String path) {
  return path.split('/').where((String segment) => segment.isNotEmpty).toList();
}
