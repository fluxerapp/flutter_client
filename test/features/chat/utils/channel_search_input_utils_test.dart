import 'package:fluxer_app/features/chat/domain/channel_search_segments.dart';
import 'package:fluxer_app/features/chat/utils/channel_search_input_utils.dart';
import 'package:test/test.dart';

void main() {
  group('splitChannelSearchInput', () {
    test('splits completed filters into pills and editable text', () {
      final ChannelSearchInputParts parts = splitChannelSearchInput(
        'hello from:user world',
      );

      expect(parts.pills, hasLength(1));
      expect(parts.pills.first.filterKey, 'from');
      expect(parts.pills.first.display, 'user');
      expect(parts.editableText, 'hello world');
    });

    test('keeps incomplete filter in editable text', () {
      final ChannelSearchInputParts parts = splitChannelSearchInput('from:');

      expect(parts.pills, isEmpty);
      expect(parts.editableText, 'from:');
    });
  });

  group('rebuildChannelSearchText', () {
    test('rebuilds display text from pills and editable suffix', () {
      final String text = rebuildChannelSearchText(
        pills: const <ChannelSearchSegment>[
          ChannelSearchSegment(
            type: ChannelSearchSegmentType.filter,
            filterKey: 'has',
            display: 'image',
          ),
        ],
        editableText: 'cats',
      );

      expect(text, 'has:image cats');
    });
  });

  group('removeChannelSearchPill', () {
    test('removes matching pill', () {
      const List<ChannelSearchSegment> pills = <ChannelSearchSegment>[
        ChannelSearchSegment(
          type: ChannelSearchSegmentType.filter,
          filterKey: 'has',
          display: 'image',
        ),
        ChannelSearchSegment(
          type: ChannelSearchSegmentType.user,
          filterKey: 'from',
          display: 'alice',
        ),
      ];

      final List<ChannelSearchSegment> result = removeChannelSearchPill(
        pills,
        pills.first,
      );

      expect(result, hasLength(1));
      expect(result.first.filterKey, 'from');
    });
  });
}
