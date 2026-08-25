import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/character_counter/fluxer_character_counter.dart';
import 'package:fluxer_app/features/ui/keybind_hint/fluxer_keybind_hint.dart';
import 'package:fluxer_app/features/ui/scroller/fluxer_scroller.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../helpers/rendered_text_test_helpers.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );
}

void main() {
  group('FluxerCharacterCounter', () {
    testWidgets('shows remaining characters', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerCharacterCounter(current: 42, max: 200)),
      );

      expect(find.text('158'), findsOneWidget);
    });

    testWidgets('uses danger color when nearing limit', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerCharacterCounter(current: 160, max: 200)),
      );

      final Text text = tester.widget<Text>(findAppText('40'));
      expect(text.style?.color, buildDarkColorTheme().statusDanger);
    });

    testWidgets('shows negative remaining when over limit', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerCharacterCounter(current: 250, max: 200)),
      );

      expect(find.text('-50'), findsOneWidget);
    });
  });

  group('FluxerWarningAlert', () {
    testWidgets('shows message text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerWarningAlert(message: 'Something went wrong')),
      );

      expect(find.text('Something went wrong'), findsOneWidget);
    });

    testWidgets('renders all variants', (tester) async {
      for (final variant in FluxerAlertVariant.values) {
        await tester.pumpWidget(
          buildTestApp(
            FluxerWarningAlert(message: 'Test $variant', variant: variant),
          ),
        );

        expect(find.text('Test $variant'), findsOneWidget);
      }
    });
  });

  group('FluxerKeybindHint', () {
    testWidgets('renders all keys', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerKeybindHint(keys: ['Ctrl', 'Shift', 'P'])),
      );

      expect(find.text('Ctrl'), findsOneWidget);
      expect(find.text('Shift'), findsOneWidget);
      expect(find.text('P'), findsOneWidget);
      expect(find.text('+'), findsNothing);
    });

    testWidgets('renders single key without separator', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerKeybindHint(keys: ['Esc'])),
      );

      expect(find.text('Esc'), findsOneWidget);
      expect(find.text('+'), findsNothing);
    });
  });

  group('FluxerScroller', () {
    testWidgets('renders child', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerScroller(
            child: SingleChildScrollView(child: Text('Scrollable content')),
          ),
        ),
      );

      expect(find.text('Scrollable content'), findsOneWidget);
      expect(find.byType(Scrollbar), findsOneWidget);
    });

    testWidgets('uses provided controller', (tester) async {
      final controller = ScrollController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        buildTestApp(
          FluxerScroller(
            controller: controller,
            child: ListView.builder(
              controller: controller,
              itemCount: 100,
              itemBuilder: (context, index) => Text('Item $index'),
            ),
          ),
        ),
      );

      expect(find.byType(Scrollbar), findsOneWidget);
    });
  });
}
