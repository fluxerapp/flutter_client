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
    return ClipRect(child: child);
  }
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
