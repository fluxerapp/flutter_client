import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';

import '../../../helpers/open_test_database.dart';

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

  group('resolveChannelJumpLink', () {
    const String guildId = '111111111111111111';
    const String channelId = '222222222222222222';
    const String messageId = '333333333333333333';

    late FluxerDatabase database;
    late ProviderContainer container;

    setUp(() {
      database = openTestDatabase();
      container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(database),
          activeChannelIdProvider.overrideWithValue(null),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test(
      'returns access denied when guild channel is missing and gateway is ready',
      () async {
        container.read(gatewayReadyProvider.notifier).setReady();
        const MessageJumpLink link = MessageJumpLink(
          scope: guildId,
          channelId: channelId,
          messageId: messageId,
        );
        final ChannelJumpResolution resolution = await resolveChannelJumpLink(
          container: container,
          link: link,
        );
        expect(resolution, isA<ChannelJumpAccessDenied>());
      },
    );

    test(
      'returns pending when guild channel is missing and gateway is not ready',
      () async {
        const MessageJumpLink link = MessageJumpLink(
          scope: guildId,
          channelId: channelId,
          messageId: messageId,
        );
        final ChannelJumpResolution resolution = await resolveChannelJumpLink(
          container: container,
          link: link,
        );
        expect(resolution, isA<ChannelJumpPending>());
        expect(
          (resolution as ChannelJumpPending).path,
          '/channels/$guildId/$channelId/$messageId',
        );
      },
    );

    test('returns navigate when guild channel exists', () async {
      container.read(gatewayReadyProvider.notifier).setReady();
      await database.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: guildId,
          name: 'general',
        ),
      );
      const MessageJumpLink link = MessageJumpLink(
        scope: guildId,
        channelId: channelId,
        messageId: messageId,
      );
      final ChannelJumpResolution resolution = await resolveChannelJumpLink(
        container: container,
        link: link,
      );
      expect(resolution, isA<ChannelJumpNavigate>());
      final ChannelJumpNavigate navigate = resolution as ChannelJumpNavigate;
      expect(navigate.path, '/channels/$guildId/$channelId/$messageId');
      expect(navigate.channelId, channelId);
      expect(navigate.messageId, messageId);
    });

    test('returns open link when guild channel is a link channel', () async {
      container.read(gatewayReadyProvider.notifier).setReady();
      await database.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: guildId,
          name: 'rules-link',
          type: Value(ChannelType.guildLink.wireValue),
          url: const Value('https://example.com/rules'),
        ),
      );
      const ChannelJumpLink link = ChannelJumpLink(
        scope: guildId,
        channelId: channelId,
      );
      final ChannelJumpResolution resolution = await resolveChannelJumpLink(
        container: container,
        link: link,
      );
      expect(resolution, isA<ChannelJumpOpenLink>());
      final ChannelJumpOpenLink openLink = resolution as ChannelJumpOpenLink;
      expect(openLink.channelId, channelId);
      expect(openLink.guildId, guildId);
    });

    test(
      'returns open link for message jump when guild channel is a link channel',
      () async {
        container.read(gatewayReadyProvider.notifier).setReady();
        await database.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: channelId,
            guildId: guildId,
            name: 'rules-link',
            type: Value(ChannelType.guildLink.wireValue),
            url: const Value('https://example.com/rules'),
          ),
        );
        const MessageJumpLink link = MessageJumpLink(
          scope: guildId,
          channelId: channelId,
          messageId: messageId,
        );
        final ChannelJumpResolution resolution = await resolveChannelJumpLink(
          container: container,
          link: link,
        );
        expect(resolution, isA<ChannelJumpOpenLink>());
      },
    );

    test('returns redirect guild when guild channel is a category', () async {
      container.read(gatewayReadyProvider.notifier).setReady();
      await database.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: guildId,
          name: 'category',
          type: Value(ChannelType.guildCategory.wireValue),
        ),
      );
      const ChannelJumpLink link = ChannelJumpLink(
        scope: guildId,
        channelId: channelId,
      );
      final ChannelJumpResolution resolution = await resolveChannelJumpLink(
        container: container,
        link: link,
      );
      expect(resolution, isA<ChannelJumpRedirectGuild>());
      expect((resolution as ChannelJumpRedirectGuild).guildId, guildId);
    });
  });
}
