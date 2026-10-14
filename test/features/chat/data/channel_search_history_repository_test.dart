import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/channel_search_history_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ChannelSearchHistoryEntry', () {
    test('round-trips extended fields and legacy entries default safely', () {
      const ChannelSearchHistoryEntry entry = ChannelSearchHistoryEntry(
        contextKey: 'guild:g1:channel:c1',
        displayText: 'from:alice has:image',
        authorId: '1',
        scopeIndex: 2,
        sortIndex: 1,
        contentTypeIndices: <int>[0],
        timestampMs: 123,
        channelIds: <String>['c2'],
        mentionIds: <String>['m1'],
        pinned: true,
        authorTypes: <String>['bot'],
        linkHostname: 'example.com',
        fileName: 'shot',
        fileExtension: 'png',
        dateFilterKey: 'before',
        dateValue: '2024-01-01',
        usersByTag: <String, String>{'alice': '1'},
        channelsByName: <String, String>{'general': 'c2'},
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

  group('structured recents', () {
    const String context = 'guild:g1:channel:c1';
    const String userId = '1130650140000000000';

    ChannelSearchHistoryEntry entryFor(
      List<ChannelSearchToken> tokens, {
      String text = '',
    }) => ChannelSearchHistoryEntry.fromQuery(
      contextKey: context,
      text: text,
      tokens: tokens,
      scopeIndex: 0,
      sortIndex: 0,
      timestampMs: 1,
    );

    test('round-trips tokens with a display snapshot', () {
      final ChannelSearchHistoryEntry entry = entryFor(<ChannelSearchToken>[
        const ChannelSearchToken(
          kind: ChannelSearchTokenKind.from,
          value: userId,
          label: 'Hampus K',
        ),
        const ChannelSearchToken(
          kind: ChannelSearchTokenKind.has,
          value: 'image',
        ),
      ], text: 'cats');

      final ChannelSearchHistoryEntry restored =
          ChannelSearchHistoryEntry.fromJson(entry.toJson());

      expect(restored.query.text, 'cats');
      expect(restored.query.tokens, entry.tokens);
      expect(restored.query.tokens.first.label, 'Hampus K');
      expect(restored.displayText, 'from:"Hampus K" has:image cats');
      expect(restored.usersByTag, <String, String>{'Hampus K': userId});
    });

    test('reads a legacy filter-only entry as a user token, not text', () {
      final ChannelSearchHistoryEntry legacy =
          ChannelSearchHistoryEntry.fromJson(const <String, dynamic>{
            'contextKey': context,
            'displayText': '',
            'authorId': userId,
            'scopeIndex': 0,
            'sortIndex': 0,
            'contentTypeIndices': <int>[],
            'timestampMs': 1,
          });

      expect(legacy.isEmpty, isFalse);
      expect(legacy.query.text, isEmpty);
      expect(legacy.query.tokens, const <ChannelSearchToken>[
        ChannelSearchToken(kind: ChannelSearchTokenKind.from, value: userId),
      ]);
    });

    test('reads typed legacy filters through their hints', () {
      const ChannelSearchHistoryEntry legacy = ChannelSearchHistoryEntry(
        contextKey: context,
        displayText: 'from:alice in:general has:sound hello link:x.com',
        authorId: '',
        scopeIndex: 0,
        sortIndex: 0,
        contentTypeIndices: <int>[],
        timestampMs: 1,
        usersByTag: <String, String>{'alice': '1'},
        channelsByName: <String, String>{'general': 'c2'},
      );

      final ({String text, List<ChannelSearchToken> tokens}) query =
          legacy.query;

      expect(query.tokens, const <ChannelSearchToken>[
        ChannelSearchToken(kind: ChannelSearchTokenKind.from, value: '1'),
        ChannelSearchToken(kind: ChannelSearchTokenKind.channel, value: 'c2'),
        ChannelSearchToken(kind: ChannelSearchTokenKind.has, value: 'sound'),
      ]);
      expect(query.tokens.first.label, 'alice');
      expect(query.text, 'hello link-from:x.com');
    });

    test(
      'keeps distinct filter-only searches and dedupes equal ones',
      () async {
        SharedPreferences.setMockInitialValues(<String, Object>{});
        final ChannelSearchHistoryRepository repository =
            ChannelSearchHistoryRepository(
              await SharedPreferences.getInstance(),
            );

        await repository.addEntry(
          entryFor(<ChannelSearchToken>[
            const ChannelSearchToken(
              kind: ChannelSearchTokenKind.from,
              value: userId,
            ),
          ]),
        );
        await repository.addEntry(
          entryFor(<ChannelSearchToken>[
            const ChannelSearchToken(
              kind: ChannelSearchTokenKind.has,
              value: 'file',
            ),
          ]),
        );
        await repository.addEntry(
          entryFor(<ChannelSearchToken>[
            const ChannelSearchToken(
              kind: ChannelSearchTokenKind.from,
              value: userId,
              label: 'Hampus',
            ),
          ]),
        );
        await repository.addEntry(entryFor(const <ChannelSearchToken>[]));

        final List<ChannelSearchHistoryEntry> entries = repository
            .readForContext(context);
        expect(entries, hasLength(2));
        expect(entries.first.query.tokens.single.label, 'Hampus');
        expect(
          entries.last.query.tokens.single.kind,
          ChannelSearchTokenKind.has,
        );

        await repository.removeEntry(entries.first);
        expect(
          repository.readForContext(context).single.query.tokens.single.value,
          'file',
        );
      },
    );

    test(
      'a refinement replaces the entry it narrows and nothing else',
      () async {
        SharedPreferences.setMockInitialValues(<String, Object>{});
        final ChannelSearchHistoryRepository repository =
            ChannelSearchHistoryRepository(
              await SharedPreferences.getInstance(),
            );
        const ChannelSearchToken from = ChannelSearchToken(
          kind: ChannelSearchTokenKind.from,
          value: userId,
        );
        const ChannelSearchToken link = ChannelSearchToken(
          kind: ChannelSearchTokenKind.has,
          value: 'link',
        );
        final ChannelSearchHistoryEntry older = entryFor(
          const <ChannelSearchToken>[],
          text: 'release',
        );
        final ChannelSearchHistoryEntry first = entryFor(
          const <ChannelSearchToken>[from],
        );
        final ChannelSearchHistoryEntry refined = entryFor(
          const <ChannelSearchToken>[from, link],
          text: 'cats',
        );
        final ChannelSearchHistoryEntry unrelated = entryFor(
          const <ChannelSearchToken>[link],
        );

        await repository.addEntry(older);
        await repository.addEntry(first);
        await repository.addEntry(refined, replacing: first);
        expect(
          repository.readForContext(context).map((e) => e.signature),
          <String>[refined.signature, older.signature],
        );

        await repository.addEntry(unrelated, replacing: refined);
        expect(
          repository.readForContext(context).map((e) => e.signature),
          <String>[unrelated.signature, refined.signature, older.signature],
        );
      },
    );
  });
}
