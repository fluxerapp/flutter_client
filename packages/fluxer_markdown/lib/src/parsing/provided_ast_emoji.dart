import 'package:markdown/markdown.dart' as md;

const Set<String> _skippedTags = {
  'code',
  'pre',
  'timestamp',
  'mention-user',
  'mention-channel',
  'mention-role',
  'mention-everyone',
  'mention-command',
  'mention-guild-nav',
  'emoji-unicode',
  'emoji-custom',
};

/// Expands unicode and `:shortcode:` emoji in the text leaves of a provided
/// AST; the native parser only emits standard emoji nodes when given an emoji
/// context TSV, which the mobile client does not produce yet.
List<md.Node> applyFluxerMarkdownEmojiPostPass(
  List<md.Node> nodes,
  md.Document emojiDocument,
) {
  final result = <md.Node>[];
  for (final md.Node node in nodes) {
    if (node is md.Text) {
      if (_mayContainEmoji(node.text)) {
        result.addAll(emojiDocument.parseInline(node.text));
      } else {
        result.add(node);
      }
      continue;
    }
    if (node is! md.Element) {
      result.add(node);
      continue;
    }
    final List<md.Node>? children = node.children;
    if (children == null || _skippedTags.contains(node.tag)) {
      result.add(node);
      continue;
    }
    final element = md.Element(
      node.tag,
      applyFluxerMarkdownEmojiPostPass(children, emojiDocument),
    );
    element.attributes.addAll(node.attributes);
    result.add(element);
  }
  return result;
}

bool _mayContainEmoji(String text) {
  if (text.contains(':')) {
    return true;
  }
  for (final int unit in text.codeUnits) {
    if (unit > 0x7f) {
      return true;
    }
  }
  return false;
}
