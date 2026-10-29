import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';

List<int> filterGuildEmojiIndices(
  List<GuildEmojiSettingsEntry> emojis,
  String query,
) {
  final String normalized = query.trim().toLowerCase();
  if (normalized.isEmpty) {
    return List<int>.generate(emojis.length, (int index) => index);
  }
  final List<int> indices = <int>[];
  for (int index = 0; index < emojis.length; index++) {
    if (emojis[index].name.toLowerCase().contains(normalized)) {
      indices.add(index);
    }
  }
  return indices;
}

List<int> filterGuildStickerIndices(
  List<GuildStickerSettingsEntry> stickers,
  String query,
) {
  final String normalized = query.trim().toLowerCase();
  if (normalized.isEmpty) {
    return List<int>.generate(stickers.length, (int index) => index);
  }
  final List<int> indices = <int>[];
  for (int index = 0; index < stickers.length; index++) {
    final GuildStickerSettingsEntry sticker = stickers[index];
    final bool matchesName = sticker.name.toLowerCase().contains(normalized);
    final bool matchesDescription = sticker.description.toLowerCase().contains(
      normalized,
    );
    final bool matchesTag = sticker.tags.any(
      (String tag) => tag.toLowerCase().contains(normalized),
    );
    if (matchesName || matchesDescription || matchesTag) {
      indices.add(index);
    }
  }
  return indices;
}

int compareGuildExpressionEntriesByIdDesc(String leftId, String rightId) {
  try {
    final BigInt left = BigInt.parse(leftId);
    final BigInt right = BigInt.parse(rightId);
    return right.compareTo(left);
  } on FormatException {
    return rightId.compareTo(leftId);
  }
}
