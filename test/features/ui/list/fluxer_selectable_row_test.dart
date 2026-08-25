import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/list/fluxer_selectable_row.dart';
import 'package:fluxer_app/material_ui.dart';

Widget _app(Widget child) {
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
  testWidgets('exposes semanticLabel for screen readers', (tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();

    await tester.pumpWidget(
      _app(
        FluxerSelectableRow(
          isSelected: true,
          selectedColor: Colors.blue,
          borderRadius: BorderRadius.circular(8),
          semanticLabel: 'General channel',
          onTap: () {},
          child: const Text('General'),
        ),
      ),
    );

    expect(find.bySemanticsLabel('General channel'), findsOneWidget);
    handle.dispose();
  });
}
