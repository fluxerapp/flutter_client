import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/theme_swatch_button.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/material_ui.dart';

Widget _buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

void main() {
  testWidgets('shows theme name on long press', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(
        ThemeSwatchButton(
          label: 'Dark Theme',
          backgroundColor: const Color(0xFF1D1C22),
          isSelected: false,
          onTap: () {},
        ),
      ),
    );

    expect(find.text('Dark Theme'), findsNothing);

    await tester.longPress(find.byType(ThemeSwatchButton));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Dark Theme'), findsOneWidget);
    expect(find.byType(FluxerTooltip), findsOneWidget);
  });

  testWidgets('exposes theme name as semantics label', (tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();

    await tester.pumpWidget(
      _buildTestApp(
        ThemeSwatchButton(
          label: 'Light Theme',
          backgroundColor: const Color(0xFFFBFBFC),
          isSelected: true,
          onTap: () {},
        ),
      ),
    );

    expect(find.bySemanticsLabel('Light Theme'), findsOneWidget);
    handle.dispose();
  });
}
