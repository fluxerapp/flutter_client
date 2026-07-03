import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/favorites/utils/favorites_shell_navigation.dart';
import 'package:fluxer_app/features/shell/providers/drawer_reveal_sync_trigger_provider.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';

abstract final class DrawerNavigationCoordinator {
  static void prepareForNavigation(ProviderContainer container, String path) {
    final RevealSide? eager = eagerRevealSideFor(path);
    if (eager != null) {
      container.read(currentRevealSideProvider.notifier).set(eager);
      container.read(drawerRevealSyncTriggerProvider.notifier).nudge();
    }
  }

  static void syncForShellLocation(
    ProviderContainer container,
    String location,
  ) {
    container.read(currentRevealSideProvider.notifier).syncForRoute(location);
  }

  static void revealDrawer(ProviderContainer container) {
    container.read(currentRevealSideProvider.notifier).set(RevealSide.left);
    container.read(drawerRevealSyncTriggerProvider.notifier).nudge();
  }

  static void closeDrawer(ProviderContainer container) {
    container.read(currentRevealSideProvider.notifier).set(RevealSide.main);
    container.read(drawerRevealSyncTriggerProvider.notifier).nudge();
  }

  static void activateHomeTab(ProviderContainer container) {
    container.read(currentRevealSideProvider.notifier).resetForHomeTabReturn();
    container.read(fluxerRouterProvider).go(RoutePaths.me);
  }

  static void nudgeDrawerSync(ProviderContainer container) {
    container.read(drawerRevealSyncTriggerProvider.notifier).nudge();
  }

  static void navigateToContent(ProviderContainer container, String path) {
    prepareForNavigation(container, path);
    container.read(fluxerRouterProvider).go(path);
  }

  static void returnToFavoritesList(ProviderContainer container) {
    returnToFavoritesListFromContainer(container);
  }
}

void navigateToContentWithCoordinator(
  ProviderContainer container,
  String path,
) {
  DrawerNavigationCoordinator.navigateToContent(container, path);
}
