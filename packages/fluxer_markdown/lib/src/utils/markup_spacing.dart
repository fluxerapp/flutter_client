/// Web Markup.module.css spacing at a 16px root font size.
// ignore: avoid_classes_with_only_static_members
abstract final class FluxerMarkupSpacing {
  static const double rootFontSize = 16;

  static double rem(double value) => value * rootFontSize;

  static const double paragraphBottom = 12; // 0.75rem
  static const double headingTop = 20; // 1.25rem
  static const double headingTopFirst = 4; // 0.25rem
  static const double headingBottom = 12; // 0.75rem
  static const double headingLineHeight = 1.2;

  static const double listBlockMargin = 4; // 0.25rem
  static const double listItemGap = 4; // 0.25rem
  static const double listNestedTop = 4; // 0.25rem
  static const double listIndent = 20; // 1.25rem

  static const double quoteMargin = 4; // 0.25rem
  static const double quoteDividerEnd = 12; // 0.75rem

  static const double codePadding = 14; // 0.875rem
  static const double codeBottom = 12; // 0.75rem

  static const double blockGap = 12; // 0.75rem
}
