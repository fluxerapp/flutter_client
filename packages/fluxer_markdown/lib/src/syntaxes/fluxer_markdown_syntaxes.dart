import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:markdown/markdown.dart' as md;

final RegExp blankMarkdownLinkLabelPattern = RegExp(r'^\s*$');

bool hasApostropheInMaskedLinkAuthority(String url) {
  final Uri? uri = Uri.tryParse(url);
  if (uri == null || !uri.hasAuthority) {
    return false;
  }
  return uri.host.contains("'");
}

class FluxerInlineCodeSyntax extends md.InlineSyntax {
  FluxerInlineCodeSyntax() : super(r'`([^`\n]+)`');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String? content = match.group(1);
    if (content == null || content.isEmpty) {
      return false;
    }
    parser.addNode(md.Element.text('code', content));
    return true;
  }
}

bool _hasVisibleMarkdownContent(String value) {
  return value.trim().isNotEmpty &&
      value.runes.any(
        (int codeUnit) =>
            codeUnit != 0x200E &&
            !<int>{0x20, 0x09, 0x0A, 0x0D}.contains(codeUnit),
      );
}

String? _specialShortcodeText(String name) {
  return switch (name) {
    'tm' => '™',
    'copyright' => '©',
    'registered' => '®',
    _ => null,
  };
}

class FluxerUnderlineSyntax extends md.InlineSyntax {
  FluxerUnderlineSyntax() : super('(?<!_)__(?!_)(.+?)(?<!_)__(?!_)');

  static const tag = 'underline';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || !_hasVisibleMarkdownContent(content)) {
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
    if (content == null || !_hasVisibleMarkdownContent(content)) {
      return false;
    }
    final children = parser.document.parseInline(content);
    parser.addNode(md.Element(tag, children));
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

    final el = md.Element.text(tag, name)..attributes['surrogate'] = surrogate;
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
    final String? special = _specialShortcodeText(name);
    if (special != null) {
      parser.addNode(md.Text(special));
      return true;
    }
    final surrogate = resolver(name);
    if (surrogate == null) {
      parser.addNode(md.Text(match[0]!));
      return true;
    }
    final el = md.Element.text(tag, name)..attributes['surrogate'] = surrogate;
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

class FluxerRawUnicodeEmojiSyntax extends md.InlineSyntax {
  FluxerRawUnicodeEmojiSyntax(RegExp emojiPattern)
    : super(emojiPattern.pattern);

  static const String tag = FluxerUnicodeEmojiToneSyntax.tag;

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final surrogate = match[0];
    if (surrogate == null || surrogate.isEmpty) {
      return false;
    }

    final el = md.Element.text(tag, surrogate)
      ..attributes['surrogate'] = surrogate;
    parser.addNode(el);
    return true;
  }
}

class FluxerJumpLinkSyntax extends md.InlineSyntax {
  FluxerJumpLinkSyntax(RegExp pattern)
    : super(pattern.pattern, caseSensitive: pattern.isCaseSensitive);

  static const tag = 'jump-link';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final url = match[0]!;
    final el = md.Element.text(tag, url)..attributes['href'] = url;
    parser.addNode(el);
    return true;
  }
}

class FluxerBracketedJumpLinkSyntax extends md.InlineSyntax {
  FluxerBracketedJumpLinkSyntax(RegExp pattern)
    : super('<(${pattern.pattern})>', caseSensitive: pattern.isCaseSensitive);

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String? url = match[1];
    if (url == null || url.isEmpty) {
      return false;
    }
    final el = md.Element.text(FluxerJumpLinkSyntax.tag, url)
      ..attributes['href'] = url;
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

class FluxerAppLinkSyntax extends md.InlineSyntax {
  FluxerAppLinkSyntax() : super(r'fluxer:(?://)?[^\s<>\[\]()]+');

  static const tag = 'a';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String url = match[0]!;
    final md.Element element = md.Element.text(tag, url)
      ..attributes['href'] = url;
    parser.addNode(element);
    return true;
  }
}

class FluxerBracketedAppLinkSyntax extends md.InlineSyntax {
  FluxerBracketedAppLinkSyntax() : super(r'<(fluxer:(?://)?[^\s<>]+)>');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String? url = match[1];
    if (url == null || url.isEmpty) {
      return false;
    }
    final md.Element element = md.Element.text('a', url)
      ..attributes['href'] = url;
    parser.addNode(element);
    return true;
  }
}

class FluxerCommandMentionSyntax extends md.InlineSyntax {
  FluxerCommandMentionSyntax()
    : super(r'</([a-zA-Z0-9_-]+(?: [a-zA-Z0-9_-]+){0,2}):(\d+)>');

  static const tag = 'mention-command';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String? command = match[1];
    final String? id = match[2];
    if (command == null || id == null || command.isEmpty) {
      return false;
    }
    final List<String> segments = command.split(' ');
    if (segments.isEmpty || segments.length > 3) {
      return false;
    }
    final md.Element element = md.Element(tag, <md.Node>[md.Text(command)])
      ..attributes['id'] = id
      ..attributes['segments'] = segments.join('\u{1F}');
    parser.addNode(element);
    return true;
  }
}

class FluxerGuildNavigationSyntax extends md.InlineSyntax {
  FluxerGuildNavigationSyntax()
    : super(r'<id:(customize|browse|guide|linked-roles)(?::(\d+))?>');

  static const tag = 'mention-guild-nav';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String? navTypeRaw = match[1];
    final String? navId = match[2];
    if (navTypeRaw == null) {
      return false;
    }
    final FluxerGuildNavigationType? navType = parseFluxerGuildNavigationType(
      navTypeRaw,
    );
    if (navType == null) {
      return false;
    }
    if (navType != FluxerGuildNavigationType.linkedRoles && navId != null) {
      return false;
    }
    final md.Element element = md.Element.text(tag, navTypeRaw);
    if (navId != null) {
      element.attributes['nav-id'] = navId;
    }
    parser.addNode(element);
    return true;
  }
}

class FluxerTimestampSyntax extends md.InlineSyntax {
  FluxerTimestampSyntax() : super(r'<t:(\d+)(?::([sStTdDfFR]))?>');

  static const tag = 'timestamp';

  /// Maximum representable timestamp in seconds. The widget multiplies by 1000
  /// before calling [DateTime.fromMillisecondsSinceEpoch], whose valid range is
  /// ±8.64e15 ms, so seconds are capped at 8.64e12. Beyond this `value * 1000`
  /// overflows a 64-bit int and throws a `RangeError` at build time. Mirrors the
  /// canonical web parser, which rejects larger values.
  static const _maxSeconds = 8640000000000;

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final raw = match[1];
    final unix = raw == null ? null : int.tryParse(raw);
    if (raw == null || unix == null || unix <= 0 || unix > _maxSeconds) {
      parser.addNode(md.Text(match[0]!));
      return true;
    }
    final el = md.Element.text(tag, raw)..attributes['flag'] = match[2] ?? 'f';
    parser.addNode(el);
    return true;
  }
}
