import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
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
  testWidgets('SelectableText shows a copy toolbar on long press', (
    tester,
  ) async {
    await tester.pumpWidget(
      buildTestApp(const SelectableText('{"id": "message-1"}')),
    );

    final editable = tester.widget<EditableText>(find.byType(EditableText));
    expect(editable.contextMenuBuilder, isNotNull);

    await tester.longPress(find.byType(EditableText));
    await tester.pumpAndSettle();

    expect(find.text('Copy'), findsOneWidget);
    expect(find.text('Select all'), findsOneWidget);
  });
}
