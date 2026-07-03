import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/navigation/shell_layout_mode.dart';
import 'package:fluxer_app/features/shell/presentation/desktop_shell_scaffold.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_channel_drawer_shell.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_channels_root_shell.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_home_utility_shell.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_main_tab_shell.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_shell_back_scope.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:go_router/go_router.dart';

class MobileShellScaffold extends ConsumerWidget {
  const MobileShellScaffold({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String topLocation = ref.watch(topLocationProvider);
    final String activeBranchLocation = ref.watch(activeBranchLocationProvider);
    final int activeBranchIndex = ref.watch(activeShellBranchIndexProvider);
    final ShellLayoutMode mode = resolveMobileShellLayoutMode(
      navigationShellIndex: navigationShell.currentIndex,
      activeBranchIndex: activeBranchIndex,
      activeBranchLocation: activeBranchLocation,
      topLocation: topLocation,
    );
    final String shellLocation =
        mode == ShellLayoutMode.channelsRoot &&
            navigationShell.currentIndex == 0 &&
            activeBranchIndex != 0
        ? homeBranchFallbackLocation()
        : activeBranchLocation;
    final Widget bottomNav = mobileBottomNav(
      context: context,
      currentIndex: navigationShell.currentIndex,
      onBranchSelected: (int index) {
        if (index == 0 && navigationShell.currentIndex != 0) {
          DrawerNavigationCoordinator.activateHomeTab(ref.container);
          return;
        }
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      },
    );
    return switch (mode) {
      ShellLayoutMode.channelDrawer => MobileChannelDrawerShell(
        shellLocation: shellLocation,
        navigationShell: navigationShell,
        bottomNav: bottomNav,
      ),
      ShellLayoutMode.channelsRoot => MobileChannelsRootShell(
        shellLocation: shellLocation,
        bottomNav: bottomNav,
      ),
      ShellLayoutMode.mainTab => MobileMainTabShell(
        navigationShell: navigationShell,
        bottomNav: bottomNav,
      ),
      ShellLayoutMode.homeUtility => MobileHomeUtilityShell(
        shellLocation: shellLocation,
        navigationShell: navigationShell,
        bottomNav: bottomNav,
      ),
    };
  }
}

class AppLayoutShell extends ConsumerWidget {
  const AppLayoutShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isMobile = isMobileLayout(context);
    if (!isMobile) {
      final String shellLocation = ref.watch(shellLocationProvider);
      return Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        body: desktopShellScaffold(
          context: context,
          shellLocation: shellLocation,
          navigationShell: navigationShell,
        ),
      );
    }
    return MobileShellBackScope(
      navigationShell: navigationShell,
      child: MobileShellScaffold(navigationShell: navigationShell),
    );
  }
}
