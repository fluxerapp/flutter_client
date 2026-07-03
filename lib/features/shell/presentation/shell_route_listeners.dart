import 'dart:async';

import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/guild_channel_permission_cleanup.dart';
import 'package:fluxer_app/core/push/push_notifications_coordinator.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_coordinator.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_distributor_setup.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_distributor_ui.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/providers/member_list_desired_ranges_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';

class ShellRouteListeners extends ConsumerStatefulWidget {
  const ShellRouteListeners({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<ShellRouteListeners> createState() =>
      _ShellRouteListenersState();
}

class _ShellRouteListenersState extends ConsumerState<ShellRouteListeners> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      DrawerNavigationCoordinator.syncForShellLocation(
        ref.container,
        ref.read(shellLocationProvider),
      );
    });
    ref.listenManual<String>(shellLocationProvider, (
      String? previous,
      String next,
    ) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        DrawerNavigationCoordinator.syncForShellLocation(ref.container, next);
      });
    });
    ref.listenManual<String?>(activeGuildIdProvider, (
      String? previous,
      String? next,
    ) {
      if (previous != null && previous != next) {
        unawaited(evictInactiveGuildPermissionState(ref.container, previous));
      }
      if (next != null) {
        final guilds = ref.read(guildListViewModelProvider).guilds;
        final guild = guilds.where((g) => g.id == next).firstOrNull;
        ref
            .read(channelListViewModelProvider.notifier)
            .loadChannels(next, guild: guild);
        ref.read(guildSyncProvider.notifier).syncIfNeeded(next);
      }
    });
    ref.listenManual<String?>(activeChannelIdProvider, (
      String? previous,
      String? next,
    ) {
      if (previous == null || previous == next) {
        return;
      }
      final String? guildId = ref.read(activeGuildIdProvider);
      if (guildId == null) {
        return;
      }
      ref
          .read(memberListViewportProvider.notifier)
          .clearChannel(guildId: guildId, channelId: previous);
      ref
          .read(memberListDesiredRangesProvider.notifier)
          .clearChannel(guildId: guildId, channelId: previous);
    });
    if (PushProviderGuard.isUnifiedPush) {
      ref.listenManual<bool>(unifiedPushDistributorSetupProvider, (
        bool? previous,
        bool next,
      ) {
        if (!next) {
          return;
        }
        final BuildContext? rootContext = rootNavigatorKey.currentContext;
        if (rootContext == null || !rootContext.mounted) {
          return;
        }
        ref.read(unifiedPushDistributorSetupProvider.notifier).clearRequest();
        unawaited(showUnifiedPushDistributorSetup(rootContext));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref
      ..watch(pushNotificationsCoordinatorProvider)
      ..watch(appIconBadgeCoordinatorProvider);
    return widget.child;
  }
}
