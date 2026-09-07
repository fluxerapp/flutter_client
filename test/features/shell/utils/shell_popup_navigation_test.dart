import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/features/shell/utils/shell_popup_navigation.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('popShellCoveringPages', () {
    testWidgets('pops stacked settings pages on the root navigator', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(navigatorKey: rootNavigatorKey, home: const Text('shell')),
      );

      rootNavigatorKey.currentState!.push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const Text('settings'),
        ),
      );
      await tester.pumpAndSettle();
      rootNavigatorKey.currentState!.push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const Text('section'),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('section'), findsOneWidget);

      popShellCoveringPages();
      await tester.pumpAndSettle();

      expect(find.text('section'), findsNothing);
      expect(find.text('settings'), findsNothing);
      expect(find.text('shell'), findsOneWidget);
    });

    testWidgets('pops a popup on a shell branch navigator', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: homeBranchNavigatorKey,
          home: const Text('branch'),
        ),
      );

      homeBranchNavigatorKey.currentState!.push(_LabeledPopupRoute('sheet'));
      await tester.pumpAndSettle();
      expect(find.text('sheet'), findsOneWidget);

      popShellCoveringPages();
      await tester.pumpAndSettle();

      expect(find.text('sheet'), findsNothing);
      expect(find.text('branch'), findsOneWidget);
    });

    testWidgets('pops overlay pages on the tab overlay navigator', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: shellTabOverlayNavigatorKey,
          home: const Text('tabs'),
        ),
      );

      shellTabOverlayNavigatorKey.currentState!.push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const Text('overlay'),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('overlay'), findsOneWidget);

      popShellCoveringPages();
      await tester.pumpAndSettle();

      expect(find.text('overlay'), findsNothing);
      expect(find.text('tabs'), findsOneWidget);
    });

    testWidgets('leaves GoRouter page overlays in place', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: _PagesNavigator(
            pages: <Page<void>>[
              MaterialPage<void>(child: Text('shell')),
              MaterialPage<void>(child: Text('discover')),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('discover'), findsOneWidget);

      popShellCoveringPages();
      await tester.pumpAndSettle();

      expect(find.text('discover'), findsOneWidget);
    });
  });

  group('routeIsImperativeOverlay', () {
    testWidgets('ignores the shell route', (tester) async {
      await tester.pumpWidget(
        MaterialApp(navigatorKey: rootNavigatorKey, home: const Text('shell')),
      );

      expect(
        routeIsImperativeOverlay(_topRoute(rootNavigatorKey.currentState!)),
        isFalse,
      );
    });

    testWidgets('treats pushed page routes as overlays', (tester) async {
      await tester.pumpWidget(
        MaterialApp(navigatorKey: rootNavigatorKey, home: const Text('shell')),
      );
      final MaterialPageRoute<void> settings = MaterialPageRoute<void>(
        builder: (BuildContext context) => const Text('settings'),
      );
      rootNavigatorKey.currentState!.push(settings);
      await tester.pumpAndSettle();

      expect(routeIsImperativeOverlay(settings), isTrue);
    });
  });
}

Route<dynamic> _topRoute(NavigatorState navigator) {
  late Route<dynamic> top;
  navigator.popUntil((Route<dynamic> route) {
    top = route;
    return true;
  });
  return top;
}

class _PagesNavigator extends StatelessWidget {
  const _PagesNavigator({required this.pages});

  final List<Page<void>> pages;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: rootNavigatorKey,
      pages: pages,
      onDidRemovePage: (_) {},
    );
  }
}

class _LabeledPopupRoute extends PopupRoute<void> {
  _LabeledPopupRoute(this.label);

  final String label;

  @override
  Color? get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => label;

  @override
  Duration get transitionDuration => Duration.zero;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) => Text(label);
}
