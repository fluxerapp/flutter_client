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
  static const favoritesMessage = 'favorites-message';
  static const discover = 'discover';
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

  // Guild settings individual pages (for mobile popup navigation)
  static const guildSettingsOverview = 'guild-settings-overview';
  static const guildSettingsRoles = 'guild-settings-roles';
  static const guildSettingsEmoji = 'guild-settings-emoji';
  static const guildSettingsStickers = 'guild-settings-stickers';
  static const guildSettingsModeration = 'guild-settings-moderation';
  static const guildSettingsAuditLog = 'guild-settings-audit-log';
  static const guildSettingsWebhooks = 'guild-settings-webhooks';
  static const guildSettingsDiscovery = 'guild-settings-discovery';
  static const guildSettingsMembers = 'guild-settings-members';
  static const guildSettingsInvites = 'guild-settings-invites';
  static const guildSettingsBans = 'guild-settings-bans';
}

/// Path builders mirroring web app's Routes object.
// ignore: avoid_classes_with_only_static_members
abstract final class RoutePaths {
  static const me = '/channels/@me';
  static String dmChannel(String channelId) => '/channels/@me/$channelId';
  static String dmChannelCall(String channelId) =>
      '/channels/@me/$channelId/call';
  static String dmChannelMessage(String channelId, String messageId) =>
      '/channels/@me/$channelId/$messageId';
  static const favoritesBase = '/channels/@favorites';
  static const discover = '/channels/@discover';
  static String favoritesChannel(String channelId) =>
      '/channels/@favorites/$channelId';
  static String favoritesChannelMessage(String channelId, String messageId) =>
      '/channels/@favorites/$channelId/$messageId';
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

  // Guild settings individual page paths (mobile popup navigation)
  static String guildSettingsOverviewPath(String guildId) =>
      '/settings/guild/$guildId/overview';
  static String guildSettingsRolesPath(String guildId) =>
      '/settings/guild/$guildId/roles';
  static String guildSettingsEmojiPath(String guildId) =>
      '/settings/guild/$guildId/emoji';
  static String guildSettingsStickersPath(String guildId) =>
      '/settings/guild/$guildId/stickers';
  static String guildSettingsModerationPath(String guildId) =>
      '/settings/guild/$guildId/moderation';
  static String guildSettingsAuditLogPath(String guildId) =>
      '/settings/guild/$guildId/audit-log';
  static String guildSettingsWebhooksPath(String guildId) =>
      '/settings/guild/$guildId/webhooks';
  static String guildSettingsDiscoveryPath(String guildId) =>
      '/settings/guild/$guildId/discovery';
  static String guildSettingsMembersPath(String guildId) =>
      '/settings/guild/$guildId/members';
  static String guildSettingsInvitesPath(String guildId) =>
      '/settings/guild/$guildId/invites';
  static String guildSettingsBansPath(String guildId) =>
      '/settings/guild/$guildId/bans';

  static const notificationsPath = '/notifications';
  static const youPath = '/you';
  static const bookmarksPath = '/bookmarks';
  static const mentionsPath = '/mentions';
}
