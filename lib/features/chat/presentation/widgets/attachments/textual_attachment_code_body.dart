import 'dart:async';

import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_preview_surface.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_preview_utils.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

String? resolveHighlightLanguage(String languageCode) {
  ensureFluxerMarkdownLanguagesRegistered();
  final String normalized = languageCode.trim().toLowerCase();
  if (normalized.isEmpty ||
      normalized == 'plaintext' ||
      normalized == 'auto' ||
      normalized == 'ini') {
    return null;
  }
  if (kFluxerMarkdownLanguages.containsKey(normalized)) {
    return normalized;
  }
  return null;
}

class TextualAttachmentCodeBody extends StatefulWidget {
  const TextualAttachmentCodeBody({
    required this.content,
    required this.languageCode,
    required this.wrapText,
    this.remainingSuffix,
    super.key,
  });

  final String content;
  final String languageCode;
  final bool wrapText;
  final String? remainingSuffix;

  @override
  State<TextualAttachmentCodeBody> createState() =>
      _TextualAttachmentCodeBodyState();
}

class _TextualAttachmentCodeBodyState extends State<TextualAttachmentCodeBody> {
  late String _display;
  BackgroundCodeHighlight? _highlight;
  List<TextSpan>? _spans;
  (bool, TextStyle)? _spansKey;

  @override
  void initState() {
    super.initState();
    _syncHighlight();
  }

  @override
  void didUpdateWidget(TextualAttachmentCodeBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.content != widget.content ||
        oldWidget.remainingSuffix != widget.remainingSuffix ||
        oldWidget.languageCode != widget.languageCode) {
      _syncHighlight();
    }
  }

  void _syncHighlight() {
    final String? suffix = widget.remainingSuffix;
    _display = suffix == null ? widget.content : '${widget.content}\n$suffix';
    final String? language = _display.length > kMaxCodeHighlightSourceLength
        ? null
        : resolveHighlightLanguage(widget.languageCode);
    final BackgroundCodeHighlight? highlight = language == null
        ? null
        : backgroundCodeHighlight(code: _display, language: language);
    if (identical(highlight, _highlight)) {
      return;
    }
    _highlight = highlight;
    _spans = null;
    _spansKey = null;
    if (highlight == null || highlight.isComplete) {
      return;
    }
    unawaited(
      highlight.done.then((_) {
        if (!mounted || !identical(_highlight, highlight)) {
          return;
        }
        setState(() {});
      }),
    );
  }

  List<TextSpan>? _resolveSpans(
    BackgroundCodeHighlight highlight,
    bool isDark,
    TextStyle monoStyle,
  ) {
    if (!highlight.isComplete) {
      return null;
    }
    final (bool, TextStyle) key = (isDark, monoStyle);
    if (_spansKey != key) {
      final Map<String, TextStyle> theme = codeBlockHighlightThemeFor(
        isDark ? vs2015Theme : githubTheme,
        codeTextStyle: monoStyle,
      );
      _spans = highlight.spans((String className) => theme[className]);
      _spansKey = key;
    }
    return _spans;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final TextStyle monoStyle = codeTextStyleFrom(
      context.textStyles.smallText.copyWith(
        color: context.colors.textPrimary,
        height: kTextualPreviewLineHeight / 13,
      ),
      codeTextStyle: context.textStyles.codeText,
    );
    final BackgroundCodeHighlight? highlight = _highlight;
    if (highlight != null) {
      return _HighlightedCode(
        source: highlight.code,
        spans: _resolveSpans(highlight, isDark, monoStyle),
        rootStyle: (isDark ? vs2015Theme : githubTheme)['root'],
        textStyle: monoStyle,
        wrapText: widget.wrapText,
      );
    }

    final Widget plain = Text(
      _display,
      softWrap: widget.wrapText,
      style: monoStyle,
    );
    if (widget.wrapText) {
      return Padding(padding: kTextualPreviewCodeInset, child: plain);
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: kTextualPreviewCodeInset,
      child: plain,
    );
  }
}

class _HighlightedCode extends StatelessWidget {
  const _HighlightedCode({
    required this.source,
    required this.spans,
    required this.rootStyle,
    required this.textStyle,
    required this.wrapText,
  });

  final String source;
  final List<TextSpan>? spans;
  final TextStyle? rootStyle;
  final TextStyle textStyle;
  final bool wrapText;

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveStyle = TextStyle(
      color: rootStyle?.color,
    ).merge(textStyle);
    final List<TextSpan>? highlighted = spans;
    final Widget code = ColoredBox(
      color: rootStyle?.backgroundColor ?? Colors.transparent,
      child: Padding(
        padding: wrapText ? kTextualPreviewCodeInset : EdgeInsets.zero,
        child: RichText(
          text: highlighted == null
              ? TextSpan(style: effectiveStyle, text: source)
              : TextSpan(style: effectiveStyle, children: highlighted),
        ),
      ),
    );
    if (wrapText) {
      return code;
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: kTextualPreviewCodeInset,
      child: code,
    );
  }
}
