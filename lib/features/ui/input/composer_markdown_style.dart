import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_fonts.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown_native/fluxer_markdown_native.dart'
    show MdSourceSpan, MdSpanFormat;

const double kComposerMarkdownMarkerOpacity = 0.45;
const double _kSmallFontScale = 0.85;
const Color _kSpoilerBackground = Color(0x26000000);

TextStyle composerMarkdownStyle(
  BuildContext context,
  TextStyle? base,
  MdSourceSpan span,
) {
  final TextStyle style = base ?? const TextStyle();
  final FluxerColorTheme colors = context.colors;
  final Color baseColor = style.color ?? colors.textChat;
  if (span.isMarker) {
    return style.copyWith(
      color: baseColor.withValues(
        alpha: baseColor.a * kComposerMarkdownMarkerOpacity,
      ),
    );
  }
  if (span.format == MdSpanFormat.none) {
    return style;
  }
  final bool code = span.has(MdSpanFormat.code);
  final Color color = code
      ? colors.textCode
      : span.has(MdSpanFormat.link)
      ? colors.textLink
      : span.has(MdSpanFormat.blockquote) || span.has(MdSpanFormat.subtext)
      ? colors.textChatMuted
      : baseColor;
  final List<TextDecoration> decorations = <TextDecoration>[
    if (span.has(MdSpanFormat.underline)) TextDecoration.underline,
    if (span.has(MdSpanFormat.strike)) TextDecoration.lineThrough,
  ];
  final bool small = code || span.has(MdSpanFormat.subtext);
  return style.copyWith(
    color: color,
    fontSize: small ? (style.fontSize ?? 16) * _kSmallFontScale : null,
    fontFamily: code ? FluxerFonts.mono : null,
    fontWeight: span.has(MdSpanFormat.bold) || span.has(MdSpanFormat.heading)
        ? FontWeight.w700
        : null,
    fontStyle: span.has(MdSpanFormat.italic) ? FontStyle.italic : null,
    decoration: decorations.isEmpty
        ? null
        : TextDecoration.combine(decorations),
    decorationColor: decorations.isEmpty ? null : color,
    backgroundColor: span.has(MdSpanFormat.spoiler)
        ? _kSpoilerBackground
        : null,
  );
}
