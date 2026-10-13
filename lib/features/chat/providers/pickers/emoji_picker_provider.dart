import 'dart:math';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:fluxer_app/core/synced_preferences/usage_frecency.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_usage_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:riverpod/riverpod.dart' as rp;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'emoji_picker_provider.g.dart';

Duration _retryEmojiRegistryLoad(int retryCount, Object error) =>
    Duration(milliseconds: 200 * (1 << min(retryCount, 5)));

@Riverpod(keepAlive: true, retry: _retryEmojiRegistryLoad)
Future<void> emojiRegistryLoaded(Ref ref) {
  return EmojiRegistry.ensureLoaded();
}

const int kMaxFrecentEmojis = 42;

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
      'emoji_${id}_${animated ? 'a2' : 's'}_$size';

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

List<FrecentEmojiItem> buildPickerFrecentEmojis({
  required List<String> rankedUsageKeys,
  required Map<String, GuildEmojiEntry> availableCustomEmojisById,
  int limit = kMaxFrecentEmojis,
}) {
  if (limit <= 0) {
    return const <FrecentEmojiItem>[];
  }
  final result = <FrecentEmojiItem>[];
  for (final String key in rankedUsageKeys) {
    if (result.length >= limit) {
      break;
    }
    if (key.startsWith('unicode:')) {
      final String suffix = key.substring('unicode:'.length);
      if (suffix.isEmpty) {
        continue;
      }
      final EmojiEntry? entry =
          EmojiRegistry.entryByName(suffix) ??
          EmojiRegistry.entryBySurrogates(suffix);
      if (entry != null) {
        result.add(FrecentUnicodeEmoji(entry));
      }
    } else if (key.startsWith('custom:')) {
      final int lastColon = key.lastIndexOf(':');
      if (lastColon < 'custom:'.length) {
        continue;
      }
      final String emojiId = key.substring(lastColon + 1);
      final GuildEmojiEntry? emoji = availableCustomEmojisById[emojiId];
      if (emoji != null) {
        result.add(FrecentCustomEmoji(emoji));
      }
    }
  }
  return result;
}

@Riverpod(keepAlive: true)
Future<List<String>> rankedEmojiUsageKeys(Ref ref) async {
  final Map<String, UsageEntry> usage = await ref.watch(
    expressionUsageProvider(ExpressionUsageKind.emoji).future,
  );
  return rankUsageKeys(usage, DateTime.now().millisecondsSinceEpoch);
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
  final grouped = _groupEmojiEntriesByGuild(
    guilds: targetGuilds,
    emojis: emojis,
  );
  if (hasGlobalEmojiAccess ||
      activeGuildId == null ||
      activeGuildId.isEmpty ||
      grouped.keys.any((guild) => guild.id == activeGuildId)) {
    return grouped;
  }
  final activeEmojis = emojis
      .where((emoji) => emoji.guildId == activeGuildId)
      .toList(growable: false);
  if (activeEmojis.isEmpty) {
    return grouped;
  }
  Guild? knownGuild;
  for (final Guild guild in targetGuilds) {
    if (guild.id == activeGuildId) {
      knownGuild = guild;
      break;
    }
  }
  final Guild guildKey = knownGuild ?? Guild(id: activeGuildId, name: '');
  return Map<Guild, List<GuildEmojiEntry>>.from(grouped)
    ..[guildKey] = activeEmojis;
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

bool composerCanUseGuildEmoji({
  required GuildEmojiEntry emoji,
  required bool hasGlobalEmojiAccess,
  required bool isDirectChat,
  required String? activeGuildId,
}) => hasGlobalEmojiAccess || (!isDirectChat && emoji.guildId == activeGuildId);

@Riverpod(keepAlive: true)
class EmojiSkinTone extends _$EmojiSkinTone {
  @override
  Future<String> build() async {
    final String? userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      return '';
    }
    return ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .getEmojiSkinTone(userId);
  }

  Future<void> set(String skinTone) async {
    state = AsyncData(skinTone);
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    await ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .setEmojiSkinTone(userId, skinTone);
    ref.markSyncedDirty(SyncedPreferenceField.emoji);
  }
}
