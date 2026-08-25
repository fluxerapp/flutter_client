import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

@immutable
class EmojiInfoData {
  const EmojiInfoData({
    required this.name,
    this.id,
    this.animated = false,
    this.guildId,
  });

  factory EmojiInfoData.fromEmojiEntry(EmojiEntry entry) {
    return EmojiInfoData(name: entry.surrogates);
  }

  factory EmojiInfoData.fromGuildEmoji(GuildEmojiEntry entry) {
    return EmojiInfoData(
      id: entry.id,
      name: entry.name,
      animated: entry.animated,
      guildId: entry.guildId,
    );
  }

  factory EmojiInfoData.fromReaction(Reaction reaction) {
    return EmojiInfoData(
      id: reaction.emojiId,
      name: reaction.emoji,
      animated: reaction.animated,
    );
  }

  factory EmojiInfoData.fromMarkdownLongPress({
    required String? emojiId,
    required String name,
    required bool animated,
  }) {
    return EmojiInfoData(id: emojiId, name: name, animated: animated);
  }

  final String? id;
  final String name;
  final bool animated;
  final String? guildId;

  bool get isCustom => id != null && id!.isNotEmpty;

  EmojiEntry? get unicodeEntry => isCustom ? null : _lookupUnicodeEntry(name);

  String get displayName {
    if (isCustom) {
      return ':$name:';
    }

    final entry = unicodeEntry;
    if (entry != null) {
      return ':${entry.primaryName}:';
    }

    if (name.startsWith(':') && name.endsWith(':')) {
      return name;
    }
    return ':$name:';
  }

  String get unicodeSurrogate => unicodeEntry?.surrogates ?? name;

  String? favoriteKeyForGuild(String? resolvedGuildId) {
    if (isCustom) {
      return favoriteKeyForCustomEmoji(
        emojiId: id!,
        name: name,
        animated: animated,
        guildId: resolvedGuildId,
      );
    }

    final entry = unicodeEntry;
    if (entry != null) {
      return unicodeEmojiFavoriteKey(entry);
    }

    final normalized = name.startsWith(':') && name.endsWith(':')
        ? name.substring(1, name.length - 1)
        : name;
    if (normalized.isEmpty) {
      return null;
    }
    return 'unicode:$normalized';
  }

  @override
  bool operator ==(Object other) {
    return other is EmojiInfoData &&
        other.id == id &&
        other.name == name &&
        other.animated == animated &&
        other.guildId == guildId;
  }

  @override
  int get hashCode => Object.hash(id, name, animated, guildId);
}

EmojiEntry? _lookupUnicodeEntry(String value) {
  return EmojiRegistry.entryBySurrogates(value) ??
      EmojiRegistry.entryByName(value);
}

String? favoriteKeyForCustomEmoji({
  required String emojiId,
  required String name,
  required bool animated,
  required String? guildId,
}) {
  if (guildId == null || guildId.isEmpty) {
    return null;
  }
  return customEmojiFavoriteKey(
    GuildEmojiEntry(
      id: emojiId,
      name: name,
      animated: animated,
      guildId: guildId,
    ),
  );
}
