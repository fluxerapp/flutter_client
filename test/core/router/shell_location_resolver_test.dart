import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

void main() {
  group('resolveShellLocation', () {
    test('returns null when shell is not mounted', () {
      final GoRouter router = GoRouter(
        initialLocation: '/channels/@discover',
        routes: <RouteBase>[
          GoRoute(
            path: '/channels/@discover',
            builder: (BuildContext context, GoRouterState state) =>
                const SizedBox.shrink(),
          ),
        ],
      );
      addTearDown(router.dispose);
      expect(
        resolveShellLocation(router.routerDelegate.currentConfiguration),
        isNull,
      );
    });
  });

  group('isRootOverlayLocation', () {
    test('detects top location differing from shell location', () {
      expect(
        isRootOverlayLocation(
          '/settings/guild/g1',
          shellLocation: '/channels/@me/abc',
        ),
        isTrue,
      );
      expect(
        isRootOverlayLocation(
          '/channels/@me/abc',
          shellLocation: '/channels/@me/abc',
        ),
        isFalse,
      );
      expect(isRootOverlayLocation('/channels/@discover'), isFalse);
    });
  });

  group('inferShellBranchIndex', () {
    test('classifies shell branch routes', () {
      expect(inferShellBranchIndex('/notifications'), 1);
      expect(inferShellBranchIndex('/you'), 2);
      expect(inferShellBranchIndex('/channels/@me'), 0);
    });
  });
}
