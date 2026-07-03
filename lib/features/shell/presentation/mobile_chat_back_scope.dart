import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/favorites/utils/favorites_shell_navigation.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_resolver.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_manual_gesture_block_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:fluxer_app/features/shell/utils/shell_popup_navigation.dart';

class MobileChatBackScope extends ConsumerWidget {
  final Widget child;

  const MobileChatBackScope({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isMobileLayout(context)) {
      return child;
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) {
        if (didPop) {
          return;
        }
        final ShellBackAction action = resolveShellBackAction(
          hasPopupOverlay: ref.read(shellHasPopupOverlayProvider),
          hasManualGestureBlock: ref.read(shellManualGestureBlockProvider),
          hasExpressionPanelOpen: ref.read(expressionPanelProvider),
          revealSide: ref.read(currentRevealSideProvider),
          shellLocation: ref.read(shellLocationProvider),
        );
        switch (action) {
          case ShellBackAction.popOverlay:
            popTopShellPopupRoute(context);
          case ShellBackAction.blockManualGesture:
            break;
          case ShellBackAction.closePanel:
            ref.read(expressionPanelProvider.notifier).close();
          case ShellBackAction.closeDrawer:
            FocusManager.instance.primaryFocus?.unfocus();
            DrawerNavigationCoordinator.closeDrawer(ref.container);
          case ShellBackAction.noop:
            break;
          case ShellBackAction.returnToFavorites:
            FocusManager.instance.primaryFocus?.unfocus();
            returnToFavoritesList(ref);
          case ShellBackAction.revealDrawer:
            FocusManager.instance.primaryFocus?.unfocus();
            DrawerNavigationCoordinator.revealDrawer(ref.container);
        }
      },
      child: child,
    );
  }
}
