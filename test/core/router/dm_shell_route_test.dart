import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/shell_transition_page.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('nested DM routes do not duplicate path parameters', (
    WidgetTester tester,
  ) async {
    expect(
      () => GoRouter(
        routes: <RouteBase>[
          GoRoute(
            path: RoutePaths.me,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return shellSlideTransitionPage(
                context: context,
                key: state.pageKey,
                child: const Scaffold(body: Center(child: Text('friends'))),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: ':channelId',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return shellSlideTransitionPage(
                    context: context,
                    key: state.pageKey,
                    child: Scaffold(
                      body: Center(
                        child: Text(state.pathParameters['channelId']!),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      returnsNormally,
    );
  });
}
