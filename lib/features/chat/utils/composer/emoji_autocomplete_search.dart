import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_search.dart';

/// A single ranked emoji autocomplete result: either a unicode emoji from the
/// registry or a guild custom emoji.
sealed class EmojiAutocompleteResult {
  const EmojiAutocompleteResult();
}

final class UnicodeEmojiResult extends EmojiAutocompleteResult {
  const UnicodeEmojiResult(this.entry);

  final EmojiEntry entry;
}

final class CustomEmojiResult extends EmojiAutocompleteResult {
  const CustomEmojiResult(this.entry);

  final GuildEmojiEntry entry;
}

/// Searches [unicode] and [custom] emoji as a single merged, relevance-ranked
/// list matching the Fluxer web app (`Emoji.search`): custom and unicode
/// results interleave purely by rank rather than custom-first.
///
/// [matchedText] is the raw `:query` text and is normalized internally.
/// [custom] should already be ordered active-guild-first (then other guilds) so
/// active-guild emoji win exact ties. [score] returns the frecency score for a
/// usage key (`unicode:<name>` / `custom:<guildId>:<id>`); higher wins ties.
/// A [limit] <= 0 returns every match.
List<EmojiAutocompleteResult> searchEmojiAutocomplete({
  required String matchedText,
  required List<EmojiEntry> unicode,
  required List<GuildEmojiEntry> custom,
  required double Function(String frecencyKey) score,
  required int limit,
}) {
  final String q = normalizeEmojiSearchQuery(matchedText);
  if (q.isEmpty) {
    return const <EmojiAutocompleteResult>[];
  }

  final ranked = <_RankedEmoji>[];
  var order = 0;

  for (final EmojiEntry e in unicode) {
    final int? tier = emojiMatchTier(
      names: e.names,
      namesLower: e.namesLower,
      keywordsLower: e.keywordsLower,
      query: q,
    );
    if (tier != null) {
      ranked.add(
        _RankedEmoji(
          result: UnicodeEmojiResult(e),
          tier: tier,
          frecency: score(unicodeEmojiFavoriteKey(e)),
          primaryName: e.primaryName,
          order: order,
        ),
      );
    }
    order++;
  }

  for (final GuildEmojiEntry e in custom) {
    final int? tier = emojiMatchTier(
      names: <String>[e.name],
      namesLower: <String>[e.nameLower],
      keywordsLower: const <String>[],
      query: q,
    );
    if (tier != null) {
      ranked.add(
        _RankedEmoji(
          result: CustomEmojiResult(e),
          tier: tier,
          frecency: score(customEmojiFavoriteKey(e)),
          primaryName: e.name,
          order: order,
        ),
      );
    }
    order++;
  }

  ranked.sort(_compareRanked);
  final Iterable<_RankedEmoji> limited = limit > 0
      ? ranked.take(limit)
      : ranked;
  return limited.map((_RankedEmoji r) => r.result).toList(growable: false);
}

/// Mirrors web `compareSearchResults`: tier asc, frecency desc, primary name
/// asc, then original merge order asc.
int _compareRanked(_RankedEmoji a, _RankedEmoji b) {
  if (a.tier != b.tier) {
    return a.tier - b.tier;
  }
  if (a.frecency != b.frecency) {
    return b.frecency.compareTo(a.frecency);
  }
  final int byName = a.primaryName.compareTo(b.primaryName);
  return byName != 0 ? byName : a.order - b.order;
}

class _RankedEmoji {
  _RankedEmoji({
    required this.result,
    required this.tier,
    required this.frecency,
    required this.primaryName,
    required this.order,
  });

  final EmojiAutocompleteResult result;
  final int tier;
  final double frecency;
  final String primaryName;
  final int order;
}
