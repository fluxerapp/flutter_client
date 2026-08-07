import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';

bool shellBottomNavWouldBeVisible({
  required String shellLocation,
  required RevealSide revealSide,
}) {
  if (isSidebarDrawerLockedForLocation(shellLocation)) {
    return true;
  }
  return revealSide == RevealSide.left;
}

bool shouldHideShellBottomNavOverlay({
  required bool navWouldBeVisible,
  required bool keyboardOpen,
  required bool isOnChatRoute,
  required bool isExpressionPanelOpen,
}) {
  if (!navWouldBeVisible) {
    return false;
  }
  if (keyboardOpen) {
    return true;
  }
  return isOnChatRoute && isExpressionPanelOpen;
}

bool showShellBottomNav({
  required String shellLocation,
  required RevealSide revealSide,
  required bool keyboardOpen,
  required bool isOnChatRoute,
  required bool isExpressionPanelOpen,
}) {
  final bool navWouldBeVisible = shellBottomNavWouldBeVisible(
    shellLocation: shellLocation,
    revealSide: revealSide,
  );
  return !shouldHideShellBottomNavOverlay(
    navWouldBeVisible: navWouldBeVisible,
    keyboardOpen: keyboardOpen,
    isOnChatRoute: isOnChatRoute,
    isExpressionPanelOpen: isExpressionPanelOpen,
  );
}
