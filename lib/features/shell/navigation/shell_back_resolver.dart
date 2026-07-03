import 'package:fluxer_app/features/favorites/utils/favorites_shell_navigation.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';

enum ShellBackAction {
  popOverlay,
  closePanel,
  blockManualGesture,
  closeDrawer,
  revealDrawer,
  returnToFavorites,
  noop,
}

ShellBackAction resolveShellBackAction({
  required bool hasPopupOverlay,
  required bool hasManualGestureBlock,
  required bool hasExpressionPanelOpen,
  required RevealSide revealSide,
  required String shellLocation,
}) {
  if (hasPopupOverlay) {
    return ShellBackAction.popOverlay;
  }
  if (hasManualGestureBlock) {
    return ShellBackAction.blockManualGesture;
  }
  if (hasExpressionPanelOpen) {
    return ShellBackAction.closePanel;
  }
  if (revealSide == RevealSide.left) {
    return ShellBackAction.closeDrawer;
  }
  if (isFavoritesChannelRoute(shellLocation)) {
    return ShellBackAction.returnToFavorites;
  }
  return ShellBackAction.revealDrawer;
}
