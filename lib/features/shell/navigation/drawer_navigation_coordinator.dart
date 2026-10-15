import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
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

  static int _selectGuildGeneration = 0;

  static Future<void> selectGuild(
    ProviderContainer container,
    String guildId,
  ) async {
    talker.debug('[DrawerNavigation] selectGuild guildId=$guildId');
    final int generation = ++_selectGuildGeneration;
    try {
      await primeGuildChannelUnreads(container, guildId);
    } on Object catch (error, stackTrace) {
      talker.error('[DrawerNavigation] unread prime failed', error, stackTrace);
    }
    if (generation != _selectGuildGeneration) {
      return;
    }
    container
        .read(channelListViewModelProvider.notifier)
        .loadActiveGuild(guildId);
    revealDrawer(container);
    container.read(fluxerRouterProvider).go(RoutePaths.guild(guildId));
  }

  static void openGuildChannelList(
    ProviderContainer container,
    String guildId,
  ) {
    talker.debug('[DrawerNavigation] openGuildChannelList guildId=$guildId');
    container
        .read(channelListViewModelProvider.notifier)
        .loadActiveGuild(guildId);
    revealDrawer(container);
    container
        .read(fluxerRouterProvider)
        .go(
          RoutePaths.guildChannelList(guildId),
          extra: kGuildRootStayOnListExtra,
        );
  }

  static void leaveDeletedChannel(
    ProviderContainer container,
    String channelId,
  ) {
    final String? path = deletedChannelExitPath(
      location: container.read(routeStateProvider).effectiveShellLocation,
      channelId: channelId,
    );
    if (path == null) {
      return;
    }
    talker.debug(
      '[DrawerNavigation] leaveDeletedChannel channelId=$channelId path=$path',
    );
    revealDrawer(container);
    container.read(fluxerRouterProvider).go(path);
  }

  static void leaveDeletedGuild(ProviderContainer container, String guildId) {
    container.read(channelListViewModelProvider.notifier).forgetGuild(guildId);
    final String location = container
        .read(routeStateProvider)
        .effectiveShellLocation;
    if (extractGuildId(location) != guildId) {
      return;
    }
    talker.debug('[DrawerNavigation] leaveDeletedGuild guildId=$guildId');
    revealDrawer(container);
    container.read(fluxerRouterProvider).go(RoutePaths.me);
  }

  static void selectFavorites(ProviderContainer container) {
    talker.debug('[DrawerNavigation] selectFavorites');
    revealDrawer(container);
    container.read(fluxerRouterProvider).go(RoutePaths.favoritesBase);
  }
}
