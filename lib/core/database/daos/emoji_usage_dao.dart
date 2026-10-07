import 'dart:math';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/emoji_usage.dart';

part 'emoji_usage_dao.g.dart';

const int _kDecayHours = 24 * 7; // 168 hours

@DriftAccessor(tables: [EmojiUsage])
class EmojiUsageDao extends DatabaseAccessor<FluxerDatabase>
    with _$EmojiUsageDaoMixin {
  EmojiUsageDao(super.attachedDatabase);

  Future<void> trackUsage(String key) async {
    final existing = await (select(
      emojiUsage,
    )..where((e) => e.key.equals(key))).getSingleOrNull();

    if (existing != null) {
      await (update(emojiUsage)..where((e) => e.key.equals(key))).write(
        EmojiUsageCompanion(
          useCount: Value(existing.useCount + 1),
          lastUsed: Value(DateTime.now()),
        ),
      );
    } else {
      await into(
        emojiUsage,
      ).insert(EmojiUsageCompanion.insert(key: key, lastUsed: DateTime.now()));
    }
  }

  /// Returns the top [limit] emojis sorted by
  /// frecency score (frequency * recency decay).
  Future<List<EmojiUsageData>> getTopByFrecency(int limit) async {
    final all = await select(emojiUsage).get();
    all.sort((a, b) => _score(b).compareTo(_score(a)));
    return all.take(limit).toList();
  }

  Future<List<EmojiUsageData>> getTopByFrecencyForPrefix(
    String prefix,
    int limit,
  ) async {
    final matching = await (select(
      emojiUsage,
    )..where((e) => e.key.like('$prefix%'))).get();
    matching.sort((a, b) => _score(b).compareTo(_score(a)));
    return matching.take(limit).toList();
  }

  /// Returns the top [limit] frecent emoji keys with their `unicode:` and
  /// `custom:` prefixes intact, for the caller to parse and resolve.
  Future<List<String>> getQuickReactionMixedKeys(int limit) async {
    final top = await getTopByFrecency(limit);
    return top.map((e) => e.key).toList();
  }

  /// Returns the frecency score for every tracked emoji keyed by its usage key
  /// (`unicode:<name>` / `custom:<guildId>:<id>`). Used to rank autocomplete
  /// results without per-key queries.
  Future<Map<String, double>> getFrecencyScores() async {
    final all = await select(emojiUsage).get();
    return {for (final usage in all) usage.key: _score(usage)};
  }

  double _score(EmojiUsageData usage) {
    final hours = DateTime.now().difference(usage.lastUsed).inHours;
    final decay = max<double>(0, 1.0 - hours / _kDecayHours);
    return usage.useCount * (1 + decay);
  }

  Future<void> clearAll() => delete(emojiUsage).go();
}
