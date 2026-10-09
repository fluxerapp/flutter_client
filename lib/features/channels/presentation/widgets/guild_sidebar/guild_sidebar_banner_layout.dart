part of 'guild_sidebar.dart';

const double kGuildSidebarHeaderMinHeight = 56;
const double kGuildSidebarHeaderTopInset = 14;

const double kGuildSidebarScrollIndicatorTopInset =
    kGuildSidebarHeaderMinHeight + 8;

@visibleForTesting
double guildSidebarBannerLayoutWidth(
  BuildContext context,
  BoxConstraints constraints,
) {
  if (constraints.hasBoundedWidth && constraints.maxWidth > 0) {
    return constraints.maxWidth;
  }
  final layout = context.layout;
  if (isMobileLayout(context)) {
    return math.max(
      layout.sidebarWidth,
      MediaQuery.sizeOf(context).width - layout.guildListWidth,
    );
  }
  return layout.sidebarWidth;
}

@visibleForTesting
double guildSidebarBannerHeight({
  required double width,
  required double viewportHeight,
  double aspectRatio = Breakpoints.guildBannerAspectRatio,
}) {
  if (width <= 0) {
    return 0;
  }
  final double idealHeight = width / aspectRatio;
  final double viewportCap =
      viewportHeight * Breakpoints.guildBannerMaxViewportHeightFraction;
  return math.max(
    kGuildSidebarHeaderMinHeight,
    math.min(idealHeight, viewportCap),
  );
}
