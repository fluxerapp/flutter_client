import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';

enum ShellLayoutMode { channelDrawer, channelsRoot, mainTab, homeUtility }

ShellLayoutMode shellLayoutModeForLocation(String location) {
  final RouteKind kind = classifyRoute(location);
  if (kind == RouteKind.chat ||
      kind == RouteKind.guildMembers ||
      kind == RouteKind.dmCall) {
    return ShellLayoutMode.channelDrawer;
  }
  if (kind == RouteKind.channelsRoot) {
    return ShellLayoutMode.channelsRoot;
  }
  if (location == '/notifications' || location == '/you') {
    return ShellLayoutMode.mainTab;
  }
  if (location == '/bookmarks' || location == '/mentions') {
    return ShellLayoutMode.homeUtility;
  }
  return ShellLayoutMode.mainTab;
}

ShellLayoutMode resolveMobileShellLayoutMode({
  required int navigationShellIndex,
  required int activeBranchIndex,
  required String activeBranchLocation,
  required String topLocation,
}) {
  final int effectiveBranchIndex = navigationShellIndex != activeBranchIndex
      ? navigationShellIndex
      : activeBranchIndex;
  if (effectiveBranchIndex == shellNotificationsBranchIndex ||
      effectiveBranchIndex == shellYouBranchIndex) {
    return ShellLayoutMode.mainTab;
  }
  if (navigationShellIndex == shellHomeBranchIndex &&
      inferShellBranchIndex(topLocation) != shellHomeBranchIndex) {
    return ShellLayoutMode.channelsRoot;
  }
  return shellLayoutModeForLocation(activeBranchLocation);
}

bool canShellUtilityEdgeSwipePop(String location) {
  return shellLayoutModeForLocation(location) == ShellLayoutMode.homeUtility;
}

String homeBranchFallbackLocation() => RoutePaths.me;
