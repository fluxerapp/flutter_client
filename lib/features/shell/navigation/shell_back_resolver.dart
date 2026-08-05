import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';

enum ShellBackAction {
  popOverlay,
  closePanel,
  blockManualGesture,
  closeDrawer,
  revealDrawer,
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
  if (isSidebarDrawerLockedForLocation(shellLocation)) {
    return ShellBackAction.noop;
  }
  if (revealSide == RevealSide.left) {
    return ShellBackAction.closeDrawer;
  }
  return ShellBackAction.revealDrawer;
}
