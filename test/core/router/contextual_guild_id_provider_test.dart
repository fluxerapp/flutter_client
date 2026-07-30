import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';

void main() {
  group('contextualGuildIdProvider', () {
    test('returns route guild ID without reading channel guild provider', () {
      var channelGuildIdReads = 0;
      final ProviderContainer container = ProviderContainer(
        overrides: [
          routeStateProvider.overrideWithValue(
            _routeState(
              location: '/channels/guild-1/channel-1',
              guildId: 'guild-1',
              channelId: 'channel-1',
            ),
          ),
          channelGuildIdProvider('channel-1').overrideWith((Ref ref) {
            channelGuildIdReads++;
            return Stream<String?>.value('guild-from-db');
          }),
        ],
      );
      addTearDown(container.dispose);

      expect(container.read(contextualGuildIdProvider), 'guild-1');
      expect(channelGuildIdReads, 0);
    });

    test(
      'resolves guild ID from channel when route has no guild segment',
      () async {
        final ProviderContainer container = ProviderContainer(
          overrides: [
            routeStateProvider.overrideWithValue(
              _routeState(
                location: '/channels/@favorites/channel-1',
                guildId: null,
                channelId: 'channel-1',
              ),
            ),
            channelGuildIdProvider(
              'channel-1',
            ).overrideWith((Ref ref) => Stream<String?>.value('guild-from-db')),
          ],
        );
        addTearDown(container.dispose);
        final ProviderSubscription<String?> subscription = container.listen(
          contextualGuildIdProvider,
          (_, _) {},
          fireImmediately: true,
        );
        addTearDown(subscription.close);

        await Future<void>.delayed(Duration.zero);

        expect(container.read(contextualGuildIdProvider), 'guild-from-db');
      },
    );

    test('returns null for DM routes without a guild channel', () {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          routeStateProvider.overrideWithValue(
            _routeState(
              location: '/channels/@me/dm-1',
              guildId: null,
              channelId: 'dm-1',
            ),
          ),
          channelGuildIdProvider(
            'dm-1',
          ).overrideWith((Ref ref) => Stream<String?>.value(null)),
        ],
      );
      addTearDown(container.dispose);

      expect(container.read(contextualGuildIdProvider), isNull);
    });
  });
}

RouteState _routeState({
  required String location,
  required String? guildId,
  required String? channelId,
}) {
  return RouteState(
    location: location,
    activeBranchLocation: location,
    activeBranchIndex: 0,
    kind: classifyRoute(location),
    guildId: guildId,
    channelId: channelId,
  );
}
