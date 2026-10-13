import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/features/shell/presentation/splash_shell_settle.dart';
import 'package:fluxer_app/material_ui.dart';

Future<ProviderContainer> _settleAfterExit(
  WidgetTester tester, {
  required bool zoom,
}) async {
  final ProviderContainer container = ProviderContainer();
  addTearDown(container.dispose);
  container.read(splashRevealZoomProvider.notifier).setZoom(value: zoom);
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: const Directionality(
        textDirection: TextDirection.ltr,
        child: SplashShellSettle(child: SizedBox.expand()),
      ),
    ),
  );
  container.read(splashExitAllowedProvider.notifier).allow();
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 100));
  return container;
}

void main() {
  testWidgets('shell settles from a larger scale after a zoom reveal', (
    tester,
  ) async {
    await _settleAfterExit(tester, zoom: true);

    expect(
      find.descendant(
        of: find.byType(SplashShellSettle),
        matching: find.byType(Transform),
      ),
      findsOneWidget,
    );
    await tester.pumpAndSettle();
  });

  testWidgets('shell stays at rest after a reveal without the zoom', (
    tester,
  ) async {
    await _settleAfterExit(tester, zoom: false);

    final Transform transform = tester.widget<Transform>(
      find.descendant(
        of: find.byType(SplashShellSettle),
        matching: find.byType(Transform),
      ),
    );
    expect(transform.transform, Matrix4.identity());
  });
}
