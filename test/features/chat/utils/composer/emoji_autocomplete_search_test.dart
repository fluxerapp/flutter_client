import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/emoji_autocomplete_search.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

EmojiEntry uni(
  List<String> names, {
  List<String> keywords = const <String>[],
  String surrogates = '✨',
}) => EmojiEntry(
  names: names,
  surrogates: surrogates,
  category: 'people',
  spriteIndex: 0,
  keywords: keywords,
);

GuildEmojiEntry custom(
  String name, {
  String id = 'id',
  String guildId = 'g1',
}) => GuildEmojiEntry(id: id, name: name, animated: false, guildId: guildId);

double Function(String) scores([
  Map<String, double> m = const <String, double>{},
]) =>
    (String key) => m[key] ?? 0.0;

String label(EmojiAutocompleteResult r) => switch (r) {
  UnicodeEmojiResult(:final EmojiEntry entry) => 'u:${entry.primaryName}',
  CustomEmojiResult(:final GuildEmojiEntry entry) => 'c:${entry.name}',
};

void main() {
  group('searchEmojiAutocomplete', () {
    test('unicode exact match ranks above a custom substring match', () {
      final List<EmojiAutocompleteResult> results = searchEmojiAutocomplete(
        matchedText: 'smile',
        unicode: <EmojiEntry>[
          uni(<String>['smile']),
        ],
        custom: <GuildEmojiEntry>[custom('blobsmile')],
        score: scores(),
        limit: 10,
      );
      expect(results.length, 2);
      expect(label(results.first), 'u:smile');
    });

    test('custom exact match ranks above a unicode substring match', () {
      final List<EmojiAutocompleteResult> results = searchEmojiAutocomplete(
        matchedText: 'smile',
        unicode: <EmojiEntry>[
          uni(<String>['xsmile']),
        ],
        custom: <GuildEmojiEntry>[custom('smile')],
        score: scores(),
        limit: 10,
      );
      expect(label(results.first), 'c:smile');
    });

    test('custom and unicode interleave purely by rank', () {
      final List<EmojiAutocompleteResult> results = searchEmojiAutocomplete(
        matchedText: 'smile',
        unicode: <EmojiEntry>[
          uni(<String>['smile']),
          uni(<String>['xsmile']),
        ],
        custom: <GuildEmojiEntry>[
          custom('smiley', id: 'c1'),
          custom('asmile', id: 'c2'),
        ],
        score: scores(),
        limit: 10,
      );
      expect(results.map(label).toList(), <String>[
        'u:smile', // exact (tier 0)
        'c:smiley', // starts-with (tier 1)
        'c:asmile', // contains (tier 3), name < xsmile
        'u:xsmile', // contains (tier 3)
      ]);
    });

    test('frecency breaks ties within the same tier', () {
      final List<EmojiAutocompleteResult> results = searchEmojiAutocomplete(
        matchedText: 'smile',
        unicode: <EmojiEntry>[
          uni(<String>['xsmile']),
          uni(<String>['ysmile']),
        ],
        custom: const <GuildEmojiEntry>[],
        score: scores(<String, double>{'unicode:ysmile': 5}),
        limit: 10,
      );
      // Without frecency, 'xsmile' would sort first alphabetically.
      expect(label(results.first), 'u:ysmile');
    });

    test('respects the result limit', () {
      final List<EmojiAutocompleteResult> results = searchEmojiAutocomplete(
        matchedText: 'smile',
        unicode: <EmojiEntry>[
          uni(<String>['smile1']),
          uni(<String>['smile2']),
          uni(<String>['smile3']),
        ],
        custom: const <GuildEmojiEntry>[],
        score: scores(),
        limit: 2,
      );
      expect(results.length, 2);
    });

    test('applies punctuation aliases (+1 -> thumbsup)', () {
      final List<EmojiAutocompleteResult> results = searchEmojiAutocomplete(
        matchedText: '+1',
        unicode: <EmojiEntry>[
          uni(<String>['thumbsup']),
          uni(<String>['smile']),
        ],
        custom: const <GuildEmojiEntry>[],
        score: scores(),
        limit: 10,
      );
      expect(results.length, 1);
      expect(label(results.first), 'u:thumbsup');
    });

    test('keyword-only matches rank below name matches', () {
      final List<EmojiAutocompleteResult> results = searchEmojiAutocomplete(
        matchedText: 'happy',
        unicode: <EmojiEntry>[
          uni(<String>['joy'], keywords: <String>['happy']),
          uni(<String>['happy_face']),
        ],
        custom: const <GuildEmojiEntry>[],
        score: scores(),
        limit: 10,
      );
      expect(results.map(label).toList(), <String>['u:happy_face', 'u:joy']);
    });

    test('returns nothing for an empty normalized query', () {
      expect(
        searchEmojiAutocomplete(
          matchedText: '::',
          unicode: <EmojiEntry>[
            uni(<String>['smile']),
          ],
          custom: const <GuildEmojiEntry>[],
          score: scores(),
          limit: 10,
        ),
        isEmpty,
      );
    });

    test('returns nothing when there is no match', () {
      expect(
        searchEmojiAutocomplete(
          matchedText: 'zzz',
          unicode: <EmojiEntry>[
            uni(<String>['smile']),
          ],
          custom: const <GuildEmojiEntry>[],
          score: scores(),
          limit: 10,
        ),
        isEmpty,
      );
    });
  });
}
