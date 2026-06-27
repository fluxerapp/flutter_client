import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';

/// Whether [navigator]'s top route is a [PopupRoute].
bool navigatorHasPopupOverlay(NavigatorState? navigator) {
  return _navigatorShowsPopupOverlay(navigator);
}

/// Test-visible alias for [navigatorHasPopupOverlay].
@visibleForTesting
bool navigatorShowsPopupOverlay(NavigatorState? navigator) {
  return _navigatorShowsPopupOverlay(navigator);
}

bool _navigatorShowsPopupOverlay(NavigatorState? navigator) {
  if (navigator == null || !navigator.mounted || !navigator.canPop()) {
    return false;
  }
  bool hasPopup = false;
  navigator.popUntil((Route<dynamic> route) {
    hasPopup = route is PopupRoute;
    return true;
  });
  return hasPopup;
}

/// Scans shell branch and root navigators for any visible popup overlay
bool shellNavigatorsHavePopupOverlay() {
  for (final GlobalKey<NavigatorState> key in shellBranchNavigatorKeys) {
    if (navigatorShowsPopupOverlay(key.currentState)) {
      return true;
    }
  }
  return navigatorShowsPopupOverlay(rootNavigatorKey.currentState);
}

/// Rereads navigator stacks and updates [shellHasPopupOverlayProvider]
void reconcileShellPopupOverlay(Ref ref) {
  reconcileShellPopupOverlayForContainer(ref.container);
}

/// Same as [reconcileShellPopupOverlay] for call sites that only have a
/// [ProviderContainer] (e.g. after a modal future completes).
void reconcileShellPopupOverlayForContainer(ProviderContainer container) {
  container
      .read(shellHasPopupOverlayProvider.notifier)
      .setHasOverlay(value: shellNavigatorsHavePopupOverlay());
}
