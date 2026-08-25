abstract final class MessageContentPatterns {
  const MessageContentPatterns._();
  static final RegExp spoiler = RegExp(r'\|\|([\s\S]*?)\|\|');
  static final RegExp customEmoji = RegExp(r'<a?:([^:>]+):\d+>');
  static final RegExp userMention = RegExp(r'<@!?(\d+)>');
  static final RegExp roleMention = RegExp(r'<@&(\d+)>');
  static final RegExp channelMention = RegExp(r'<#(\d+)>');
  static final RegExp slashCommand = RegExp(r'<\/([^:]+):\d+>');
  static final RegExp timestamp = RegExp(r'<t:(\d+)(?::([tTdDfFR]))?>');
  static final RegExp markdownLink = RegExp(r'\[([^\]]+)\]\([^)]+\)');
  static final RegExp inlineCode = RegExp(r'`([^`\n]+)`');
  static final RegExp fencedCodeBlockInner = RegExp(
    r'```[^\n]*\n([\s\S]*?)```',
  );
  static final RegExp fencedCodeBlockWhole = RegExp(r'```[\s\S]*?```');
  static final RegExp blockQuotePrefix = RegExp(r'^>+\s?', multiLine: true);
  static final RegExp headingPrefix = RegExp(
    r'^(?:-#|#{1,6})\s+',
    multiLine: true,
  );
  static final RegExp collapsedWhitespace = RegExp(r'\s+');
  static final RegExp boldAsterisk = RegExp(r'\*\*(.+?)\*\*');
  static final RegExp boldUnderscore = RegExp('__(.+?)__');
  static final RegExp italicAsterisk = RegExp(
    r'(?<!\*)\*(?!\*)(.+?)(?<!\*)\*(?!\*)',
  );
  static final RegExp italicUnderscore = RegExp(
    '(?<!_)_(?!_)(.+?)(?<!_)_(?!_)',
  );
  static final RegExp strikethrough = RegExp('~~(.+?)~~');
}

String stripMessageMarkdownEmphasis(String text) {
  var result = text;
  for (final RegExp pattern in <RegExp>[
    MessageContentPatterns.boldAsterisk,
    MessageContentPatterns.boldUnderscore,
    MessageContentPatterns.strikethrough,
    MessageContentPatterns.italicAsterisk,
    MessageContentPatterns.italicUnderscore,
  ]) {
    result = result.replaceAllMapped(pattern, (match) => match.group(1) ?? '');
  }
  return result;
}

String stripMessageInlineCode(String text) {
  return text.replaceAllMapped(
    MessageContentPatterns.inlineCode,
    (match) => match.group(1) ?? '',
  );
}

String stripMessageMarkdownLinks(String text) {
  return text.replaceAllMapped(
    MessageContentPatterns.markdownLink,
    (match) => match.group(1) ?? '',
  );
}

String stripMessageStructuralMarkdown(String text) {
  var result = text;
  result = result.replaceAll(MessageContentPatterns.blockQuotePrefix, '');
  result = result.replaceAll(MessageContentPatterns.headingPrefix, '');
  result = stripMessageMarkdownEmphasis(result);
  return result.trim().replaceAll(
    MessageContentPatterns.collapsedWhitespace,
    ' ',
  );
}

String extractFencedCodeBlockContent(String text) {
  return text.replaceAllMapped(
    MessageContentPatterns.fencedCodeBlockInner,
    (match) => match.group(1)?.trim() ?? '',
  );
}
