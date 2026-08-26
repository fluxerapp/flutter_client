import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/utils/composer_clipboard_paste.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<ComposerMentionController> _pumpMentionController(
  WidgetTester tester,
) async {
  final colorTheme = buildDarkColorTheme();
  ComposerMentionController? controller;
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        home: Scaffold(
          body: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? _) {
              controller ??= ComposerMentionController(ref: ref);
              return TextField(controller: controller);
            },
          ),
        ),
      ),
    ),
  );
  addTearDown(() => controller?.dispose());
  return controller!;
}

void _mockClipboardText(String text) {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(SystemChannels.platform, (
        MethodCall methodCall,
      ) async {
        if (methodCall.method == 'Clipboard.getData') {
          return <String, String>{'text': text};
        }
        return null;
      });
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('clipboardLikelyHasFileAttachments', () {
    test('returns false when clipboard has strings', () {
      expect(clipboardLikelyHasFileAttachments(hasStrings: true), isFalse);
    });

    test('returns true when clipboard has no strings', () {
      expect(clipboardLikelyHasFileAttachments(hasStrings: false), isTrue);
    });

    test('returns true when clipboard string presence is unknown', () {
      expect(clipboardLikelyHasFileAttachments(hasStrings: null), isTrue);
    });
  });

  group('readClipboardLikelyHasFileAttachments', () {
    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, null);
    });

    test('reads clipboard string presence from the platform', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, (
            MethodCall methodCall,
          ) async {
            if (methodCall.method == 'Clipboard.hasStrings') {
              return <String, bool>{'value': true};
            }
            return null;
          });

      expect(await readClipboardLikelyHasFileAttachments(), isFalse);
    });
  });

  group('finishComposerNativeTextPaste', () {
    testWidgets('re-chips pasted mention wire text after native paste', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );
      controller.text = 'hi <@123>';

      await finishComposerNativeTextPaste(
        controller: controller,
        textBefore: '',
        selectionBefore: const TextSelection.collapsed(offset: 0),
        maxMessageLength: 100,
        canAttachOnExceed: () => false,
        onPasteExceedsLimit: (_) => fail('should not exceed'),
      );
      await tester.pump();

      expect(controller.text, isNot(contains('<@123>')));
      expect(controller.toWireText(), 'hi <@123>');
    });
  });

  group('projectedWireLengthAfterPaste', () {
    testWidgets('projects wire length for insertion at caret', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );
      controller
        ..text = 'hi'
        ..selection = const TextSelection.collapsed(offset: 2);

      final int projected = projectedWireLengthAfterPaste(controller, ' there');

      expect(projected, 'hi there'.length);
    });
  });

  group('pasteIntoComposer', () {
    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, null);
    });

    testWidgets('inserts clipboard text within limit', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );
      _mockClipboardText('hello');

      await pasteIntoComposer(
        controller: controller,
        maxLength: 100,
        canAttachOnExceed: false,
        onPasteExceedsLimit: (_) => fail('should not exceed'),
      );

      expect(controller.toWireText(), 'hello');
    });

    testWidgets('chips pasted mention wire text', (WidgetTester tester) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );
      _mockClipboardText('hi <@123>');

      await pasteIntoComposer(
        controller: controller,
        maxLength: 100,
        canAttachOnExceed: false,
        onPasteExceedsLimit: (_) => fail('should not exceed'),
      );
      await tester.pump();

      expect(controller.text, isNot(contains('<@123>')));
      expect(controller.toWireText(), 'hi <@123>');
    });

    testWidgets('routes over-limit paste to attachment callback', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );
      _mockClipboardText('hello world');
      String? exceededText;

      await pasteIntoComposer(
        controller: controller,
        maxLength: 5,
        canAttachOnExceed: true,
        onPasteExceedsLimit: (String pastedText) => exceededText = pastedText,
      );

      expect(exceededText, 'hello world');
      expect(controller.toWireText(), isEmpty);
    });

    testWidgets('allows over-limit paste when attach fallback disabled', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );
      _mockClipboardText('hello world');
      var attachCalled = false;

      await pasteIntoComposer(
        controller: controller,
        maxLength: 5,
        canAttachOnExceed: false,
        onPasteExceedsLimit: (_) => attachCalled = true,
      );

      expect(attachCalled, isFalse);
      expect(controller.toWireText(), 'hello world');
    });

    testWidgets('reports a paste that is only private-use glyphs', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );
      _mockClipboardText('\uE056');
      var lostContent = false;

      await pasteIntoComposer(
        controller: controller,
        maxLength: 100,
        canAttachOnExceed: true,
        onPasteExceedsLimit: (_) => fail('should not exceed'),
        onPasteLostContent: () => lostContent = true,
      );

      expect(lostContent, isTrue);
      expect(controller.toWireText(), isEmpty);
    });
  });

  group('dictation-like bulk edits without paste formatters', () {
    testWidgets('preserves bulk insert into empty field', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );

      controller.value = const TextEditingValue(
        text: 'hello world',
        selection: TextSelection.collapsed(offset: 11),
      );
      await tester.pump();

      expect(controller.toWireText(), 'hello world');
    });

    testWidgets('preserves remove-then-insert finalize sequence', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );

      controller
        ..value = const TextEditingValue(
          text: 'hello worl',
          selection: TextSelection.collapsed(offset: 10),
        )
        ..value = const TextEditingValue(
          selection: TextSelection.collapsed(offset: 0),
        )
        ..value = const TextEditingValue(
          text: 'hello world',
          selection: TextSelection.collapsed(offset: 11),
        );
      await tester.pump();

      expect(controller.toWireText(), 'hello world');
    });

    testWidgets('preserves in-place dictation correction', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );

      controller
        ..value = const TextEditingValue(
          text: 'This on is',
          selection: TextSelection.collapsed(offset: 10),
        )
        ..value = const TextEditingValue(
          text: 'This one is difficult',
          selection: TextSelection.collapsed(offset: 22),
        );
      await tester.pump();

      expect(controller.toWireText(), 'This one is difficult');
    });
  });
}
