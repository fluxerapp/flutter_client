import 'dart:convert';

import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:fluxer_markdown_native/fluxer_markdown_native.dart' as native;
import 'package:markdown/markdown.dart' as md;

/// Unicode emoji available to package tests; the app builds its context from
/// the full registry, tests only need a stable handful.
const Map<String, String> kTestUnicodeEmoji = {
  'grinning': '\u{1F600}',
  'joy': '\u{1F602}',
  'fire': '\u{1F525}',
  'wave': '\u{1F44B}',
  'heart': '\u2764\uFE0F',
  'thumbsup': '\u{1F44D}',
};

const Map<String, String> kTestSkinToneEmoji = {
  'wave::skin-tone-3': '\u{1F44B}\u{1F3FD}',
  'thumbsup::skin-tone-5': '\u{1F44D}\u{1F3FF}',
};

int testParserFlagsForFeatures(FluxerMarkdownFeatures features) {
  var flags = 0;
  if (features.allowSpoilers) {
    flags |= native.FluxerParserFlags.spoilers;
  }
  if (features.allowHeadings) {
    flags |= native.FluxerParserFlags.headings;
  }
  if (features.allowLists) {
    flags |= native.FluxerParserFlags.lists;
  }
  if (features.allowCodeBlocks) {
    flags |= native.FluxerParserFlags.codeBlocks;
  }
  if (features.allowMaskedLinks) {
    flags |= native.FluxerParserFlags.maskedLinks;
  }
  if (features.allowCommandMentions) {
    flags |= native.FluxerParserFlags.commandMentions;
  }
  if (features.allowGuildNavigations) {
    flags |= native.FluxerParserFlags.guildNavigations;
  }
  if (features.allowUserMentions) {
    flags |= native.FluxerParserFlags.userMentions;
  }
  if (features.allowRoleMentions) {
    flags |= native.FluxerParserFlags.roleMentions;
  }
  if (features.allowChannelMentions) {
    flags |= native.FluxerParserFlags.channelMentions;
  }
  if (features.allowEveryoneMentions) {
    flags |= native.FluxerParserFlags.everyoneMentions;
  }
  if (features.allowBlockquotes) {
    flags |= native.FluxerParserFlags.blockquotes;
  }
  if (features.allowMultilineBlockquotes) {
    flags |= native.FluxerParserFlags.multilineBlockquotes;
  }
  if (features.allowSubtext) {
    flags |= native.FluxerParserFlags.subtext;
  }
  if (features.allowTables) {
    flags |= native.FluxerParserFlags.tables;
  }
  if (features.allowAlerts) {
    flags |= native.FluxerParserFlags.alerts;
  }
  if (features.allowAutolinks) {
    flags |= native.FluxerParserFlags.autolinks;
  }
  return flags;
}

String buildTestEmojiContextTsv(String input) {
  final buffer = StringBuffer();
  var utf16Cursor = 0;
  var byteCursor = 0;
  final pattern = RegExp(
    (kTestUnicodeEmoji.values.toList()
          ..addAll(kTestSkinToneEmoji.values)
          ..sort((a, b) => b.length.compareTo(a.length)))
        .map(RegExp.escape)
        .join('|'),
  );
  for (final Match match in pattern.allMatches(input)) {
    final String raw = match.group(0)!;
    byteCursor += utf8.encode(input.substring(utf16Cursor, match.start)).length;
    utf16Cursor = match.start;
    final String name = _nameForRaw(raw);
    buffer.writeln(
      [
        'S',
        '$byteCursor',
        '${utf8.encode(raw).length}',
        raw,
        name,
        _codepoints(raw),
      ].join('\t'),
    );
  }
  for (final MapEntry<String, String> entry in kTestUnicodeEmoji.entries) {
    if (input.contains(':${entry.key}:')) {
      buffer.writeln(
        ['C', entry.key, entry.value, _codepoints(entry.value)].join('\t'),
      );
    }
  }
  for (final MapEntry<String, String> entry in kTestSkinToneEmoji.entries) {
    final List<String> parts = entry.key.split('::skin-tone-');
    if (input.contains(':${parts.first}:')) {
      buffer.writeln(
        [
          'K',
          parts.first,
          parts.last,
          entry.value,
          _codepoints(entry.value),
        ].join('\t'),
      );
    }
  }
  return buffer.toString();
}

String _nameForRaw(String raw) {
  for (final MapEntry<String, String> entry in kTestUnicodeEmoji.entries) {
    if (entry.value == raw) {
      return entry.key;
    }
  }
  for (final MapEntry<String, String> entry in kTestSkinToneEmoji.entries) {
    if (entry.value == raw) {
      return entry.key.split('::skin-tone-').first;
    }
  }
  return raw;
}

String _codepoints(String emoji) {
  final bool containsZwj = emoji.contains('\u200D');
  final String processed = containsZwj ? emoji : emoji.replaceAll('\uFE0F', '');
  return processed.runes.map((rune) => rune.toRadixString(16)).join('-');
}

/// Stable top-level reference used as `FluxerMarkdown.astParser` in tests.
List<md.Node> parseTestMarkdownAst(
  String data,
  FluxerMarkdownFeatures features,
) {
  return native.fluxerNativeAstToMarkdown(
    native.parseFluxerMarkdownBinary(
      data,
      flags: testParserFlagsForFeatures(features),
      emojiContextTsv: buildTestEmojiContextTsv(data),
    ),
  );
}

bool containsMarkdownTag(List<md.Node> nodes, String tag) =>
    findMarkdownTag(nodes, tag) != null;

md.Element? findMarkdownTag(List<md.Node> nodes, String tag) {
  for (final md.Node node in nodes) {
    if (node is! md.Element) {
      continue;
    }
    if (node.tag == tag) {
      return node;
    }
    final md.Element? nested = findMarkdownTag(node.children ?? const [], tag);
    if (nested != null) {
      return nested;
    }
  }
  return null;
}

String collectMarkdownText(List<md.Node> nodes) {
  final buffer = StringBuffer();
  for (final md.Node node in nodes) {
    if (node is md.Text) {
      buffer.write(node.text);
    } else if (node is md.Element) {
      buffer.write(collectMarkdownText(node.children ?? const []));
    }
  }
  return buffer.toString();
}
