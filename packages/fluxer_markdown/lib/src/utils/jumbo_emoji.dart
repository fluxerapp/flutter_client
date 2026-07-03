const kFluxerMarkdownJumboMaxCount = 6;
const kFluxerMarkdownEmojiSizeMultiplier = 1.5;
const kFluxerMarkdownEmojiSizeNormal = 24.0;
const kFluxerMarkdownEmojiSizeJumbo = 48.0;

bool isFluxerMarkdownJumboEmoji(String text) {
  final trimmed = text.trim();
  if (trimmed.isEmpty) {
    return false;
  }

  final tokenRe = RegExp(r':[a-zA-Z0-9_+\-]+:|<a?:[a-zA-Z0-9_]+:\d+>|\s');
  final emojiRe = RegExp(r':[a-zA-Z0-9_+\-]+:|<a?:[a-zA-Z0-9_]+:\d+>');
  final withoutTokens = trimmed.replaceAll(tokenRe, '');
  if (withoutTokens.isNotEmpty) {
    return false;
  }

  final count = emojiRe.allMatches(trimmed).length;
  return count >= 1 && count <= kFluxerMarkdownJumboMaxCount;
}
