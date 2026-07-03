/// Route classification for `/channels/...` paths.
///
/// Centralizes regex patterns that previously lived in multiple files
/// (`app_layout.dart`, `reveal_side_provider.dart`, `navigate_to_content.dart`,
/// `route_state_providers.dart`, `channel_persistence_observer.dart`). Use
/// this classifier rather than re-deriving route shape from path strings.
library;

import 'package:fluxer_app/core/router/route_names.dart';

enum RouteKind {
  /// `/channels/@me`, `/channels/@favorites`, `/channels/:guildId` with no
  /// sub-path. On mobile the drawer should be open (sidebar visible).
  channelsRoot,

  /// `/channels/:owner/:channelId(/...)` — DM, guild channel, or message
  /// jump. On mobile the drawer should be closed (chat visible).
  chat,

  /// `/channels/:guildId/members` — guild members view.
  guildMembers,

  /// `/channels/@me/:channelId/call` — fullscreen voice/video call pushed
  /// on the root navigator.
  dmCall,

  /// `/channels/@discover` — community discovery / explore page.
  discover,

  /// Anything outside the `/channels/` family (`/notifications`, `/you`,
  /// `/bookmarks`, `/mentions`, `/login`, `/loading`, etc.).
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
  if (location == RoutePaths.discover) {
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

bool isChannelsRoute(String location) => location.startsWith('/channels/');

bool isDiscoverRoute(String location) => location == RoutePaths.discover;

final _guildIdPattern = RegExp('^/channels/([^@/][^/]*)');

/// Returns the guild ID embedded in [location], or null for `@me`,
/// `@favorites`, or non-channels routes.
String? extractGuildId(String location) {
  return _guildIdPattern.firstMatch(location)?.group(1);
}

final _dmChannelIdPattern = RegExp(r'^/channels/@me/([^/]+)$');
final _dmChannelMessageIdPattern = RegExp('^/channels/@me/([^/]+)/');
final _favoritesChannelIdPattern = RegExp(r'^/channels/@favorites/([^/]+)$');
final _guildChannelIdPattern = RegExp('^/channels/[^@/][^/]*/([^/]+)');

/// Returns the channel ID embedded in [location], or null for routes
/// that have no channel segment (root channels, members, non-channels).
///
/// Semantics preserve the existing extractor in `route_state_providers.dart`:
/// DM/favorites match their channel segment; guild channels match anywhere a
/// `/channels/:guildId/:channelId(/...)` shape exists (message-jump included).
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
