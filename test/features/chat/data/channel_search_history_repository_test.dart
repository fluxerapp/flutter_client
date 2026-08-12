import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/channel_search_history_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ChannelSearchHistoryEntry', () {
    test('round-trips extended fields and legacy entries default safely', () {
      final ChannelSearchHistoryEntry entry = ChannelSearchHistoryEntry(
        contextKey: 'guild:g1:channel:c1',
        displayText: 'from:alice has:image',
        authorId: '1',
        scopeIndex: 2,
        sortIndex: 1,
        contentTypeIndices: const <int>[0],
        timestampMs: 123,
        channelIds: const <String>['c2'],
        mentionIds: const <String>['m1'],
        pinned: true,
        authorTypes: const <String>['bot'],
        linkHostname: 'example.com',
        fileName: 'shot',
        fileExtension: 'png',
        dateFilterKey: 'before',
        dateValue: '2024-01-01',
        usersByTag: const <String, String>{'alice': '1'},
        channelsByName: const <String, String>{'general': 'c2'},
      );

      final ChannelSearchHistoryEntry restored =
          ChannelSearchHistoryEntry.fromJson(entry.toJson());

      expect(restored.channelIds, entry.channelIds);
      expect(restored.usersByTag, entry.usersByTag);
      expect(restored.channelsByName, entry.channelsByName);
      expect(restored.pinned, isTrue);

      final ChannelSearchHistoryEntry legacy =
          ChannelSearchHistoryEntry.fromJson(const <String, dynamic>{
            'contextKey': 'dm:c1',
            'displayText': 'hello',
            'authorId': '',
            'scopeIndex': 0,
            'sortIndex': 0,
            'contentTypeIndices': <int>[],
            'timestampMs': 1,
          });

      expect(legacy.channelIds, isEmpty);
      expect(legacy.usersByTag, isEmpty);
    });
  });

  group('ChannelSearchHistoryRepository', () {
    test('stores and reads entries per context', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final ChannelSearchHistoryRepository repository =
          ChannelSearchHistoryRepository(prefs);

      await repository.addEntry(
        const ChannelSearchHistoryEntry(
          contextKey: 'guild:g1:channel:c1',
          displayText: 'cats',
          authorId: '',
          scopeIndex: 0,
          sortIndex: 0,
          contentTypeIndices: <int>[],
          timestampMs: 1,
        ),
      );

      expect(
        repository.readForContext('guild:g1:channel:c1').single.displayText,
        'cats',
      );
      expect(repository.readForContext('dm:c9'), isEmpty);
    });
  });
}
