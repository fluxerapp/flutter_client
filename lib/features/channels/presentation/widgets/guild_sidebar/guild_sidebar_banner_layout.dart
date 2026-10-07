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
