import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast_overlay.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: FluxerToastOverlay(child: child)),
    ),
  );
}

void main() {
  group('FluxerToastOverlay', () {
    testWidgets('shows toast message when triggered via provider', (
      tester,
    ) async {
      await tester.pumpWidget(buildTestApp(const SizedBox.shrink()));

      final container = ProviderScope.containerOf(
        tester.element(find.byType(FluxerToastOverlay)),
      );
      container
          .read(toastProvider.notifier)
          .show(const FluxerToast(message: 'Test notification'));

      await tester.pump();

      expect(find.text('Test notification'), findsOneWidget);

      // Advance past toast duration to clear pending timer.
      await tester.pump(const Duration(seconds: 5));
      await tester.pump();
    });

    testWidgets('toast is dismissible via tap', (tester) async {
      await tester.pumpWidget(buildTestApp(const SizedBox.shrink()));

      final container = ProviderScope.containerOf(
        tester.element(find.byType(FluxerToastOverlay)),
      );
      container
          .read(toastProvider.notifier)
          .show(const FluxerToast(message: 'Tap me away'));

      await tester.pumpAndSettle();
      expect(find.text('Tap me away'), findsOneWidget);

      // Toast dismisses on tap (GestureDetector.onTap -> dismiss).
      await tester.tap(find.text('Tap me away'));
      await tester.pumpAndSettle();

      expect(find.text('Tap me away'), findsNothing);
    });

    testWidgets('renders message only when action is provided', (tester) async {
      await tester.pumpWidget(buildTestApp(const SizedBox.shrink()));

      final container = ProviderScope.containerOf(
        tester.element(find.byType(FluxerToastOverlay)),
      );
      container
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: 'With action',
              action: FluxerToastAction(label: 'Undo', onPressed: () {}),
            ),
          );

      await tester.pump();

      // Current overlay renders only icon + message; the action is not
      // surfaced as a separate button.
      expect(find.text('With action'), findsOneWidget);
      expect(find.text('Undo'), findsNothing);

      // Advance past toast duration to clear pending timer.
      await tester.pump(const Duration(seconds: 5));
      await tester.pump();
    });

    testWidgets('auto-dismisses after duration', (tester) async {
      await tester.pumpWidget(buildTestApp(const SizedBox.shrink()));

      final container = ProviderScope.containerOf(
        tester.element(find.byType(FluxerToastOverlay)),
      );
      container
          .read(toastProvider.notifier)
          .show(
            const FluxerToast(
              message: 'Temporary',
              duration: Duration(seconds: 2),
            ),
          );

      await tester.pump();
      expect(find.text('Temporary'), findsOneWidget);

      await tester.pump(const Duration(seconds: 3));
      await tester.pump();

      expect(find.text('Temporary'), findsNothing);
    });
  });
}
