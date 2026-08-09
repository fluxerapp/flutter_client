import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_variant.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../helpers/test_l10n.dart';

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

Color? buttonBorderColor(WidgetTester tester) {
  final container = tester.widget<AnimatedContainer>(
    find.byType(AnimatedContainer),
  );
  final decoration = container.decoration! as BoxDecoration;
  return decoration.border?.top.color;
}

Future<void> hoverButton(WidgetTester tester) async {
  final center = tester.getCenter(find.byType(FluxerButton));
  final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
  await gesture.addPointer(location: center);
  await tester.pumpAndSettle();
}

void main() {
  group('FluxerButton', () {
    testWidgets('primary variant renders label text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(FluxerButton.primary(onPressed: () {}, label: 'Click me')),
      );

      expect(find.text('Click me'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        buildTestApp(
          FluxerButton.primary(onPressed: () => tapped = true, label: 'Tap'),
        ),
      );

      await tester.tap(find.text('Tap'));
      expect(tapped, isTrue);
    });

    testWidgets('does NOT call onPressed when loading', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        buildTestApp(
          FluxerButton.primary(
            onPressed: () => tapped = true,
            label: 'Loading',
            isLoading: true,
          ),
        ),
      );

      await tester.tap(find.byType(FluxerButton));
      expect(tapped, isFalse);
    });

    testWidgets('shows FluxerLoadingSpinner when loading', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerButton.primary(
            onPressed: () {},
            label: 'Loading',
            isLoading: true,
          ),
        ),
      );

      expect(find.byType(FluxerLoadingSpinner), findsOneWidget);
      expect(find.text('Loading'), findsNothing);
    });

    testWidgets('all 7 named constructors create a widget', (tester) async {
      final constructors = <Widget>[
        FluxerButton.primary(onPressed: () {}, label: 'primary'),
        FluxerButton.secondary(onPressed: () {}, label: 'secondary'),
        FluxerButton.dangerPrimary(onPressed: () {}, label: 'dangerPrimary'),
        FluxerButton.dangerSecondary(
          onPressed: () {},
          label: 'dangerSecondary',
        ),
        FluxerButton.inverted(onPressed: () {}, label: 'inverted'),
        FluxerButton.invertedOutline(
          onPressed: () {},
          label: 'invertedOutline',
        ),
        FluxerButton.ghost(onPressed: () {}, label: 'ghost'),
      ];

      for (final button in constructors) {
        await tester.pumpWidget(buildTestApp(button));
        expect(find.byType(FluxerButton), findsOneWidget);
      }
    });

    testWidgets('compact size renders with height 32', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerButton.primary(
            onPressed: () {},
            label: 'Compact',
            size: FluxerButtonSize.compact,
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final constraints = container.constraints!;
      expect(constraints.minHeight, 32);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerButton.primary(
            onPressed: () {},
            label: 'With icon',
            icon: PhosphorIconsBold.check,
          ),
        ),
      );

      expect(find.byType(PhosphorIcon), findsOneWidget);
      expect(find.text('With icon'), findsOneWidget);
    });

    testWidgets('renders as square icon-only button', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerButton.primary(
            onPressed: () {},
            icon: PhosphorIconsBold.plus,
            isSquare: true,
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final constraints = container.constraints!;
      expect(constraints.minWidth, constraints.minHeight);
    });

    testWidgets('icon-only button is findable with semanticLabel', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerButton.circle(
            onPressed: () {},
            icon: PhosphorIconsBold.plus,
            semanticLabel: 'Add item',
          ),
        ),
      );

      expect(find.bySemanticsLabel('Add item'), findsOneWidget);
    });

    testWidgets('loading button announces loading state', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerButton.primary(
            onPressed: () {},
            label: 'Submit',
            isLoading: true,
          ),
        ),
      );

      expect(find.bySemanticsLabel('Submit, Loading'), findsOneWidget);
    });

    group('accent borders', () {
      late FluxerColorTheme colors;

      setUp(() {
        colors = buildDarkColorTheme();
      });

      testWidgets('primary uses brand-mixed border color', (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            FluxerButton.primary(onPressed: () {}, label: 'Primary'),
          ),
        );

        expect(
          buttonBorderColor(tester),
          FluxerButtonVariant.primary.borderColor(colors),
        );
      });

      testWidgets('primary hover updates border color', (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            FluxerButton.primary(onPressed: () {}, label: 'Primary'),
          ),
        );

        await hoverButton(tester);

        expect(
          buttonBorderColor(tester),
          FluxerButtonVariant.primary.borderColor(colors, hovered: true),
        );
      });

      testWidgets('secondary uses accent border color', (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            FluxerButton.secondary(onPressed: () {}, label: 'Secondary'),
          ),
        );

        expect(
          buttonBorderColor(tester),
          FluxerButtonVariant.secondary.borderColor(colors),
        );
      });

      testWidgets('secondary hover updates border color', (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            FluxerButton.secondary(onPressed: () {}, label: 'Secondary'),
          ),
        );

        await hoverButton(tester);

        expect(
          buttonBorderColor(tester),
          FluxerButtonVariant.secondary.borderColor(colors, hovered: true),
        );
      });

      testWidgets('dangerSecondary uses accent border color', (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            FluxerButton.dangerSecondary(
              onPressed: () {},
              label: 'Danger secondary',
            ),
          ),
        );

        expect(
          buttonBorderColor(tester),
          FluxerButtonVariant.dangerSecondary.borderColor(colors),
        );
      });

      testWidgets('dangerSecondary hover updates border color', (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            FluxerButton.dangerSecondary(
              onPressed: () {},
              label: 'Danger secondary',
            ),
          ),
        );

        await hoverButton(tester);

        expect(
          buttonBorderColor(tester),
          FluxerButtonVariant.dangerSecondary.borderColor(
            colors,
            hovered: true,
          ),
        );
      });
    });
  });
}
