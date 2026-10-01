import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';

void main() {
  const String guildId = '123456789012345678';
  const String channelId = '987654321098765432';
  const String messageId = '111111111111111111';

  group('isChannelJumpHost', () {
    test('accepts official hosts', () {
      for (final String host in kOfficialChannelJumpHosts) {
        expect(isChannelJumpHost(host), isTrue, reason: host);
        expect(isChannelJumpHost(host.toUpperCase()), isTrue, reason: host);
      }
    });

    test('accepts instance webapp host', () {
      expect(
        isChannelJumpHost(
          'chat.example.com',
          instanceWebAppBase: 'https://chat.example.com',
        ),
        isTrue,
      );
    });

    test('rejects unknown hosts', () {
      expect(isChannelJumpHost('api.fluxer.app'), isFalse);
      expect(isChannelJumpHost('example.com'), isFalse);
      expect(isChannelJumpHost(''), isFalse);
    });
  });

  group('channelJumpLinkHosts', () {
    test('includes official hosts and instance host', () {
      final Set<String> hosts = channelJumpLinkHosts(
        instanceWebAppBase: 'https://chat.example.com',
      );
      expect(hosts, containsAll(kOfficialChannelJumpHosts));
      expect(hosts, contains('chat.example.com'));
    });

    test('deduplicates when instance host is official', () {
      final Set<String> hosts = channelJumpLinkHosts(
        instanceWebAppBase: 'https://web.fluxer.app',
      );
      expect(hosts.length, kOfficialChannelJumpHosts.length);
    });
  });

  group('channelJumpHostFromBaseUrl', () {
    test('extracts host with and without scheme', () {
      expect(
        channelJumpHostFromBaseUrl('https://chat.example.com'),
        'chat.example.com',
      );
      expect(
        channelJumpHostFromBaseUrl('chat.example.com'),
        'chat.example.com',
      );
    });

    test('returns null for empty input', () {
      expect(channelJumpHostFromBaseUrl(''), isNull);
      expect(channelJumpHostFromBaseUrl('   '), isNull);
    });
  });

  group('buildChannelJumpLinkPattern', () {
    test('matches channel and message links for configured hosts', () {
      final RegExp pattern = buildChannelJumpLinkPattern(<String>{
        'web.fluxer.app',
        'chat.example.com',
      });
      expect(
        pattern.hasMatch('https://web.fluxer.app/channels/$guildId/$channelId'),
        isTrue,
      );
      expect(
        pattern.hasMatch(
          'https://chat.example.com/channels/@me/$channelId/$messageId',
        ),
        isTrue,
      );
      expect(
        pattern.hasMatch('https://api.fluxer.app/channels/$guildId/$channelId'),
        isFalse,
      );
    });
  });

  test('the instance pattern follows a web app change after caching', () {
    addTearDown(InstanceEndpoints.resetToDefaults);
    const String link = 'https://chat.example.com/channels/@me/$channelId';

    InstanceEndpoints.webApp = 'https://web.fluxer.app';
    expect(instanceChannelJumpLinkPattern().hasMatch(link), isFalse);

    InstanceEndpoints.webApp = 'https://chat.example.com';
    expect(instanceChannelJumpLinkPattern().hasMatch(link), isTrue);
  });

  group('parseChannelJumpLink', () {
    for (final String host in kOfficialChannelJumpHosts) {
      test('parses guild channel link on $host', () {
        final ChannelJumpLink? link = parseChannelJumpLink(
          'https://$host/channels/$guildId/$channelId',
        );
        expect(link, isA<ChannelJumpLink>());
        expect(link!.scope, guildId);
        expect(link.channelId, channelId);
        expect(link.isDm, isFalse);
      });

      test('parses DM channel link on $host', () {
        final ChannelJumpLink? link = parseChannelJumpLink(
          'https://$host/channels/@me/$channelId',
        );
        expect(link, isA<ChannelJumpLink>());
        expect(link!.scope, '@me');
        expect(link.channelId, channelId);
        expect(link.isDm, isTrue);
      });

      test('parses message link on $host', () {
        final ChannelJumpLink? link = parseChannelJumpLink(
          'https://$host/channels/$guildId/$channelId/$messageId',
        );
        expect(link, isA<MessageJumpLink>());
        final MessageJumpLink messageLink = link! as MessageJumpLink;
        expect(messageLink.scope, guildId);
        expect(messageLink.channelId, channelId);
        expect(messageLink.messageId, messageId);
      });
    }

    test('parses self-hosted instance link', () {
      final ChannelJumpLink? link = parseChannelJumpLink(
        'https://chat.example.com/channels/$guildId/$channelId',
        instanceWebAppBase: 'https://chat.example.com',
      );
      expect(link, isA<ChannelJumpLink>());
      expect(link!.scope, guildId);
      expect(link.channelId, channelId);
    });

    test('returns null for api host', () {
      expect(
        parseChannelJumpLink(
          'https://api.fluxer.app/channels/$guildId/$channelId',
        ),
        isNull,
      );
    });

    test('returns null for unknown host', () {
      expect(
        parseChannelJumpLink(
          'https://example.com/channels/$guildId/$channelId',
        ),
        isNull,
      );
    });

    test('returns null for invalid path', () {
      expect(
        parseChannelJumpLink(
          'https://fluxer.app/not-channels/$guildId/$channelId',
        ),
        isNull,
      );
      expect(
        parseChannelJumpLink('https://fluxer.app/channels/$guildId'),
        isNull,
      );
    });

    test('returns null for non-snowflake ids', () {
      expect(
        parseChannelJumpLink(
          'https://fluxer.app/channels/not-a-snowflake/$channelId',
        ),
        isNull,
      );
      expect(
        parseChannelJumpLink(
          'https://fluxer.app/channels/$guildId/not-a-snowflake',
        ),
        isNull,
      );
    });
  });
}
