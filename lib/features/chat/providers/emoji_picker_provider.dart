import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'emoji_picker_provider.g.dart';

const int kMaxFrecentEmojis = 42;

const List<String> kDefaultQuickEmojis = [
  'thumbsup',
  'ok_hand',
  'tada',
  'heart',
];

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
