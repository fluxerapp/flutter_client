import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';

enum ShellBackAction {
  popOverlay,
  closePanel,
  blockManualGesture,
  closeChannelDetailsDrawer,
  closeDrawer,
  revealDrawer,
  leaveChat,
  minimizePhoneVoiceCall,
  exitApp,
  noop,
}

ShellBackAction resolveShellBackAction({
  required bool hasPopupOverlay,
  required bool hasManualGestureBlock,
  required bool hasExpressionPanelOpen,
  required bool hasChannelDetailsDrawerOpen,
  required RevealSide revealSide,
  required String shellLocation,
  bool minimizePhoneVoiceCall = false,
  bool isSystemBack = false,
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
  if (hasChannelDetailsDrawerOpen) {
    return ShellBackAction.closeChannelDetailsDrawer;
  }
  if (minimizePhoneVoiceCall) {
    return ShellBackAction.minimizePhoneVoiceCall;
  }
  if (isSidebarDrawerLockedForLocation(shellLocation)) {
    return isSystemBack ? ShellBackAction.exitApp : ShellBackAction.noop;
  }
  if (revealSide == RevealSide.left) {
    if (classifyRoute(shellLocation) == RouteKind.chat) {
      return ShellBackAction.leaveChat;
    }
    return ShellBackAction.closeDrawer;
  }
  return ShellBackAction.revealDrawer;
}
