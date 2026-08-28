import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';

enum ShellBackAction {
  popOverlay,
  closePanel,
  blockManualGesture,
  closeDrawer,
  revealDrawer,
  leaveChat,
  minimizePhoneVoiceCall,
  noop,
}

ShellBackAction resolveShellBackAction({
  required bool hasPopupOverlay,
  required bool hasManualGestureBlock,
  required bool hasExpressionPanelOpen,
  required RevealSide revealSide,
  required String shellLocation,
  bool minimizePhoneVoiceCall = false,
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
  if (minimizePhoneVoiceCall) {
    return ShellBackAction.minimizePhoneVoiceCall;
  }
  if (isSidebarDrawerLockedForLocation(shellLocation)) {
    return ShellBackAction.noop;
  }
  if (revealSide == RevealSide.left) {
    if (classifyRoute(shellLocation) == RouteKind.chat) {
      return ShellBackAction.leaveChat;
    }
    return ShellBackAction.closeDrawer;
  }
  return ShellBackAction.revealDrawer;
}
