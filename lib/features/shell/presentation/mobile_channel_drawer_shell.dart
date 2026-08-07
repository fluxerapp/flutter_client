import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/shell/presentation/animated_shell_bottom_nav.dart';
import 'package:fluxer_app/features/shell/presentation/desktop_shell_scaffold.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/utils/mobile_scaffold_resize_policy.dart';
import 'package:fluxer_app/features/shell/utils/shell_bottom_nav_visibility.dart';

class MobileChannelDrawerShell extends ConsumerWidget {
  const MobileChannelDrawerShell({
    required this.shellLocation,
    required this.navigationShell,
    required this.bottomNav,
    super.key,
  });

  final String shellLocation;
  final Widget navigationShell;
  final Widget bottomNav;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isOnChatRoute = _isChatRoute(shellLocation);
    final bool shouldResizeForKeyboard =
        mobileChannelScaffoldShouldResizeForKeyboard(
          isChatRoute: isOnChatRoute,
          isExpressionPanelOpen: false,
        );
    final bool keyboardOpen = ref.watch(
      mobileKeyboardMetricsProvider.select(
        (metrics) => metrics.liveKeyboardHeight > 0,
      ),
    );
    final bool isExpressionPanelOpen = ref.watch(expressionPanelProvider);
    final RevealSide revealSide = ref.watch(currentRevealSideProvider);
    final bool showBottomNav = showShellBottomNav(
      shellLocation: shellLocation,
      revealSide: revealSide,
      keyboardOpen: keyboardOpen,
      isOnChatRoute: isOnChatRoute,
      isExpressionPanelOpen: isExpressionPanelOpen,
    );
    final bool compactWide = isCompactWideMobileLayout(context);
    final bool drawerLocked = isSidebarDrawerLockedForLocation(shellLocation);
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double peekWidth = math.min(
      mobileDrawerPeekWidth(context),
      screenWidth,
    );
    final bool peekNav = compactWide && !drawerLocked;
    final double peekContentInset = peekNav
        ? math.max(0, screenWidth - peekWidth)
        : 0;
    final Widget sidebar = mobileSidebarForLocation(
      context,
      shellLocation,
      peekContentInset: peekContentInset,
    );
    final Widget nav = peekNav
        ? Align(
            alignment: AlignmentDirectional.centerStart,
            child: SizedBox(
              width: peekWidth,
              child: AnimatedShellBottomNav(
                visible: showBottomNav,
                child: bottomNav,
              ),
            ),
          )
        : AnimatedShellBottomNav(visible: showBottomNav, child: bottomNav);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) {
        if (didPop || !drawerLocked) {
          return;
        }
      },
      child: Scaffold(
        backgroundColor: isOnChatRoute
            ? context.colors.chatInputBackground
            : context.colors.backgroundPrimary,
        resizeToAvoidBottomInset: shouldResizeForKeyboard,
        body: SidebarDrawer(
          base: Column(
            children: <Widget>[
              Expanded(child: sidebar),
              nav,
            ],
          ),
          slider: navigationShell,
        ),
      ),
    );
  }

  bool _isChatRoute(String location) {
    final RouteKind kind = classifyRoute(location);
    return kind == RouteKind.chat ||
        kind == RouteKind.guildMembers ||
        kind == RouteKind.dmCall;
  }
}
