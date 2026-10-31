import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('RouteStateNotifier', () {
    testWidgets(
      'defers provider mutation when GoRouter restores during build',
      (WidgetTester tester) async {
        final GoRouter router = GoRouter(
          initialLocation: '/home',
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (BuildContext context, GoRouterState state) =>
                  const SizedBox.shrink(),
            ),
            GoRoute(
              path: '/other',
              builder: (BuildContext context, GoRouterState state) =>
                  const SizedBox.shrink(),
            ),
          ],
        );
        addTearDown(router.dispose);

        final ProviderContainer container = ProviderContainer(
          overrides: [fluxerRouterProvider.overrideWithValue(router)],
        );
        addTearDown(container.dispose);

        container.read(routeStateProvider);

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp.router(routerConfig: router),
          ),
        );
        expect(tester.takeException(), isNull);
        expect(container.read(routeStateProvider).location, '/home');

        router.go('/other');
        await tester.pumpAndSettle();
        expect(container.read(routeStateProvider).location, '/other');
      },
    );
  });
}
