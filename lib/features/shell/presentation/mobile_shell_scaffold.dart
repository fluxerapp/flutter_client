import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/navigation/shell_layout_mode.dart';
import 'package:fluxer_app/features/shell/presentation/desktop_shell_scaffold.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_channel_drawer_shell.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_home_utility_shell.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_main_tab_shell.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_shell_back_scope.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/utils/shell_popup_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

void _selectMobileShellBranch(
  StatefulNavigationShell navigationShell,
  int index,
) {
  popTopShellPopupRoute();
  if (index == 0 && navigationShell.currentIndex != 0) {
    navigationShell.goBranch(shellHomeBranchIndex);
    return;
  }
  navigationShell.goBranch(
    index,
    initialLocation: index == navigationShell.currentIndex,
  );
}

class MobileShellScaffold extends ConsumerWidget {
  const MobileShellScaffold({
    required this.navigationShell,
    required this.shellContent,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final Widget shellContent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The route-state providers defer their update by a frame in some
    // scheduler phases; watching one keeps this shell rebuilding, while the
    // router's live configuration is authoritative for the current frame.
    final String deferredBranchLocation = ref.watch(
      activeBranchLocationProvider,
    );
    final GoRouter router = ref.watch(fluxerRouterProvider);
    final String activeBranchLocation =
        resolveActiveBranchLocation(
          router.routerDelegate.currentConfiguration,
        ) ??
        deferredBranchLocation;
    final ShellLayoutMode mode = resolveMobileShellLayoutMode(
      navigationShellIndex: navigationShell.currentIndex,
      activeBranchLocation: activeBranchLocation,
    );
    final Widget bottomNav = mobileBottomNav(
      context: context,
      currentIndex: navigationShell.currentIndex,
      onBranchSelected: (int index) =>
          _selectMobileShellBranch(navigationShell, index),
    );
    return switch (mode) {
      ShellLayoutMode.channelDrawer => MobileChannelDrawerShell(
        shellLocation: activeBranchLocation,
        navigationShell: navigationShell,
        bottomNav: bottomNav,
      ),
      ShellLayoutMode.mainTab => MobileMainTabShell(
        navigationShell: shellContent,
        bottomNav: bottomNav,
      ),
      ShellLayoutMode.homeUtility => MobileHomeUtilityShell(
        shellLocation: activeBranchLocation,
        navigationShell: shellContent,
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
    final Widget shellContent = navigationShell;
    if (!isMobile) {
      final String shellLocation = ref.watch(shellLocationProvider);
      return Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        body: desktopShellScaffold(
          context: context,
          shellLocation: shellLocation,
          navigationShell: shellContent,
        ),
      );
    }
    return MobileShellBackScope(
      navigationShell: navigationShell,
      child: MobileShellScaffold(
        navigationShell: navigationShell,
        shellContent: shellContent,
      ),
    );
  }
}
