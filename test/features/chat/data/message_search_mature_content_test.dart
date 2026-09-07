import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/message_search_mature_content.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';

void main() {
  group('applyMatureContentToSearchQuery', () {
    MessageSearchQuery query({String rawQuery = 'hello'}) {
      return MessageSearchQuery.build(
        channelId: 'channel-1',
        guildId: 'guild-1',
        rawQuery: rawQuery,
      );
    }

    test('sets includeNsfw when searching consented gated content', () {
      expect(
        applyMatureContentToSearchQuery(query(), includeNsfw: true)
            .parsed
            .includeNsfw,
        isTrue,
      );
    });

    test('leaves includeNsfw unset for ungated search', () {
      final MessageSearchQuery original = query();
      final MessageSearchQuery result = applyMatureContentToSearchQuery(
        original,
        includeNsfw: false,
      );

      expect(identical(result, original), isTrue);
      expect(result.parsed.includeNsfw, isNull);
    });

    test('overwrites nsfw:false when searching consented gated content', () {
      final MessageSearchQuery original = query(rawQuery: 'hello nsfw:false');
      expect(original.parsed.includeNsfw, isFalse);
      expect(
        applyMatureContentToSearchQuery(original, includeNsfw: true)
            .parsed
            .includeNsfw,
        isTrue,
      );
    });
  });
}
