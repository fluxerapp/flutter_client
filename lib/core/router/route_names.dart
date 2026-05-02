abstract final class RouteNames {
  // Auth
  static const login = 'login';

  static const loading = 'loading';
  static const reconnecting = 'reconnecting';

  // Shell branches
  static const home = 'home';
  static const notifications = 'notifications';
  static const you = 'you';

  // Home branch routes
  static const dms = 'dms';
  static const dmChannel = 'dm-channel';
  static const dmChannelCall = 'dm-channel-call';
  static const dmMessage = 'dm-message';
  static const favorites = 'favorites';
  static const favoritesChannel = 'favorites-channel';
  static const guild = 'guild';
  static const guildMembers = 'guild-members';
  static const channel = 'channel';
  static const message = 'message';
  static const bookmarks = 'bookmarks';
  static const mentions = 'mentions';

  // Deep links (outside shell)
  static const invite = 'invite';
  static const gift = 'gift';
  static const themePreview = 'theme-preview';

  // Settings (pushed on root)
  static const guildSettings = 'guild-settings';
}

/// Path builders mirroring web app's Routes object.
abstract final class RoutePaths {
  static const me = '/channels/@me';
  static String dmChannel(String channelId) => '/channels/@me/$channelId';
  static String dmChannelCall(String channelId) => '/channels/@me/$channelId/call';
  static String dmChannelMessage(String channelId, String messageId) =>
      '/channels/@me/$channelId/$messageId';
  static const favoritesBase = '/channels/@favorites';
  static String favoritesChannel(String channelId) =>
      '/channels/@favorites/$channelId';
  static String guild(String guildId) => '/channels/$guildId';
  static String guildMembers(String guildId) => '/channels/$guildId/members';
  static String guildChannel(String guildId, String channelId) =>
      '/channels/$guildId/$channelId';
  static String guildChannelMessage(
    String guildId,
    String channelId,
    String messageId,
  ) => '/channels/$guildId/$channelId/$messageId';
  static String inviteLink(String code) => '/invite/$code';
  static String giftLink(String code) => '/gift/$code';
  static String themeLink(String themeId) => '/theme/$themeId';
  static String guildSettingsPath(String guildId, {String? tab}) {
    final base = '/settings/guild/$guildId';
    if (tab == null) {
      return base;
    }
    return '$base?tab=$tab';
  }

  static const notificationsPath = '/notifications';
  static const youPath = '/you';
  static const bookmarksPath = '/bookmarks';
  static const mentionsPath = '/mentions';
}
