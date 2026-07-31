import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/input/emoji_text_editing_controller.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';

void main() {
  group('InlineTokenWireLengthFormatter', () {
    late EmojiTextEditingController controller;
    late InlineTokenWireLengthFormatter formatter;

    setUp(() {
      controller = EmojiTextEditingController();
      formatter = InlineTokenWireLengthFormatter(controller, maxWireLength: 10);
    });

    tearDown(() {
      controller.dispose();
    });

    test('allows edits within the wire-length limit', () {
      final TextEditingValue result = formatter.formatEditUpdate(
        const TextEditingValue(text: 'hello'),
        const TextEditingValue(text: 'hello worl'),
      );

      expect(result.text, 'hello worl');
    });

    test('rejects edits that exceed the wire-length limit', () {
      final TextEditingValue result = formatter.formatEditUpdate(
        const TextEditingValue(text: 'hello'),
        const TextEditingValue(text: 'hello world!'),
      );

      expect(result.text, 'hello');
    });

    test('counts emoji wire text when checking the limit', () {
      controller.insertEmoji('smile', '😀', maxActualLength: 20);
      final String displayText = controller.text;

      final TextEditingValue result = formatter.formatEditUpdate(
        TextEditingValue(text: displayText),
        TextEditingValue(text: '$displayText extra'),
      );

      expect(result.text, displayText);
    });

    test('wireLengthForDisplayText matches actualText for plain text', () {
      controller.text = 'hello';

      expect(controller.wireLengthForDisplayText('hello'), 5);
      expect(controller.actualTextLength, 5);
    });

    test('wireLengthForDisplayText counts emoji wire text', () {
      controller.insertEmoji('smile', '😀', maxActualLength: 20);

      expect(controller.actualTextLength, greaterThan(controller.text.length));
      expect(
        controller.wireLengthForDisplayText(controller.text),
        controller.actualTextLength,
      );
    });
  });
}
