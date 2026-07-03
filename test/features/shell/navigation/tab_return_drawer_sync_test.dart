import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:go_router/go_router.dart';

void main() {
  group('DrawerNavigationCoordinator.activateHomeTab', () {
    test('resets drawer and navigates to @me root', () {
      final ProviderContainer container = _bareContainer();

      container
          .read(currentRevealSideProvider.notifier)
          .syncForRoute('/channels/@me/dm');
      expect(container.read(currentRevealSideProvider), RevealSide.main);

      container.read(currentRevealSideProvider.notifier).set(RevealSide.left);
      DrawerNavigationCoordinator.activateHomeTab(container);

      expect(container.read(currentRevealSideProvider), RevealSide.main);
      expect(
        container
            .read(fluxerRouterProvider)
            .routeInformationProvider
            .value
            .uri
            .path,
        RoutePaths.me,
      );
    });
  });
}

ProviderContainer _bareContainer() {
  final GoRouter router = GoRouter(
    initialLocation: RoutePaths.me,
    routes: [
      GoRoute(
        path: RoutePaths.me,
        builder: (BuildContext context, GoRouterState state) =>
            const SizedBox.shrink(),
        routes: [
          GoRoute(
            path: ':channelId',
            builder: (BuildContext context, GoRouterState state) =>
                const SizedBox.shrink(),
          ),
        ],
      ),
    ],
  );
  addTearDown(router.dispose);
  final ProviderContainer container = ProviderContainer(
    overrides: [fluxerRouterProvider.overrideWithValue(router)],
  );
  addTearDown(container.dispose);
  return container;
}
