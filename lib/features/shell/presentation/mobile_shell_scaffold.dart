import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/hosted_ui/adaptive_shell_tab_bar.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/features/shell/navigation/shell_branch_navigation.dart';
import 'package:fluxer_app/features/shell/navigation/shell_layout_mode.dart';
import 'package:fluxer_app/features/shell/presentation/desktop_shell_scaffold.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_channel_drawer_shell.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_chat_back_scope.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_home_utility_shell.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_main_tab_shell.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_shell_back_scope.dart';
import 'package:fluxer_app/features/shell/presentation/pinned_shell_scaffold.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_badge.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

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
      onBranchSelected: (int index) => handleMobileShellBranchSelection(
        context: context,
        ref: ref,
        navigationShell: navigationShell,
        index: index,
      ),
    );
    final bool pinned = isPinnedSidebarLayout(context);
    return FluxerEntranceSettleScope(
      key: ValueKey<ShellLayoutMode>(mode),
      child: switch (mode) {
        ShellLayoutMode.channelDrawer when pinned => PinnedMobileShellScaffold(
          mode: mode,
          navigationShell: navigationShell,
          shellContent: shellContent,
          bottomNav: bottomNav,
        ),
        ShellLayoutMode.channelDrawer => MobileChannelDrawerShell(
          shellLocation: activeBranchLocation,
          navigationShell: navigationShell,
          bottomNav: bottomNav,
        ),
        ShellLayoutMode.mainTab when pinned => PinnedMobileShellScaffold(
          mode: mode,
          navigationShell: navigationShell,
          shellContent: shellContent,
          bottomNav: bottomNav,
        ),
        ShellLayoutMode.homeUtility when pinned => PinnedMobileShellScaffold(
          mode: mode,
          navigationShell: navigationShell,
          shellContent: shellContent,
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
      },
    );
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
      return WideShellBackScope(
        child: WideShellScaffold(
          shellLocation: shellLocation,
          navigationShell: shellContent,
        ),
      );
    }
    final Widget shell = MobileShellBackScope(
      navigationShell: navigationShell,
      child: MobileShellScaffold(
        navigationShell: navigationShell,
        shellContent: shellContent,
      ),
    );
    if (!PlatformInfo.isIOS26OrHigher()) {
      return shell;
    }
    return AdaptiveScaffold(
      backgroundColor: context.colors.backgroundPrimary,
      tabBarHidden: !usesIphoneDuoHostedUi(context),
      bottomNavigationBar: usesIphoneDuoHostedUi(context)
          ? adaptiveShellTabBar(
              context: context,
              ref: ref,
              selectedIndex: navigationShell.currentIndex,
              onTap: (int index) => handleMobileShellBranchSelection(
                context: context,
                ref: ref,
                navigationShell: navigationShell,
                index: index,
              ),
            )
          : null,
      body: shell,
    );
  }
}
