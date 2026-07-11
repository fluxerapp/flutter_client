import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/input/emoji_text_editing_controller.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';

void main() {
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
              clipboardText = methodCall.arguments['text'] as String?;
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
      final TextEditingController controller = TextEditingController(
        text: 'hi',
      );
      controller.selection = const TextSelection(
        baseOffset: 0,
        extentOffset: 2,
      );

      final bool copied = await copyInlineTokenSelection(controller);

      expect(copied, isFalse);
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
      );
      controller.selection = const TextSelection.collapsed(offset: 5);
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
  });
}
