part of 'guild_sidebar.dart';

const double kGuildSidebarHeaderMinHeight = 56;
const double kGuildSidebarHeaderTopInset = 14;

const double kGuildSidebarScrollIndicatorTopInset =
    kGuildSidebarHeaderMinHeight + 8;

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

double guildSidebarBannerCollapseRatio({
  required double scrollOffset,
  required double fullBannerHeight,
}) {
  final double collapseDistance =
      fullBannerHeight - kGuildSidebarHeaderMinHeight;
  if (collapseDistance <= 0) {
    return 1;
  }
  return (scrollOffset / collapseDistance).clamp(0.0, 1.0);
}

double guildSidebarBannerHeightForCollapse({
  required double fullBannerHeight,
  required double collapseRatio,
}) {
  return fullBannerHeight -
      (fullBannerHeight - kGuildSidebarHeaderMinHeight) * collapseRatio;
}
