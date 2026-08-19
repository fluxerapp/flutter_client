import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_notification_menu_provider.dart';
import 'package:fluxer_app/features/guilds/utils/guild_notification_resolution.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('parseChannelNotificationMenuState', () {
    const Channel channel = Channel(
      id: 'channel-1',
      guildId: 'guild-1',
      name: 'general',
    );

    test('resolves inherited community default from guild context', () {
      final ChannelNotificationMenuState state =
          parseChannelNotificationMenuState(
            channel,
            jsonEncode(
              const UserGuildSettingsResponse(
                guildId: 'guild-1',
                messageNotifications: UserNotificationSettings.inherit,
                muted: false,
                muteConfig: null,
                mobilePush: true,
                suppressEveryone: false,
                suppressRoles: false,
                hideMutedChannels: false,
                channelOverrides: null,
                version: 1,
              ).toJson(),
            ),
            guildContext: const GuildNotificationContext(
              defaultMessageNotifications: 1,
            ),
          );

      expect(state.effectiveDefault, UserNotificationSettings.onlyMentions);
    });
  });
}
