import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/core/router/shell_popup_overlay_sync.dart';
import 'package:fluxer_app/material_ui.dart';

/// Pops the top [PopupRoute] on the nearest navigator, then the root navigator,
/// then shell branch navigators.
bool popTopShellPopupRoute([BuildContext? context]) {
  if (context != null) {
    final NavigatorState branchNavigator = Navigator.of(context);
    if (popPopupRouteIfPresent(branchNavigator)) {
      return true;
    }
    final NavigatorState? rootNavigator = Navigator.maybeOf(
      context,
      rootNavigator: true,
    );
    if (rootNavigator != null &&
        rootNavigator != branchNavigator &&
        popPopupRouteIfPresent(rootNavigator)) {
      return true;
    }
  }
  if (popPopupRouteIfPresent(shellTabOverlayNavigatorKey.currentState)) {
    return true;
  }
  for (final GlobalKey<NavigatorState> key in shellBranchNavigatorKeys) {
    if (popPopupRouteIfPresent(key.currentState)) {
      return true;
    }
  }
  return popPopupRouteIfPresent(rootNavigatorKey.currentState);
}

/// Pops only when the navigator's top route is a [PopupRoute].
bool popPopupRouteIfPresent(NavigatorState? navigator) {
  if (!navigatorHasPopupOverlay(navigator)) {
    return false;
  }
  navigator!.pop();
  return true;
}
