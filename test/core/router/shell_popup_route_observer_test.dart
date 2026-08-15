import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/core/router/shell_popup_route_observer.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ShellPopupRouteObserver', () {
    testWidgets('tracks popup routes across push and pop', (tester) async {
      final List<bool> states = <bool>[];
      final ShellPopupRouteObserver observer = ShellPopupRouteObserver(
        ({required bool hasOverlay}) => states.add(hasOverlay),
      );
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: homeBranchNavigatorKey,
          navigatorObservers: <NavigatorObserver>[observer],
          home: const SizedBox.shrink(),
        ),
      );

      homeBranchNavigatorKey.currentState!.push(_FakePopupRoute<void>());
      await tester.pumpAndSettle();
      expect(states, contains(true));

      homeBranchNavigatorKey.currentState!.pop();
      await tester.pumpAndSettle();
      expect(states.last, isFalse);
    });

    testWidgets(
      'defers provider mutation when navigator updates during build',
      (tester) async {
        final ProviderContainer container = ProviderContainer();
        addTearDown(container.dispose);
        final ShellPopupRouteObserver observer = ShellPopupRouteObserver(
          ({required bool hasOverlay}) => container
              .read(shellHasPopupOverlayProvider.notifier)
              .setHasOverlay(value: hasOverlay),
        );
        final ValueNotifier<List<Page<void>>> pages =
            ValueNotifier<List<Page<void>>>(<Page<void>>[
              const MaterialPage<void>(child: SizedBox.shrink()),
            ]);
        addTearDown(pages.dispose);
        final List<NavigatorObserver> observers = <NavigatorObserver>[observer];

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              home: ValueListenableBuilder<List<Page<void>>>(
                valueListenable: pages,
                builder: (_, value, _) => Navigator(
                  observers: observers,
                  pages: value,
                  onDidRemovePage: (_) {},
                ),
              ),
            ),
          ),
        );

        // Simulate an open popup (e.g. the settings modal the user logs out
        // from) so the build-phase reconcile below actually changes state.
        container
            .read(shellHasPopupOverlayProvider.notifier)
            .setHasOverlay(value: true);

        // Declarative page push: didPush fires while the navigator is
        // rebuilding, i.e. during the build phase.
        pages.value = <Page<void>>[
          ...pages.value,
          const MaterialPage<void>(child: SizedBox.shrink()),
        ];
        await tester.pump();
        expect(tester.takeException(), isNull);
        await tester.pumpAndSettle();
        expect(container.read(shellHasPopupOverlayProvider), isFalse);
      },
    );

    testWidgets('remove decrements popup tracking', (tester) async {
      final List<bool> states = <bool>[];
      final ShellPopupRouteObserver observer = ShellPopupRouteObserver(
        ({required bool hasOverlay}) => states.add(hasOverlay),
      );
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: homeBranchNavigatorKey,
          navigatorObservers: <NavigatorObserver>[observer],
          home: const SizedBox.shrink(),
        ),
      );

      final Route<void> popupRoute = _FakePopupRoute<void>();
      homeBranchNavigatorKey.currentState!.push(popupRoute);
      await tester.pumpAndSettle();
      expect(states, contains(true));

      homeBranchNavigatorKey.currentState!.removeRoute(popupRoute);
      await tester.pumpAndSettle();
      expect(states.last, isFalse);
    });

    testWidgets('replace keeps popup tracking when swapping popups', (
      tester,
    ) async {
      final List<bool> states = <bool>[];
      final ShellPopupRouteObserver observer = ShellPopupRouteObserver(
        ({required bool hasOverlay}) => states.add(hasOverlay),
      );
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: homeBranchNavigatorKey,
          navigatorObservers: <NavigatorObserver>[observer],
          home: const SizedBox.shrink(),
        ),
      );

      final NavigatorState navigator = homeBranchNavigatorKey.currentState!;
      final Future<void> firstPush = navigator.push(_FakePopupRoute<void>());
      unawaited(firstPush);
      await tester.pumpAndSettle();
      expect(states, contains(true));

      final Future<void> replacementPush = navigator.pushReplacement(
        _FakePopupRoute<void>(),
      );
      unawaited(replacementPush);
      await tester.pumpAndSettle();
      expect(states.last, isTrue);
    });
  });
}

class _FakePopupRoute<T> extends PopupRoute<T> {
  @override
  Color? get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => Duration.zero;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) => const SizedBox.shrink();
}
