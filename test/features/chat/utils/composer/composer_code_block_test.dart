import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_code_block.dart';

void main() {
  group('isOffsetInsideCodeBlock', () {
    test('detects a caret inside a fenced block', () {
      const String text = '```\nfoo\n```';
      expect(isOffsetInsideCodeBlock(text, 5), isTrue);
      expect(isOffsetInsideCodeBlock(text, text.length), isFalse);
    });

    test('treats an unclosed fence as code to the end', () {
      const String text = 'hi\n```js\nconst a = 1;';
      expect(isOffsetInsideCodeBlock(text, text.length), isTrue);
      expect(isOffsetInsideCodeBlock(text, 1), isFalse);
    });

    test('ignores plain text and escaped fences', () {
      expect(isOffsetInsideCodeBlock('hello world', 5), isFalse);
      expect(
        isOffsetInsideCodeBlock(
          r'\```'
          '\nfoo',
          6,
        ),
        isFalse,
      );
    });

    test('ignores a fence opened inside inline code', () {
      expect(isOffsetInsideCodeBlock('`a ```\nfoo', 9), isFalse);
    });

    test('finds fences inside block quotes', () {
      const String text = '> ```\n> foo';
      expect(isOffsetInsideCodeBlock(text, text.length), isTrue);
    });
  });

  group('analyzeCodeIndent', () {
    test('inserts a tab at a collapsed caret inside code', () {
      const String text = '```\nfoo\n```';
      final CodeIndentPlan? plan = analyzeCodeIndent(
        text,
        4,
        4,
        unindent: false,
      );
      expect(plan, isNotNull);
      expect(plan!.edits.single.text, '\t');
      expect(plan.edits.single.start, 4);
      expect(plan.selectionStart, 5);
      expect(plan.selectionEnd, 5);
    });

    test('does nothing outside code', () {
      expect(analyzeCodeIndent('hello', 2, 2, unindent: false), isNull);
      expect(analyzeCodeIndent('hello', 2, 2, unindent: true), isNull);
    });

    test('indents every selected code line', () {
      const String text = '```\nfoo\nbar\n```';
      final CodeIndentPlan? plan = analyzeCodeIndent(
        text,
        4,
        11,
        unindent: false,
      );
      expect(plan, isNotNull);
      expect(plan!.edits.map((CodeIndentEdit e) => e.start), <int>[4, 8]);
      expect(plan.selectionStart, 5);
      expect(plan.selectionEnd, 13);
    });

    test('unindents a tab or up to four spaces', () {
      const String text = '```\n\tfoo\n      bar\n```';
      final CodeIndentPlan? plan = analyzeCodeIndent(
        text,
        4,
        18,
        unindent: true,
      );
      expect(plan, isNotNull);
      expect(
        plan!.edits.map((CodeIndentEdit e) => (e.start, e.end)),
        <(int, int)>[(4, 5), (9, 13)],
      );
    });
  });
}
