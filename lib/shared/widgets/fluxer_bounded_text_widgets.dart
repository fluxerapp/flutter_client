import 'dart:ui' show BoxHeightStyle, BoxWidthStyle;

import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart' as material;

class Text extends material.StatelessWidget {
  const Text(
    String this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    @Deprecated(
      'Use textScaler instead. '
      'Use of textScaleFactor was deprecated in preparation for the upcoming nonlinear text scaling support. '
      'This feature was deprecated after v3.12.0-2.0.pre.',
    )
    this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.semanticsIdentifier,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : textSpan = null,
       assert(
         textScaler == null || textScaleFactor == null,
         'textScaleFactor is deprecated and cannot be specified when textScaler is specified.',
       );

  const Text.rich(
    material.InlineSpan this.textSpan, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    @Deprecated(
      'Use textScaler instead. '
      'Use of textScaleFactor was deprecated in preparation for the upcoming nonlinear text scaling support. '
      'This feature was deprecated after v3.12.0-2.0.pre.',
    )
    this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.semanticsIdentifier,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : data = null,
       assert(
         textScaler == null || textScaleFactor == null,
         'textScaleFactor is deprecated and cannot be specified when textScaler is specified.',
       );

  final String? data;
  final material.InlineSpan? textSpan;
  final material.TextStyle? style;
  final material.StrutStyle? strutStyle;
  final material.TextAlign? textAlign;
  final material.TextDirection? textDirection;
  final material.Locale? locale;
  final bool? softWrap;
  final material.TextOverflow? overflow;
  final double? textScaleFactor;
  final material.TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final String? semanticsIdentifier;
  final material.TextWidthBasis? textWidthBasis;
  final material.TextHeightBehavior? textHeightBehavior;
  final material.Color? selectionColor;

  @override
  material.Widget build(material.BuildContext context) {
    final material.TextStyle effectiveStyle = material.DefaultTextStyle.of(
      context,
    ).style.merge(style);
    final bool bounded = shouldApplyBoundedTextMetrics(maxLines: maxLines);
    final material.TextHeightBehavior? effectiveHeightBehavior =
        textHeightBehavior ??
        (bounded
            ? (material.DefaultTextHeightBehavior.maybeOf(context) ??
                  fluxerBoundedTextHeightBehavior)
            : material.DefaultTextHeightBehavior.maybeOf(context));
    final material.StrutStyle? effectiveStrut =
        strutStyle ?? (bounded ? boundedStrutFor(effectiveStyle) : null);

    final material.Widget text = data != null
        ? material.Text(
            data!,
            style: style,
            strutStyle: effectiveStrut,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            textScaler: textScaler,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            semanticsIdentifier: semanticsIdentifier,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: effectiveHeightBehavior,
            selectionColor: selectionColor,
          )
        : material.Text.rich(
            textSpan!,
            style: style,
            strutStyle: effectiveStrut,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            textScaler: textScaler,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            semanticsIdentifier: semanticsIdentifier,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: effectiveHeightBehavior,
            selectionColor: selectionColor,
          );

    return wrapBoundedTextClip(child: text, maxLines: maxLines);
  }
}

class RichText extends material.StatelessWidget {
  const RichText({
    required this.text,
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign = material.TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap = true,
    this.overflow = material.TextOverflow.clip,
    @Deprecated(
      'Use textScaler instead. '
      'Use of textScaleFactor was deprecated in preparation for the upcoming nonlinear text scaling support. '
      'This feature was deprecated after v3.12.0-2.0.pre.',
    )
    this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.textWidthBasis = material.TextWidthBasis.parent,
    this.textHeightBehavior,
    this.selectionColor,
  });

  final material.InlineSpan text;
  final material.TextStyle? style;
  final material.StrutStyle? strutStyle;
  final material.TextAlign textAlign;
  final material.TextDirection? textDirection;
  final material.Locale? locale;
  final bool softWrap;
  final material.TextOverflow overflow;
  final double? textScaleFactor;
  final material.TextScaler? textScaler;
  final int? maxLines;
  final material.TextWidthBasis textWidthBasis;
  final material.TextHeightBehavior? textHeightBehavior;
  final material.Color? selectionColor;

  @override
  material.Widget build(material.BuildContext context) {
    final material.TextStyle effectiveStyle = material.DefaultTextStyle.of(
      context,
    ).style.merge(style);
    final bool bounded = shouldApplyBoundedTextMetrics(maxLines: maxLines);
    final material.TextHeightBehavior? effectiveHeightBehavior =
        textHeightBehavior ??
        (bounded
            ? (material.DefaultTextHeightBehavior.maybeOf(context) ??
                  fluxerBoundedTextHeightBehavior)
            : material.DefaultTextHeightBehavior.maybeOf(context));
    final material.StrutStyle? effectiveStrut =
        strutStyle ?? (bounded ? boundedStrutFor(effectiveStyle) : null);

    final material.Widget richText = material.RichText(
      text: text,
      strutStyle: effectiveStrut,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler:
          textScaler ?? material.TextScaler.linear(textScaleFactor ?? 1.0),
      maxLines: maxLines,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: effectiveHeightBehavior,
      selectionColor: selectionColor,
    );

    return wrapBoundedTextClip(child: richText, maxLines: maxLines);
  }
}

class SelectableText extends material.StatelessWidget {
  const SelectableText(
    String this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    @Deprecated(
      'Use textScaler instead. '
      'Use of textScaleFactor was deprecated in preparation for the upcoming nonlinear text scaling support. '
      'This feature was deprecated after v3.12.0-2.0.pre.',
    )
    this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.showCursor = true,
    this.autofocus = false,
    this.contextMenuBuilder,
    this.magnifierConfiguration,
    this.onSelectionChanged,
    this.selectionControls,
    this.focusNode,
    this.scrollPhysics,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorHeight,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.onTap,
  }) : textSpan = null;

  const SelectableText.rich(
    material.TextSpan this.textSpan, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    @Deprecated(
      'Use textScaler instead. '
      'Use of textScaleFactor was deprecated in preparation for the upcoming nonlinear text scaling support. '
      'This feature was deprecated after v3.12.0-2.0.pre.',
    )
    this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.showCursor = true,
    this.autofocus = false,
    this.contextMenuBuilder,
    this.magnifierConfiguration,
    this.onSelectionChanged,
    this.selectionControls,
    this.focusNode,
    this.scrollPhysics,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorHeight,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.onTap,
  }) : data = null;

  final String? data;
  final material.TextSpan? textSpan;
  final material.TextStyle? style;
  final material.StrutStyle? strutStyle;
  final material.TextAlign? textAlign;
  final material.TextDirection? textDirection;
  final material.Locale? locale;
  final double? textScaleFactor;
  final material.TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final material.TextWidthBasis? textWidthBasis;
  final material.TextHeightBehavior? textHeightBehavior;
  final material.Color? selectionColor;
  final bool showCursor;
  final bool autofocus;
  final material.EditableTextContextMenuBuilder? contextMenuBuilder;
  final material.TextMagnifierConfiguration? magnifierConfiguration;
  final material.SelectionChangedCallback? onSelectionChanged;
  final material.TextSelectionControls? selectionControls;
  final material.FocusNode? focusNode;
  final material.ScrollPhysics? scrollPhysics;
  final material.Color? cursorColor;
  final double cursorWidth;
  final material.Radius? cursorRadius;
  final double? cursorHeight;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final material.GestureTapCallback? onTap;

  @override
  material.Widget build(material.BuildContext context) {
    final material.TextStyle effectiveStyle = material.DefaultTextStyle.of(
      context,
    ).style.merge(style);
    final bool bounded = shouldApplyBoundedTextMetrics(maxLines: maxLines);
    final material.TextHeightBehavior? effectiveHeightBehavior =
        textHeightBehavior ??
        (bounded
            ? (material.DefaultTextHeightBehavior.maybeOf(context) ??
                  fluxerBoundedTextHeightBehavior)
            : material.DefaultTextHeightBehavior.maybeOf(context));
    final material.StrutStyle? effectiveStrut =
        strutStyle ?? (bounded ? boundedStrutFor(effectiveStyle) : null);

    final material.Widget text = data != null
        ? material.SelectableText(
            data!,
            style: style,
            strutStyle: effectiveStrut,
            textAlign: textAlign,
            textDirection: textDirection,
            textScaleFactor: textScaleFactor,
            textScaler: textScaler,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: effectiveHeightBehavior,
            selectionColor: selectionColor,
            showCursor: showCursor,
            autofocus: autofocus,
            contextMenuBuilder: contextMenuBuilder,
            magnifierConfiguration: magnifierConfiguration,
            onSelectionChanged: onSelectionChanged,
            selectionControls: selectionControls,
            focusNode: focusNode,
            scrollPhysics: scrollPhysics,
            cursorColor: cursorColor,
            cursorWidth: cursorWidth,
            cursorRadius: cursorRadius,
            cursorHeight: cursorHeight,
            selectionHeightStyle: selectionHeightStyle,
            selectionWidthStyle: selectionWidthStyle,
            onTap: onTap,
          )
        : material.SelectableText.rich(
            textSpan!,
            style: style,
            strutStyle: effectiveStrut,
            textAlign: textAlign,
            textDirection: textDirection,
            textScaleFactor: textScaleFactor,
            textScaler: textScaler,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: effectiveHeightBehavior,
            selectionColor: selectionColor,
            showCursor: showCursor,
            autofocus: autofocus,
            contextMenuBuilder: contextMenuBuilder,
            magnifierConfiguration: magnifierConfiguration,
            onSelectionChanged: onSelectionChanged,
            selectionControls: selectionControls,
            focusNode: focusNode,
            scrollPhysics: scrollPhysics,
            cursorColor: cursorColor,
            cursorWidth: cursorWidth,
            cursorRadius: cursorRadius,
            cursorHeight: cursorHeight,
            selectionHeightStyle: selectionHeightStyle,
            selectionWidthStyle: selectionWidthStyle,
            onTap: onTap,
          );

    return wrapBoundedTextClip(child: text, maxLines: maxLines);
  }
}
