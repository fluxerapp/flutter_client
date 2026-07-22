import 'package:fluxer_app/core/media/fluxer_media_cdn.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

const _kTwemojiVersion = '2';

const int kCustomEmojiFetchSize = 96;

const List<String> kSkinToneSurrogates = [
  '\u{1F3FB}',
  '\u{1F3FC}',
  '\u{1F3FD}',
  '\u{1F3FE}',
  '\u{1F3FF}',
];

String? skinToneToName(String surrogate) {
  final idx = kSkinToneSurrogates.indexOf(surrogate);
  if (idx == -1) {
    return null;
  }
  return 'skin-tone-${idx + 1}';
}

/// Resolves a reaction or shortcode [emoji] value to Unicode surrogates.
String resolveUnicodeEmoji(String emoji) {
  final entry = EmojiRegistry.entryByName(emoji);
  if (entry != null) {
    return entry.surrogates;
  }
  final resolved = EmojiRegistry.resolveSync(emoji);
  if (resolved != null) {
    return resolved;
  }
  return emoji;
}

String emojiToCodePoints(String emoji) {
  final containsZwj = emoji.contains('\u200D');
  final processed = containsZwj ? emoji : emoji.replaceAll('\uFE0F', '');
  return processed.runes
      .map((r) => r.toRadixString(16).replaceAll(RegExp('^0+'), ''))
      .where((s) => s.isNotEmpty)
      .join('-');
}

String? getTwemojiUrl(String unicode) {
  final codePoints = emojiToCodePoints(unicode);
  if (codePoints.isEmpty) {
    return null;
  }
  return '$fluxerStaticCdn/emoji/$codePoints.svg?v=$_kTwemojiVersion';
}

String getCustomEmojiMarkdown({
  required String name,
  required String id,
  bool animated = false,
}) => '<${animated ? 'a' : ''}:$name:$id>';
