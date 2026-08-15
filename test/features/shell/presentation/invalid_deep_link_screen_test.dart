import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/shell/presentation/invalid_deep_link_screen.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  group('InvalidDeepLinkScreen', () {
    testWidgets('renders title, description, and go home button', (
      tester,
    ) async {
      await tester.pumpWidget(_buildRouterApp(initialLocation: '/missing'));
      await tester.pumpAndSettle();

      expect(find.text("Link couldn't be opened"), findsOneWidget);
      expect(
        find.text(
          'This link may be broken, only available on the web, or you might not have access. Check the link and try again.',
        ),
        findsOneWidget,
      );
      expect(find.text('Go to home'), findsOneWidget);
    });

    testWidgets('go home button navigates to RoutePaths.me', (tester) async {
      final GoRouter router = _buildRouter(initialLocation: '/missing');
      addTearDown(router.dispose);

      await tester.pumpWidget(_buildRouterAppFromRouter(router));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FluxerButton));
      await tester.pumpAndSettle();

      expect(
        router.routerDelegate.currentConfiguration.uri.path,
        RoutePaths.me,
      );
    });
  });
}

GoRouter _buildRouter({required String initialLocation}) {
  return GoRouter(
    initialLocation: initialLocation,
    errorBuilder: (BuildContext context, GoRouterState state) {
      return InvalidDeepLinkScreen(uri: state.uri);
    },
    routes: <RouteBase>[
      GoRoute(
        path: RoutePaths.me,
        builder: (BuildContext context, GoRouterState state) {
          return const Scaffold(body: Text('home'));
        },
      ),
    ],
  );
}

Widget _buildRouterApp({required String initialLocation}) {
  final GoRouter router = _buildRouter(initialLocation: initialLocation);
  return _buildRouterAppFromRouter(router);
}

Widget _buildRouterAppFromRouter(GoRouter router) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp.router(
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    routerConfig: router,
  );
}
