import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/emoji_search.dart';

int? tierOf(
  List<String> names,
  String query, {
  List<String> keywords = const <String>[],
}) {
  return emojiMatchTier(
    names: names,
    namesLower: names.map((String n) => n.toLowerCase()).toList(),
    keywordsLower: keywords.map((String k) => k.toLowerCase()).toList(),
    query: query,
  );
}

void main() {
  group('emojiMatchTier', () {
    test('returns ascending tiers from exact to keyword-contains', () {
      expect(tierOf(<String>['smile'], 'smile'), emojiTierExactName);
      expect(tierOf(<String>['smiley'], 'smile'), emojiTierNameStartsWith);
      expect(tierOf(<String>['sweat_smile'], 'smile'), emojiTierNameBoundary);
      expect(tierOf(<String>['grimacing'], 'maci'), emojiTierNameContains);
      expect(
        tierOf(<String>['grinning'], 'hap', keywords: <String>['happy']),
        emojiTierKeywordStartsWith,
      );
      expect(
        tierOf(<String>['grinning'], 'happy', keywords: <String>['unhappy']),
        emojiTierKeywordContains,
      );
    });

    test('the tier constants are strictly ordered', () {
      expect(
        <int>[
          emojiTierExactName,
          emojiTierNameStartsWith,
          emojiTierNameBoundary,
          emojiTierNameContains,
          emojiTierKeywordStartsWith,
          emojiTierKeywordContains,
        ],
        <int>[0, 1, 2, 3, 4, 5],
      );
    });

    test('exact name beats a keyword that also matches', () {
      expect(
        tierOf(<String>['joy'], 'joy', keywords: <String>['joy', 'laugh']),
        emojiTierExactName,
      );
    });

    test('name start beats keyword start', () {
      expect(
        tierOf(<String>['joyful'], 'joy', keywords: <String>['joyous']),
        emojiTierNameStartsWith,
      );
    });

    test('returns null when nothing matches', () {
      expect(tierOf(<String>['grinning'], 'zzz'), isNull);
      expect(
        tierOf(<String>['grinning'], 'zzz', keywords: <String>['happy']),
        isNull,
      );
    });
  });

  group('emojiHasBoundaryMatch', () {
    test('matches at an underscore boundary', () {
      expect(
        emojiHasBoundaryMatch('sweat_smile', 'sweat_smile', 'smile'),
        true,
      );
    });

    test('does not match inside a word', () {
      expect(emojiHasBoundaryMatch('catsmile', 'catsmile', 'smile'), false);
    });

    test('matches a trailing plural "s" at a boundary', () {
      expect(emojiHasBoundaryMatch('cat_smiles', 'cat_smiles', 'smile'), true);
    });

    test('matches when preceded by an uppercase ASCII letter', () {
      expect(emojiHasBoundaryMatch('aBsmile', 'absmile', 'smile'), true);
    });

    test('plural rule only applies at a boundary', () {
      expect(emojiHasBoundaryMatch('catsmiles', 'catsmiles', 'smile'), false);
    });
  });

  group('normalizeEmojiSearchQuery', () {
    test('maps punctuation aliases', () {
      expect(normalizeEmojiSearchQuery('+1'), 'thumbsup');
      expect(normalizeEmojiSearchQuery('-1'), 'thumbsdown');
      expect(normalizeEmojiSearchQuery('?'), 'question');
      expect(normalizeEmojiSearchQuery('!'), 'exclamation');
      expect(normalizeEmojiSearchQuery('!!'), 'bangbang');
      expect(normalizeEmojiSearchQuery('!?'), 'interrobang');
    });

    test('strips wrapping colons', () {
      expect(normalizeEmojiSearchQuery(':smile:'), 'smile');
      expect(normalizeEmojiSearchQuery('::smile::'), 'smile');
    });

    test('converts spaces to underscores', () {
      expect(normalizeEmojiSearchQuery('thumbs up'), 'thumbs_up');
    });

    test('trims and lowercases', () {
      expect(normalizeEmojiSearchQuery('  SMILE  '), 'smile');
    });

    test('returns empty for a colon-only query', () {
      expect(normalizeEmojiSearchQuery('::'), '');
    });
  });
}
