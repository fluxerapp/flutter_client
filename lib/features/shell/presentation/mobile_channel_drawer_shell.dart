import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/shell/presentation/desktop_shell_scaffold.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/utils/mobile_scaffold_resize_policy.dart';

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
    final bool hideBottomNav = keyboardOpen || isExpressionPanelOpen;
    final Widget sidebar = mobileSidebarForLocation(context, shellLocation);
    return Scaffold(
      backgroundColor: isOnChatRoute
          ? context.colors.chatInputBackground
          : context.colors.backgroundPrimary,
      resizeToAvoidBottomInset: shouldResizeForKeyboard,
      body: SidebarDrawer(
        base: Column(
          children: <Widget>[
            Expanded(child: sidebar),
            if (!hideBottomNav) bottomNav,
          ],
        ),
        slider: RepaintBoundary(child: navigationShell),
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
