import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/input/emoji_text_editing_controller.dart';
import 'package:material_ui/material_ui.dart';

List<InlineSpan> _flattenInlineSpans(InlineSpan span) {
  if (span is TextSpan && span.children != null) {
    return span.children!.expand(_flattenInlineSpans).toList();
  }
  return <InlineSpan>[span];
}

List<String> _collectTextSpanTexts(InlineSpan root) {
  final List<String> texts = <String>[];
  for (final InlineSpan span in _flattenInlineSpans(root)) {
    if (span is TextSpan && span.text != null && span.text!.isNotEmpty) {
      texts.add(span.text!);
    }
  }
  return texts;
}

bool _containsPrivateUseSentinel(String text) {
  for (final int code in text.runes) {
    if (code >= 0xE000 && code <= 0xF8FF) {
      return true;
    }
  }
  return false;
}

void main() {
  group('EmojiTextEditingController', () {
    late EmojiTextEditingController controller;

    setUp(() {
      controller = EmojiTextEditingController();
    });

    tearDown(() {
      controller.dispose();
    });

    group('insertEmoji', () {
      test('inserts emoji into empty text', () {
        controller.insertEmoji('wave', '\u{1F44B}');

        expect(controller.text.length, 1);
        expect(controller.actualText, ':wave:');
        expect(controller.selection.baseOffset, 1);
      });

      test('inserts emoji at cursor position', () {
        controller
          ..value = const TextEditingValue(
            text: 'hello world',
            selection: TextSelection.collapsed(offset: 5),
          )
          ..insertEmoji('wave', '\u{1F44B}');

        expect(controller.actualText, 'hello :wave: world');
      });

      test('adds leading space when previous char is not whitespace', () {
        controller
          ..value = const TextEditingValue(
            text: 'hello',
            selection: TextSelection.collapsed(offset: 5),
          )
          ..insertEmoji('wave', '\u{1F44B}');

        expect(controller.actualText, 'hello :wave:');
      });

      test('does not add leading space when previous char is whitespace', () {
        controller
          ..value = const TextEditingValue(
            text: 'hello ',
            selection: TextSelection.collapsed(offset: 6),
          )
          ..insertEmoji('wave', '\u{1F44B}');

        expect(controller.actualText, 'hello :wave:');
      });

      test('adds trailing space when next char is not whitespace', () {
        controller
          ..value = const TextEditingValue(
            text: 'hello world',
            selection: TextSelection.collapsed(offset: 6),
          )
          ..insertEmoji('wave', '\u{1F44B}');

        expect(controller.actualText, 'hello :wave: world');
      });

      test('does not add trailing space when next char is whitespace', () {
        controller
          ..value = const TextEditingValue(
            text: 'hello  world',
            selection: TextSelection.collapsed(offset: 6),
          )
          ..insertEmoji('wave', '\u{1F44B}');

        expect(controller.actualText, 'hello :wave: world');
      });

      test('inserts at end when selection is invalid', () {
        controller
          ..text = 'hello'
          ..insertEmoji('wave', '\u{1F44B}');

        expect(controller.actualText, 'hello :wave:');
      });

      test('respects maxActualLength and blocks insertion', () {
        controller
          ..value = const TextEditingValue(
            text: 'abcde',
            selection: TextSelection.collapsed(offset: 5),
          )
          ..insertEmoji('wave', '\u{1F44B}', maxActualLength: 10);

        expect(controller.actualText, 'abcde');
      });

      test('allows insertion when within maxActualLength', () {
        controller
          ..value = const TextEditingValue(
            text: 'ab',
            selection: TextSelection.collapsed(offset: 2),
          )
          ..insertEmoji('wave', '\u{1F44B}', maxActualLength: 20);

        expect(controller.actualText, 'ab :wave:');
      });

      test('accounts for leading/trailing spaces in maxActualLength', () {
        controller
          ..value = const TextEditingValue(
            text: 'abcdefghij',
            selection: TextSelection.collapsed(offset: 5),
          )
          // actualText would be "abcde :wave: fghij" = 18 chars
          // but maxActualLength is 17 → should be blocked
          ..insertEmoji('wave', '\u{1F44B}', maxActualLength: 17);

        expect(controller.actualText, 'abcdefghij');
      });

      test('handles custom emoji markdown', () {
        controller.insertEmoji('cool', '<:cool:12345>');

        expect(controller.actualText, '<:cool:12345>');
      });

      test('handles animated custom emoji markdown', () {
        controller.insertEmoji('dance', '<a:dance:67890>');

        expect(controller.actualText, '<a:dance:67890>');
      });

      test('inserts consecutive emojis with spacing', () {
        controller
          ..insertEmoji('wave', '\u{1F44B}')
          ..insertEmoji('smile', '\u{1F604}');

        expect(controller.actualText, ':wave: :smile:');
      });
    });

    group('replaceRangeWithEmoji', () {
      test('replaces colon-prefixed query with emoji', () {
        controller
          ..value = const TextEditingValue(
            text: ':wave',
            selection: TextSelection.collapsed(offset: 5),
          )
          ..replaceRangeWithEmoji(0, 5, 'wave', '\u{1F44B}');

        expect(controller.actualText, ':wave:');
        expect(controller.text.length, 1);
      });

      test('replaces query after sentinel with no space', () {
        // Simulate: [sentinel]:wave
        controller.insertEmoji('smile', '\u{1F604}');
        final sentinelText = controller.text; // single sentinel char
        expect(sentinelText.length, 1);

        // Now append ":wave" by setting the value directly
        controller
          ..value = TextEditingValue(
            text: '$sentinelText:wave',
            selection: TextSelection.collapsed(offset: sentinelText.length + 5),
          )
          ..replaceRangeWithEmoji(
            sentinelText.length,
            sentinelText.length + 5,
            'wave',
            '\u{1F44B}',
          );

        expect(controller.actualText, ':smile::wave:');
        expect(controller.text.length, 2);
      });

      test('replaces query after sentinel with space', () {
        controller.insertEmoji('smile', '\u{1F604}');
        final sentinelText = controller.text;

        controller
          ..value = TextEditingValue(
            text: '$sentinelText :wave',
            selection: TextSelection.collapsed(offset: sentinelText.length + 6),
          )
          ..replaceRangeWithEmoji(
            sentinelText.length + 1,
            sentinelText.length + 6,
            'wave',
            '\u{1F44B}',
          );

        expect(controller.actualText, ':smile: :wave:');
      });

      test('adds trailing space when followed by non-whitespace', () {
        controller
          ..value = const TextEditingValue(
            text: ':wave hello',
            selection: TextSelection.collapsed(offset: 5),
          )
          ..replaceRangeWithEmoji(0, 5, 'wave', '\u{1F44B}');

        expect(controller.actualText, ':wave: hello');
      });

      test('does not add trailing space when followed by whitespace', () {
        controller
          ..value = const TextEditingValue(
            text: ':wave  hello',
            selection: TextSelection.collapsed(offset: 5),
          )
          ..replaceRangeWithEmoji(0, 5, 'wave', '\u{1F44B}');

        // Existing double space is preserved (no extra space added)
        expect(controller.actualText, ':wave:  hello');
      });

      test('does not add trailing space at end of text', () {
        controller
          ..value = const TextEditingValue(
            text: ':wave',
            selection: TextSelection.collapsed(offset: 5),
          )
          ..replaceRangeWithEmoji(0, 5, 'wave', '\u{1F44B}');

        expect(controller.actualText, ':wave:');
      });

      test('respects maxActualLength and blocks replacement', () {
        controller
          ..value = const TextEditingValue(
            text: 'aaaaaaaaaa:wave',
            selection: TextSelection.collapsed(offset: 15),
          )
          // actualTextLength = 15 (all plain text)
          // removedLength = 5 (":wave")
          // token = ":wave:" = 6
          // new = 15 - 5 + 6 = 16 → if maxActualLength = 15, should block
          ..replaceRangeWithEmoji(
            10,
            15,
            'wave',
            '\u{1F44B}',
            maxActualLength: 15,
          );

        expect(controller.actualText, 'aaaaaaaaaa:wave');
      });

      test('allows replacement within maxActualLength', () {
        controller
          ..value = const TextEditingValue(
            text: ':wave',
            selection: TextSelection.collapsed(offset: 5),
          )
          ..replaceRangeWithEmoji(
            0,
            5,
            'wave',
            '\u{1F44B}',
            maxActualLength: 320,
          );

        expect(controller.actualText, ':wave:');
      });

      test('handles custom emoji replacement', () {
        controller
          ..value = const TextEditingValue(
            text: ':cool',
            selection: TextSelection.collapsed(offset: 5),
          )
          ..replaceRangeWithEmoji(0, 5, 'cool', '<:cool:12345>');

        expect(controller.actualText, '<:cool:12345>');
      });

      test('places cursor after inserted emoji', () {
        controller
          ..value = const TextEditingValue(
            text: ':wave rest',
            selection: TextSelection.collapsed(offset: 5),
          )
          ..replaceRangeWithEmoji(0, 5, 'wave', '\u{1F44B}');

        // No trailing space added since after starts with ' '
        expect(controller.selection.baseOffset, 1);
      });
    });

    group('loadWithTokens', () {
      test('loads plain text without tokens', () {
        controller.loadWithTokens('hello world');

        expect(controller.text, 'hello world');
        expect(controller.actualText, 'hello world');
      });

      test('loads unicode emoji shortcode', () {
        controller.loadWithTokens(':wave:');

        expect(controller.text.length, 1);
        expect(controller.actualText, ':wave:');
      });

      test('loads multiple emoji shortcodes', () {
        controller.loadWithTokens(':wave::smile:');

        expect(controller.text.length, 2);
        expect(controller.actualText, ':wave::smile:');
      });

      test('loads emoji shortcodes with surrounding text', () {
        controller.loadWithTokens('hello :wave: world');

        expect(controller.actualText, 'hello :wave: world');
      });

      test('loads custom emoji markdown', () {
        controller.loadWithTokens('<:cool:12345>');

        expect(controller.text.length, 1);
        expect(controller.actualText, '<:cool:12345>');
      });

      test('loads animated custom emoji markdown', () {
        controller.loadWithTokens('<a:dance:67890>');

        expect(controller.text.length, 1);
        expect(controller.actualText, '<a:dance:67890>');
      });

      test('loads skin tone emoji shortcode', () {
        controller.loadWithTokens(':wave::skin-tone-3:');

        expect(controller.text.length, 1);
        expect(controller.actualText, ':wave::skin-tone-3:');
      });

      test('loads mixed content', () {
        controller.loadWithTokens('hi :wave: check <:cool:123> bye');

        expect(controller.actualText, 'hi :wave: check <:cool:123> bye');
      });

      test('resets segments on repeated calls', () {
        controller.loadWithTokens(':wave:');
        expect(controller.text.length, 1);

        controller.loadWithTokens(':smile:');
        expect(controller.text.length, 1);
        expect(controller.actualText, ':smile:');
      });

      test('loads empty string', () {
        controller.loadWithTokens('');

        expect(controller.text, '');
        expect(controller.actualText, '');
      });
    });

    group('actualText', () {
      test('returns plain text unchanged', () {
        controller.text = 'hello world';

        expect(controller.actualText, 'hello world');
      });

      test('expands sentinel to emoji token', () {
        controller.insertEmoji('wave', '\u{1F44B}');

        expect(controller.actualText, ':wave:');
      });

      test('expands multiple sentinels', () {
        controller.loadWithTokens(':wave::smile:');

        expect(controller.actualText, ':wave::smile:');
      });

      test('mixes plain text and sentinels', () {
        controller.loadWithTokens('hello :wave: world');

        expect(controller.actualText, 'hello :wave: world');
      });
    });

    group('actualTextLength', () {
      test('returns plain text length', () {
        controller.text = 'hello';

        expect(controller.actualTextLength, 5);
      });

      test('counts emoji token length, not sentinel length', () {
        controller.insertEmoji('wave', '\u{1F44B}');

        // ":wave:" is 6 chars, sentinel is 1 char in text
        expect(controller.actualTextLength, 6);
        expect(controller.text.length, 1);
      });

      test('counts custom emoji token length', () {
        controller.insertEmoji('cool', '<:cool:12345>');

        // "<:cool:12345>" is 13 chars
        expect(controller.actualTextLength, 13);
      });

      test('counts mixed text and emoji correctly', () {
        controller.loadWithTokens('hi :wave:');

        // "hi " = 3 chars + ":wave:" = 6 chars = 9
        expect(controller.actualTextLength, 9);
      });

      test('returns zero for empty text', () {
        expect(controller.actualTextLength, 0);
      });

      test('counts a keyboard-committed emoji as its two wire chars', () {
        controller.value = const TextEditingValue(
          text: '\u{1F600}',
          selection: TextSelection.collapsed(offset: 2),
        );

        expect(controller.actualTextLength, controller.actualText.length);
        expect(controller.actualTextLength, 2);
      });
    });

    group('buildTextSpan', () {
      testWidgets('renders plain text in children', (tester) async {
        controller.text = 'hello';
        TextSpan? result;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  result = controller.buildTextSpan(
                    context: context,
                    withComposing: false,
                  );
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        );

        expect(result, isNotNull);
        expect(result!.children, isNotNull);
        expect(result!.children!.length, 1);
        expect((result!.children!.first as TextSpan).text, 'hello');
      });

      testWidgets('renders emoji as WidgetSpan chip', (tester) async {
        controller.insertEmoji('wave', '\u{1F44B}');
        TextSpan? result;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  result = controller.buildTextSpan(
                    context: context,
                    withComposing: false,
                  );
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        );

        expect(result, isNotNull);
        expect(result!.children, isNotNull);
        expect(result!.children!.length, 1);
        expect(result!.children!.first, isA<WidgetSpan>());
      });

      testWidgets('renders mixed content as text and widget spans', (
        tester,
      ) async {
        controller.loadWithTokens('hello :wave: world');
        TextSpan? result;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  result = controller.buildTextSpan(
                    context: context,
                    withComposing: false,
                  );
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        );

        expect(result, isNotNull);
        // "hello " text, :wave: widget, " world" text
        expect(result!.children!.length, 3);
        expect(result!.children![0], isA<TextSpan>());
        expect(result!.children![1], isA<WidgetSpan>());
        expect(result!.children![2], isA<TextSpan>());
      });

      testWidgets('cleans up stale segments for deleted emojis', (
        tester,
      ) async {
        controller.loadWithTokens(':wave::smile:');
        expect(controller.text.length, 2);

        // Remove the second sentinel manually
        controller.text = controller.text.substring(0, 1);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  controller.buildTextSpan(
                    context: context,
                    withComposing: false,
                  );
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        );

        // After buildTextSpan, stale segment should be cleaned
        expect(controller.actualText, ':wave:');
      });

      testWidgets(
        'keeps emoji chip when composing covers adjacent typed text',
        (tester) async {
          controller
            ..loadWithTokens('hello :wave:')
            ..value = TextEditingValue(
              text: controller.text,
              composing: const TextRange(start: 0, end: 5),
              selection: const TextSelection.collapsed(offset: 5),
            );
          TextSpan? result;

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    result = controller.buildTextSpan(
                      context: context,
                      withComposing: true,
                    );
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          );

          expect(result, isNotNull);
          final List<InlineSpan> spans = _flattenInlineSpans(result!);
          expect(spans.whereType<WidgetSpan>().length, 1);
          for (final String text in _collectTextSpanTexts(result!)) {
            expect(_containsPrivateUseSentinel(text), isFalse);
          }
        },
      );

      testWidgets('underlines plain text in the composing range', (
        tester,
      ) async {
        controller
          ..text = 'hello world'
          ..value = TextEditingValue(
            text: controller.text,
            composing: const TextRange(start: 0, end: 5),
            selection: const TextSelection.collapsed(offset: 5),
          );
        TextSpan? result;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  result = controller.buildTextSpan(
                    context: context,
                    style: const TextStyle(),
                    withComposing: true,
                  );
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        );

        expect(result, isNotNull);
        final List<TextSpan> textSpans = _flattenInlineSpans(
          result!,
        ).whereType<TextSpan>().toList();
        expect(textSpans.length, 2);
        expect(textSpans[0].text, 'hello');
        expect(textSpans[0].style?.decoration, TextDecoration.underline);
        expect(textSpans[1].text, ' world');
        expect(textSpans[1].style?.decoration, isNull);
      });

      testWidgets(
        'keeps emoji chip when composing range spans sentinel offset',
        (tester) async {
          controller.loadWithTokens(':wave:');
          final int sentinelOffset = controller.text.indexOf(
            String.fromCharCode(0xE000),
          );
          expect(sentinelOffset, 0);
          controller.value = TextEditingValue(
            text: controller.text,
            composing: TextRange(
              start: sentinelOffset,
              end: sentinelOffset + 1,
            ),
            selection: TextSelection.collapsed(offset: sentinelOffset + 1),
          );
          TextSpan? result;

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    result = controller.buildTextSpan(
                      context: context,
                      withComposing: true,
                    );
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          );

          expect(result, isNotNull);
          final List<InlineSpan> spans = _flattenInlineSpans(result!);
          expect(spans.length, 1);
          expect(spans.single, isA<WidgetSpan>());
        },
      );
    });

    group('wire text range', () {
      test('toWireTextRange expands sentinels in selection', () {
        controller.loadWithTokens('hello :wave: world');

        expect(
          controller.toWireTextRange(0, controller.text.length),
          'hello :wave: world',
        );
        expect(controller.toWireTextRange(6, 7), ':wave:');
      });

      test('wireToDisplayFragment round-trips emoji shortcode', () {
        final String display = controller.wireToDisplayFragment(':wave:');
        controller.text = display;

        expect(display.length, 1);
        expect(controller.toWireText(), ':wave:');
      });

      test('replaceSelectionWithDisplayFragment splices at caret', () {
        controller
          ..loadWithTokens('hello world')
          ..selection = const TextSelection.collapsed(offset: 5);
        final String fragment = controller.wireToDisplayFragment(' :wave:');

        controller.replaceSelectionWithDisplayFragment(fragment);

        expect(controller.actualText, 'hello :wave: world');
        expect(
          controller.selection,
          TextSelection.collapsed(offset: 5 + fragment.length),
        );
      });
    });

    group('sentinel allocation', () {
      test('allocates unique sentinels for each emoji', () {
        controller
          ..insertEmoji('wave', '\u{1F44B}')
          ..insertEmoji('smile', '\u{1F604}');

        // Two distinct sentinels in the text
        final runes = controller.text.runes.toList();
        expect(runes.length, 3); // sentinel + space + sentinel
        expect(runes[0], isNot(equals(runes[2])));
      });

      test('sentinels are in BMP Private Use Area', () {
        controller.insertEmoji('wave', '\u{1F44B}');

        final code = controller.text.codeUnitAt(0);
        expect(code, greaterThanOrEqualTo(0xE000));
        expect(code, lessThanOrEqualTo(0xF8FF));
      });

      test('loadWithTokens resets sentinel allocation', () {
        controller.loadWithTokens(':wave:');
        final firstCode = controller.text.codeUnitAt(0);

        controller.loadWithTokens(':smile:');
        final secondCode = controller.text.codeUnitAt(0);

        // Both should start from the same base since loadWithTokens resets
        expect(firstCode, equals(secondCode));
      });
    });

    group('edge cases', () {
      test('handles inserting emoji with selection range', () {
        controller
          ..value = const TextEditingValue(
            text: 'hello world',
            selection: TextSelection(baseOffset: 5, extentOffset: 11),
          )
          // Non-collapsed selection should use baseOffset
          ..insertEmoji('wave', '\u{1F44B}');

        expect(controller.actualText, 'hello :wave: world');
      });

      test('replaceRange handles mid-text replacement', () {
        controller
          ..value = const TextEditingValue(
            text: 'start :wav middle',
            selection: TextSelection.collapsed(offset: 10),
          )
          ..replaceRangeWithEmoji(6, 10, 'wave', '\u{1F44B}');

        expect(controller.actualText, 'start :wave: middle');
      });

      test('multiple loadWithTokens calls do not leak segments', () {
        controller
          ..loadWithTokens(':a::b::c:')
          ..loadWithTokens(':x:');

        expect(controller.actualText, ':x:');
        expect(controller.text.length, 1);
      });

      test('keeps the caret off a surrogate pair when stripping sentinels', () {
        controller.value = const TextEditingValue(
          text: '\u{1F600}\uE000',
          selection: TextSelection.collapsed(offset: 2),
        );

        expect(controller.text, '\u{1F600}');
        expect(controller.selection.baseOffset, 2);
      });
    });
  });
}
