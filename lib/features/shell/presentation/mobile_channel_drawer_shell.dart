import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
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
    final bool isPanelOpen = ref.watch(expressionPanelProvider);
    final bool shouldResizeForKeyboard =
        mobileChannelScaffoldShouldResizeForKeyboard(
          isChatRoute: isOnChatRoute,
          isExpressionPanelOpen: isPanelOpen,
        );
    final Widget sidebar = mobileSidebarForLocation(context, shellLocation);
    return _MobileChannelScaffold(
      backgroundColor: isOnChatRoute
          ? context.colors.chatInputBackground
          : context.colors.backgroundPrimary,
      resizeToAvoidBottomInset: shouldResizeForKeyboard,
      sidebar: sidebar,
      bottomNav: bottomNav,
      slider: navigationShell,
    );
  }

  bool _isChatRoute(String location) {
    final RouteKind kind = classifyRoute(location);
    return kind == RouteKind.chat ||
        kind == RouteKind.guildMembers ||
        kind == RouteKind.dmCall;
  }
}

class _MobileChannelScaffold extends StatelessWidget {
  const _MobileChannelScaffold({
    required this.backgroundColor,
    required this.resizeToAvoidBottomInset,
    required this.sidebar,
    required this.bottomNav,
    required this.slider,
  });

  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;
  final Widget sidebar;
  final Widget bottomNav;
  final Widget slider;

  @override
  Widget build(BuildContext context) {
    final bool keyboardOpen = MediaQuery.viewInsetsOf(context).bottom > 0;
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SidebarDrawer(
        base: Column(
          children: <Widget>[
            Expanded(child: sidebar),
            if (!keyboardOpen) bottomNav,
          ],
        ),
        slider: RepaintBoundary(child: slider),
      ),
    );
  }
}
