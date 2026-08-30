// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:fluxer_markdown_native/src/ast.dart';
import 'package:markdown/markdown.dart' as md;

/// Converts the canonical native AST into the `md.Node` element shapes and
/// tag/attribute contract consumed by `package:fluxer_markdown`'s renderer.
List<md.Node> fluxerNativeAstToMarkdown(List<MdNode> nodes) =>
    _convertBlockChildren(nodes);

Iterable<MdNode> _flatten(List<MdNode> nodes) sync* {
  for (final node in nodes) {
    if (node is MdSequence) {
      yield* _flatten(node.children);
    } else {
      yield node;
    }
  }
}

bool _isBlockNode(MdNode node) => switch (node) {
  MdHeading() ||
  MdBlockquote() ||
  MdList() ||
  MdCodeBlock() ||
  MdTable() ||
  MdAlert() ||
  MdSubtext() => true,
  MdSpoiler(:final isBlock) => isBlock ?? false,
  _ => false,
};

List<md.Node> _convertBlockChildren(List<MdNode> nodes) {
  final result = <md.Node>[];
  final run = <md.Node>[];

  void flushRun() {
    if (run.isEmpty) {
      return;
    }
    final paragraph = _paragraphFromRun(run);
    run.clear();
    if (paragraph != null) {
      result.add(paragraph);
    }
  }

  for (final node in _flatten(nodes)) {
    if (_isBlockNode(node)) {
      flushRun();
      result.add(_convertBlock(node));
    } else {
      run.add(_convertInline(node));
    }
  }
  flushRun();
  return result;
}

final RegExp _leadingNewlines = RegExp(r'^\n+');
final RegExp _trailingNewlines = RegExp(r'\n+$');

// Boundary newlines only separate a run from an adjacent block; the classic
// pipeline splits on them before parsing and never renders them.
md.Element? _paragraphFromRun(List<md.Node> run) {
  final nodes = List<md.Node>.of(run);
  if (nodes.isNotEmpty) {
    final first = nodes.first;
    if (first is md.Text) {
      final trimmed = first.text.replaceFirst(_leadingNewlines, '');
      if (trimmed.isEmpty) {
        nodes.removeAt(0);
      } else if (trimmed != first.text) {
        nodes[0] = md.Text(trimmed);
      }
    }
  }
  if (nodes.isNotEmpty) {
    final last = nodes.last;
    if (last is md.Text) {
      final trimmed = last.text.replaceFirst(_trailingNewlines, '');
      if (trimmed.isEmpty) {
        nodes.removeLast();
      } else if (trimmed != last.text) {
        nodes[nodes.length - 1] = md.Text(trimmed);
      }
    }
  }
  if (nodes.isEmpty ||
      nodes.every((node) => node is md.Text && node.text.trim().isEmpty)) {
    return null;
  }
  return md.Element('p', nodes);
}

md.Node _convertBlock(MdNode node) => switch (node) {
  MdHeading(:final level, :final children) when level >= 1 && level <= 4 =>
    md.Element('h$level', _convertInlineChildren(children)),
  MdHeading(:final children) => md.Element(
    'p',
    _convertInlineChildren(children),
  ),
  MdBlockquote(:final children) => md.Element(
    'blockquote',
    _convertBlockChildren(children),
  ),
  MdList() => _convertList(node),
  MdCodeBlock(:final language, :final content) => _convertCodeBlock(
    language,
    content,
  ),
  MdTable() => _convertTable(node),
  MdAlert(:final alertType, :final children) => md.Element(
    'alert',
    _convertBlockChildren(children),
  )..attributes['type'] = alertType.name,
  MdSubtext(:final children) => md.Element(
    'subtext',
    _convertInlineChildren(children),
  ),
  MdSpoiler(:final children) => md.Element(
    'block-spoiler',
    _convertInlineChildren(children),
  ),
  _ => _convertInline(node),
};

List<md.Node> _convertInlineChildren(List<MdNode> children) => [
  for (final MdNode child in _flatten(children)) _convertInline(child),
];

md.Node _convertInline(MdNode node) => switch (node) {
  MdText(:final content) => md.Text(content),
  MdStrong(:final children) => md.Element(
    'strong',
    _convertInlineChildren(children),
  ),
  MdEmphasis(:final children) => md.Element(
    'em',
    _convertInlineChildren(children),
  ),
  MdUnderline(:final children) => md.Element(
    'underline',
    _convertInlineChildren(children),
  ),
  MdStrikethrough(:final children) => md.Element(
    'del',
    _convertInlineChildren(children),
  ),
  MdSpoiler(:final children) => md.Element(
    'spoiler',
    _convertInlineChildren(children),
  ),
  MdInlineCode(:final content) => md.Element('code', [md.Text(content)]),
  MdLink() => _convertLink(node),
  MdMention(:final kind) => _convertMention(kind),
  MdTimestamp(:final timestamp, :final style) => md.Element('timestamp', [
    md.Text('$timestamp'),
  ])..attributes['flag'] = _timestampFlag(style),
  MdEmoji(:final kind) => _convertEmoji(kind),
  MdTableRow(:final cells) => md.Element(
    'span',
    _convertInlineChildren(cells),
  ),
  MdTableCell(:final children) => md.Element(
    'span',
    _convertInlineChildren(children),
  ),
  MdSequence(:final children) => md.Element(
    'span',
    _convertInlineChildren(children),
  ),
  _ => _convertBlock(node),
};

md.Element _convertList(MdList list) {
  final items = <md.Node>[
    for (final MdListItem item in list.items)
      md.Element('li', _convertListItemChildren(item.children)),
  ];
  final element = md.Element(list.ordered ? 'ol' : 'ul', items);
  if (list.ordered && list.items.isNotEmpty) {
    element.attributes['start'] = '${list.items.first.ordinal ?? 1}';
  }
  return element;
}

List<md.Node> _convertListItemChildren(List<MdNode> children) => [
  for (final MdNode child in _flatten(children))
    if (_isBlockNode(child)) _convertBlock(child) else _convertInline(child),
];

md.Element _convertCodeBlock(String? language, String content) {
  final code = md.Element('code', [md.Text(content)]);
  if (language != null && language.isNotEmpty) {
    code.attributes['class'] = 'language-$language';
  }
  return md.Element('pre', [code]);
}

md.Element _convertTable(MdTable table) {
  md.Element convertRow(MdNode row, String cellTag) {
    final cells = row is MdTableRow ? row.cells : const <MdNode>[];
    final converted = <md.Node>[];
    for (var i = 0; i < cells.length; i++) {
      final cell = cells[i];
      final children = cell is MdTableCell
          ? _convertInlineChildren(cell.children)
          : [_convertInline(cell)];
      final element = md.Element(cellTag, children);
      final alignment = i < table.alignments.length
          ? table.alignments[i]
          : MdTableAlignment.none;
      if (alignment != MdTableAlignment.none) {
        element.attributes['align'] = alignment.name;
      }
      converted.add(element);
    }
    return md.Element('tr', converted);
  }

  return md.Element('table', [
    md.Element('thead', [convertRow(table.header, 'th')]),
    if (table.rows.isNotEmpty)
      md.Element('tbody', [
        for (final MdNode row in table.rows) convertRow(row, 'td'),
      ]),
  ]);
}

md.Element _convertLink(MdLink link) {
  final children = switch (link.text) {
    null => [md.Text(link.rawUrl)],
    final MdNode text => _convertInlineChildren([text]),
  };
  return md.Element('a', children)..attributes['href'] = link.url;
}

md.Node _convertMention(MdMentionKind kind) => switch (kind) {
  MdUserMention(:final id) => md.Element('mention-user', [md.Text(id)]),
  MdChannelMention(:final id) => md.Element('mention-channel', [md.Text(id)]),
  MdRoleMention(:final id) => md.Element('mention-role', [md.Text(id)]),
  MdEveryoneMention() => md.Element('mention-everyone', [
    md.Text('@everyone'),
  ]),
  MdHereMention() => md.Element('mention-everyone', [md.Text('@here')]),
  MdCommandMention() => _convertCommandMention(kind),
  MdGuildNavigationMention(:final navigationType, :final id) => md.Element(
    'mention-guild-nav',
    [
      md.Text(_guildNavigationName(navigationType)),
    ],
  )..attributes.addAll({'nav-id': ?id}),
};

md.Element _convertCommandMention(MdCommandMention kind) {
  final command = [
    kind.name,
    if (kind.subcommandGroup != null) kind.subcommandGroup!,
    if (kind.subcommand != null) kind.subcommand!,
  ].join(' ');
  return md.Element('mention-command', [md.Text(command)])
    ..attributes['id'] = kind.id;
}

String _guildNavigationName(MdGuildNavigationType type) => switch (type) {
  MdGuildNavigationType.linkedRoles => 'linked-roles',
  _ => type.name,
};

String _timestampFlag(MdTimestampStyle style) => switch (style) {
  MdTimestampStyle.shortTime => 't',
  MdTimestampStyle.longTime => 'T',
  MdTimestampStyle.shortDate => 'd',
  MdTimestampStyle.longDate => 'D',
  MdTimestampStyle.shortDateTime => 'f',
  MdTimestampStyle.longDateTime => 'F',
  MdTimestampStyle.shortDateShortTime => 's',
  MdTimestampStyle.shortDateMediumTime => 'S',
  MdTimestampStyle.relativeTime => 'R',
};

md.Node _convertEmoji(MdEmojiKind kind) => switch (kind) {
  MdStandardEmoji(:final raw, :final name) => md.Element('emoji-unicode', [
    md.Text(name),
  ])..attributes['surrogate'] = raw,
  MdCustomEmoji(:final name, :final id, :final animated) => md.Element(
    'emoji-custom',
    [md.Text(name)],
  )..attributes.addAll({'id': id, 'animated': '$animated'}),
};
