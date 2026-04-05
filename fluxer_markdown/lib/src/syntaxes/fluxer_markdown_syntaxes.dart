import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:markdown/markdown.dart' as md;

class FluxerTripleAsteriskSyntax extends md.InlineSyntax {
  FluxerTripleAsteriskSyntax() : super(r'\*\*\*(.+?)\*\*\*');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || content.isEmpty) {
      return false;
    }

    parser.addNode(
      md.Element('em', [
        md.Element('strong', parser.document.parseInline(content)),
      ]),
    );
    return true;
  }
}

class FluxerTripleUnderscoreSyntax extends md.InlineSyntax {
  FluxerTripleUnderscoreSyntax() : super(r'___(.+?)___');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || content.isEmpty) {
      return false;
    }

    parser.addNode(
      md.Element('em', [
        md.Element('strong', parser.document.parseInline(content)),
      ]),
    );
    return true;
  }
}

class FluxerSpacedTripleAsteriskSyntax extends md.InlineSyntax {
  FluxerSpacedTripleAsteriskSyntax() : super(r'\*\*\*(\s+.+?\s+)\*\*\*');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || content.trim().isEmpty) {
      return false;
    }

    parser.addNode(
      md.Element('em', [
        md.Element('strong', parser.document.parseInline(content)),
      ]),
    );
    return true;
  }
}

class FluxerSpacedTripleUnderscoreSyntax extends md.InlineSyntax {
  FluxerSpacedTripleUnderscoreSyntax() : super(r'___(\s+.+?\s+)___');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || content.trim().isEmpty) {
      return false;
    }

    parser.addNode(
      md.Element('em', [
        md.Element('strong', parser.document.parseInline(content)),
      ]),
    );
    return true;
  }
}

class FluxerSpacedStrongSyntax extends md.InlineSyntax {
  FluxerSpacedStrongSyntax() : super(r'\*\*(\s+.+?\s+)\*\*');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || content.trim().isEmpty) {
      return false;
    }

    parser.addNode(md.Element('strong', parser.document.parseInline(content)));
    return true;
  }
}

class FluxerSpacedEmphasisSyntax extends md.InlineSyntax {
  FluxerSpacedEmphasisSyntax() : super(r'\*(\s+.+?\s+)\*');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || content.trim().isEmpty) {
      return false;
    }

    parser.addNode(md.Element('em', parser.document.parseInline(content)));
    return true;
  }
}

class FluxerSpacedUnderscoreEmphasisSyntax extends md.InlineSyntax {
  FluxerSpacedUnderscoreEmphasisSyntax() : super(r'_(\s+.+?\s+)_');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || content.trim().isEmpty) {
      return false;
    }

    parser.addNode(md.Element('em', parser.document.parseInline(content)));
    return true;
  }
}

class FluxerSpacedUnderlineSyntax extends md.InlineSyntax {
  FluxerSpacedUnderlineSyntax() : super(r'__(\s+.+?\s+)__');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || content.trim().isEmpty) {
      return false;
    }

    parser.addNode(
      md.Element(FluxerUnderlineSyntax.tag, parser.document.parseInline(content)),
    );
    return true;
  }
}

class FluxerSpacedStrikethroughSyntax extends md.InlineSyntax {
  FluxerSpacedStrikethroughSyntax() : super(r'~~(\s+.+?\s+)~~');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || content.trim().isEmpty) {
      return false;
    }

    parser.addNode(md.Element('del', parser.document.parseInline(content)));
    return true;
  }
}

class FluxerUnderlineSyntax extends md.InlineSyntax {
  FluxerUnderlineSyntax() : super('__(.+?)__');

  static const tag = 'underline';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || content.isEmpty) {
      return false;
    }
    parser.addNode(md.Element.text(tag, content));
    return true;
  }
}

class FluxerSpoilerSyntax extends md.InlineSyntax {
  FluxerSpoilerSyntax() : super(r'\|\|(.+?)\|\|');

  static const tag = 'spoiler';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || content.isEmpty) {
      return false;
    }
    parser.addNode(md.Element.text(tag, content));
    return true;
  }
}

class FluxerUnicodeEmojiToneSyntax extends md.InlineSyntax {
  FluxerUnicodeEmojiToneSyntax(this.resolver)
    : super(r':([a-zA-Z0-9_+\-]+)::skin-tone-([1-5]):');

  final FluxerShortcodeResolver resolver;

  static const tag = 'emoji-unicode';
  static const _kTones = [
    '\u{1F3FB}',
    '\u{1F3FC}',
    '\u{1F3FD}',
    '\u{1F3FE}',
    '\u{1F3FF}',
  ];

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final name = match[1];
    final toneStr = match[2];
    if (name == null || name.isEmpty) {
      return false;
    }

    var surrogate = resolver(name);
    if (surrogate == null) {
      parser.addNode(md.Text(match[0]!));
      return true;
    }

    final idx = int.tryParse(toneStr ?? '');
    if (idx != null && idx >= 1 && idx <= 5) {
      surrogate = surrogate + _kTones[idx - 1];
    }

    final el = md.Element.text(tag, name)
      ..attributes['surrogate'] = surrogate;
    parser.addNode(el);
    return true;
  }
}

class FluxerUnicodeEmojiSyntax extends md.InlineSyntax {
  FluxerUnicodeEmojiSyntax(this.resolver) : super(r':([a-zA-Z0-9_+\-]+):');

  final FluxerShortcodeResolver resolver;

  static const String tag = FluxerUnicodeEmojiToneSyntax.tag;

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final name = match[1];
    if (name == null || name.isEmpty) {
      return false;
    }
    final surrogate = resolver(name);
    if (surrogate == null) {
      parser.addNode(md.Text(match[0]!));
      return true;
    }
    final el = md.Element.text(tag, name)
      ..attributes['surrogate'] = surrogate;
    parser.addNode(el);
    return true;
  }
}

class FluxerCustomEmojiSyntax extends md.InlineSyntax {
  FluxerCustomEmojiSyntax() : super(r'<(a?):([a-zA-Z0-9_]+):(\d+)>');

  static const tag = 'emoji-custom';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final animated = match[1] == 'a';
    final name = match[2] ?? '';
    final id = match[3];
    if (id == null) {
      return false;
    }
    final el = md.Element.text(tag, name)
      ..attributes['id'] = id
      ..attributes['animated'] = animated.toString();
    parser.addNode(el);
    return true;
  }
}

class FluxerJumpLinkSyntax extends md.InlineSyntax {
  FluxerJumpLinkSyntax(RegExp pattern) : super(pattern.pattern);

  static const tag = 'jump-link';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final url = match[0]!;
    final el = md.Element.text(tag, url)..attributes['href'] = url;
    parser.addNode(el);
    return true;
  }
}

class FluxerUserMentionSyntax extends md.InlineSyntax {
  FluxerUserMentionSyntax() : super(r'<@!?(\d+)>');

  static const tag = 'mention-user';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final id = match[1];
    if (id == null) {
      return false;
    }
    parser.addNode(md.Element.text(tag, id));
    return true;
  }
}

class FluxerChannelMentionSyntax extends md.InlineSyntax {
  FluxerChannelMentionSyntax() : super(r'<#(\d+)>');

  static const tag = 'mention-channel';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final id = match[1];
    if (id == null) {
      return false;
    }
    parser.addNode(md.Element.text(tag, id));
    return true;
  }
}

class FluxerEveryoneMentionSyntax extends md.InlineSyntax {
  FluxerEveryoneMentionSyntax() : super('@(everyone|here)');

  static const tag = 'mention-everyone';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    parser.addNode(md.Element.text(tag, '@${match[1]}'));
    return true;
  }
}

class FluxerRoleMentionSyntax extends md.InlineSyntax {
  FluxerRoleMentionSyntax() : super(r'<@&(\d+)>');

  static const tag = 'mention-role';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final id = match[1];
    if (id == null) {
      return false;
    }
    parser.addNode(md.Element.text(tag, id));
    return true;
  }
}

class FluxerTimestampSyntax extends md.InlineSyntax {
  FluxerTimestampSyntax() : super(r'<t:(\d+)(?::([tTdDfFR]))?>');

  static const tag = 'timestamp';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final unix = match[1];
    if (unix == null) {
      return false;
    }
    final el = md.Element.text(tag, unix)..attributes['flag'] = match[2] ?? 'f';
    parser.addNode(el);
    return true;
  }
}
