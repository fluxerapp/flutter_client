import 'dart:ui' show CheckedState, Tristate;

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_switch_control.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_toggle_switch.dart';

import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import '../../helpers/test_l10n.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

void main() {
  group('FluxerCheckbox', () {
    testWidgets('renders label and toggles on tap', (tester) async {
      var checked = false;
      await tester.pumpWidget(
        buildTestApp(
          StatefulBuilder(
            builder: (context, setState) {
              return FluxerCheckbox(
                value: checked,
                onChanged: (v) => setState(() => checked = v ?? false),
                label: 'Accept terms',
              );
            },
          ),
        ),
      );

      expect(find.text('Accept terms'), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);

      // Tap the label to toggle.
      await tester.tap(find.text('Accept terms'));
      await tester.pump();
      expect(checked, isTrue);
    });

    testWidgets('does not toggle when disabled', (tester) async {
      var checked = false;
      await tester.pumpWidget(
        buildTestApp(
          FluxerCheckbox(
            value: checked,
            onChanged: (v) => checked = v ?? false,
            label: 'Disabled',
            enabled: false,
          ),
        ),
      );

      await tester.tap(find.text('Disabled'));
      await tester.pump();
      expect(checked, isFalse);
    });
  });

  group('FluxerRadioGroup', () {
    testWidgets('renders all items and selects on tap', (tester) async {
      var selected = 'a';
      final items = [
        const FluxerRadioItem(value: 'a', label: 'Alpha'),
        const FluxerRadioItem(value: 'b', label: 'Beta'),
        const FluxerRadioItem(value: 'c', label: 'Gamma'),
      ];

      await tester.pumpWidget(
        buildTestApp(
          StatefulBuilder(
            builder: (context, setState) {
              return FluxerRadioGroup<String>(
                value: selected,
                items: items,
                onChanged: (v) => setState(() => selected = v),
              );
            },
          ),
        ),
      );

      // All labels rendered.
      expect(find.text('Alpha'), findsOneWidget);
      expect(find.text('Beta'), findsOneWidget);
      expect(find.text('Gamma'), findsOneWidget);
      expect(find.byType(AnimatedContainer), findsNWidgets(3));

      // Tap label to select.
      await tester.tap(find.text('Beta'));
      await tester.pump();
      expect(selected, 'b');
    });

    testWidgets('supports horizontal direction', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerRadioGroup<int>(
            value: 1,
            items: const [
              FluxerRadioItem(value: 1, label: 'One'),
              FluxerRadioItem(value: 2, label: 'Two'),
            ],
            onChanged: (_) {},
            direction: Axis.horizontal,
          ),
        ),
      );

      // Verify the Flex widget uses horizontal direction.
      final flex = tester.widget<Flex>(find.byType(Flex));
      expect(flex.direction, Axis.horizontal);
    });
  });

  group('FluxerToggleSwitch', () {
    testWidgets('renders label and toggles on tap', (tester) async {
      var toggled = false;
      await tester.pumpWidget(
        buildTestApp(
          StatefulBuilder(
            builder: (context, setState) {
              return FluxerToggleSwitch(
                value: toggled,
                onChanged: (v) => setState(() => toggled = v),
                label: 'Enable notifications',
              );
            },
          ),
        ),
      );

      expect(find.text('Enable notifications'), findsOneWidget);
      expect(find.byType(FluxerSwitchControl), findsOneWidget);

      // Tap the label to toggle.
      await tester.tap(find.text('Enable notifications'));
      await tester.pump();
      expect(toggled, isTrue);
    });

    testWidgets('does not toggle when disabled', (tester) async {
      var toggled = false;
      await tester.pumpWidget(
        buildTestApp(
          FluxerToggleSwitch(
            value: toggled,
            onChanged: (v) => toggled = v,
            label: 'Disabled switch',
            enabled: false,
          ),
        ),
      );

      await tester.tap(find.text('Disabled switch'));
      await tester.pump();
      expect(toggled, isFalse);
    });

    testWidgets(
      'renders description and icon for stacked mobile settings rows',
      (tester) async {
        var toggled = false;

        await tester.pumpWidget(
          buildTestApp(
            StatefulBuilder(
              builder: (context, setState) {
                return FluxerToggleSwitch(
                  value: toggled,
                  onChanged: (value) => setState(() => toggled = value),
                  label: 'Enable notifications',
                  description: 'Alerts for mentions, replies, and invites.',
                  icon: Icons.notifications_outlined,
                );
              },
            ),
          ),
        );

        expect(find.byIcon(Icons.notifications_outlined), findsOneWidget);
        expect(
          find.text('Alerts for mentions, replies, and invites.'),
          findsOneWidget,
        );

        await tester.tap(
          find.text('Alerts for mentions, replies, and invites.'),
        );
        await tester.pump();

        expect(toggled, isTrue);
      },
    );
  });

  group('semantics', () {
    testWidgets('checkbox exposes checked state', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerCheckbox(value: true, onChanged: (_) {}, label: 'Accept terms'),
        ),
      );

      expect(find.bySemanticsLabel('Accept terms'), findsOneWidget);
      final SemanticsNode node = tester.getSemantics(
        find.bySemanticsLabel('Accept terms'),
      );
      expect(node.flagsCollection.isChecked, CheckedState.isTrue);
    });

    testWidgets('radio group exposes selected option', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerRadioGroup<String>(
            value: 'b',
            items: const [
              FluxerRadioItem(value: 'a', label: 'Alpha'),
              FluxerRadioItem(value: 'b', label: 'Beta'),
            ],
            onChanged: (_) {},
          ),
        ),
      );

      final SemanticsNode beta = tester.getSemantics(find.text('Beta'));
      expect(beta.flagsCollection.isChecked, CheckedState.isTrue);
    });

    testWidgets('toggle switch exposes toggled state', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerToggleSwitch(
            value: true,
            onChanged: (_) {},
            label: 'Enable notifications',
          ),
        ),
      );

      expect(find.bySemanticsLabel('Enable notifications'), findsOneWidget);
      final SemanticsNode node = tester.getSemantics(
        find.bySemanticsLabel('Enable notifications'),
      );
      expect(node.flagsCollection.isToggled, isNot(Tristate.none));
      expect(node.flagsCollection.isToggled, Tristate.isTrue);
    });
  });
}
