import 'package:fluxer_app/features/chat/utils/channel_search_text_edit_utils.dart';
import 'package:test/test.dart';

void main() {
  group('replaceCurrentWordInSearchText', () {
    test('replaces the current word once', () {
      final SearchTextEditResult result = replaceCurrentWordInSearchText(
        text: 'hello from:partial world',
        cursor: 18,
        replacement: 'from:alice ',
      );

      expect(result.text, 'hello from:alice  world');
      expect(result.cursor, 17);
    });

    test('does not duplicate filters while extending a token', () {
      final SearchTextEditResult first = replaceCurrentWordInSearchText(
        text: 'from:a',
        cursor: 6,
        replacement: 'from:ab',
      );
      final SearchTextEditResult second = replaceCurrentWordInSearchText(
        text: first.text,
        cursor: first.cursor,
        replacement: 'from:abc',
      );

      expect(second.text, 'from:abc');
      expect(second.text.contains('from:a from:'), isFalse);
    });

    test('quotes values with spaces when inserted manually', () {
      final SearchTextEditResult result = replaceCurrentWordInSearchText(
        text: 'from:',
        cursor: 5,
        replacement: 'from:"Alice Smith" ',
      );

      expect(result.text, 'from:"Alice Smith" ');
    });
  });

  group('pruneSearchHintMaps', () {
    test('removes stale user hints when token text changes', () {
      final Map<String, String> usersByTag = <String, String>{'alice': '1'};
      final Map<String, String> channelsByName = <String, String>{};

      pruneSearchHintMaps(
        query: 'from:bob',
        usersByTag: usersByTag,
        channelsByName: channelsByName,
      );

      expect(usersByTag, isEmpty);
    });

    test('keeps hints that still match the query', () {
      final Map<String, String> usersByTag = <String, String>{'alice': '1'};
      final Map<String, String> channelsByName = <String, String>{
        'general': '10',
      };

      pruneSearchHintMaps(
        query: 'from:alice in:general',
        usersByTag: usersByTag,
        channelsByName: channelsByName,
      );

      expect(usersByTag['alice'], '1');
      expect(channelsByName['general'], '10');
    });
  });
}
