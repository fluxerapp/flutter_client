import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_alert.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_mention.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:highlight/highlight.dart' show Mode, highlight;
import 'package:highlight/languages/bash.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/cs.dart';
import 'package:highlight/languages/css.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/diff.dart';
import 'package:highlight/languages/dockerfile.dart';
import 'package:highlight/languages/go.dart';
import 'package:highlight/languages/graphql.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:highlight/languages/json.dart';
import 'package:highlight/languages/kotlin.dart';
import 'package:highlight/languages/lua.dart';
import 'package:highlight/languages/makefile.dart';
import 'package:highlight/languages/markdown.dart';
import 'package:highlight/languages/nginx.dart';
import 'package:highlight/languages/objectivec.dart';
import 'package:highlight/languages/php.dart';
import 'package:highlight/languages/powershell.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/ruby.dart';
import 'package:highlight/languages/rust.dart';
import 'package:highlight/languages/scala.dart';
import 'package:highlight/languages/scss.dart';
import 'package:highlight/languages/shell.dart';
import 'package:highlight/languages/sql.dart';
import 'package:highlight/languages/swift.dart';
import 'package:highlight/languages/typescript.dart';
import 'package:highlight/languages/xml.dart';
import 'package:highlight/languages/yaml.dart';
import 'package:intl/intl.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// sup lang list (test)
final Map<String, Mode> _kLanguages = {
  'bash': bash,
  'sh': bash,
  'shell': shell,
  'zsh': bash,
  'c': cpp,
  'c++': cpp,
  'cpp': cpp,
  'cs': cs,
  'csharp': cs,
  'css': css,
  'dart': dart,
  'diff': diff,
  'docker': dockerfile,
  'dockerfile': dockerfile,
  'go': go,
  'graphql': graphql,
  'java': java,
  'javascript': javascript,
  'js': javascript,
  'json': json,
  'kotlin': kotlin,
  'lua': lua,
  'makefile': makefile,
  'markdown': markdown,
  'md': markdown,
  'nginx': nginx,
  'objc': objectivec,
  'objectivec': objectivec,
  'php': php,
  'powershell': powershell,
  'ps1': powershell,
  'py': python,
  'python': python,
  'rb': ruby,
  'rs': rust,
  'ruby': ruby,
  'rust': rust,
  'scala': scala,
  'scss': scss,
  'sql': sql,
  'swift': swift,
  'ts': typescript,
  'typescript': typescript,
  'html': xml,
  'xml': xml,
  'yaml': yaml,
  'yml': yaml,
};

const _kJumboMaxCount = 6;
const _kEmojiSizeNormal = 22.0;
const _kEmojiSizeJumbo = 48.0;

bool _languagesRegistered = false;

bool isJumboEmoji(String text) {
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
  return count >= 1 && count <= _kJumboMaxCount;
}

void _ensureLanguagesRegistered() {
  if (_languagesRegistered) {
    return;
  }
  _languagesRegistered = true;
  _kLanguages.forEach(highlight.registerLanguage);
}

sealed class _Segment {}

final class _MarkdownSegment extends _Segment {
  _MarkdownSegment(this.text);
  final String text;
}

final class _AlertSegment extends _Segment {
  _AlertSegment({required this.type, required this.body});
  final AlertType type;
  final String body;
}

/// Parses alert blocks out of [text], returns interleaved markdown and alert
/// segments.
List<_Segment> _parseSegments(String text) {
  final openRe = RegExp(
    r'^>\s*\[!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)\]\s*(.*)',
    caseSensitive: false,
  );
  final lineRe = RegExp(r'^>\s?(.*)$');

  final lines = text.split('\n');
  final segments = <_Segment>[];
  final mdBuffer = StringBuffer();

  int i = 0;
  while (i < lines.length) {
    final match = openRe.firstMatch(lines[i]);
    if (match == null) {
      mdBuffer.writeln(lines[i]);
      i++;
      continue;
    }

    final pending = mdBuffer.toString().trim();
    if (pending.isNotEmpty) {
      segments.add(_MarkdownSegment(pending));
      mdBuffer.clear();
    }

    final rawType = match.group(1)!;
    final type = AlertType.tryParse(rawType)!;
    final inlineText = (match.group(2) ?? '').trim();
    i++;

    final bodyLines = <String>[];
    if (inlineText.isNotEmpty) {
      bodyLines.add(inlineText);
    }
    while (i < lines.length) {
      final bodyMatch = lineRe.firstMatch(lines[i]);
      if (bodyMatch == null) {
        break;
      }
      bodyLines.add(bodyMatch.group(1) ?? '');
      i++;
    }

    segments.add(_AlertSegment(type: type, body: bodyLines.join('\n').trim()));
  }

  final remaining = mdBuffer.toString().trim();
  if (remaining.isNotEmpty) {
    segments.add(_MarkdownSegment(remaining));
  }

  return segments;
}

class MessageMarkdown extends StatelessWidget {
  const MessageMarkdown({
    required this.data,
    this.baseStyle,
    this.selectable = false,
    this.channelId,
    super.key,
  });

  final String data;
  final TextStyle? baseStyle;
  final bool selectable;
  final String? channelId;

  @override
  Widget build(BuildContext context) {
    _ensureLanguagesRegistered();

    final colors = context.colors;
    final style = baseStyle ?? context.textStyles.messageText;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final sheet = MarkdownStyleSheet(
      p: style,
      a: style.copyWith(
        color: colors.textLink,
        decoration: TextDecoration.none,
      ),
      strong: style.copyWith(fontWeight: FontWeight.w700),
      em: style.copyWith(fontStyle: FontStyle.italic),
      code: style.copyWith(
        fontSize: (style.fontSize ?? 16) * 0.85,
        backgroundColor: colors.bgCode,
        fontFamily: 'monospace',
      ),
      codeblockDecoration: BoxDecoration(
        color: colors.bgCodeBlock,
        borderRadius: BorderRadius.circular(4),
      ),
      codeblockPadding: const EdgeInsets.all(8),
      blockquoteDecoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: colors.interactiveMuted, width: 4),
        ),
      ),
      blockquotePadding: const EdgeInsets.only(left: 10),
      h1: style.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
      h2: style.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
      h3: style.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
      listBullet: style,
      tableHead: style.copyWith(fontWeight: FontWeight.w600),
      tableBody: style,
      tableBorder: TableBorder.all(color: colors.borderColor),
    );

    final segments = _parseSegments(data);

    if (segments.length == 1 && segments.first is _MarkdownSegment) {
      return _buildMarkdown(
        (segments.first as _MarkdownSegment).text,
        sheet,
        isDark,
        style,
        context,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: segments.map((seg) {
        return switch (seg) {
          _MarkdownSegment(:final text) => _buildMarkdown(
            text,
            sheet,
            isDark,
            style,
            context,
          ),
          _AlertSegment(:final type, :final body) => MessageAlert(
            type: type,
            bodyWidget: _buildMarkdown(body, sheet, isDark, style, context),
            baseStyle: style,
          ),
        };
      }).toList(),
    );
  }

  Widget _buildMarkdown(
    String text,
    MarkdownStyleSheet sheet,
    bool isDark,
    TextStyle style,
    BuildContext context,
  ) {
    final jumbo = isJumboEmoji(text);
    return MarkdownBody(
      data: text,
      styleSheet: sheet,
      selectable: selectable,
      inlineSyntaxes: [
        _JumpLinkSyntax(),
        _UserMentionSyntax(),
        _ChannelMentionSyntax(),
        _RoleMentionSyntax(),
        _EveryoneMentionSyntax(),
        _TimestampSyntax(),
        _SpoilerSyntax(),
        _UnicodeEmojiSyntax(),
        _UnicodeEmojiPlainSyntax(),
        _CustomEmojiSyntax(),
      ],
      builders: {
        _JumpLinkSyntax.tag: _JumpLinkBuilder(baseStyle: style),
        _UserMentionSyntax.tag: _UserMentionBuilder(
          baseStyle: style,
          channelId: channelId,
        ),
        _ChannelMentionSyntax.tag: _ChannelMentionBuilder(baseStyle: style),
        _RoleMentionSyntax.tag: _RoleMentionBuilder(baseStyle: style),
        _EveryoneMentionSyntax.tag: _EveryoneMentionBuilder(baseStyle: style),
        _TimestampSyntax.tag: _TimestampBuilder(baseStyle: style),
        _SpoilerSyntax.tag: _SpoilerBuilder(),
        _UnicodeEmojiSyntax.tag: _EmojiBuilder(baseStyle: style, jumbo: jumbo),
        _CustomEmojiSyntax.tag: _EmojiBuilder(baseStyle: style, jumbo: jumbo),
        'code': _CodeBlockBuilder(isDark: isDark, baseStyle: style),
      },
      extensionSet: md.ExtensionSet.gitHubFlavored,
      onTapLink: (_, href, _) => _onTapLink(href, context),
    );
  }

  void _onTapLink(String? href, BuildContext context) {
    if (href == null) {
      return;
    }
    final jump = parseChannelJumpLink(href);
    if (jump != null) {
      final router = ProviderScope.containerOf(
        context,
      ).read(fluxerRouterProvider);
      if (jump.isDm) {
        router.go(RoutePaths.dmChannel(jump.channelId));
      } else if (jump is MessageJumpLink) {
        router.go(
          RoutePaths.guildChannelMessage(
            jump.scope,
            jump.channelId,
            jump.messageId,
          ),
        );
      } else {
        router.go(RoutePaths.guildChannel(jump.scope, jump.channelId));
      }
      return;
    }
    final uri = Uri.tryParse(href);
    if (uri == null) {
      return;
    }
    unawaited(launchUrl(uri, mode: LaunchMode.externalApplication));
  }
}

/// Parses `<@userId>` and `<@!userId>` user mention tags.
class _UserMentionSyntax extends md.InlineSyntax {
  _UserMentionSyntax() : super(r'<@!?(\d+)>');

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

class _UserMentionBuilder extends MarkdownElementBuilder {
  _UserMentionBuilder({required this.baseStyle, this.channelId});

  final TextStyle baseStyle;
  final String? channelId;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) => UserMention(
    userId: element.textContent,
    channelId: channelId,
    baseStyle: baseStyle,
  );
}

/// Parses `<#Id>` channel mention tags.
class _ChannelMentionSyntax extends md.InlineSyntax {
  _ChannelMentionSyntax() : super(r'<#(\d+)>');

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

class _ChannelMentionBuilder extends MarkdownElementBuilder {
  _ChannelMentionBuilder({required this.baseStyle});

  final TextStyle baseStyle;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) => ChannelMention(channelId: element.textContent, baseStyle: baseStyle);
}

/// Parses plain-text `@everyone` and `@here` mentions.
class _EveryoneMentionSyntax extends md.InlineSyntax {
  _EveryoneMentionSyntax() : super('@(everyone|here)');

  static const tag = 'mention-everyone';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final el = md.Element.text(tag, '@${match[1]}');
    parser.addNode(el);
    return true;
  }
}

class _EveryoneMentionBuilder extends MarkdownElementBuilder {
  _EveryoneMentionBuilder({required this.baseStyle});

  final TextStyle baseStyle;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) => TextMention(label: element.textContent, baseStyle: baseStyle);
}

/// Parses `<@&roleId>` role mention tags.
class _RoleMentionSyntax extends md.InlineSyntax {
  _RoleMentionSyntax() : super(r'<@&(\d+)>');

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

class _RoleMentionBuilder extends MarkdownElementBuilder {
  _RoleMentionBuilder({required this.baseStyle});

  final TextStyle baseStyle;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) => RoleMention(roleId: element.textContent, baseStyle: baseStyle);
}

/// Parses `<t:unix:flag>` timestamp tags.
class _TimestampSyntax extends md.InlineSyntax {
  _TimestampSyntax() : super(r'<t:(\d+)(?::([tTdDfFR]))?>');

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

class _TimestampBuilder extends MarkdownElementBuilder {
  _TimestampBuilder({required this.baseStyle});

  final TextStyle baseStyle;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    final unix = int.tryParse(element.textContent);
    if (unix == null) {
      return null;
    }
    final dt = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
    final flag = element.attributes['flag'] ?? 'f';
    final text = _format(dt, flag);
    final colors = context.colors;
    final fontSize = (baseStyle.fontSize ?? 16) * 0.85;

    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundModifierHover,
        borderRadius: BorderRadius.circular(3),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            PhosphorIconsFill.clock,
            size: fontSize,
            color: (baseStyle.color ?? colors.textSecondary).withValues(
              alpha: 0.7,
            ),
          ),
          const SizedBox(width: 3),
          Text(
            text,
            style: baseStyle.copyWith(
              fontSize: fontSize,
              color: colors.textSecondary,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  static String _format(DateTime dt, String flag) => switch (flag) {
    't' => DateFormat.Hm().format(dt),
    'T' => DateFormat.Hms().format(dt),
    'd' => DateFormat.yMd().format(dt),
    'D' => DateFormat.yMMMMd().format(dt),
    'F' => DateFormat.yMMMMEEEEd().add_Hm().format(dt),
    // relative: "2 hours ago" / "in 3 days"
    'R' => _relative(dt),
    _ => DateFormat.yMMMMd().add_Hm().format(dt),
  };

  static String _relative(DateTime dt) {
    final diff = dt.difference(DateTime.now());
    final abs = diff.abs();
    final future = !diff.isNegative;
    final String label;
    if (abs.inSeconds < 60) {
      label = '${abs.inSeconds} seconds';
    } else if (abs.inMinutes < 60) {
      label = '${abs.inMinutes} minutes';
    } else if (abs.inHours < 24) {
      label = '${abs.inHours} hours';
    } else if (abs.inDays < 30) {
      label = '${abs.inDays} days';
    } else if (abs.inDays < 365) {
      label = '${abs.inDays ~/ 30} months';
    } else {
      label = '${abs.inDays ~/ 365} years';
    }
    return future ? 'in $label' : '$label ago';
  }
}

/// Parses spoiler syntax ||text||.
class _SpoilerSyntax extends md.InlineSyntax {
  _SpoilerSyntax() : super(r'\|\|(.+?)\|\|');

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

class _SpoilerBuilder extends MarkdownElementBuilder {
  @override
  Widget visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) => _SpoilerSpan(
    child: Text(element.textContent, style: preferredStyle ?? parentStyle),
  );
}

class _SpoilerSpan extends StatefulWidget {
  const _SpoilerSpan({required this.child});

  final Widget child;

  @override
  State<_SpoilerSpan> createState() => _SpoilerSpanState();
}

class _SpoilerSpanState extends State<_SpoilerSpan>
    with SingleTickerProviderStateMixin {
  static const _kDuration = Duration(milliseconds: 200);

  late final AnimationController _controller;
  late final Animation<double> _opacity;
  var _isRevealed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _kDuration);
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _isRevealed = !_isRevealed);
    unawaited(_isRevealed ? _controller.forward() : _controller.reverse());
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: _toggle,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: [
          FadeTransition(opacity: _opacity, child: widget.child),
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedOpacity(
                duration: _kDuration,
                opacity: _isRevealed ? 0 : 1,
                child: ColoredBox(color: context.colors.spoilerBackground),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _CodeBlockBuilder extends MarkdownElementBuilder {
  _CodeBlockBuilder({required this.isDark, required this.baseStyle});

  final bool isDark;
  final TextStyle baseStyle;

  static const _kPadding = EdgeInsets.all(12);
  static const _kRadius = BorderRadius.all(Radius.circular(4));

  @override
  Widget visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    final rawClass = (element.attributes['class'] ?? '').trim();
    if (!rawClass.startsWith('language-')) {
      return const SizedBox.shrink();
    }

    final rawLang = rawClass.replaceFirst('language-', '').toLowerCase();

    var code = element.textContent;
    if (code.endsWith('\n')) {
      code = code.substring(0, code.length - 1);
    }

    final knownLang = _kLanguages.containsKey(rawLang) ? rawLang : null;

    // No matching language but label exists, show it as the first line
    if (knownLang == null && rawLang.isNotEmpty) {
      code = '$rawLang\n$code';
    }

    final colors = context.colors;
    final bgColor = isDark
        ? (vs2015Theme['root']?.backgroundColor ?? colors.bgCodeBlock)
        : (githubTheme['root']?.backgroundColor ?? colors.bgCodeBlock);

    if (knownLang == null) {
      return _PlainCodeBlock(
        code: code,
        bgColor: bgColor,
        baseStyle: baseStyle,
      );
    }

    return ClipRRect(
      borderRadius: _kRadius,
      child: HighlightView(
        code,
        language: knownLang,
        theme: isDark ? vs2015Theme : githubTheme,
        padding: _kPadding,
        textStyle: baseStyle.copyWith(
          fontFamily: 'monospace',
          fontSize: (baseStyle.fontSize ?? 16) * 0.85,
        ),
      ),
    );
  }
}

class _PlainCodeBlock extends StatelessWidget {
  const _PlainCodeBlock({
    required this.code,
    required this.bgColor,
    required this.baseStyle,
  });

  final String code;
  final Color bgColor;
  final TextStyle baseStyle;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
    ),
    padding: const EdgeInsets.all(12),
    child: Text(
      code,
      style: baseStyle.copyWith(
        fontFamily: 'monospace',
        fontSize: (baseStyle.fontSize ?? 16) * 0.85,
      ),
    ),
  );
}

class _UnicodeEmojiSyntax extends md.InlineSyntax {
  _UnicodeEmojiSyntax()
      : super(r':([a-zA-Z0-9_+\-]+)::skin-tone-([1-5]):');

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

    var surrogate = EmojiRegistry.resolveSync(name);
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

class _UnicodeEmojiPlainSyntax extends md.InlineSyntax {
  _UnicodeEmojiPlainSyntax() : super(r':([a-zA-Z0-9_+\-]+):');

  static const String tag = _UnicodeEmojiSyntax.tag;

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final name = match[1];
    if (name == null || name.isEmpty) {
      return false;
    }
    final surrogate = EmojiRegistry.resolveSync(name);
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

class _CustomEmojiSyntax extends md.InlineSyntax {
  _CustomEmojiSyntax() : super(r'<(a?):([a-zA-Z0-9_]+):(\d+)>');

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

/// in-memory SVG cache to avoid re-fetching on every rebuild.
class SvgCache {
  SvgCache._();

  static final _cache = <String, Future<Uint8List>>{};

  static Future<Uint8List> load(String url) =>
      _cache.putIfAbsent(url, () async {
        final uri = Uri.parse(url);
        final response = await HttpClient().getUrl(uri).then((r) => r.close());
        final builder = BytesBuilder();
        await response.forEach(builder.add);
        return builder.toBytes();
      });
}

class _EmojiBuilder extends MarkdownElementBuilder {
  _EmojiBuilder({required this.baseStyle, this.jumbo = false});

  final TextStyle baseStyle;
  final bool jumbo;

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final size = jumbo ? _kEmojiSizeJumbo : _kEmojiSizeNormal;
    if (element.tag == _CustomEmojiSyntax.tag) {
      return _buildCustom(element, size);
    }
    return _buildUnicode(element, size);
  }

  Widget _buildUnicode(md.Element element, double size) {
    final surrogate = element.attributes['surrogate'] ?? element.textContent;
    final url = getTwemojiUrl(surrogate);
    if (url == null) {
      return Text(surrogate, style: TextStyle(fontSize: size));
    }
    return FutureBuilder<Uint8List>(
      future: SvgCache.load(url),
      builder: (context, snap) {
        if (!snap.hasData) {
          return SizedBox(width: size, height: size);
        }
        return SvgPicture.memory(
          snap.data!,
          width: size,
          height: size,
        );
      },
    );
  }

  Widget _buildCustom(md.Element element, double size) {
    final id = element.attributes['id'] ?? '';
    final name = element.textContent;
    final animated = element.attributes['animated'] == 'true';
    final cdnSize = jumbo ? 240 : 96;
    final url = getCustomEmojiUrl(id: id, animated: animated, size: cdnSize);
    final px = size.toInt();
    return SizedBox(
      width: size,
      height: size,
      child: CachedNetworkImage(
        imageUrl: url,
        cacheKey: 'emoji_${id}_${animated ? 'a' : 's'}',
        width: size,
        height: size,
        memCacheWidth: px,
        memCacheHeight: px,
        errorBuilder: (_, _, _) => Text(':$name:'),
      ),
    );
  }
}

class _JumpLinkSyntax extends md.InlineSyntax {
  _JumpLinkSyntax()
    : super(
        r'https?://fluxer\.app/channels/'
        r'(?:@me|\d{15,21})/\d{15,21}(?:/\d{15,21})?',
      );

  static const tag = 'jump-link';

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final url = match[0]!;
    final el = md.Element.text(tag, url)..attributes['href'] = url;
    parser.addNode(el);
    return true;
  }
}

class _JumpLinkBuilder extends MarkdownElementBuilder {
  _JumpLinkBuilder({required this.baseStyle});

  final TextStyle baseStyle;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    final url = element.attributes['href'] ?? element.textContent;
    final link = parseChannelJumpLink(url);
    if (link == null) {
      return null;
    }
    return ChannelJumpLinkMention(link: link, url: url, baseStyle: baseStyle);
  }
}
