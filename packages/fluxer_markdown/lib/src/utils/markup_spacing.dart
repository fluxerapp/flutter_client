/// Web Markup.module.css spacing at a 16px root font size.
// ignore: avoid_classes_with_only_static_members
abstract final class FluxerMarkupSpacing {
  static const double rootFontSize = 16;

  static double rem(double value) => value * rootFontSize;

  static const double paragraphBottom = 12;
  static const double headingTop = 20;
  static const double headingTopFirst = 4;
  static const double headingBottom = 12;
  static const double headingLineHeight = 1.2;

  static const double listBlockMargin = 4;
  static const double listItemGap = 4;
  static const double listNestedTop = 4;

  static const double quoteMargin = 4;
  static const double quoteDividerEnd = 12;

  static const double codePadding = 14;

  static const double blockGap = 12;
}
