// SPDX-License-Identifier: AGPL-3.0-or-later
//
// Typed mirror of the Rust AST (rust/src/ast.rs, `Node` and friends) as
// serialized by serde with `#[serde(tag = "type")]` / `#[serde(tag = "kind")]`.

/// A node of the canonical Fluxer markdown AST.
sealed class MdNode {
  const MdNode();

  factory MdNode.fromJson(Map<String, Object?> json) {
    final type = json['type']! as String;
    return switch (type) {
      'Text' => MdText(json['content']! as String),
      'Blockquote' => MdBlockquote(
        _children(json),
        blankLines: json['blankLines'] as int?,
      ),
      'Strong' => MdStrong(_children(json)),
      'Emphasis' => MdEmphasis(_children(json)),
      'Underline' => MdUnderline(_children(json)),
      'Strikethrough' => MdStrikethrough(_children(json)),
      'Spoiler' => MdSpoiler(
        _children(json),
        isBlock: json['isBlock'] as bool?,
      ),
      'Heading' => MdHeading(json['level']! as int, _children(json)),
      'Subtext' => MdSubtext(_children(json)),
      'List' => MdList(
        ordered: json['ordered']! as bool,
        items: [
          for (final Object? item in json['items']! as List<Object?>)
            MdListItem.fromJson(item! as Map<String, Object?>),
        ],
      ),
      'CodeBlock' => MdCodeBlock(
        language: json['language'] as String?,
        content: json['content']! as String,
      ),
      'InlineCode' => MdInlineCode(json['content']! as String),
      'Sequence' => MdSequence(_children(json)),
      'Link' => MdLink(
        text: switch (json['text']) {
          null => null,
          final Object text => MdNode.fromJson(text as Map<String, Object?>),
        },
        url: json['url']! as String,
        escaped: json['escaped']! as bool,
        rawUrl: json['rawUrl']! as String,
        source: json['source']! as String,
      ),
      'Mention' => MdMention(
        MdMentionKind.fromJson(json['kind']! as Map<String, Object?>),
      ),
      'Timestamp' => MdTimestamp(
        (json['timestamp']! as num).toInt(),
        _enumFromName(MdTimestampStyle.values, json['style']! as String),
      ),
      'Emoji' => MdEmoji(
        MdEmojiKind.fromJson(json['kind']! as Map<String, Object?>),
      ),
      'Table' => MdTable(
        header: MdNode.fromJson(json['header']! as Map<String, Object?>),
        alignments: [
          for (final Object? alignment in json['alignments']! as List<Object?>)
            _enumFromName(MdTableAlignment.values, alignment! as String),
        ],
        rows: [
          for (final Object? row in json['rows']! as List<Object?>)
            MdNode.fromJson(row! as Map<String, Object?>),
        ],
      ),
      'TableRow' => MdTableRow([
        for (final Object? cell in json['cells']! as List<Object?>)
          MdNode.fromJson(cell! as Map<String, Object?>),
      ]),
      'TableCell' => MdTableCell(_children(json)),
      'Alert' => MdAlert(
        _enumFromName(MdAlertType.values, json['alertType']! as String),
        _children(json),
      ),
      _ => throw FormatException('Unknown markdown node type: $type'),
    };
  }

  static List<MdNode> _children(Map<String, Object?> json) => [
    for (final Object? child in json['children']! as List<Object?>)
      MdNode.fromJson(child! as Map<String, Object?>),
  ];
}

T _enumFromName<T extends Enum>(List<T> values, String rustName) =>
    values.firstWhere(
      (value) => value.name.toLowerCase() == rustName.toLowerCase(),
      orElse: () => throw FormatException(
        'Unknown ${values.first.runtimeType}: $rustName',
      ),
    );

final class MdText extends MdNode {
  const MdText(this.content);
  final String content;
}

final class MdBlockquote extends MdNode {
  const MdBlockquote(this.children, {this.blankLines});
  final List<MdNode> children;
  final int? blankLines;
}

final class MdStrong extends MdNode {
  const MdStrong(this.children);
  final List<MdNode> children;
}

final class MdEmphasis extends MdNode {
  const MdEmphasis(this.children);
  final List<MdNode> children;
}

final class MdUnderline extends MdNode {
  const MdUnderline(this.children);
  final List<MdNode> children;
}

final class MdStrikethrough extends MdNode {
  const MdStrikethrough(this.children);
  final List<MdNode> children;
}

final class MdSpoiler extends MdNode {
  const MdSpoiler(this.children, {this.isBlock});
  final List<MdNode> children;
  final bool? isBlock;
}

final class MdHeading extends MdNode {
  const MdHeading(this.level, this.children);
  final int level;
  final List<MdNode> children;
}

final class MdSubtext extends MdNode {
  const MdSubtext(this.children);
  final List<MdNode> children;
}

final class MdListItem {
  const MdListItem(this.children, {this.ordinal});

  factory MdListItem.fromJson(Map<String, Object?> json) => MdListItem(
    MdNode._children(json),
    ordinal: json['ordinal'] as int?,
  );

  final List<MdNode> children;
  final int? ordinal;
}

final class MdList extends MdNode {
  const MdList({required this.ordered, required this.items});
  final bool ordered;
  final List<MdListItem> items;
}

final class MdCodeBlock extends MdNode {
  const MdCodeBlock({required this.language, required this.content});
  final String? language;
  final String content;
}

final class MdInlineCode extends MdNode {
  const MdInlineCode(this.content);
  final String content;
}

final class MdSequence extends MdNode {
  const MdSequence(this.children);
  final List<MdNode> children;
}

final class MdLink extends MdNode {
  const MdLink({
    required this.text,
    required this.url,
    required this.escaped,
    required this.rawUrl,
    required this.source,
  });

  final MdNode? text;
  final String url;
  final bool escaped;
  final String rawUrl;
  final String source;
}

final class MdMention extends MdNode {
  const MdMention(this.kind);
  final MdMentionKind kind;
}

final class MdTimestamp extends MdNode {
  const MdTimestamp(this.timestamp, this.style);
  final int timestamp;
  final MdTimestampStyle style;
}

final class MdEmoji extends MdNode {
  const MdEmoji(this.kind);
  final MdEmojiKind kind;
}

final class MdTable extends MdNode {
  const MdTable({
    required this.header,
    required this.alignments,
    required this.rows,
  });

  final MdNode header;
  final List<MdTableAlignment> alignments;
  final List<MdNode> rows;
}

final class MdTableRow extends MdNode {
  const MdTableRow(this.cells);
  final List<MdNode> cells;
}

final class MdTableCell extends MdNode {
  const MdTableCell(this.children);
  final List<MdNode> children;
}

final class MdAlert extends MdNode {
  const MdAlert(this.alertType, this.children);
  final MdAlertType alertType;
  final List<MdNode> children;
}

enum MdTimestampStyle {
  shortTime,
  longTime,
  shortDate,
  longDate,
  shortDateTime,
  longDateTime,
  shortDateShortTime,
  shortDateMediumTime,
  relativeTime,
}

enum MdAlertType { note, tip, important, warning, caution }

enum MdTableAlignment { left, center, right, none }

enum MdGuildNavigationType { customize, browse, guide, linkedRoles }

sealed class MdMentionKind {
  const MdMentionKind();

  factory MdMentionKind.fromJson(Map<String, Object?> json) {
    final kind = json['kind']! as String;
    return switch (kind) {
      'User' => MdUserMention(json['id']! as String),
      'Channel' => MdChannelMention(json['id']! as String),
      'Role' => MdRoleMention(json['id']! as String),
      'Command' => MdCommandMention(
        name: json['name']! as String,
        subcommandGroup: json['subcommandGroup'] as String?,
        subcommand: json['subcommand'] as String?,
        id: json['id']! as String,
      ),
      'GuildNavigation' => MdGuildNavigationMention(
        _enumFromName(
          MdGuildNavigationType.values,
          json['navigationType']! as String,
        ),
        id: json['id'] as String?,
      ),
      'Everyone' => const MdEveryoneMention(),
      'Here' => const MdHereMention(),
      _ => throw FormatException('Unknown mention kind: $kind'),
    };
  }
}

final class MdUserMention extends MdMentionKind {
  const MdUserMention(this.id);
  final String id;
}

final class MdChannelMention extends MdMentionKind {
  const MdChannelMention(this.id);
  final String id;
}

final class MdRoleMention extends MdMentionKind {
  const MdRoleMention(this.id);
  final String id;
}

final class MdCommandMention extends MdMentionKind {
  const MdCommandMention({
    required this.name,
    required this.subcommandGroup,
    required this.subcommand,
    required this.id,
  });

  final String name;
  final String? subcommandGroup;
  final String? subcommand;
  final String id;
}

final class MdGuildNavigationMention extends MdMentionKind {
  const MdGuildNavigationMention(this.navigationType, {this.id});
  final MdGuildNavigationType navigationType;
  final String? id;
}

final class MdEveryoneMention extends MdMentionKind {
  const MdEveryoneMention();
}

final class MdHereMention extends MdMentionKind {
  const MdHereMention();
}

sealed class MdEmojiKind {
  const MdEmojiKind();

  factory MdEmojiKind.fromJson(Map<String, Object?> json) {
    final kind = json['kind']! as String;
    return switch (kind) {
      'Standard' => MdStandardEmoji(
        raw: json['raw']! as String,
        codepoints: json['codepoints']! as String,
        name: json['name']! as String,
      ),
      'Custom' => MdCustomEmoji(
        name: json['name']! as String,
        id: json['id']! as String,
        animated: json['animated']! as bool,
      ),
      _ => throw FormatException('Unknown emoji kind: $kind'),
    };
  }
}

final class MdStandardEmoji extends MdEmojiKind {
  const MdStandardEmoji({
    required this.raw,
    required this.codepoints,
    required this.name,
  });

  final String raw;
  final String codepoints;
  final String name;
}

final class MdCustomEmoji extends MdEmojiKind {
  const MdCustomEmoji({
    required this.name,
    required this.id,
    required this.animated,
  });

  final String name;
  final String id;
  final bool animated;
}
