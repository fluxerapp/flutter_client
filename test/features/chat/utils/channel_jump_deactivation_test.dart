import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/open_test_database.dart';

/// The jump path is entered from a search sheet that the same tap dismisses,
/// so the BuildContext dies at several different points. Navigation must
/// still complete, and a required gate must still be honoured rather than
/// skipped, which is the failure mode that let a dead context walk straight
/// past the gate.
void main() {
  const String guildId = '111111111111111111';
  const String channelId = '222222222222222222';
  const String messageId = '333333333333333333';
  const String targetPath = '/channels/$guildId/$channelId/$messageId';

  const MessageJumpLink link = MessageJumpLink(
    scope: guildId,
    channelId: channelId,
    messageId: messageId,
  );

  late FluxerDatabase database;
  late GoRouter router;

  GoRouter buildRouter() {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(path: '/', builder: (_, _) => const Text('home')),
        GoRoute(
          path: '/channels/:guildId/:channelId/:messageId',
          builder: (_, _) => const Text('message'),
        ),
      ],
    );
  }

  String currentPath() => router.routeInformationProvider.value.uri.path;

  /// [gateReason] drives whether a gate is required; the reason is resolved
  /// from the container, so it does not need a context.
  ProviderContainer buildContainer({
    MatureContentGateReason gateReason = MatureContentGateReason.none,
  }) {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(database),
        activeChannelIdProvider.overrideWithValue(null),
        fluxerRouterProvider.overrideWithValue(router),
        matureContentGateReasonProvider(channelId).overrideWith(
          (ref) => Future<MatureContentGateReason>.value(gateReason),
        ),
      ],
    );
    addTearDown(container.dispose);
    container.read(gatewayReadyProvider.notifier).setReady();
    return container;
  }

  /// Mounts a throwaway widget and returns its context, still alive.
  Future<BuildContext> mountedContext(WidgetTester tester) async {
    late BuildContext captured;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            captured = context;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    return captured;
  }

  setUp(() async {
    database = openTestDatabase();
    router = buildRouter();
    addTearDown(router.dispose);
    await database.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: channelId,
        guildId: guildId,
        name: 'general',
      ),
    );
  });

  testWidgets('navigates when the context is already dead on entry', (
    tester,
  ) async {
    final ProviderContainer container = buildContainer();
    final BuildContext dead = await mountedContext(tester);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
    expect(dead.mounted, isFalse, reason: 'the harness must really kill it');

    await navigateToChannelJumpLink(
      container: container,
      link: link,
      context: dead,
    );
    await tester.pumpAndSettle();

    expect(currentPath(), targetPath);
  });

  testWidgets('navigates when the context dies during the channel lookup', (
    tester,
  ) async {
    final ProviderContainer container = buildContainer();
    final BuildContext live = await mountedContext(tester);

    final Future<void> jump = navigateToChannelJumpLink(
      container: container,
      link: link,
      context: live,
    );
    // Kill it mid flight, which is the window the old code guarded by
    // returning early and dropping the jump.
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
    await jump;
    await tester.pumpAndSettle();

    expect(live.mounted, isFalse);
    expect(currentPath(), targetPath);
  });

  testWidgets('does not navigate when a gate is required and no context '
      'exists at all', (tester) async {
    final ProviderContainer container = buildContainer(
      gateReason: MatureContentGateReason.consentRequired,
    );

    await navigateToChannelJumpLink(container: container, link: link);
    await tester.pumpAndSettle();

    expect(
      currentPath(),
      '/',
      reason: 'fail closed: no context means no gate, so no navigation',
    );
  });

  testWidgets('navigates with no context at all when no gate is required', (
    tester,
  ) async {
    final ProviderContainer container = buildContainer();

    await navigateToChannelJumpLink(container: container, link: link);
    await tester.pumpAndSettle();

    expect(
      currentPath(),
      targetPath,
      reason: 'an ungated channel needs no context to be reached',
    );
  });
}
