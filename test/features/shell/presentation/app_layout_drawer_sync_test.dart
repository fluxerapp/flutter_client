import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:go_router/go_router.dart';

void main() {
  void syncForRoute(ProviderContainer container, String location) {
    container.read(currentRevealSideProvider.notifier).syncForRoute(location);
  }

  void setRevealSide(ProviderContainer container, RevealSide side) {
    container.read(currentRevealSideProvider.notifier).set(side);
  }

  group('CurrentRevealSide.syncForRoute', () {
    test('same channels location does not overwrite manual state', () {
      final container = _bareContainer();

      syncForRoute(container, '/channels/@me');
      expect(container.read(currentRevealSideProvider), RevealSide.left);

      setRevealSide(container, RevealSide.main);
      expect(container.read(currentRevealSideProvider), RevealSide.main);

      // Same location re-syncs — must NOT overwrite the manual state.
      syncForRoute(container, '/channels/@me');
      expect(container.read(currentRevealSideProvider), RevealSide.main);
    });

    test('different channels location re-syncs', () {
      final container = _bareContainer();

      syncForRoute(container, '/channels/@me');
      setRevealSide(container, RevealSide.main);
      syncForRoute(container, '/channels/guild/channel');
      expect(container.read(currentRevealSideProvider), RevealSide.main);

      syncForRoute(container, '/channels/@me');
      expect(container.read(currentRevealSideProvider), RevealSide.left);
    });

    test('members route does not flip the drawer', () {
      final container = _bareContainer();

      setRevealSide(container, RevealSide.main);
      syncForRoute(container, '/channels/guild/members');
      expect(container.read(currentRevealSideProvider), RevealSide.main);

      setRevealSide(container, RevealSide.left);
      syncForRoute(container, '/channels/guild/members');
      expect(container.read(currentRevealSideProvider), RevealSide.left);
    });

    test('non-channels location does not flip the drawer', () {
      final container = _bareContainer();

      setRevealSide(container, RevealSide.main);
      syncForRoute(container, '/notifications');
      expect(container.read(currentRevealSideProvider), RevealSide.main);

      setRevealSide(container, RevealSide.left);
      syncForRoute(container, '/you');
      expect(container.read(currentRevealSideProvider), RevealSide.left);
    });

    test('logout clears the guard so post-login sync still fires', () {
      final container = _bareContainer();
      // Establish the logged-in baseline before observing logout → so the
      // listener actually sees a transition (default state is false).
      container.read(authStateProvider.notifier).setAuthenticated(value: true);

      syncForRoute(container, '/channels/@me');
      expect(container.read(currentRevealSideProvider), RevealSide.left);

      // Simulate "user swipes drawer closed before logging out".
      setRevealSide(container, RevealSide.main);

      // Logout fires the listener and clears the guard.
      container.read(authStateProvider.notifier).setAuthenticated(value: false);

      // After login, syncForRoute for the same location must re-apply
      // RevealSide.left even though the location string matches a stale
      // guard from the previous session.
      syncForRoute(container, '/channels/@me');
      expect(container.read(currentRevealSideProvider), RevealSide.left);
    });
  });

  testWidgets(
    'tab roundtrip preserves manually toggled drawer state (integration)',
    (tester) async {
      final router = _shellRouterFor('/channels/@me');
      addTearDown(router.dispose);
      final container = _containerFor(router);

      await tester.pumpWidget(
        _buildShellApp(container: container, router: router),
      );
      await tester.pumpAndSettle();

      expect(container.read(currentRevealSideProvider), RevealSide.left);

      // User swipes drawer closed to see the FriendsList.
      container.read(currentRevealSideProvider.notifier).set(RevealSide.main);
      await tester.pump();

      // Bottom-nav to Notifications then back to Home.
      router.go('/notifications');
      await tester.pumpAndSettle();
      router.go('/channels/@me');
      await tester.pumpAndSettle();

      expect(
        container.read(currentRevealSideProvider),
        RevealSide.main,
        reason: 'drawer state must survive the tab round-trip',
      );

      // Navigating to a different channels location DOES re-sync.
      router.go('/channels/guild/channel');
      await tester.pumpAndSettle();
      expect(container.read(currentRevealSideProvider), RevealSide.main);

      router.go('/channels/@me');
      await tester.pumpAndSettle();
      expect(container.read(currentRevealSideProvider), RevealSide.left);
    },
  );
}

/// A container with no router override. The provider's `build()` reads
/// `fluxerRouterProvider`, so we still need a router instance — even an
/// unmounted one. Tests drive state explicitly via `syncForRoute`, not
/// from router events.
ProviderContainer _bareContainer() {
  final router = GoRouter(
    initialLocation: '/channels/@me',
    routes: [
      GoRoute(
        path: '/channels/:guildId',
        builder: (context, state) => const SizedBox.shrink(),
      ),
    ],
  );
  addTearDown(router.dispose);
  return _containerFor(router);
}

GoRouter _shellRouterFor(String initialLocation) {
  final homeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
  final notifKey = GlobalKey<NavigatorState>(debugLabel: 'notif');
  final youKey = GlobalKey<NavigatorState>(debugLabel: 'you');

  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            _TestShell(child: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: homeKey,
            routes: [
              GoRoute(
                path: '/channels/@me',
                builder: (context, state) => const Text('dms'),
                routes: [
                  GoRoute(
                    path: ':channelId',
                    builder: (context, state) => const Text('dm-chat'),
                  ),
                ],
              ),
              GoRoute(
                path: '/channels/:guildId',
                builder: (context, state) => const Text('guild'),
                routes: [
                  GoRoute(
                    path: 'members',
                    builder: (context, state) => const Text('members'),
                  ),
                  GoRoute(
                    path: ':channelId',
                    builder: (context, state) => const Text('chat'),
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
                builder: (context, state) => const Text('notifications'),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: youKey,
            routes: [
              GoRoute(
                path: '/you',
                builder: (context, state) => const Text('you'),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

ProviderContainer _containerFor(GoRouter router) {
  final container = ProviderContainer(
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
      builder: (context, child) => MediaQuery(
        data: const MediaQueryData(size: Size(400, 800)),
        child: child ?? const SizedBox.shrink(),
      ),
    ),
  );
}

/// Minimal stand-in for `_AppLayoutState` that wires the router's route
/// listener to [CurrentRevealSide.syncForRoute] without pulling in the
/// real `AppLayout`'s downstream provider dependencies.
class _TestShell extends ConsumerStatefulWidget {
  final Widget child;

  const _TestShell({required this.child});

  @override
  ConsumerState<_TestShell> createState() => _TestShellState();
}

class _TestShellState extends ConsumerState<_TestShell> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = ref.read(fluxerRouterProvider);
    _router.routerDelegate.addListener(_onRouteChange);
  }

  @override
  void dispose() {
    _router.routerDelegate.removeListener(_onRouteChange);
    super.dispose();
  }

  void _onRouteChange() {
    if (!mounted) {
      return;
    }
    final config = _router.routerDelegate.currentConfiguration;
    if (config.isEmpty) {
      return;
    }
    ref
        .read(currentRevealSideProvider.notifier)
        .syncForRoute(config.last.matchedLocation);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
