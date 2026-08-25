import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast_overlay.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/test_l10n.dart';

Widget buildToastTestApp(Widget child) {
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      locale: kTestLocale,
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
  group('FluxerToastOverlay exit animation', () {
    testWidgets('keeps toast visible while manual dismiss animates', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildToastTestApp(const SizedBox.shrink()));

      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(find.byType(FluxerToastOverlay)),
      );
      container
          .read(toastProvider.notifier)
          .show(
            const FluxerToast(
              message: 'Animated dismiss',
              duration: Duration(seconds: 30),
            ),
          );

      await tester.pump();
      await tester.pump(fluxerToastAnimationDuration);

      final List<ToastEntry> actualEntries = container.read(toastProvider);
      final int actualToastId = actualEntries.single.id;

      container.read(toastProvider.notifier).dismiss(actualToastId);

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Animated dismiss'), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump();

      expect(find.text('Animated dismiss'), findsNothing);

      await tester.pump(const Duration(seconds: 30));
      await tester.pump();
    });

    testWidgets('keeps toast visible while auto dismiss animates', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildToastTestApp(const SizedBox.shrink()));

      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(find.byType(FluxerToastOverlay)),
      );
      container
          .read(toastProvider.notifier)
          .show(
            const FluxerToast(
              message: 'Auto dismiss',
              duration: Duration(milliseconds: 50),
            ),
          );

      await tester.pump();
      expect(find.text('Auto dismiss'), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 50));
      expect(find.text('Auto dismiss'), findsOneWidget);

      await tester.pump(fluxerToastAnimationDuration);
      await tester.pump();

      expect(find.text('Auto dismiss'), findsNothing);
    });
  });
}
