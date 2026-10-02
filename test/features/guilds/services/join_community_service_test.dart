import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/guilds/services/join_community_service.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('guildInviteNavigationPath', () {
    test('opens text channel invites on the channel route', () {
      expect(
        guildInviteNavigationPath(
          guildId: 'g1',
          channelType: ChannelType.guildText,
          channelId: 'c1',
        ),
        RoutePaths.guildChannel('g1', 'c1'),
      );
    });

    test('category and link invites land on the community root', () {
      expect(
        guildInviteNavigationPath(
          guildId: 'g1',
          channelType: ChannelType.guildCategory,
          channelId: 'cat',
        ),
        RoutePaths.guild('g1'),
      );
      expect(
        guildInviteNavigationPath(
          guildId: 'g1',
          channelType: ChannelType.guildLink,
          channelId: 'link',
        ),
        RoutePaths.guild('g1'),
      );
    });
  });
}
