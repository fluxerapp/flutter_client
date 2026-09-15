import 'package:fluxer_app/shared/utils/emoji_registry.dart';

final RegExp _shortcodePattern = RegExp(
  r':([\p{L}\p{N}_+~.-]{2,}):',
  unicode: true,
);

final RegExp _urlPattern = RegExp(
  r'''https?:\/\/[^\s<>"']+''',
  caseSensitive: false,
);

/// Resolves typed custom-emoji shortcodes (`:name:`) in [content] to their
/// custom-emoji markdown (`<:name:id>` / `<a:name:id>`), mirroring the web
/// app's `replaceTypedEmojiShortcodes`.
///
/// Only CUSTOM emoji are resolved. Known unicode shortcodes, shortcodes inside
/// URLs, and already-rendered custom-emoji markdown (`<:...>` / `<a:...>`) are
/// left untouched. [lookupAvailableCustomEmojiMarkdown] returns the markdown for
/// an available custom emoji keyed by lowercased name, or `null` when the emoji
/// is unknown or unusable.
String resolveTypedCustomEmojiShortcodes(
  String content,
  String? Function(String nameLower) lookupAvailableCustomEmojiMarkdown,
) {
  if (!content.contains(':')) {
    return content;
  }
  final List<({int start, int end})> urlSpans = _urlPattern
      .allMatches(content)
      .map((RegExpMatch m) => (start: m.start, end: m.end))
      .toList();
  bool insideUrl(int index) {
    for (final ({int start, int end}) span in urlSpans) {
      if (index >= span.start && index < span.end) {
        return true;
      }
    }
    return false;
  }

  return content.replaceAllMapped(_shortcodePattern, (Match match) {
    final String whole = match[0]!;
    final int start = match.start;
    // Skip existing custom-emoji markdown: `<:name:id>` and `<a:name:id>`.
    if (start > 0 && content[start - 1] == '<') {
      return whole;
    }
    if (start > 1 && content[start - 1] == 'a' && content[start - 2] == '<') {
      return whole;
    }
    if (insideUrl(start)) {
      return whole;
    }
    final String name = match[1]!;
    // Known unicode shortcode → leave as-is (server/renderer resolves it).
    if (EmojiRegistry.resolveSync(name) != null) {
      return whole;
    }
    final String? markdown = lookupAvailableCustomEmojiMarkdown(
      name.toLowerCase(),
    );
    return markdown ?? whole;
  });
}
