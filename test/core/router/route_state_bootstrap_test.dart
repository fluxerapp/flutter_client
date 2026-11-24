import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

void main() {
  test(
    'defers provider mutation while runApp builds outside a frame',
    () async {
      final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
      expect(binding.rootElement, isNull);

      final GoRouter router = GoRouter(
        initialLocation: '/home',
        routes: <RouteBase>[
          GoRoute(
            path: '/home',
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

      final List<String> locations = <String>[];
      container.listen<String>(
        currentLocationProvider,
        (String? previous, String next) => locations.add(next),
        fireImmediately: true,
      );

      final List<FlutterErrorDetails> errors = <FlutterErrorDetails>[];
      final FlutterExceptionHandler? previousOnError = FlutterError.onError;
      FlutterError.onError = errors.add;
      addTearDown(() => FlutterError.onError = previousOnError);

      SchedulerPhase? notifiedPhase;
      bool? notifiedBeforeRoot;
      void recordPhase() {
        notifiedPhase ??= binding.schedulerPhase;
        notifiedBeforeRoot ??= binding.rootElement == null;
      }

      router.routerDelegate.addListener(recordPhase);
      addTearDown(() => router.routerDelegate.removeListener(recordPhase));

      runApp(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await binding.endOfFrame;
      await binding.endOfFrame;
      await container.pump();

      expect(notifiedPhase, SchedulerPhase.idle);
      expect(notifiedBeforeRoot, isTrue);
      expect(errors, isEmpty);
      expect(container.read(routeStateProvider).location, '/home');
      expect(container.read(currentLocationProvider), '/home');
      expect(locations, <String>['/', '/home']);

      runApp(const SizedBox.shrink());
      await binding.endOfFrame;
    },
  );
}
