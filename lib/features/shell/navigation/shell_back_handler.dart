import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_resolver.dart';
import 'package:fluxer_app/features/shell/utils/shell_popup_navigation.dart';
import 'package:material_ui/material_ui.dart';

void applyShellBackAction({
  required BuildContext context,
  required ProviderContainer container,
  required ShellBackAction action,
  VoidCallback? closeExpressionPanel,
}) {
  switch (action) {
    case ShellBackAction.popOverlay:
      popTopShellPopupRoute(context);
    case ShellBackAction.blockManualGesture:
    case ShellBackAction.noop:
      break;
    case ShellBackAction.closePanel:
      closeExpressionPanel?.call();
    case ShellBackAction.closeDrawer:
      FocusManager.instance.primaryFocus?.unfocus();
      DrawerNavigationCoordinator.closeDrawer(container);
    case ShellBackAction.revealDrawer:
      FocusManager.instance.primaryFocus?.unfocus();
      DrawerNavigationCoordinator.revealDrawer(container);
    case ShellBackAction.leaveChat:
      FocusManager.instance.primaryFocus?.unfocus();
      DrawerNavigationCoordinator.navigateToContent(container, RoutePaths.me);
  }
}
