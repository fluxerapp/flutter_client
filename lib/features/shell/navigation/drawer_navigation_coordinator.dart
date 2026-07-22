import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/favorites/utils/favorites_shell_navigation.dart';
import 'package:fluxer_app/features/shell/providers/drawer_reveal_sync_trigger_provider.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';

class DrawerNavigationCoordinator {
  const DrawerNavigationCoordinator._();
  static void prepareForNavigation(ProviderContainer container, String path) {
    final RevealSide? eager = eagerRevealSideFor(path);
    if (eager != null) {
      talker.debug(
        '[DrawerNavigation] prepareForNavigation path=$path eager=$eager',
      );
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

  static void nudgeDrawerSync(ProviderContainer container) {
    container.read(drawerRevealSyncTriggerProvider.notifier).nudge();
  }

  static void navigateToContent(ProviderContainer container, String path) {
    talker.debug('[DrawerNavigation] navigateToContent path=$path');
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
