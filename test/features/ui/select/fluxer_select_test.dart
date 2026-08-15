import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../helpers/test_l10n.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
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
      home: Scaffold(body: child),
    ),
  );
}

double _caretRight(WidgetTester tester, Key key) => tester
    .getTopRight(
      find.descendant(
        of: find.byKey(key),
        matching: find.byIcon(PhosphorIconsBold.caretDown),
      ),
    )
    .dx;

double _fieldRight(WidgetTester tester, Key key) =>
    tester.getTopRight(find.byKey(key)).dx;

void main() {
  final items = [
    const FluxerSelectItem(value: 'a', label: 'Alpha'),
    const FluxerSelectItem(value: 'b', label: 'Beta'),
    const FluxerSelectItem(value: 'c', label: 'Gamma'),
  ];

  group('FluxerSelect', () {
    testWidgets('renders selected item label', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerSelect<String>(items: items, value: 'b', onChanged: (_) {}),
        ),
      );

      expect(find.text('Beta'), findsOneWidget);
    });

    testWidgets('renders hint when no value is selected', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerSelect<String>(
            items: items,
            hint: 'Pick one',
            onChanged: (_) {},
          ),
        ),
      );

      expect(find.text('Pick one'), findsOneWidget);
    });

    testWidgets('shows dropdown items when tapped', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerSelect<String>(items: items, value: 'a', onChanged: (_) {}),
        ),
      );

      await tester.tap(find.text('Alpha'));
      await tester.pumpAndSettle();

      // All items should be visible in the dropdown
      expect(find.text('Alpha'), findsExactly(2));
      expect(find.text('Beta'), findsOneWidget);
      expect(find.text('Gamma'), findsOneWidget);
    });

    testWidgets('calls onChanged and closes popout on item tap', (
      tester,
    ) async {
      String? selectedValue;
      await tester.pumpWidget(
        buildTestApp(
          FluxerSelect<String>(
            items: items,
            onChanged: (value) => selectedValue = value,
          ),
        ),
      );

      // Open the dropdown by tapping the caret icon area
      await tester.tap(find.byIcon(PhosphorIconsBold.caretDown));
      await tester.pumpAndSettle();

      // Tap on Beta
      await tester.tap(find.text('Beta'));
      await tester.pumpAndSettle();

      expect(selectedValue, equals('b'));
      // Dropdown should be closed — only the trigger text remains
      expect(find.text('Gamma'), findsNothing);
    });

    testWidgets('renders label above the trigger', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerSelect<String>(
            items: items,
            label: 'Choose option',
            onChanged: (_) {},
          ),
        ),
      );

      expect(find.text('Choose option'), findsOneWidget);
    });

    testWidgets('shows check icon for selected item in dropdown', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerSelect<String>(items: items, value: 'a', onChanged: (_) {}),
        ),
      );

      // No check icon visible before opening
      expect(find.byIcon(PhosphorIconsBold.check), findsNothing);

      await tester.tap(find.text('Alpha'));
      await tester.pumpAndSettle();

      // Check icon visible for selected item
      expect(find.byIcon(PhosphorIconsBold.check), findsOneWidget);
    });

    testWidgets('renders description and error text below the trigger', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerSelect<String>(
            items: items,
            description: 'Choose the channel sort order.',
            errorText: 'Selection is required.',
            onChanged: (_) {},
          ),
        ),
      );

      expect(find.text('Choose the channel sort order.'), findsOneWidget);
      expect(find.text('Selection is required.'), findsOneWidget);
    });

    testWidgets('searches rich options and shows an empty state', (
      tester,
    ) async {
      final richItems = [
        const FluxerSelectItem(
          value: 'a',
          label: 'Alpha',
          description: 'First option',
        ),
        const FluxerSelectItem(
          value: 'b',
          label: 'Beta',
          description: 'Second option',
        ),
        const FluxerSelectItem(
          value: 'c',
          label: 'Gamma',
          description: 'Third option',
        ),
      ];

      await tester.pumpWidget(
        buildTestApp(
          FluxerSelect<String>(
            items: richItems,
            searchHint: 'Search options',
            emptyLabel: 'No matches found',
            onChanged: (_) {},
          ),
        ),
      );

      await tester.tap(find.byIcon(PhosphorIconsBold.caretDown));
      await tester.pumpAndSettle();

      expect(find.text('Search options'), findsOneWidget);

      await tester.enterText(find.byType(TextFormField), 'Gam');
      await tester.pumpAndSettle();

      expect(find.text('Gamma'), findsOneWidget);
      expect(find.text('Third option'), findsOneWidget);
      expect(find.text('Alpha'), findsNothing);

      await tester.enterText(find.byType(TextFormField), 'zzz');
      await tester.pumpAndSettle();

      expect(find.text('No matches found'), findsOneWidget);
    });

    testWidgets(
      'stretch fills the field width and pins the caret to the right edge, '
      'while the default sizes to content',
      (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 320,
                  child: FluxerSelect<String>(
                    key: const Key('stretched'),
                    stretch: true,
                    hint: 'Pick',
                    items: items,
                    onChanged: (_) {},
                  ),
                ),
                SizedBox(
                  width: 320,
                  child: FluxerSelect<String>(
                    key: const Key('content'),
                    hint: 'Pick',
                    items: items,
                    onChanged: (_) {},
                  ),
                ),
              ],
            ),
          ),
        );

        // Stretched: caret sits at the field's right edge.
        expect(
          _fieldRight(tester, const Key('stretched')) -
              _caretRight(tester, const Key('stretched')),
          lessThan(24),
        );

        // Content-sized: caret sits well left of the right edge.
        expect(
          _fieldRight(tester, const Key('content')) -
              _caretRight(tester, const Key('content')),
          greaterThan(100),
        );
      },
    );

    testWidgets(
      'opens the scrollable bottom-sheet variant when scrollableSheet is true',
      (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            FluxerSelect<String>(
              scrollableSheet: true,
              enableSearch: false,
              hint: 'Pick',
              items: items,
              onChanged: (_) {},
            ),
          ),
        );

        await tester.tap(find.byIcon(PhosphorIconsBold.caretDown));
        await tester.pumpAndSettle();

        expect(find.byType(DraggableScrollableSheet), findsOneWidget);
      },
    );

    testWidgets(
      'opens the content-sized sheet when search and scrollableSheet are off',
      (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            FluxerSelect<String>(
              enableSearch: false,
              hint: 'Pick',
              items: items,
              onChanged: (_) {},
            ),
          ),
        );

        await tester.tap(find.byIcon(PhosphorIconsBold.caretDown));
        await tester.pumpAndSettle();

        expect(find.byType(DraggableScrollableSheet), findsNothing);
      },
    );
  });
}
