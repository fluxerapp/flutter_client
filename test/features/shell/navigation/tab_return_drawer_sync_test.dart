import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/navigation/shell_layout_mode.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/material_ui.dart';
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

  group('Home branch stack survives tab round trips', () {
    for (final ({String name, String path}) route
        in <({String name, String path})>[
          (name: 'community root', path: '/channels/guild'),
          (name: 'DM list root', path: RoutePaths.me),
          (name: 'guild channel', path: '/channels/guild/channel'),
        ]) {
      for (final int branch in <int>[
        shellNotificationsBranchIndex,
        shellYouBranchIndex,
      ]) {
        testWidgets('${route.name} survives a trip through branch $branch', (
          tester,
        ) async {
          StatefulNavigationShell? navigationShell;
          final GoRouter router = _shellRouterFor(
            route.path,
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
          expect(router.routeInformationProvider.value.uri.path, route.path);
          expect(
            find.byType(StatefulNavigationShell),
            findsOneWidget,
            reason:
                'the shell must stay mounted on ${route.path}; unmounting it '
                'discards the saved branch route stacks (issue #463)',
          );
          final StatefulNavigationShellState shellState = tester.state(
            find.byType(StatefulNavigationShell),
          );

          navigationShell!.goBranch(branch);
          await tester.pumpAndSettle();
          expect(
            router.routeInformationProvider.value.uri.path,
            branch == shellNotificationsBranchIndex ? '/notifications' : '/you',
          );

          navigationShell!.goBranch(shellHomeBranchIndex);
          await tester.pumpAndSettle();

          expect(router.routeInformationProvider.value.uri.path, route.path);
          expect(
            tester.state(find.byType(StatefulNavigationShell)),
            same(shellState),
          );
        });
      }
    }
  });

  group('Home branch return with route-state consumers', () {
    for (final String path in <String>[
      '/channels/guild',
      RoutePaths.me,
      '/channels/guild/channel',
    ]) {
      testWidgets('returning to Home from $path does not throw', (
        tester,
      ) async {
        StatefulNavigationShell? navigationShell;
        final GoRouter router = _shellRouterFor(
          path,
          watchRouteState: true,
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
        expect(tester.takeException(), isNull);

        navigationShell!.goBranch(shellNotificationsBranchIndex);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);

        navigationShell!.goBranch(shellHomeBranchIndex);
        await tester.pumpAndSettle();
        final Object? resumeError = tester.takeException();
        expect(router.routeInformationProvider.value.uri.path, path);
        expect(
          find.text('${_labelFor(path)}|context:$path'),
          findsOneWidget,
          reason:
              'the branch subtree must observe the current location after '
              'the resume, not a value from before the branch switch',
        );
        expect(
          resumeError,
          isNull,
          reason:
              'resuming the Home subtree must not invalidate a route-state '
              'provider during the build phase',
        );
      });
    }
  });
}

GoRouter _shellRouterFor(
  String initialLocation, {
  required void Function(StatefulNavigationShell shell) onShellBuilt,
  bool watchRouteState = false,
}) {
  final GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>(
    debugLabel: 'home',
  );
  final GlobalKey<NavigatorState> notifKey = GlobalKey<NavigatorState>(
    debugLabel: 'notif',
  );
  final GlobalKey<NavigatorState> youKey = GlobalKey<NavigatorState>(
    debugLabel: 'you',
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
              return _MirroredMobileShell(navigationShell: navigationShell);
            },
        branches: [
          StatefulShellBranch(
            navigatorKey: homeKey,
            routes: [
              GoRoute(
                path: '/channels/@me',
                builder: (BuildContext context, GoRouterState state) =>
                    _branchChild('dms', watchRouteState: watchRouteState),
                routes: [
                  GoRoute(
                    path: ':channelId',
                    builder: (BuildContext context, GoRouterState state) =>
                        _branchChild(
                          'dm-chat',
                          watchRouteState: watchRouteState,
                        ),
                  ),
                ],
              ),
              GoRoute(
                path: '/channels/:guildId',
                builder: (BuildContext context, GoRouterState state) =>
                    _branchChild('guild', watchRouteState: watchRouteState),
                routes: [
                  GoRoute(
                    path: ':channelId',
                    builder: (BuildContext context, GoRouterState state) =>
                        _branchChild('chat', watchRouteState: watchRouteState),
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
          StatefulShellBranch(
            navigatorKey: youKey,
            routes: [
              GoRoute(
                path: '/you',
                builder: (BuildContext context, GoRouterState state) =>
                    const Text('you'),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class _MirroredMobileShell extends ConsumerWidget {
  const _MirroredMobileShell({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String deferredBranchLocation = ref.watch(
      activeBranchLocationProvider,
    );
    final GoRouter router = ref.watch(fluxerRouterProvider);
    final String branchLocation =
        resolveActiveBranchLocation(
          router.routerDelegate.currentConfiguration,
        ) ??
        deferredBranchLocation;
    final ShellLayoutMode mode = resolveMobileShellLayoutMode(
      navigationShellIndex: navigationShell.currentIndex,
      activeBranchLocation: branchLocation,
    );
    const Widget sidebar = SizedBox.expand(child: Text('sidebar'));
    const Widget bottomNav = SizedBox(height: 48, child: Text('nav'));
    return Scaffold(
      body: switch (mode) {
        ShellLayoutMode.channelDrawer => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const Column(
              children: <Widget>[
                Expanded(child: sidebar),
                bottomNav,
              ],
            ),
            navigationShell,
          ],
        ),
        ShellLayoutMode.mainTab || ShellLayoutMode.homeUtility => Column(
          children: <Widget>[
            Expanded(child: navigationShell),
            bottomNav,
          ],
        ),
      },
    );
  }
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

Widget _branchChild(String label, {required bool watchRouteState}) {
  return watchRouteState ? _RouteStateBranchChild(label) : Text(label);
}

final Provider<String> _branchRouteProvider = Provider<String>(
  (Ref ref) => ref.watch(activeBranchLocationProvider),
);

final Provider<String> _branchContextProvider = Provider<String>(
  (Ref ref) => 'context:${ref.watch(_branchRouteProvider)}',
);

class _RouteStateBranchChild extends ConsumerStatefulWidget {
  const _RouteStateBranchChild(this.label);

  final String label;

  @override
  ConsumerState<_RouteStateBranchChild> createState() =>
      _RouteStateBranchChildState();
}

class _RouteStateBranchChildState
    extends ConsumerState<_RouteStateBranchChild> {
  @override
  Widget build(BuildContext context) {
    final String context0 = ref.watch(_branchContextProvider);
    ref.watch(_branchRouteProvider);
    return Text('${widget.label}|$context0');
  }
}

String _labelFor(String path) => switch (path) {
  '/channels/@me' => 'dms',
  '/channels/guild' => 'guild',
  '/channels/guild/channel' => 'chat',
  _ => throw ArgumentError.value(path, 'path', 'no branch label'),
};
