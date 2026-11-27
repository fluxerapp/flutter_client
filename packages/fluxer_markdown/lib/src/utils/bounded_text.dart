import 'package:flutter/rendering.dart' show SelectionRegistrar;
import 'package:material_ui/material_ui.dart';

const TextHeightBehavior fluxerBoundedTextHeightBehavior = TextHeightBehavior(
  leadingDistribution: TextLeadingDistribution.even,
);

const double kFluxerBoundedTextDefaultHeight = 1.25;

StrutStyle boundedStrutFor(TextStyle style, {bool forceHeight = true}) {
  return StrutStyle.fromTextStyle(
    style,
    forceStrutHeight: forceHeight,
    height: style.height ?? kFluxerBoundedTextDefaultHeight,
  );
}

bool shouldApplyBoundedTextMetrics({int? maxLines}) => maxLines != null;

bool inlineSpanHasWidget(InlineSpan span) {
  if (span is WidgetSpan) {
    return true;
  }
  if (span is TextSpan) {
    for (final InlineSpan child in span.children ?? const <InlineSpan>[]) {
      if (inlineSpanHasWidget(child)) {
        return true;
      }
    }
  }
  return false;
}

class FluxerLineBoundedWidgetSpan extends WidgetSpan {
  const FluxerLineBoundedWidgetSpan({required super.child})
    : super(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
      );
}

bool inlineSpanHasUnboundedWidget(InlineSpan span) {
  if (span is WidgetSpan) {
    return span is! FluxerLineBoundedWidgetSpan;
  }
  if (span is TextSpan) {
    for (final InlineSpan child in span.children ?? const <InlineSpan>[]) {
      if (inlineSpanHasUnboundedWidget(child)) {
        return true;
      }
    }
  }
  return false;
}

class FluxerBoundedTextClip extends StatelessWidget {
  const FluxerBoundedTextClip({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: const _VerticalTextClipper(),
      child: _registerForSelection(context, child),
    );
  }
}

Widget _registerForSelection(BuildContext context, Widget child) {
  if (child is! RichText || child.selectionRegistrar != null) {
    return child;
  }
  final SelectionRegistrar? registrar = SelectionContainer.maybeOf(context);
  if (registrar == null) {
    return child;
  }
  return RichText(
    key: child.key,
    text: child.text,
    textAlign: child.textAlign,
    textDirection: child.textDirection,
    softWrap: child.softWrap,
    overflow: child.overflow,
    textScaler: child.textScaler,
    maxLines: child.maxLines,
    locale: child.locale,
    strutStyle: child.strutStyle,
    textWidthBasis: child.textWidthBasis,
    textHeightBehavior: child.textHeightBehavior,
    selectionRegistrar: registrar,
    selectionColor:
        child.selectionColor ??
        DefaultSelectionStyle.of(context).selectionColor ??
        DefaultSelectionStyle.defaultColor,
  );
}

/// Clips stacked combining marks above and below the text box but lets glyphs
/// overhang sideways, so the last italic letter of a line is not cut off.
class _VerticalTextClipper extends CustomClipper<Rect> {
  const _VerticalTextClipper();

  @override
  Rect getClip(Size size) {
    // A glyph's overhang is smaller than its line height, and the box is at
    // least one line tall.
    final double overhang = size.height;
    return Rect.fromLTRB(-overhang, 0, size.width + overhang, size.height);
  }

  @override
  bool shouldReclip(_VerticalTextClipper oldClipper) => false;
}

Widget wrapBoundedTextClip({required Widget child, int? maxLines}) {
  if (!shouldApplyBoundedTextMetrics(maxLines: maxLines)) {
    return child;
  }
  return FluxerBoundedTextClip(child: child);
}

Widget buildFluxerBoundedRichText({
  required InlineSpan text,
  required TextStyle baseStyle,
  TextScaler? textScaler,
  int? maxLines,
  TextOverflow? overflow,
  TextWidthBasis? textWidthBasis,
  TextAlign textAlign = TextAlign.start,
  TextDirection? textDirection,
  bool softWrap = true,
}) {
  final bool forceLineHeight = inlineSpanHasWidget(text)
      ? !inlineSpanHasUnboundedWidget(text)
      : maxLines != null;
  return FluxerBoundedTextClip(
    child: RichText(
      text: text,
      strutStyle: boundedStrutFor(baseStyle, forceHeight: forceLineHeight),
      textHeightBehavior: fluxerBoundedTextHeightBehavior,
      textScaler: textScaler ?? TextScaler.noScaling,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
    ),
  );
}
