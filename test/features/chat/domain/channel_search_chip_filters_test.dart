import 'package:fluxer_app/features/chat/data/channel_search_query_parser.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_chip_filters.dart';
import 'package:test/test.dart';

void main() {
  group('mergeChipFilters', () {
    test('merges authors, mentions, channels, and has values', () {
      const ParsedChannelSearchParams parsed = ParsedChannelSearchParams(
        content: 'cats',
      );

      final ParsedChannelSearchParams merged = parsed.mergeChipFilters(
        authorId: 'author-1',
        contentTypes: const <MessageSearchContentFilter>{
          MessageSearchContentFilter.image,
        },
        chips: const ChannelSearchChipFilters(
          mentionIds: <String>['mention-1'],
          channelIds: <String>['channel-1'],
          pinned: true,
          authorTypes: <String>['bot'],
          linkHostname: 'example.com',
          fileName: 'screenshot',
          fileExtension: 'png',
          dateFilterKey: 'before',
          dateValue: '2024-01-15',
        ),
      );

      expect(merged.content, 'cats');
      expect(merged.authorIds, contains('author-1'));
      expect(merged.mentions, contains('mention-1'));
      expect(merged.channelIds, contains('channel-1'));
      expect(merged.has, contains('image'));
      expect(merged.pinned, isTrue);
      expect(merged.authorTypes, contains('bot'));
      expect(merged.linkHostnames, contains('example.com'));
      expect(merged.attachmentFilenames, contains('screenshot'));
      expect(merged.attachmentExtensions, contains('png'));
      expect(merged.maxId, isNotNull);
    });

    test('maps forward content filter to snapshot', () {
      const ParsedChannelSearchParams parsed = ParsedChannelSearchParams();

      final ParsedChannelSearchParams merged = parsed.mergeChipFilters(
        contentTypes: const <MessageSearchContentFilter>{
          MessageSearchContentFilter.forward,
        },
      );

      expect(merged.has, contains('snapshot'));
    });
  });

  group('MessageSearchQuery.build', () {
    test('sort and scope alone do not create search terms', () {
      final MessageSearchQuery query = MessageSearchQuery.build(
        channelId: 'channel-1',
        rawQuery: '',
        uiScope: MessageSearchScopeFilter.all,
        uiSort: MessageSearchSortFilter.oldest,
      );

      expect(query.hasSearchTerms, isFalse);
    });

    test('chip filters create search terms without text', () {
      final MessageSearchQuery query = MessageSearchQuery.build(
        channelId: 'channel-1',
        rawQuery: '',
        chipFilters: const ChannelSearchChipFilters(
          channelIds: <String>['channel-2'],
        ),
      );

      expect(query.hasSearchTerms, isTrue);
      expect(query.parsed.channelIds, contains('channel-2'));
    });
  });
}
