import 'package:fluxer_app/shared/utils/emoji_registry.dart';

final RegExp _shortcodePattern = RegExp(
  r':([\p{L}\p{N}_+~.-]{2,}):',
  unicode: true,
);

final RegExp _urlPattern = RegExp(
  r'''https?:\/\/[^\s<>"']+''',
  caseSensitive: false,
);

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
    if (EmojiRegistry.resolveSync(name) != null) {
      return whole;
    }
    final String? markdown = lookupAvailableCustomEmojiMarkdown(
      name.toLowerCase(),
    );
    return markdown ?? whole;
  });
}
