import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:go_router/go_router.dart';

void main() {
  group('Home tab return', () {
    testWidgets('restores the last guild channel route from notifications', (
      tester,
    ) async {
      const String guildChannelPath = '/channels/guild/channel';
      StatefulNavigationShell? navigationShell;
      final GoRouter router = _shellRouterFor(
        guildChannelPath,
        onShellBuilt: (StatefulNavigationShell shell) {
          navigationShell = shell;
        },
      );
      addTearDown(router.dispose);
      final ProviderContainer container = _containerFor(router);

      await tester.pumpWidget(
        _buildShellApp(container: container, router: router),
      );
      await tester.pumpAndSettle();

      expect(navigationShell, isNotNull);
      expect(router.routeInformationProvider.value.uri.path, guildChannelPath);
      DrawerNavigationCoordinator.syncForShellLocation(
        container,
        guildChannelPath,
      );
      expect(container.read(currentRevealSideProvider), RevealSide.main);

      navigationShell!.goBranch(shellNotificationsBranchIndex);
      await tester.pumpAndSettle();
      expect(router.routeInformationProvider.value.uri.path, '/notifications');

      navigationShell!.goBranch(shellHomeBranchIndex);
      await tester.pumpAndSettle();

      expect(router.routeInformationProvider.value.uri.path, guildChannelPath);
      DrawerNavigationCoordinator.syncForShellLocation(
        container,
        guildChannelPath,
      );
      expect(container.read(currentRevealSideProvider), RevealSide.main);
    });

    testWidgets(
      'resets to DMs root when Home is tapped while already on Home',
      (tester) async {
        const String guildChannelPath = '/channels/guild/channel';
        StatefulNavigationShell? navigationShell;
        final GoRouter router = _shellRouterFor(
          guildChannelPath,
          onShellBuilt: (StatefulNavigationShell shell) {
            navigationShell = shell;
          },
        );
        addTearDown(router.dispose);
        final ProviderContainer container = _containerFor(router);

        await tester.pumpWidget(
          _buildShellApp(container: container, router: router),
        );
        await tester.pumpAndSettle();

        navigationShell!.goBranch(shellHomeBranchIndex, initialLocation: true);
        await tester.pumpAndSettle();

        expect(router.routeInformationProvider.value.uri.path, RoutePaths.me);
      },
    );
  });
}

GoRouter _shellRouterFor(
  String initialLocation, {
  required void Function(StatefulNavigationShell shell) onShellBuilt,
}) {
  final GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>(
    debugLabel: 'home',
  );
  final GlobalKey<NavigatorState> notifKey = GlobalKey<NavigatorState>(
    debugLabel: 'notif',
  );

  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      StatefulShellRoute.indexedStack(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) {
              onShellBuilt(navigationShell);
              return navigationShell;
            },
        branches: [
          StatefulShellBranch(
            navigatorKey: homeKey,
            routes: [
              GoRoute(
                path: '/channels/@me',
                builder: (BuildContext context, GoRouterState state) =>
                    const Text('dms'),
                routes: [
                  GoRoute(
                    path: ':channelId',
                    builder: (BuildContext context, GoRouterState state) =>
                        const Text('dm-chat'),
                  ),
                ],
              ),
              GoRoute(
                path: '/channels/:guildId',
                builder: (BuildContext context, GoRouterState state) =>
                    const Text('guild'),
                routes: [
                  GoRoute(
                    path: ':channelId',
                    builder: (BuildContext context, GoRouterState state) =>
                        const Text('chat'),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: notifKey,
            routes: [
              GoRoute(
                path: '/notifications',
                builder: (BuildContext context, GoRouterState state) =>
                    const Text('notifications'),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

ProviderContainer _containerFor(GoRouter router) {
  final ProviderContainer container = ProviderContainer(
    overrides: [fluxerRouterProvider.overrideWithValue(router)],
  );
  addTearDown(container.dispose);
  return container;
}

Widget _buildShellApp({
  required ProviderContainer container,
  required GoRouter router,
}) {
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp.router(
      routerConfig: router,
      builder: (BuildContext context, Widget? child) => MediaQuery(
        data: const MediaQueryData(size: Size(400, 800)),
        child: child ?? const SizedBox.shrink(),
      ),
    ),
  );
}
