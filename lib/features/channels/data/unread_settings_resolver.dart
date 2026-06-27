import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_dart/export.dart';

class ResolvedUnreadSettings {
  const ResolvedUnreadSettings({
    required this.isMuted,
    required this.allowsMessageUnread,
    required this.allowsMentionUnread,
  });

  final bool isMuted;
  final bool allowsMessageUnread;
  final bool allowsMentionUnread;
}

UserGuildSettingsResponse? decodeUserGuildSettings(String data) {
  try {
    return UserGuildSettingsResponse.fromJson(
      jsonDecode(data) as Map<String, dynamic>,
    );
  } on Object {
    return null;
  }
}

UserNotificationSettings? getLockedCommunityUnreadBadgesLevel({
  required UserGuildSettingsResponse? guildSettings,
  required DateTime now,
}) {
  if (guildSettings == null) {
    return null;
  }
  if (_isGuildMuted(guildSettings, now)) {
    return UserNotificationSettings.noMessages;
  }
  final notificationLevel = guildSettings.messageNotifications;
  if (notificationLevel == UserNotificationSettings.allMessages) {
    return UserNotificationSettings.allMessages;
  }
  if (notificationLevel == UserNotificationSettings.noMessages) {
    return UserNotificationSettings.noMessages;
  }
  return null;
}

UserNotificationSettings? resolveUnreadBadgesLevel({
  required db.Channel channel,
  required UserGuildSettingsResponse? guildSettings,
  bool unreadBadgeCustomizationEnabled = false,
}) {
  return _resolvedUnreadBadgeLevel(
    channel: channel,
    guildSettings: guildSettings,
    unreadBadgeCustomizationEnabled: unreadBadgeCustomizationEnabled,
  );
}

UserNotificationSettings? resolveGuildUnreadBadgesLevel({
  required db.Channel channel,
  required UserGuildSettingsResponse? guildSettings,
  bool unreadBadgeCustomizationEnabled = false,
}) {
  final lockedLevel = getLockedCommunityUnreadBadgesLevel(
    guildSettings: guildSettings,
    now: DateTime.now(),
  );
  if (lockedLevel != null) {
    return lockedLevel;
  }
  return _resolvedUnreadBadgeLevel(
    channel: channel,
    guildSettings: guildSettings,
    unreadBadgeCustomizationEnabled: unreadBadgeCustomizationEnabled,
  );
}

UserNotificationSettings? resolveExplicitUnreadBadgeLevel({
  required db.Channel channel,
  required UserGuildSettingsResponse? guildSettings,
  bool unreadBadgeCustomizationEnabled = false,
}) {
  return _resolvedUnreadBadgeLevel(
    channel: channel,
    guildSettings: guildSettings,
    unreadBadgeCustomizationEnabled: unreadBadgeCustomizationEnabled,
  );
}

ResolvedUnreadSettings resolveChannelUnreadSettings({
  required db.Channel channel,
  required UserGuildSettingsResponse? guildSettings,
  required DateTime now,
  bool unreadBadgeCustomizationEnabled = false,
}) {
  final badgeLevel =
      resolveUnreadBadgesLevel(
        channel: channel,
        guildSettings: guildSettings,
        unreadBadgeCustomizationEnabled: unreadBadgeCustomizationEnabled,
      ) ??
      UserNotificationSettings.allMessages;
  return ResolvedUnreadSettings(
    isMuted: isChannelDirectlyMuted(
      channel: channel,
      guildSettings: guildSettings,
      now: now,
    ),
    allowsMessageUnread: badgeLevel == UserNotificationSettings.allMessages,
    allowsMentionUnread: badgeLevel != UserNotificationSettings.noMessages,
  );
}

ResolvedUnreadSettings resolveUnreadSettings({
  required db.Channel channel,
  required UserGuildSettingsResponse? guildSettings,
  required DateTime now,
  bool unreadBadgeCustomizationEnabled = false,
}) {
  return resolveChannelUnreadSettings(
    channel: channel,
    guildSettings: guildSettings,
    now: now,
    unreadBadgeCustomizationEnabled: unreadBadgeCustomizationEnabled,
  );
}

bool isGuildOrCategoryOrChannelMuted({
  required db.Channel channel,
  required UserGuildSettingsResponse? guildSettings,
  required DateTime now,
}) {
  if (_isGuildMuted(guildSettings, now)) {
    return true;
  }
  final overrides = guildSettings?.channelOverrides ?? const {};
  final parentOverride = channel.parentId == null
      ? null
      : overrides[channel.parentId!];
  if (_isChannelMuted(parentOverride, now)) {
    return true;
  }
  return _isChannelMuted(overrides[channel.id], now);
}

bool isChannelDirectlyMuted({
  required db.Channel channel,
  required UserGuildSettingsResponse? guildSettings,
  required DateTime now,
}) {
  final overrides = guildSettings?.channelOverrides ?? const {};
  return _isChannelMuted(overrides[channel.id], now);
}

bool isChannelOverrideMuted(
  ChannelOverrides? override, {
  required DateTime now,
}) {
  return _isChannelMuted(override, now);
}

UserNotificationSettings? _resolvedUnreadBadgeLevel({
  required db.Channel channel,
  required UserGuildSettingsResponse? guildSettings,
  required bool unreadBadgeCustomizationEnabled,
}) {
  if (!unreadBadgeCustomizationEnabled) {
    return null;
  }
  final overrides = guildSettings?.channelOverrides ?? const {};
  final directOverride = overrides[channel.id];
  final parentOverride = channel.parentId == null
      ? null
      : overrides[channel.parentId!];
  return _explicitLevel(directOverride?.unreadBadges) ??
      _explicitLevel(parentOverride?.unreadBadges) ??
      _explicitLevel(guildSettings?.unreadBadges);
}

bool _isGuildMuted(UserGuildSettingsResponse? settings, DateTime now) {
  if (settings?.muted != true) {
    return false;
  }
  return _isMuteActive(settings?.muteConfig?.endTime, now);
}

bool _isChannelMuted(ChannelOverrides? override, DateTime now) {
  if (override?.muted != true) {
    return false;
  }
  return _isMuteActive(override?.muteConfig?.endTime, now);
}

bool _isMuteActive(String? endTime, DateTime now) {
  if (endTime == null || endTime.isEmpty) {
    return true;
  }
  final parsed = DateTime.tryParse(endTime);
  return parsed == null || parsed.isAfter(now);
}

UserNotificationSettings? _explicitLevel(UserNotificationSettings? level) {
  if (level == null ||
      level == UserNotificationSettings.inherit ||
      level == UserNotificationSettings.$unknown) {
    return null;
  }
  return level;
}

UserNotificationSettings resolveMessageNotifications({
  required db.Channel channel,
  required UserGuildSettingsResponse? guildSettings,
}) {
  final overrides = guildSettings?.channelOverrides ?? const {};
  final direct = _explicitLevel(overrides[channel.id]?.messageNotifications);
  if (direct != null) {
    return direct;
  }
  if (channel.parentId != null) {
    final parent = _explicitLevel(
      overrides[channel.parentId!]?.messageNotifications,
    );
    if (parent != null) {
      return parent;
    }
  }
  return guildSettings?.messageNotifications ??
      UserNotificationSettings.allMessages;
}

bool shouldShowChannelInUnreadInbox({
  required db.Channel channel,
  required UserGuildSettingsResponse? guildSettings,
  required bool hasUnread,
  required bool hasMentions,
  required DateTime now,
  bool unreadBadgeCustomizationEnabled = false,
}) {
  final level = resolveUnreadBadgesLevel(
    channel: channel,
    guildSettings: guildSettings,
    unreadBadgeCustomizationEnabled: unreadBadgeCustomizationEnabled,
  );
  if (level != null) {
    return _shouldShowUnreadInboxStateAtLevel(
      level,
      hasUnread: hasUnread,
      hasMentions: hasMentions,
    );
  }
  if (isGuildOrCategoryOrChannelMuted(
    channel: channel,
    guildSettings: guildSettings,
    now: now,
  )) {
    return false;
  }
  return _shouldShowUnreadInboxStateAtLevel(
    resolveMessageNotifications(channel: channel, guildSettings: guildSettings),
    hasUnread: hasUnread,
    hasMentions: hasMentions,
  );
}

bool _shouldShowUnreadInboxStateAtLevel(
  UserNotificationSettings level, {
  required bool hasUnread,
  required bool hasMentions,
}) {
  if (level == UserNotificationSettings.noMessages) {
    return false;
  }
  if (level == UserNotificationSettings.onlyMentions) {
    return hasMentions;
  }
  return hasUnread || hasMentions;
}
