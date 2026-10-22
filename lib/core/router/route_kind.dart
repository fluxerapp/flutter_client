import 'package:fluxer_app/core/router/route_names.dart';

enum RouteKind {
  channelsRoot,

  chat,

  guildMembers,

  dmCall,

  discover,

  nonChannel,
}

final _channelsRootPattern = RegExp(r'^/channels/[^/]+$');
final _guildMembersPattern = RegExp(r'^/channels/[^@/][^/]*/members$');
final _dmCallPattern = RegExp(r'^/channels/@me/[^/]+/call$');
final _chatPattern = RegExp(r'^/channels/[^/]+/.+$');

RouteKind classifyRoute(String location) {
  if (!location.startsWith('/channels/')) {
    return RouteKind.nonChannel;
  }
  if (isDiscoverRoute(location)) {
    return RouteKind.discover;
  }
  if (_channelsRootPattern.hasMatch(location)) {
    return RouteKind.channelsRoot;
  }
  if (_dmCallPattern.hasMatch(location)) {
    return RouteKind.dmCall;
  }
  if (_guildMembersPattern.hasMatch(location)) {
    return RouteKind.guildMembers;
  }
  if (_chatPattern.hasMatch(location)) {
    return RouteKind.chat;
  }
  return RouteKind.nonChannel;
}

bool isDiscoverRoute(String location) =>
    location == RoutePaths.discover || location == RoutePaths.legacyDiscover;

final _guildIdPattern = RegExp('^/channels/([^@/][^/]*)');

String? extractGuildId(String location) {
  return _guildIdPattern.firstMatch(location)?.group(1);
}

final _dmChannelIdPattern = RegExp(r'^/channels/@me/([^/]+)$');
final _dmChannelMessageIdPattern = RegExp('^/channels/@me/([^/]+)/');
final _favoritesChannelIdPattern = RegExp('^/channels/@favorites/([^/]+)');
final _guildChannelIdPattern = RegExp('^/channels/[^@/][^/]*/([^/]+)');

String? extractChannelId(String location) {
  if (isDiscoverRoute(location)) {
    return null;
  }
  final dmMatch = _dmChannelIdPattern.firstMatch(location);
  if (dmMatch != null) {
    return dmMatch.group(1);
  }
  final dmMessageMatch = _dmChannelMessageIdPattern.firstMatch(location);
  if (dmMessageMatch != null) {
    return dmMessageMatch.group(1);
  }
  final favMatch = _favoritesChannelIdPattern.firstMatch(location);
  if (favMatch != null) {
    return favMatch.group(1);
  }
  final guildMatch = _guildChannelIdPattern.firstMatch(location);
  if (guildMatch != null && guildMatch.group(1) != 'members') {
    return guildMatch.group(1);
  }
  return null;
}

String? deletedChannelExitPath({
  required String location,
  required String channelId,
}) {
  if (extractChannelId(location) != channelId) {
    return null;
  }
  final String? guildId = extractGuildId(location);
  if (guildId != null) {
    return RoutePaths.guild(guildId);
  }
  if (location.startsWith('${RoutePaths.me}/')) {
    return RoutePaths.me;
  }
  if (location.startsWith('${RoutePaths.favoritesBase}/')) {
    return RoutePaths.favoritesBase;
  }
  return null;
}
