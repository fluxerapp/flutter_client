import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
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
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Widget buildToastTestApp(Widget child) {
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
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
  group('FluxerToastOverlay semantics', () {
    testWidgets('toast exposes live region with message label', (
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
              message: 'Settings saved',
              duration: Duration(seconds: 30),
            ),
          );

      await tester.pump();
      await tester.pump(fluxerToastAnimationDuration);

      expect(find.bySemanticsLabel('Settings saved'), findsOneWidget);
      final SemanticsNode node = tester.getSemantics(
        find.bySemanticsLabel('Settings saved'),
      );
      expect(node.flagsCollection.isLiveRegion, isTrue);
    });
  });
}
