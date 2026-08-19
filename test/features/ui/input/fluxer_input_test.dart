import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/input/emoji_text_editing_controller.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:material_ui/material_ui.dart';

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

    testWidgets('wraps token controllers with clipboard scope', (tester) async {
      final EmojiTextEditingController controller =
          EmojiTextEditingController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        buildTestApp(FluxerInput(controller: controller, hint: 'Bio')),
      );

      expect(find.byType(FluxerClipboardScope), findsOneWidget);
    });

    testWidgets('paste from the real long press toolbar inserts text', (
      tester,
    ) async {
      final TextEditingController controller = TextEditingController();
      addTearDown(controller.dispose);
      _mockClipboardText('pasted-secret');

      await tester.pumpWidget(
        buildTestApp(FluxerInput(controller: controller, label: 'Email')),
      );

      await tester.longPress(find.byType(EditableText));
      await tester.pumpAndSettle();
      expect(find.text('Paste'), findsOneWidget);

      await tester.tap(find.text('Paste'));
      await tester.pumpAndSettle();

      expect(controller.text, 'pasted-secret');
    });

    testWidgets('toolbar paste survives a menu rebuild during the press', (
      tester,
    ) async {
      final TextEditingController controller = TextEditingController();
      addTearDown(controller.dispose);
      _mockClipboardText('pasted-secret');

      await tester.pumpWidget(
        buildTestApp(FluxerInput(controller: controller, label: 'Email')),
      );

      await tester.longPress(find.byType(EditableText));
      await tester.pumpAndSettle();

      final TestGesture gesture = await tester.startGesture(
        tester.getCenter(find.text('Paste')),
      );
      controller.selection = const TextSelection.collapsed(offset: 0);
      await tester.pump();
      await gesture.up();
      await tester.pumpAndSettle();

      expect(controller.text, 'pasted-secret');
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

void _mockClipboardText(String text) {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(SystemChannels.platform, (
        MethodCall methodCall,
      ) async {
        if (methodCall.method == 'Clipboard.getData') {
          return <String, String>{'text': text};
        }
        if (methodCall.method == 'Clipboard.hasStrings') {
          return <String, bool>{'value': true};
        }
        return null;
      });
  addTearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, null);
  });
}
