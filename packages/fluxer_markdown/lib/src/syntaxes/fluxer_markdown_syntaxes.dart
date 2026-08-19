import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/utils/visible_content.dart';
import 'package:markdown/markdown.dart' as md;

final RegExp blankMarkdownLinkLabelPattern = RegExp(r'^\s*$');
const int kFluxerMarkdownMaxMaskedLinkUrlLength = 2048;

bool hasApostropheInMaskedLinkAuthority(String url) {
  final Uri? uri = Uri.tryParse(url);
  if (uri == null || !uri.hasAuthority) {
    return false;
  }
  return uri.host.contains("'");
}

bool isEmailLikeMaskedLinkLabel(String text) {
  final int atIndex = text.indexOf('@');
  if (atIndex <= 0 || atIndex == text.length - 1) {
    return false;
  }
  if (text.contains(RegExp(r'\s'))) {
    return false;
  }
  return text.substring(atIndex + 1).contains('.');
}

bool isSlashCommandLikeMaskedLinkLabel(String text) {
  final String trimmed = text.trim();
  return trimmed.startsWith('</') &&
      trimmed.endsWith('>') &&
      trimmed.contains(':');
}

bool isValidMaskedLinkUrl(String url) {
  final String normalized = unwrapAngleMaskedLinkDestination(url);
  if (normalized.isEmpty ||
      normalized.length > kFluxerMarkdownMaxMaskedLinkUrlLength) {
    return false;
  }
  if (normalized.contains('"')) {
    return false;
  }
  final Uri? uri = Uri.tryParse(normalized);
  if (uri == null) {
    return false;
  }
  final String scheme = uri.scheme.toLowerCase();
  if (scheme == 'http' || scheme == 'https') {
    return uri.userInfo.isEmpty;
  }
  return scheme == 'mailto' ||
      scheme == 'tel' ||
      scheme == 'sms' ||
      scheme == 'fluxer';
}

String unwrapAngleMaskedLinkDestination(String url) {
  final String trimmed = url.trim();
  if (trimmed.length >= 2 && trimmed.startsWith('<') && trimmed.endsWith('>')) {
    return trimmed.substring(1, trimmed.length - 1);
  }
  return trimmed;
}

bool isMisleadingMaskedLinkLabel(String text, String url) {
  final String label = text.trim();
  final String destination = unwrapAngleMaskedLinkDestination(url);
  if (!_looksLikeComparableUrl(label)) {
    return false;
  }
  return !_maskedLinkUrlsMatch(label, destination);
}

bool _looksLikeComparableUrl(String value) {
  final String lower = value.toLowerCase();
  return lower.startsWith('https://') ||
      lower.startsWith('http://') ||
      lower.startsWith('fluxer:');
}

bool _maskedLinkUrlsMatch(String left, String right) {
  final Uri? leftUri = Uri.tryParse(left);
  final Uri? rightUri = Uri.tryParse(right);
  if (leftUri == null || rightUri == null) {
    return left == right;
  }
  return leftUri.scheme.toLowerCase() == rightUri.scheme.toLowerCase() &&
      leftUri.host.toLowerCase() == rightUri.host.toLowerCase() &&
      leftUri.port == rightUri.port &&
      leftUri.path == rightUri.path &&
      leftUri.query == rightUri.query &&
      leftUri.fragment == rightUri.fragment;
}

bool isAutolinkDisplayText(String text, String href) {
  if (text == href) {
    return true;
  }
  for (final String prefix in <String>['mailto:', 'tel:', 'sms:']) {
    if (href.startsWith(prefix) && text == href.substring(prefix.length)) {
      return true;
    }
  }
  return false;
}

bool isValidPhoneNumber(String text) {
  if (!text.startsWith('+') || text.length < 7) {
    return false;
  }
  final String digits = text.substring(1);
  if (digits.isEmpty || !RegExp('^[1-9]').hasMatch(digits)) {
    return false;
  }
  return RegExp(r'^[0-9][0-9 \-()]*$').hasMatch(digits);
}

String normalizePhoneNumber(String text) {
  return text.replaceAll(RegExp('[^0-9+]'), '');
}

class FluxerAngleEmailLinkSyntax extends md.InlineSyntax {
  FluxerAngleEmailLinkSyntax() : super(r'<([^<>@\s]+@[^<>@\s]+\.[^<>@\s]+)>');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String? email = match.group(1);
    if (email == null || email.isEmpty || email.startsWith('+')) {
      return false;
    }
    final md.Element anchor = md.Element.text('a', email)
      ..attributes['href'] = 'mailto:$email';
    parser.addNode(anchor);
    return true;
  }
}

class FluxerAngleUrlLinkSyntax extends md.InlineSyntax {
  FluxerAngleUrlLinkSyntax()
    : super(r'<((?:https?://|fluxer:)[^>\s]+)>', caseSensitive: false);

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String? url = match.group(1);
    if (url == null || url.isEmpty) {
      return false;
    }
    if (url.length > kFluxerMarkdownMaxMaskedLinkUrlLength) {
      return false;
    }
    final md.Element anchor = md.Element.text('a', url)
      ..attributes['href'] = url;
    parser.addNode(anchor);
    return true;
  }
}

class FluxerPhoneLinkSyntax extends md.InlineSyntax {
  FluxerPhoneLinkSyntax() : super(r'<(\+[0-9][0-9 \-()]{5,})>');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String? raw = match.group(1);
    if (raw == null || !isValidPhoneNumber(raw)) {
      return false;
    }
    final String normalized = normalizePhoneNumber(raw);
    final md.Element anchor = md.Element.text('a', raw)
      ..attributes['href'] = 'tel:$normalized';
    parser.addNode(anchor);
    return true;
  }
}

class FluxerSmsLinkSyntax extends md.InlineSyntax {
  FluxerSmsLinkSyntax() : super(r'<sms:(\+[0-9][0-9 \-()]{5,})>');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String? raw = match.group(1);
    if (raw == null || !isValidPhoneNumber(raw)) {
      return false;
    }
    final String normalized = normalizePhoneNumber(raw);
    final md.Element anchor = md.Element.text('a', raw)
      ..attributes['href'] = 'sms:$normalized';
    parser.addNode(anchor);
    return true;
  }
}

bool hasVisibleMaskedLinkLabel(String text) => hasVisibleContent(text);

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
    if (content == null || !hasVisibleContent(content)) {
      return false;
    }
    final children = parser.document.parseInline(content);
    parser.addNode(md.Element(tag, children));
    return true;
  }
}

class FluxerSpoilerSyntax extends md.InlineSyntax {
  FluxerSpoilerSyntax() : super(r'\|\|(.+?)\|\|');

  static const tag = 'spoiler';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final content = match[1];
    if (content == null || !hasVisibleContent(content)) {
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

class FluxerLocalhostAutolinkSyntax extends md.InlineSyntax {
  FluxerLocalhostAutolinkSyntax()
    : super(
        '(?:https?|ftp)://'
        'localhost'
        r'(?::\d+)?'
        r'(?:/[^\s<]*)?'
        '(?![a-zA-Z0-9_-])',
        caseSensitive: false,
      );

  @override
  bool tryMatch(md.InlineParser parser, [int? startMatchPos]) {
    startMatchPos ??= parser.pos;
    final Match? startMatch = pattern.matchAsPrefix(
      parser.source,
      startMatchPos,
    );
    if (startMatch == null) {
      return false;
    }
    if (parser.pos > 0 &&
        !isAutolinkBoundaryCodePoint(parser.charAt(parser.pos - 1))) {
      return false;
    }
    parser.writeText();
    return onMatch(parser, startMatch);
  }

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String matchedText = match[0]!;
    final int consumeLength = _autolinkConsumeLength(matchedText);
    final String text = matchedText.substring(0, consumeLength);
    final md.Element anchor = md.Element.text('a', text)
      ..attributes['href'] = text;
    parser
      ..addNode(anchor)
      ..consume(consumeLength);
    return true;
  }
}

int _autolinkConsumeLength(String text) {
  var excludedLength = 0;
  if (text.endsWith(')')) {
    final RegExpMatch parenMatch = RegExp(r'(\(.*)?(\)+)$').firstMatch(text)!;
    if (parenMatch.group(1) == null) {
      excludedLength = parenMatch.group(2)!.length;
    } else {
      var parenCount = 0;
      for (var i = 0; i < text.length; i++) {
        final int char = text.codeUnitAt(i);
        if (char == 0x28) {
          parenCount++;
        } else if (char == 0x29) {
          parenCount--;
        }
      }
      if (parenCount < 0) {
        excludedLength = parenCount.abs();
      }
    }
  } else if (text.endsWith(';')) {
    final RegExpMatch? entityMatch = RegExp(r'&[0-9a-z]+;$').firstMatch(text);
    if (entityMatch != null) {
      excludedLength = entityMatch[0]!.length;
    }
  }
  while (text.length - excludedLength > 0) {
    final String lastChar = text[text.length - excludedLength - 1];
    if ('?!.,:*_~'.contains(lastChar)) {
      excludedLength++;
    } else {
      break;
    }
  }
  return text.length - excludedLength;
}

class FluxerAutolinkExtensionSyntax extends md.InlineSyntax {
  static const String _linkPattern =
      r'(?:https?):\/\/'
      r'(?:[-_a-z0-9]+\.)*(?:[-a-z0-9]+\.[-a-z0-9]+)'
      r'[^\s<]*'
      r'[^\s<?!.,:*_~]';

  FluxerAutolinkExtensionSyntax() : super(_linkPattern, caseSensitive: false);

  @override
  bool tryMatch(md.InlineParser parser, [int? startMatchPos]) {
    startMatchPos ??= parser.pos;
    final Match? startMatch = pattern.matchAsPrefix(
      parser.source,
      startMatchPos,
    );
    if (startMatch == null) {
      return false;
    }
    if (parser.pos > 0 &&
        !isAutolinkBoundaryCodePoint(parser.charAt(parser.pos - 1))) {
      return false;
    }
    parser.writeText();
    return onMatch(parser, startMatch);
  }

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String matchedText = match[0]!;
    final int consumeLength = _autolinkConsumeLength(matchedText);
    final String text = matchedText.substring(0, consumeLength);
    final md.Element anchor = md.Element.text('a', text)
      ..attributes['href'] = text;
    parser
      ..addNode(anchor)
      ..consume(consumeLength);
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
