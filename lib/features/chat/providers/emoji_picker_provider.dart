import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
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
  const GuildEmojiEntry({
    required this.id,
    required this.name,
    required this.animated,
    required this.guildId,
  });

  factory GuildEmojiEntry.fromRow(GuildEmoji row) => GuildEmojiEntry(
    id: row.id,
    name: row.name,
    animated: row.animated,
    guildId: row.guildId,
  );

  final String id;
  final String name;
  final bool animated;
  final String guildId;

  String get url => urlForSize(48);

  String urlForSize(int size) =>
      getCustomEmojiUrl(id: id, animated: animated, size: size);

  String cacheKeyForSize(int size) =>
      'emoji_${id}_${animated ? 'a' : 's'}_$size';

  /// Markdown token inserted into the message text.
  String get markdown => getCustomEmojiMarkdown(
    name: name,
    id: id,
    animated: animated,
  );
}

@riverpod
Future<List<EmojiEntry>> frecentEmojis(Ref ref) async {
  final db = ref.watch(fluxerDatabaseProvider);
  final keys = await db.emojiUsageDao.getTopByFrecency(kMaxFrecentEmojis);

  final result = <EmojiEntry>[];
  for (final usage in keys) {
    if (!usage.key.startsWith('unicode:')) {
      continue;
    }
    final name = usage.key.substring('unicode:'.length);
    final entry = EmojiRegistry.allEmojis
        .where((e) => e.primaryName == name)
        .firstOrNull;
    if (entry != null) {
      result.add(entry);
    }
  }
  return result;
}

@Riverpod(keepAlive: true)
Stream<List<GuildEmojiEntry>> guildEmojisForPicker(
  Ref ref,
  String guildId,
) {
  final db = ref.watch(fluxerDatabaseProvider);
  return db.guildEmojiDao
      .watchByGuild(guildId)
      .map((rows) => rows.map(GuildEmojiEntry.fromRow).toList());
}

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
