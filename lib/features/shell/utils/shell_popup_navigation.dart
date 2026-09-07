import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/core/router/shell_popup_overlay_sync.dart';
import 'package:fluxer_app/material_ui.dart';

/// Pops sheets, settings pages, and other imperative overlay routes so the
/// shell and voice call is visible
void popShellCoveringPages() {
  _popImperativeOverlays(shellTabOverlayNavigatorKey.currentState);
  for (final GlobalKey<NavigatorState> key in shellBranchNavigatorKeys) {
    _popImperativeOverlays(key.currentState);
  }
  _popImperativeOverlays(rootNavigatorKey.currentState);
}

void _popImperativeOverlays(NavigatorState? navigator) {
  while (navigator != null &&
      navigator.mounted &&
      navigator.canPop() &&
      _topRouteIsImperativeOverlay(navigator)) {
    navigator.pop();
  }
}

bool _topRouteIsImperativeOverlay(NavigatorState navigator) {
  final Route<dynamic>? top = _navigatorTopRoute(navigator);
  return top != null && routeIsImperativeOverlay(top);
}

Route<dynamic>? _navigatorTopRoute(NavigatorState navigator) {
  Route<dynamic>? top;
  navigator.popUntil((Route<dynamic> route) {
    top = route;
    return true;
  });
  return top;
}

/// Popup routes and [Navigator.push] pages
@visibleForTesting
bool routeIsImperativeOverlay(Route<dynamic> route) {
  if (route.isFirst) {
    return false;
  }
  if (route is PopupRoute) {
    return true;
  }
  return route.settings is! Page<dynamic>;
}

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
