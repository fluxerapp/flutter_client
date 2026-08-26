import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/input/emoji_text_editing_controller.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('extractInsertedDisplayText', () {
    test('extracts text inserted at caret', () {
      expect(
        extractInsertedDisplayText(
          textBefore: 'hello world',
          textAfter: 'hello there world',
          selectionBefore: const TextSelection.collapsed(offset: 5),
        ),
        ' there',
      );
    });

    test('extracts text that replaced a selection', () {
      expect(
        extractInsertedDisplayText(
          textBefore: 'hello world',
          textAfter: 'hi world',
          selectionBefore: const TextSelection(baseOffset: 0, extentOffset: 5),
        ),
        'hi',
      );
    });
  });

  group('reprocessNativeTextPaste', () {
    test('re-chips pasted emoji shortcode after native paste', () async {
      final EmojiTextEditingController controller = EmojiTextEditingController()
        ..selection = const TextSelection.collapsed(offset: 0);
      controller.text = ':wave:';

      final bool pasted = await reprocessNativeTextPaste(
        controller: controller,
        textBefore: '',
        selectionBefore: const TextSelection.collapsed(offset: 0),
        applyPaste: (String inserted) =>
            pasteWireTextIntoInlineTokenController(controller, inserted),
      );

      expect(pasted, isTrue);
      expect(controller.actualText, ':wave:');
      expect(controller.text.length, 1);
      controller.dispose();
    });
  });

  group('reprocessNativeInlineTokenPaste', () {
    test('delegates to reprocessNativeTextPaste', () async {
      final EmojiTextEditingController controller = EmojiTextEditingController()
        ..selection = const TextSelection.collapsed(offset: 0);
      controller.text = ':wave:';

      final bool pasted = await reprocessNativeInlineTokenPaste(
        controller: controller,
        textBefore: '',
        selectionBefore: const TextSelection.collapsed(offset: 0),
      );

      expect(pasted, isTrue);
      expect(controller.actualText, ':wave:');
      controller.dispose();
    });
  });

  group('stripPrivateUseCharacters', () {
    test('removes BMP private-use sentinels', () {
      expect(
        stripPrivateUseCharacters('a${String.fromCharCode(0xE000)}b'),
        'ab',
      );
    });

    test('preserves plain text', () {
      expect(stripPrivateUseCharacters('hello :wave:'), 'hello :wave:');
    });
  });

  group('copyInlineTokenSelection', () {
    test('copies wire text for selected emoji', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final EmojiTextEditingController controller = EmojiTextEditingController()
        ..loadWithTokens(':wave:');
      controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: controller.text.length,
      );
      String? clipboardText;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, (
            MethodCall methodCall,
          ) async {
            if (methodCall.method == 'Clipboard.setData') {
              final Map<dynamic, dynamic> args =
                  methodCall.arguments as Map<dynamic, dynamic>;
              clipboardText = args['text'] as String?;
            }
            return null;
          });
      addTearDown(() {
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, null);
      });

      final bool copied = await copyInlineTokenSelection(controller);

      expect(copied, isTrue);
      expect(clipboardText, ':wave:');
      controller.dispose();
    });

    test('returns false for plain controller', () async {
      final TextEditingController controller = TextEditingController(text: 'hi')
        ..selection = const TextSelection(baseOffset: 0, extentOffset: 2);

      final bool copied = await copyInlineTokenSelection(controller);

      expect(copied, isFalse);
      controller.dispose();
    });
  });

  group('projectedWireLengthAfterPaste', () {
    test('projects wire length for insertion at caret', () {
      final EmojiTextEditingController controller = EmojiTextEditingController()
        ..text = 'hi'
        ..selection = const TextSelection.collapsed(offset: 2);

      final int projected = projectedWireLengthAfterPaste(controller, ' there');

      expect(projected, 'hi there'.length);
      controller.dispose();
    });
  });

  group('pasteWireTextIntoInlineTokenController', () {
    test('re-chips pasted emoji shortcode', () async {
      final EmojiTextEditingController controller = EmojiTextEditingController()
        ..selection = const TextSelection.collapsed(offset: 0);

      final bool pasted = await pasteWireTextIntoInlineTokenController(
        controller,
        ':wave:',
      );

      expect(pasted, isTrue);
      expect(controller.actualText, ':wave:');
      expect(controller.text.length, 1);
      controller.dispose();
    });

    test('strips orphan private-use sentinels from clipboard', () async {
      final EmojiTextEditingController controller =
          EmojiTextEditingController();

      final bool pasted = await pasteWireTextIntoInlineTokenController(
        controller,
        String.fromCharCode(0xE000),
      );

      expect(pasted, isFalse);
      expect(controller.text, isEmpty);
      controller.dispose();
    });

    test('inserts wire text at selection', () async {
      final EmojiTextEditingController controller = EmojiTextEditingController()
        ..text = 'hi '
        ..selection = const TextSelection.collapsed(offset: 3);

      await pasteWireTextIntoInlineTokenController(controller, ':wave:');

      expect(controller.actualText, 'hi :wave:');
      controller.dispose();
    });
  });

  group('pasteIntoTextController', () {
    test('inserts clipboard text at the current selection', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final TextEditingController controller = TextEditingController(
        text: 'hello world',
      )..selection = const TextSelection.collapsed(offset: 5);
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, (
            MethodCall methodCall,
          ) async {
            if (methodCall.method == 'Clipboard.getData') {
              return <String, String>{'text': ' there'};
            }
            return null;
          });
      addTearDown(() {
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, null);
      });
      await pasteIntoTextController(controller);
      expect(controller.text, 'hello there world');
      expect(controller.selection, const TextSelection.collapsed(offset: 11));
      controller.dispose();
    });

    test('inserts clipboard text at end when selection is invalid', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final TextEditingController controller = TextEditingController(text: 'hi')
        ..selection = const TextSelection.collapsed(offset: -1);
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, (
            MethodCall methodCall,
          ) async {
            if (methodCall.method == 'Clipboard.getData') {
              return <String, String>{'text': ' there'};
            }
            return null;
          });
      addTearDown(() {
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, null);
      });

      await pasteIntoTextController(controller);

      expect(controller.text, 'hi there');
      expect(controller.selection, const TextSelection.collapsed(offset: 8));
      controller.dispose();
    });
  });

  group('InlineTokenTextEditingController IME sanitize', () {
    test('drops orphan private-use sentinels on value assignment', () {
      final EmojiTextEditingController controller = EmojiTextEditingController()
        ..value = TextEditingValue(
          text: 'a${String.fromCharCode(0xE000)}b',
          selection: const TextSelection.collapsed(offset: 2),
        );

      expect(controller.text, 'ab');
      expect(controller.selection, const TextSelection.collapsed(offset: 1));
      controller.dispose();
    });

    test('keeps live token sentinels', () {
      final EmojiTextEditingController controller = EmojiTextEditingController()
        ..loadWithTokens(':wave:');
      final String sentinel = controller.text;

      controller.value = TextEditingValue(
        text: '${sentinel}x',
        selection: TextSelection.collapsed(offset: sentinel.length + 1),
      );

      expect(controller.text, '${sentinel}x');
      expect(controller.actualText, ':wave:x');
      controller.dispose();
    });
  });
}
