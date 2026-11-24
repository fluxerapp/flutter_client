import 'package:fluxer_app/shared/utils/emoji/emoji_registry.dart';

final RegExp _kUrlStart = RegExp('https?://', caseSensitive: false);
final RegExp _kWhitespace = RegExp(r'\s');

int? _protectedSpanEnd(String content, int index) {
  if (content.startsWith('`', index)) {
    int run = 0;
    while (index + run < content.length && content[index + run] == '`') {
      run++;
    }
    final String fence = '`' * run;
    final int close = content.indexOf(fence, index + run);
    return close == -1 ? null : close + run;
  }
  if (content.startsWith('[', index) || content.startsWith('![', index)) {
    final int bracket = content.indexOf('](', index);
    if (bracket != -1) {
      final int close = content.indexOf(')', bracket + 2);
      if (close != -1) {
        return close + 1;
      }
    }
  }
  final Match? url = _kUrlStart.matchAsPrefix(content, index);
  if (url != null) {
    int end = url.end;
    while (end < content.length && !_kWhitespace.hasMatch(content[end])) {
      end++;
    }
    return end;
  }
  return null;
}

String convertEmoticonsToEmoji(String content) {
  final List<String> shortcuts = EmojiRegistry.emoticonShortcuts;
  if (content.isEmpty || shortcuts.isEmpty) {
    return content;
  }
  final StringBuffer buffer = StringBuffer();
  int index = 0;
  while (index < content.length) {
    final int? protectedEnd = _protectedSpanEnd(content, index);
    if (protectedEnd != null && protectedEnd > index) {
      buffer.write(content.substring(index, protectedEnd));
      index = protectedEnd;
      continue;
    }
    final bool leadingBoundary =
        index == 0 || _kWhitespace.hasMatch(content[index - 1]);
    String? matched;
    if (leadingBoundary) {
      for (final String shortcut in shortcuts) {
        if (!content.startsWith(shortcut, index)) {
          continue;
        }
        final int end = index + shortcut.length;
        if (end < content.length && content[end] != ' ') {
          continue;
        }
        matched = shortcut;
        break;
      }
    }
    final String? emoji = matched == null
        ? null
        : EmojiRegistry.resolveSync(matched);
    if (matched != null && emoji != null) {
      buffer.write(emoji);
      index += matched.length;
      continue;
    }
    buffer.write(content[index]);
    index++;
  }
  return buffer.toString();
}
