import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:fluxer_app/features/quick_switcher/domain/recent_channel_visit.dart';
import 'package:fluxer_app/features/quick_switcher/providers/recent_channel_visits_provider.dart';
import 'package:fluxer_app/features/settings/providers/local_settings_provider.dart';
import 'package:fluxer_app/features/shell/providers/drawer_reveal_sync_trigger_provider.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';

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
    if (container.read(handheldVoiceImmersiveProvider)) {
      return;
    }
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
    final bool switchingGuild =
        container.read(activeGuildIdProvider) != guildId;
    final bool openLastChannel = container
        .read(localSettingsProvider)
        .openCommunitiesToLastChannel;
    container
        .read(channelListViewModelProvider.notifier)
        .loadActiveGuild(guildId);
    final Future<String?> lastChannelPath = switchingGuild && openLastChannel
        ? _lastChannelPathToOpen(container, guildId)
        : Future<String?>.value();
    if (switchingGuild && !openLastChannel) {
      revealDrawer(container);
      container.read(fluxerRouterProvider).go(RoutePaths.guild(guildId));
    }
    try {
      await primeGuildChannelUnreads(container, guildId);
    } on Object catch (error, stackTrace) {
      talker.error('[DrawerNavigation] unread prime failed', error, stackTrace);
    }
    if (generation != _selectGuildGeneration) {
      return;
    }
    final String? chatPath = await lastChannelPath;
    if (generation != _selectGuildGeneration) {
      return;
    }
    if (chatPath != null) {
      navigateToContent(container, chatPath);
      return;
    }
    if (switchingGuild) {
      revealDrawer(container);
      container.read(fluxerRouterProvider).go(RoutePaths.guild(guildId));
      return;
    }
    revealDrawer(container);
    container.read(fluxerRouterProvider).go(RoutePaths.guild(guildId));
  }

  static Future<String?> _lastChannelPathToOpen(
    ProviderContainer container,
    String guildId,
  ) async {
    if (!container.read(localSettingsProvider).openCommunitiesToLastChannel ||
        container.read(activeGuildIdProvider) == guildId) {
      return null;
    }
    final String? path = await resolveGuildRootRedirect(
      guildId: guildId,
      fullPath: RoutePaths.guild(guildId),
      db: container.read(fluxerDatabaseProvider),
      currentUserId: container.read(currentUserIdProvider),
      trackedUnavailableGuildIds: container.read(guildAvailabilityProvider),
    );
    if (path == null || classifyRoute(path) != RouteKind.chat) {
      return null;
    }
    return path;
  }

  static Future<void> openGuildChatAfterMinimizeVoice(
    ProviderContainer container,
    String guildId, {
    String? excludeVoiceChannelId,
  }) async {
    talker.debug(
      '[DrawerNavigation] openGuildChatAfterMinimizeVoice guildId=$guildId',
    );
    container
        .read(channelListViewModelProvider.notifier)
        .loadActiveGuild(guildId);
    final List<String> recentChannelIdsInGuild = container
        .read(recentChannelVisitsProvider)
        .where((RecentChannelVisit visit) => visit.guildId == guildId)
        .map((RecentChannelVisit visit) => visit.channelId)
        .toList(growable: false);
    final String? chatPath = await resolveGuildMinimizeVoiceRedirect(
      guildId: guildId,
      db: container.read(fluxerDatabaseProvider),
      currentUserId: container.read(currentUserIdProvider),
      excludeChannelId: excludeVoiceChannelId,
      trackedUnavailableGuildIds: container.read(guildAvailabilityProvider),
      recentChannelIdsInGuild: recentChannelIdsInGuild,
    );
    if (chatPath != null) {
      navigateToContent(container, chatPath);
      syncForShellLocation(container, chatPath);
      closeDrawer(container);
      return;
    }
    final String path = RoutePaths.guildChannelList(guildId);
    container
        .read(fluxerRouterProvider)
        .go(path, extra: kGuildRootStayOnListExtra);
    syncForShellLocation(container, path);
    revealDrawer(container);
  }

  static void openImmersiveGuildVoiceCall(
    ProviderContainer container, {
    required String guildId,
    required String channelId,
  }) {
    talker.debug(
      '[DrawerNavigation] openImmersiveGuildVoiceCall guildId=$guildId channelId=$channelId',
    );
    container
        .read(channelListViewModelProvider.notifier)
        .loadActiveGuild(guildId);
    closeDrawer(container);
    navigateToContent(container, RoutePaths.guildChannel(guildId, channelId));
  }

  static void openImmersiveDmVoiceCall(
    ProviderContainer container, {
    required String channelId,
  }) {
    talker.debug(
      '[DrawerNavigation] openImmersiveDmVoiceCall channelId=$channelId',
    );
    closeDrawer(container);
    navigateToContent(container, RoutePaths.dmChannelCall(channelId));
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
