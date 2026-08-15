import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/navigation/shell_layout_mode.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

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

  // Regression coverage for issue #463: a shell-less layout for community and
  // DM roots disposed StatefulNavigationShellState, destroying go_router's
  // saved per-branch route stacks, so returning to Home fell back to the
  // branch default (/channels/@me).
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
          // The shell element is never torn down, which is what preserves the
          // saved branch route stacks and the branch subtree state.
          expect(
            tester.state(find.byType(StatefulNavigationShell)),
            same(shellState),
          );
        });
      }
    }
  });

  // Keeping the shell mounted (issue #463) also keeps the offscreen branch
  // subtrees alive, so returning to Home resumes their paused riverpod
  // subscriptions instead of building them from scratch. That resume happens
  // inside the build phase, and flushing a route-state provider there used to
  // invalidate its dependents mid-build.
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

        // The offscreen Home subtree is ticker-resumed during this frame's
        // build, which is where the mid-build invalidation surfaced.
        navigationShell!.goBranch(shellHomeBranchIndex);
        await tester.pumpAndSettle();
        final Object? resumeError = tester.takeException();
        expect(router.routeInformationProvider.value.uri.path, path);
        // The functional symptom: an aborted resume leaves the derived
        // providers wedged, so the branch keeps rendering pre-switch data.
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

/// Mirrors the production layout switch in `MobileShellScaffold`: the resolved
/// [ShellLayoutMode] decides the surrounding chrome, and every mode must keep
/// the [StatefulNavigationShell] mounted.
class _MirroredMobileShell extends ConsumerWidget {
  const _MirroredMobileShell({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Same read shape as MobileShellScaffold: a watched deferred provider as
    // the fallback, with the router's live configuration authoritative.
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
        // Drawer layout: sidebar behind, branch content as the slider.
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

/// Mirrors the production chain `routeState -> activeChannelId/activeGuildId
/// -> contextualGuildId`: a derived provider and a second provider derived
/// from it, both reachable only through the branch subtree.
final Provider<String> _branchRouteProvider = Provider<String>(
  (Ref ref) => ref.watch(activeBranchLocationProvider),
);

final Provider<String> _branchContextProvider = Provider<String>(
  (Ref ref) => 'context:${ref.watch(_branchRouteProvider)}',
);

/// Stands in for the real branch surfaces, which are `ConsumerStatefulWidget`s
/// reading route state. Riverpod pauses their subscriptions when the branch
/// goes offscreen and resumes them during build when it comes back, so while
/// the branch is away nothing else flushes this chain and it stays dirty.
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
    // Rendering the derived value makes a wedged scheduler observable: if the
    // resume aborts, this text keeps showing the location from before the
    // branch switch.
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
