import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import '../../../helpers/test_l10n.dart';

Widget _buildTestApp(Widget child) {
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

void main() {
  group('FluxerConfirmSheet', () {
    testWidgets('tap confirm fires callback and resolves with true', (
      tester,
    ) async {
      var onConfirmCalls = 0;
      Future<bool?>? pendingResult;

      await tester.pumpWidget(
        _buildTestApp(
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                pendingResult = FluxerConfirmSheet.show(
                  context,
                  title: 'Delete Item',
                  description: 'Are you sure?',
                  confirmLabel: 'Delete',
                  isDanger: true,
                  onConfirm: () => onConfirmCalls++,
                );
              },
              child: const Text('Open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Delete Item'), findsOneWidget);
      expect(find.text('Are you sure?'), findsOneWidget);
      // No Cancel button — only the confirm action.
      expect(find.text('Cancel'), findsNothing);
      expect(find.byType(FluxerButton), findsOneWidget);

      await tester.tap(find.widgetWithText(FluxerButton, 'Delete'));
      await tester.pumpAndSettle();

      expect(onConfirmCalls, 1);
      expect(await pendingResult, isTrue);
    });

    testWidgets('dismiss without confirming resolves with null', (
      tester,
    ) async {
      var onConfirmCalls = 0;
      Future<bool?>? pendingResult;
      late BuildContext capturedContext;

      await tester.pumpWidget(
        _buildTestApp(
          Builder(
            builder: (context) {
              capturedContext = context;
              return ElevatedButton(
                onPressed: () {
                  pendingResult = FluxerConfirmSheet.show(
                    context,
                    title: 'Unpin Message',
                    description: 'Are you sure?',
                    confirmLabel: 'Unpin',
                    onConfirm: () => onConfirmCalls++,
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text('Unpin Message'), findsOneWidget);

      // Dismiss without confirming — pop the sheet route directly to mimic
      // a swipe-down / backdrop tap.
      Navigator.of(capturedContext).pop();
      await tester.pumpAndSettle();

      expect(onConfirmCalls, 0);
      expect(await pendingResult, isNull);
    });

    testWidgets(
      'isDanger=true renders the dangerPrimary FluxerButton variant',
      (tester) async {
        await tester.pumpWidget(
          _buildTestApp(
            Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerConfirmSheet.show(
                      context,
                      title: 'Delete',
                      confirmLabel: 'Delete',
                      isDanger: true,
                      onConfirm: () {},
                    ),
                  );
                },
                child: const Text('Open'),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();

        // The danger constructor maps to `FluxerButton.dangerPrimary`, which
        // renders a distinct background color. Compare against the primary
        // constructor rendered in an identical setup.
        final dangerColor = _resolveButtonFill(tester);

        // Re-render with isDanger: false and compare.
        await tester.tap(find.byType(FluxerButton));
        await tester.pumpAndSettle();
        await tester.pumpWidget(
          _buildTestApp(
            Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerConfirmSheet.show(
                      context,
                      title: 'Confirm',
                      confirmLabel: 'OK',
                      onConfirm: () {},
                    ),
                  );
                },
                child: const Text('Open'),
              ),
            ),
          ),
        );
        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();
        final primaryColor = _resolveButtonFill(tester);

        expect(
          dangerColor,
          isNot(equals(primaryColor)),
          reason:
              'danger variant must render a different fill color than primary',
        );
      },
    );
  });
}

/// Resolves the resting background color of the single FluxerButton currently
/// rendered in the sheet body. Walks the FluxerButton's subtree to find the
/// AnimatedContainer that draws the button background.
Color? _resolveButtonFill(WidgetTester tester) {
  final container = tester.widget<AnimatedContainer>(
    find
        .descendant(
          of: find.byType(FluxerButton),
          matching: find.byType(AnimatedContainer),
        )
        .first,
  );
  final decoration = container.decoration as BoxDecoration?;
  return decoration?.color;
}
