import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';

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
  group('FluxerInput', () {
    testWidgets('renders label text above the field', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerInput(label: 'Username')),
      );

      expect(find.text('Username'), findsOneWidget);

      final labelFinder = find.text('Username');
      final fieldFinder = find.byType(TextFormField);

      final labelOffset = tester.getTopLeft(labelFinder);
      final fieldOffset = tester.getTopLeft(fieldFinder);
      expect(labelOffset.dy, lessThan(fieldOffset.dy));
    });

    testWidgets('renders hint text in the field', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerInput(hint: 'Enter your name')),
      );

      expect(find.text('Enter your name'), findsOneWidget);
    });

    testWidgets('does not render label when null', (tester) async {
      await tester.pumpWidget(buildTestApp(const FluxerInput(hint: 'Hi')));

      final column = tester.widget<Column>(find.byType(Column).first);
      // Column should contain only the TextFormField (no label Padding).
      expect(column.children.whereType<Padding>().length, equals(0));
    });

    testWidgets('multiline constructor sets minLines', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerInput.multiline(hint: 'Write something...')),
      );

      final editable = tester.widget<EditableText>(find.byType(EditableText));
      expect(editable.minLines, equals(3));
      expect(editable.maxLines, isNull);
    });

    testWidgets('provides the default text selection context menu', (
      tester,
    ) async {
      await tester.pumpWidget(buildTestApp(const FluxerInput()));

      final editable = tester.widget<EditableText>(find.byType(EditableText));
      expect(editable.contextMenuBuilder, isNotNull);
    });

    testWidgets('preserves a custom text selection context menu', (
      tester,
    ) async {
      Widget customContextMenuBuilder(
        BuildContext context,
        EditableTextState editableTextState,
      ) => const SizedBox();

      await tester.pumpWidget(
        buildTestApp(FluxerInput(contextMenuBuilder: customContextMenuBuilder)),
      );

      final editable = tester.widget<EditableText>(find.byType(EditableText));
      expect(editable.contextMenuBuilder, same(customContextMenuBuilder));
    });

    testWidgets('suffix icon tap fires callback', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        buildTestApp(
          FluxerInput(
            hint: 'Password',
            suffixIcon: const Icon(Icons.visibility),
            onSuffixTap: () => tapped = true,
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.visibility));
      expect(tapped, isTrue);
    });
  });
}
