import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_segments.dart';

void main() {
  group('parseChannelSearchDisplayText', () {
    test('parses plain text', () {
      final segments = parseChannelSearchDisplayText('hello world');
      expect(segments, hasLength(1));
      expect(segments.first.type, ChannelSearchSegmentType.text);
      expect(segments.first.display, 'hello world');
    });

    test('parses from filter', () {
      final segments = parseChannelSearchDisplayText('from:alice');
      expect(segments, isNotEmpty);
      expect(
        segments.any((ChannelSearchSegment s) => s.filterKey == 'from'),
        isTrue,
      );
    });

    test('parses author-type and date filters', () {
      final segments = parseChannelSearchDisplayText(
        'author-type:bot on:2024-01-15',
      );
      expect(
        segments.any((ChannelSearchSegment s) => s.filterKey == 'author-type'),
        isTrue,
      );
      expect(
        segments.any((ChannelSearchSegment s) => s.filterKey == 'on'),
        isTrue,
      );
    });

    test('parses filter key aliases', () {
      final segments = parseChannelSearchDisplayText('link:example.com');
      expect(
        segments.any((ChannelSearchSegment s) => s.filterKey == 'link-from'),
        isTrue,
      );
    });
  });

  group('channelSearchAutocompleteFilterOptions', () {
    test('includes forward in has values', () {
      final ChannelSearchFilterOption? hasOption =
          channelSearchFilterOptionForKey('has');
      expect(hasOption?.values, contains('forward'));
    });

    test('exposes negated filters when current word starts with dash', () {
      final List<ChannelSearchFilterOption> options =
          channelSearchAutocompleteFilterOptions(
            isGuildChannel: true,
            currentWord: '-fr',
          );

      expect(
        options.any(
          (ChannelSearchFilterOption option) => option.key == '-from',
        ),
        isTrue,
      );
    });
  });
}
