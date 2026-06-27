import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/parsing/markdown_parse_cache.dart';

void main() {
  test('markdownParseCacheKey prefers stable message key', () {
    expect(markdownParseCacheKey('hello', 'msg-1:42'), 'msg-1:42:hello');
    expect(markdownParseCacheKey('hello', null), 'hello');
  });
}
