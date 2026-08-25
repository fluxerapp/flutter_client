import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:riverpod/riverpod.dart' as rp;

const int kMaxFrecentStickers = 42;

class StickerEntry {
  const StickerEntry({
    required this.id,
    required this.guildId,
    required this.name,
    required this.description,
    required this.tags,
    required this.animated,
  });

  factory StickerEntry.fromRow(GuildSticker row) => StickerEntry(
    id: row.id,
    guildId: row.guildId,
    name: row.name,
    description: row.description,
    tags: _decodeTags(row.tagsJson),
    animated: row.animated,
  );

  final String id;
  final String guildId;
  final String name;
  final String description;
  final List<String> tags;
  final bool animated;

  String get url => urlForSize(320);

  String urlForSize(int size) =>
      FluxerMediaUrl.sticker(id: id, animated: animated, size: size);

  String cacheKeyForSize(int size) =>
      'sticker_${id}_${animated ? 'a' : 's'}_$size';

  String get frecencyKey => 'sticker:$guildId:$id';

  String get favoriteKey => stickerFavoriteKey(this);

  static List<String> _decodeTags(String tagsJson) {
    try {
      return (jsonDecode(tagsJson) as List<dynamic>)
          .map((tag) => tag.toString())
          .toList(growable: false);
    } on Object {
      return const <String>[];
    }
  }
}

String stickerFavoriteKey(StickerEntry sticker) =>
    '${sticker.guildId}:${sticker.id}';

final allGuildStickersForPickerProvider = rp.StreamProvider<List<StickerEntry>>(
  (ref) {
    final db = ref.watch(fluxerDatabaseProvider);
    return db.guildStickerDao.watchAll().map(
      (rows) => rows.map(StickerEntry.fromRow).toList(),
    );
  },
);

final frecentStickersProvider = rp.FutureProvider<List<StickerEntry>>((
  ref,
) async {
  final db = ref.watch(fluxerDatabaseProvider);
  final usage = await db.emojiUsageDao.getTopByFrecencyForPrefix(
    'sticker:',
    kMaxFrecentStickers * 4,
  );
  final stickers = await db.guildStickerDao.getAll();
  final byKey = <String, StickerEntry>{};
  for (final row in stickers) {
    final entry = StickerEntry.fromRow(row);
    byKey[entry.frecencyKey] = entry;
  }
  return usage
      .map((row) => byKey[row.key])
      .whereType<StickerEntry>()
      .take(kMaxFrecentStickers)
      .toList(growable: false);
});

Map<Guild, List<StickerEntry>> guildStickerEntriesForPicker({
  required List<Guild> guilds,
  required List<StickerEntry> stickers,
  required String? activeGuildId,
  required bool isPremium,
  bool canUseExternalStickers = true,
}) {
  final hasGlobalStickerAccess = isPremium && canUseExternalStickers;
  final targetGuilds = hasGlobalStickerAccess
      ? guilds
      : guilds.where((guild) => guild.id == activeGuildId).toList();
  return _groupStickerEntriesByGuild(guilds: targetGuilds, stickers: stickers);
}

List<StickerEntry> lockedGuildStickerEntriesForUpsell({
  required List<Guild> guilds,
  required List<StickerEntry> stickers,
  required String? activeGuildId,
  required bool isPremium,
  bool canUseExternalStickers = true,
}) {
  if (isPremium || !canUseExternalStickers) {
    return const <StickerEntry>[];
  }

  final lockedGuildIds = guilds
      .where((guild) => guild.id != activeGuildId)
      .map((guild) => guild.id)
      .toSet();
  return stickers
      .where((sticker) => lockedGuildIds.contains(sticker.guildId))
      .toList(growable: false);
}

List<StickerEntry> searchStickerEntries(
  Iterable<StickerEntry> stickers,
  String query,
) {
  final normalized = query.trim().toLowerCase();
  if (normalized.isEmpty) {
    return stickers.toList(growable: false);
  }
  return stickers
      .where((sticker) {
        final nameMatch = sticker.name.toLowerCase().contains(normalized);
        final descriptionMatch = sticker.description.toLowerCase().contains(
          normalized,
        );
        final tagMatch = sticker.tags.any(
          (tag) => tag.toLowerCase().contains(normalized),
        );
        return nameMatch || descriptionMatch || tagMatch;
      })
      .toList(growable: false);
}

Map<Guild, List<StickerEntry>> _groupStickerEntriesByGuild({
  required List<Guild> guilds,
  required List<StickerEntry> stickers,
}) {
  final stickersByGuildId = <String, List<StickerEntry>>{};
  for (final sticker in stickers) {
    (stickersByGuildId[sticker.guildId] ??= <StickerEntry>[]).add(sticker);
  }

  final result = <Guild, List<StickerEntry>>{};
  for (final guild in guilds) {
    final guildStickers = stickersByGuildId[guild.id];
    if (guildStickers != null && guildStickers.isNotEmpty) {
      result[guild] = [...guildStickers]..sort(_compareStickerByNewestFirst);
    }
  }
  return result;
}

int _compareStickerByNewestFirst(StickerEntry a, StickerEntry b) =>
    _compareSnowflakeStrings(b.id, a.id);

int _compareSnowflakeStrings(String a, String b) {
  if (a == b) {
    return 0;
  }
  if (a.length != b.length) {
    return a.length.compareTo(b.length);
  }
  return a.compareTo(b);
}
