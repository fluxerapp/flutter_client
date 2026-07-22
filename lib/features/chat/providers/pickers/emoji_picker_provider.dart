import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:riverpod/riverpod.dart' as rp;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'emoji_picker_provider.g.dart';

const int kMaxFrecentEmojis = 42;

const List<String> kDefaultQuickEmojis = [
  'thumbsup',
  'ok_hand',
  'tada',
  'heart',
];

class GuildEmojiEntry {
  GuildEmojiEntry({
    required this.id,
    required this.name,
    required this.animated,
    required this.guildId,
  }) : nameLower = name.toLowerCase();

  factory GuildEmojiEntry.fromRow(GuildEmoji row) => GuildEmojiEntry(
    id: row.id,
    name: row.name,
    animated: row.animated,
    guildId: row.guildId,
  );

  final String id;
  final String name;
  final String nameLower;
  final bool animated;
  final String guildId;

  String get url => urlForSize(kCustomEmojiFetchSize);

  String urlForSize(int size) =>
      FluxerMediaUrl.customEmoji(id: id, animated: animated, size: size);

  String cacheKeyForSize(int size) =>
      'emoji_${id}_${animated ? 'a' : 's'}_$size';

  /// Markdown token inserted into the message text.
  String get markdown =>
      getCustomEmojiMarkdown(name: name, id: id, animated: animated);

  String get favoriteKey => customEmojiFavoriteKey(this);
}

String unicodeEmojiFavoriteKey(EmojiEntry emoji) =>
    'unicode:${emoji.primaryName}';

String customEmojiFavoriteKey(GuildEmojiEntry emoji) =>
    'custom:${emoji.guildId}:${emoji.id}';

sealed class FrecentEmojiItem {
  const FrecentEmojiItem();
}

class FrecentUnicodeEmoji extends FrecentEmojiItem {
  const FrecentUnicodeEmoji(this.emoji);

  final EmojiEntry emoji;
}

class FrecentCustomEmoji extends FrecentEmojiItem {
  const FrecentCustomEmoji(this.emoji);

  final GuildEmojiEntry emoji;
}

List<FrecentEmojiItem> resolveFrecentEmojis({
  required List<String> usageKeys,
  required Map<String, GuildEmojiEntry> availableCustomEmojisById,
}) {
  final result = <FrecentEmojiItem>[];
  for (final key in usageKeys) {
    if (key.startsWith('unicode:')) {
      final name = key.substring('unicode:'.length);
      final entry = EmojiRegistry.entryByName(name);
      if (entry != null) {
        result.add(FrecentUnicodeEmoji(entry));
      }
    } else if (key.startsWith('custom:')) {
      final lastColon = key.lastIndexOf(':');
      if (lastColon < 'custom:'.length) {
        continue;
      }
      final emojiId = key.substring(lastColon + 1);
      final emoji = availableCustomEmojisById[emojiId];
      if (emoji != null) {
        result.add(FrecentCustomEmoji(emoji));
      }
    }
    if (result.length >= kMaxFrecentEmojis) {
      break;
    }
  }
  return result;
}

@riverpod
Future<List<FrecentEmojiItem>> frecentEmojis(Ref ref) async {
  final db = ref.watch(fluxerDatabaseProvider);
  final usage = await db.emojiUsageDao.getTopByFrecency(kMaxFrecentEmojis * 2);
  final usageKeys = usage.map((entry) => entry.key).toList();

  final customEmojisById = <String, GuildEmojiEntry>{};
  for (final key in usageKeys) {
    if (!key.startsWith('custom:')) {
      continue;
    }
    final lastColon = key.lastIndexOf(':');
    if (lastColon < 'custom:'.length) {
      continue;
    }
    final emojiId = key.substring(lastColon + 1);
    if (customEmojisById.containsKey(emojiId)) {
      continue;
    }
    final row = await db.guildEmojiDao.getById(emojiId);
    if (row != null) {
      customEmojisById[emojiId] = GuildEmojiEntry.fromRow(row);
    }
  }

  return resolveFrecentEmojis(
    usageKeys: usageKeys,
    availableCustomEmojisById: customEmojisById,
  );
}

final allGuildEmojisForPickerProvider =
    rp.StreamProvider<List<GuildEmojiEntry>>((ref) {
      final db = ref.watch(fluxerDatabaseProvider);
      return db.guildEmojiDao.watchAll().map(
        (rows) => rows.map(GuildEmojiEntry.fromRow).toList(),
      );
    });

@riverpod
Stream<List<GuildEmojiEntry>> guildEmojisForPicker(Ref ref, String guildId) {
  final db = ref.watch(fluxerDatabaseProvider);
  return db.guildEmojiDao
      .watchByGuild(guildId)
      .map((rows) => rows.map(GuildEmojiEntry.fromRow).toList());
}

Map<Guild, List<GuildEmojiEntry>> guildEmojiEntriesForPicker({
  required List<Guild> guilds,
  required List<GuildEmojiEntry> emojis,
  required String? activeGuildId,
  required bool isPremium,
  bool canUseExternalEmojis = true,
}) {
  final hasGlobalEmojiAccess = isPremium && canUseExternalEmojis;
  final targetGuilds = hasGlobalEmojiAccess
      ? guilds
      : guilds.where((guild) => guild.id == activeGuildId).toList();
  return _groupEmojiEntriesByGuild(guilds: targetGuilds, emojis: emojis);
}

List<GuildEmojiEntry> lockedGuildEmojiEntriesForUpsell({
  required List<Guild> guilds,
  required List<GuildEmojiEntry> emojis,
  required String? activeGuildId,
  required bool isPremium,
  bool canUseExternalEmojis = true,
}) {
  if (isPremium || !canUseExternalEmojis) {
    return const <GuildEmojiEntry>[];
  }

  final lockedGuildIds = guilds
      .where((guild) => guild.id != activeGuildId)
      .map((guild) => guild.id)
      .toSet();
  return emojis
      .where((emoji) => lockedGuildIds.contains(emoji.guildId))
      .toList(growable: false);
}

Map<Guild, List<GuildEmojiEntry>> _groupEmojiEntriesByGuild({
  required List<Guild> guilds,
  required List<GuildEmojiEntry> emojis,
}) {
  final emojisByGuildId = <String, List<GuildEmojiEntry>>{};
  for (final emoji in emojis) {
    (emojisByGuildId[emoji.guildId] ??= <GuildEmojiEntry>[]).add(emoji);
  }

  final result = <Guild, List<GuildEmojiEntry>>{};
  for (final guild in guilds) {
    final guildEmojis = emojisByGuildId[guild.id];
    if (guildEmojis != null && guildEmojis.isNotEmpty) {
      result[guild] = guildEmojis;
    }
  }
  return result;
}

/// Whether a guild emoji can be inserted or sent in the current composer context.
bool composerCanUseGuildEmoji({
  required GuildEmojiEntry emoji,
  required bool hasGlobalEmojiAccess,
  required bool isDirectChat,
  required String? activeGuildId,
}) => hasGlobalEmojiAccess || isDirectChat || emoji.guildId == activeGuildId;

@Riverpod(keepAlive: true)
class EmojiSkinTone extends _$EmojiSkinTone {
  @override
  Future<String> build() async {
    final db = ref.read(fluxerDatabaseProvider);
    final session = await db.authSessionDao.getActiveSession();
    if (session == null) {
      return '';
    }
    return db.userPreferencesDao.getEmojiSkinTone(session.userId);
  }

  Future<void> set(String skinTone) async {
    state = AsyncData(skinTone);
    final db = ref.read(fluxerDatabaseProvider);
    final session = await db.authSessionDao.getActiveSession();
    if (session == null) {
      return;
    }
    await db.userPreferencesDao.setEmojiSkinTone(session.userId, skinTone);
  }
}
