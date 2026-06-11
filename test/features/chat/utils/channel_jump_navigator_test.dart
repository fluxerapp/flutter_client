import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';

void main() {
  group('buildChannelJumpRoutePath', () {
    test('builds DM channel path without message', () {
      expect(buildChannelJumpRoutePath(channelId: '100'), '/channels/@me/100');
    });

    test('builds DM message path', () {
      expect(
        buildChannelJumpRoutePath(channelId: '100', messageId: '200'),
        '/channels/@me/100/200',
      );
    });

    test('builds guild channel path without message', () {
      expect(
        buildChannelJumpRoutePath(channelId: '200', guildId: '100'),
        '/channels/100/200',
      );
    });

    test('builds guild message path', () {
      expect(
        buildChannelJumpRoutePath(
          channelId: '200',
          guildId: '300',
          messageId: '400',
        ),
        '/channels/300/200/400',
      );
    });

    test('prefers resolved guild id over url scope when building path', () {
      const String urlScopeGuildId = '111111111111111111';
      const String resolvedGuildId = '222222222222222222';
      expect(
        buildChannelJumpRoutePath(
          channelId: '333333333333333333',
          guildId: resolvedGuildId,
          messageId: '444444444444444444',
        ),
        '/channels/$resolvedGuildId/333333333333333333/444444444444444444',
      );
      expect(urlScopeGuildId, isNot(resolvedGuildId));
    });
  });

  group('channelJumpLinkFromPathSegments', () {
    test('parses guild message link segments', () {
      final ChannelJumpLink? link = channelJumpLinkFromPathSegments(<String>[
        'channels',
        '100',
        '200',
        '300',
      ]);
      expect(link, isA<MessageJumpLink>());
      final MessageJumpLink messageLink = link! as MessageJumpLink;
      expect(messageLink.scope, '100');
      expect(messageLink.channelId, '200');
      expect(messageLink.messageId, '300');
    });

    test('parses guild channel link segments', () {
      final ChannelJumpLink? link = channelJumpLinkFromPathSegments(<String>[
        'channels',
        '100',
        '200',
      ]);
      expect(link, isA<ChannelJumpLink>());
      expect(link!.scope, '100');
      expect(link.channelId, '200');
    });

    test('returns null for guild-only path', () {
      expect(
        channelJumpLinkFromPathSegments(<String>['channels', '100']),
        isNull,
      );
    });
  });

  group('ChannelJumpResolution types', () {
    test('access denied is distinct from navigation', () {
      const ChannelJumpAccessDenied denied = ChannelJumpAccessDenied();
      const ChannelJumpNavigate navigate = ChannelJumpNavigate(
        path: '/channels/1/2/3',
        channelId: '2',
        messageId: '3',
      );
      expect(denied, isA<ChannelJumpResolution>());
      expect(navigate, isA<ChannelJumpResolution>());
      expect(denied, isNot(isA<ChannelJumpNavigate>()));
    });
  });
}
