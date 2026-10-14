import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/link_channel_route_handler.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../../helpers/open_test_database.dart';

void main() {
  const String guildId = '111111111111111111';
  const String textChannelId = '222222222222222222';
  const String linkChannelId = '333333333333333333';

  testWidgets('a deep link to a link channel with a Fluxer channel URL ends '
      'on that channel, not the guild', (tester) async {
    final db.FluxerDatabase database = openTestDatabase();
    await tester.runAsync(() async {
      await database.channelDao.upsertChannel(
        db.ChannelsCompanion.insert(
          id: textChannelId,
          guildId: guildId,
          name: 'general',
        ),
      );
      await database.channelDao.upsertChannel(
        db.ChannelsCompanion.insert(
          id: linkChannelId,
          guildId: guildId,
          name: 'rules-link',
          type: Value<int>(ChannelType.guildLink.wireValue),
          url: const Value<String?>(
            'https://web.fluxer.app/channels/$guildId/$textChannelId',
          ),
        ),
      );
    });
    final db.Channel? row = await tester.runAsync<db.Channel?>(
      () => database.channelDao.getChannelById(linkChannelId),
    );
    final Channel linkChannel = Channel.fromRow(row!);

    final GoRouter router = GoRouter(
      initialLocation: '/channels/$guildId/$linkChannelId',
      routes: <RouteBase>[
        GoRoute(
          path: '/channels/:guildId',
          builder: (_, _) => const Text('guild'),
        ),
        GoRoute(
          path: '/channels/:guildId/:channelId',
          builder: (_, GoRouterState state) =>
              state.pathParameters['channelId'] == linkChannelId
              ? LinkChannelRouteHandler(
                  guildId: guildId,
                  channel: linkChannel,
                  child: const SizedBox.shrink(),
                )
              : const Text('channel'),
        ),
      ],
    );
    addTearDown(router.dispose);
    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(database),
        activeChannelIdProvider.overrideWithValue(null),
        fluxerRouterProvider.overrideWithValue(router),
        matureContentGateReasonProvider(textChannelId).overrideWith(
          (ref) => Future<MatureContentGateReason>.value(
            MatureContentGateReason.none,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);
    container.read(gatewayReadyProvider.notifier).setReady();

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    for (int i = 0; i < 10; i++) {
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pump();
    }

    expect(
      router.routeInformationProvider.value.uri.path,
      '/channels/$guildId/$textChannelId',
    );
    expect(find.text('channel'), findsOneWidget);
  });
}
