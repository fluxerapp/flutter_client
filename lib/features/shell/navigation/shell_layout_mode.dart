import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';

enum ShellLayoutMode { channelDrawer, mainTab, homeUtility }

ShellLayoutMode shellLayoutModeForLocation(String location) {
  final RouteKind kind = classifyRoute(location);
  if (kind == RouteKind.chat ||
      kind == RouteKind.guildMembers ||
      kind == RouteKind.dmCall ||
      kind == RouteKind.channelsRoot) {
    return ShellLayoutMode.channelDrawer;
  }
  if (location == '/bookmarks' || location == '/mentions') {
    return ShellLayoutMode.homeUtility;
  }
  return ShellLayoutMode.mainTab;
}

// Every layout mounts the nav shell so Home keeps its branch stack: https://feedback.fluxer.com/p/1852
ShellLayoutMode resolveMobileShellLayoutMode({
  required int navigationShellIndex,
  required String activeBranchLocation,
}) {
  if (navigationShellIndex == shellNotificationsBranchIndex ||
      navigationShellIndex == shellYouBranchIndex) {
    return ShellLayoutMode.mainTab;
  }
  final ShellLayoutMode mode = shellLayoutModeForLocation(activeBranchLocation);
  return mode == ShellLayoutMode.mainTab ? ShellLayoutMode.channelDrawer : mode;
}
