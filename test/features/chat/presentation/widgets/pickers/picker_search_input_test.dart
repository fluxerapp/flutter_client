import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/material_ui.dart';

Widget buildTestApp(Widget child) {
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
  testWidgets('applies horizontal padding to both sides', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      buildTestApp(
        PickerSearchInput(
          controller: controller,
          hintText: 'Search GIFs',
          horizontalPadding: 20,
        ),
      ),
    );

    final hasSymmetricPadding = tester
        .widgetList<Padding>(find.byType(Padding))
        .any(
          (padding) =>
              padding.padding ==
              const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
        );

    expect(hasSymmetricPadding, isTrue);
  });

  testWidgets('enforces the configured max length', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      buildTestApp(
        PickerSearchInput(
          controller: controller,
          hintText: 'Search GIFs',
          maxLength: 3,
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'abcdef');
    await tester.pump();

    expect(controller.text, 'abc');
  });
}
