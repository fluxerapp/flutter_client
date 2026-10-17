import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_drawer_provider.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_resolver.dart';
import 'package:fluxer_app/features/shell/navigation/shell_chat_leave_path.dart';
import 'package:fluxer_app/features/shell/utils/shell_popup_navigation.dart';
import 'package:fluxer_app/features/voice/utils/voice_session_navigation.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

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
    case ShellBackAction.closeChannelDetailsDrawer:
      container.read(channelDetailsDrawerProvider.notifier).close();
    case ShellBackAction.closeDrawer:
      FocusManager.instance.primaryFocus?.unfocus();
      DrawerNavigationCoordinator.closeDrawer(container);
    case ShellBackAction.revealDrawer:
      FocusManager.instance.primaryFocus?.unfocus();
      DrawerNavigationCoordinator.revealDrawer(container);
    case ShellBackAction.leaveChat:
      FocusManager.instance.primaryFocus?.unfocus();
      _leaveChat(context: context, container: container);
    case ShellBackAction.minimizePhoneVoiceCall:
      FocusManager.instance.primaryFocus?.unfocus();
      minimizePhoneVoiceCall(context: context, container: container);
    case ShellBackAction.exitApp:
      FocusManager.instance.primaryFocus?.unfocus();
      unawaited(SystemNavigator.pop());
  }
}

void _leaveChat({
  required BuildContext context,
  required ProviderContainer container,
}) {
  final String shellLocation = container.read(shellLocationProvider);
  final String path = shellChatLeavePath(container, shellLocation);
  if (path == RoutePaths.me && context.canPop()) {
    context.pop();
    return;
  }
  DrawerNavigationCoordinator.navigateToContent(container, path);
}
