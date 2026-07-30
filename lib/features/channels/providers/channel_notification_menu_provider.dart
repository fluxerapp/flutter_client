import 'dart:convert';

import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod/src/providers/stream_provider.dart';

class ChannelNotificationMenuState {
  const ChannelNotificationMenuState({
    required this.isMuted,
    required this.selected,
    required this.effectiveDefault,
    required this.hasCategory,
    this.muteConfig,
  });

  final bool isMuted;
  final ChannelOverridesMuteConfig? muteConfig;
  final UserNotificationSettings selected;
  final UserNotificationSettings effectiveDefault;
  final bool hasCategory;
}

final StreamProviderFamily<ChannelNotificationMenuState, Channel>
channelNotificationMenuStateProvider = StreamProvider.autoDispose
    .family<ChannelNotificationMenuState, Channel>((ref, channel) {
      final db = ref.watch(fluxerDatabaseProvider);
      return db.userGuildSettingsDao.watchByGuildId(channel.guildId).map((
        settings,
      ) {
        return parseChannelNotificationMenuState(channel, settings?.data);
      });
    });

ChannelNotificationMenuState parseChannelNotificationMenuState(
  Channel channel,
  String? settingsData,
) {
  var selected = UserNotificationSettings.inherit;
  var guildDefault = UserNotificationSettings.allMessages;
  var categoryOverride = UserNotificationSettings.inherit;
  var isMuted = false;
  ChannelOverridesMuteConfig? muteConfig;

  if (settingsData != null) {
    try {
      final UserGuildSettingsResponse settings =
          UserGuildSettingsResponse.fromJson(
            jsonDecode(settingsData) as Map<String, dynamic>,
          );
      final ChannelOverrides? channelOverride =
          settings.channelOverrides?[channel.id];
      selected =
          channelOverride?.messageNotifications ??
          UserNotificationSettings.inherit;
      isMuted = channelOverride?.muted ?? false;
      muteConfig = channelOverride?.muteConfig;
      guildDefault = settings.messageNotifications;
      if (channel.parentId != null) {
        categoryOverride =
            settings
                .channelOverrides?[channel.parentId]
                ?.messageNotifications ??
            UserNotificationSettings.inherit;
      }
    } on Object {
      // Malformed override JSON falls back to defaults.
    }
  }

  final UserNotificationSettings effectiveDefault =
      categoryOverride == UserNotificationSettings.inherit
      ? guildDefault
      : categoryOverride;

  return ChannelNotificationMenuState(
    isMuted: isMuted,
    muteConfig: muteConfig,
    selected: selected,
    effectiveDefault: effectiveDefault,
    hasCategory: channel.parentId != null,
  );
}

String channelNotificationLevelLabel(
  FluxerLocalizations l10n,
  UserNotificationSettings setting,
) {
  return switch (setting) {
    UserNotificationSettings.allMessages => l10n.notificationAllMessages,
    UserNotificationSettings.onlyMentions => l10n.notificationOnlyAtMentions,
    UserNotificationSettings.noMessages => l10n.notificationNothing,
    UserNotificationSettings.inherit ||
    UserNotificationSettings.$unknown => l10n.notificationAllMessages,
  };
}
