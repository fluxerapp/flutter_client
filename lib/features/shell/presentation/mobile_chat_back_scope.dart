import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/favorites/utils/favorites_shell_navigation.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/drawer_reveal_sync_trigger_provider.dart';
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
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          return;
        }
        if (ref.read(shellHasPopupOverlayProvider)) {
          popTopShellPopupRoute(context);
          return;
        }
        // Recording overlay is not a popup route; still consume back here.
        if (ref.read(shellManualGestureBlockProvider)) {
          return;
        }
        if (ref.read(expressionPanelProvider)) {
          ref.read(expressionPanelProvider.notifier).close();
          return;
        }
        // Reading inside the callback (instead of `ref.watch` in build)
        // avoids rebuilding the wrapped chat subtree every time the
        // drawer side flips. Drawer animation is driven by SidebarDrawer.
        if (ref.read(currentRevealSideProvider) != RevealSide.main) {
          return;
        }
        FocusManager.instance.primaryFocus?.unfocus();
        final String location = ref.read(currentLocationProvider);
        if (isFavoritesChannelRoute(location)) {
          returnToFavoritesList(ref);
          return;
        }
        ref.read(currentRevealSideProvider.notifier).set(RevealSide.left);
        ref.read(drawerRevealSyncTriggerProvider.notifier).nudge();
      },
      child: child,
    );
  }
}
