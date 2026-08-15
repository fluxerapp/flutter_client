import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_identity_header.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/test_l10n.dart';

Widget _buildTestApp(Widget child) {
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
  group('FluxerJumpToBottomButton', () {
    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _buildTestApp(FluxerJumpToBottomButton(onTap: () => tapped = true)),
      );

      await tester.tap(find.byType(FluxerJumpToBottomButton));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onTap when disabled', (
      WidgetTester tester,
    ) async {
      var tapped = false;
      await tester.pumpWidget(
        _buildTestApp(
          FluxerJumpToBottomButton(enabled: false, onTap: () => tapped = true),
        ),
      );

      await tester.tap(find.byType(FluxerJumpToBottomButton));
      expect(tapped, isFalse);
    });

    testWidgets('shows loading spinner and does not call onTap when loading', (
      WidgetTester tester,
    ) async {
      var tapped = false;
      await tester.pumpWidget(
        _buildTestApp(
          FluxerJumpToBottomButton(isLoading: true, onTap: () => tapped = true),
        ),
      );

      expect(find.byType(FluxerLoadingSpinner), findsOneWidget);
      await tester.tap(find.byType(FluxerJumpToBottomButton));
      expect(tapped, isFalse);
    });
  });
}
