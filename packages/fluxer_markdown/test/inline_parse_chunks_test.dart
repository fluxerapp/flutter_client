import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/parsing/inline_parse_chunks.dart';

void main() {
  group('hasUnclosedStrikethroughDelimiters', () {
    test('returns false for balanced delimiters', () {
      expect(hasUnclosedStrikethroughDelimiters('~~strike~~'), isFalse);
    });

    test('returns true for a single opener', () {
      expect(hasUnclosedStrikethroughDelimiters('~~strike'), isTrue);
    });

    test('ignores escaped delimiters', () {
      expect(hasUnclosedStrikethroughDelimiters(r'\~~not strike~~'), isTrue);
    });
  });

  group('splitIntoInlineParseChunks', () {
    test('returns single chunk for text without newlines', () {
      expect(splitIntoInlineParseChunks('hello'), ['hello']);
    });

    test('splits plain lines when no strikethrough spans them', () {
      expect(splitIntoInlineParseChunks('a\nb'), ['a', 'b']);
    });

    test('coalesces lines inside strikethrough', () {
      expect(splitIntoInlineParseChunks('~~a\nb~~'), ['~~a\nb~~']);
    });

    test('coalesces only the strikethrough span between plain lines', () {
      expect(
        splitIntoInlineParseChunks('before\n~~line one\nline two~~\nafter'),
        ['before', '~~line one\nline two~~', 'after'],
      );
    });

    test('coalesces blank lines inside strikethrough', () {
      expect(splitIntoInlineParseChunks('~~a\n\nb~~'), ['~~a\n\nb~~']);
    });

    test('does not split escaped strikethrough on one line', () {
      expect(splitIntoInlineParseChunks(r'\~~not strike~~'), [
        r'\~~not strike~~',
      ]);
    });
  });
}
