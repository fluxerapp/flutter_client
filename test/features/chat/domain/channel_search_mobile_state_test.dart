import 'package:fluxer_app/features/chat/data/channel_search_history_repository.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_mobile_state.dart';
import 'package:test/test.dart';

void main() {
  group('channelSearchMobileCanSearch', () {
    test('allows search when chips or text are present', () {
      expect(
        channelSearchMobileCanSearch(
          rawQuery: '',
          hasChipFilters: true,
          contentTypes: const <MessageSearchContentFilter>{},
        ),
        isTrue,
      );
      expect(
        channelSearchMobileCanSearch(
          rawQuery: 'hello',
          hasChipFilters: false,
          contentTypes: const <MessageSearchContentFilter>{},
        ),
        isTrue,
      );
      expect(
        channelSearchMobileCanSearch(
          rawQuery: '',
          hasChipFilters: false,
          contentTypes: const <MessageSearchContentFilter>{
            MessageSearchContentFilter.image,
          },
        ),
        isTrue,
      );
    });

    test('disallows search for sort or scope alone', () {
      expect(
        channelSearchMobileCanSearch(
          rawQuery: '',
          hasChipFilters: false,
          contentTypes: const <MessageSearchContentFilter>{},
        ),
        isFalse,
      );
    });
  });

  group('ChannelSearchMobileChipState', () {
    test('restores history entry chip fields', () {
      const ChannelSearchHistoryEntry entry = ChannelSearchHistoryEntry(
        contextKey: 'guild:g1:channel:c1',
        displayText: 'from:alice',
        authorId: '1,2',
        scopeIndex: 0,
        sortIndex: 0,
        contentTypeIndices: <int>[],
        timestampMs: 1,
        channelIds: <String>['c2'],
        mentionIds: <String>['m1'],
        pinned: false,
        authorTypes: <String>['webhook'],
        linkHostname: 'example.com',
        usersByTag: <String, String>{'alice': '1'},
        channelsByName: <String, String>{'general': 'c2'},
      );

      final ChannelSearchMobileChipState state =
          ChannelSearchMobileChipState.fromHistoryEntry(entry);

      expect(state.authorIds, containsAll(<String>['1', '2']));
      expect(state.channelIds, contains('c2'));
      expect(state.mentionIds, contains('m1'));
      expect(state.pinned, isFalse);
      expect(state.authorTypes, contains('webhook'));
      expect(state.linkHostname, 'example.com');
    });
  });
}
