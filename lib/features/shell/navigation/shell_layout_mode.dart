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

/// Resolves the mobile shell layout for the current frame.
///
/// Driven by [navigationShellIndex] and the branch's own location — never by a
/// branch index inferred from the top location — so a deferred route-state
/// update cannot pick the layout of a branch that is no longer active.
///
/// Every mode mounts the `StatefulNavigationShell`. A shell-less layout would
/// dispose go_router's saved per-branch route stacks, so returning to Home
/// would fall back to the branch default instead of the last community
/// (issue #463).
ShellLayoutMode resolveMobileShellLayoutMode({
  required int navigationShellIndex,
  required String activeBranchLocation,
}) {
  if (navigationShellIndex == shellNotificationsBranchIndex ||
      navigationShellIndex == shellYouBranchIndex) {
    return ShellLayoutMode.mainTab;
  }
  final ShellLayoutMode mode = shellLayoutModeForLocation(activeBranchLocation);
  // Home branch: a location belonging to another branch can only be a stale
  // read, and the home branch never renders the tab layout.
  return mode == ShellLayoutMode.mainTab ? ShellLayoutMode.channelDrawer : mode;
}

bool canShellUtilityEdgeSwipePop(String location) {
  return shellLayoutModeForLocation(location) == ShellLayoutMode.homeUtility;
}
