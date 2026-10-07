import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/deep_links/deep_link_handler.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_route.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadFeatureChannelType;
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pending_push_notification_path_provider.g.dart';

/// Whether external navigation (push taps, universal links) may proceed
bool isPendingNavigationReady({
  required bool isAuthenticated,
  required bool isGatewayReady,
  required bool isConnectionFailed,
}) {
  return isAuthenticated && isGatewayReady && !isConnectionFailed;
}

@Riverpod(keepAlive: true)
class PendingPushNotificationPath extends _$PendingPushNotificationPath {
  @override
  PendingPushNotificationRoute? build() {
    ref
      ..listen<bool>(gatewayReadyProvider, (bool? previous, bool next) {
        if (!next) {
          return;
        }
        flushIfReady();
      })
      ..listen<bool>(authStateProvider, (bool? previous, bool next) {
        if (!next) {
          return;
        }
        flushIfReady();
      })
      ..listen<bool>(gatewayConnectionFailedProvider, (
        bool? previous,
        bool next,
      ) {
        if (next) {
          return;
        }
        flushIfReady();
      })
      ..listen<int>(gatewaySessionRecoveryProvider, (int? previous, int next) {
        if (next > 0 && previous != next) {
          flushIfReady();
        }
      });
    return null;
  }

  void store(
    String path, {
    String? accountUserId,
    ({String guildId, String parentId})? threadParent,
  }) {
    state = PendingPushNotificationRoute(
      path: path,
      accountUserId: accountUserId ?? ref.read(currentUserIdProvider),
      threadParent: threadParent,
    );
    talker.info('[PendingNavigation] Queued path until shell ready: $path');
    flushIfReady();
  }

  void clear() {
    state = null;
  }

  void flushIfReady() {
    final PendingPushNotificationRoute? pending = state;
    if (pending == null || pending.path.isEmpty) {
      return;
    }
    final bool ready = isPendingNavigationReady(
      isAuthenticated: ref.read(authStateProvider),
      isGatewayReady: ref.read(gatewayReadyProvider),
      isConnectionFailed: ref.read(gatewayConnectionFailedProvider),
    );
    if (!ready) {
      return;
    }
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (pendingPushRouteWaitsForAccount(
      accountUserId: pending.accountUserId,
      currentUserId: currentUserId,
    )) {
      return;
    }
    state = null;
    talker.info('[PendingNavigation] Flushing queued path: ${pending.path}');
    open(pending.path, threadParent: pending.threadParent);
  }

  void open(String path, {({String guildId, String parentId})? threadParent}) {
    if (threadParent == null ||
        ref.read(threadsGateProvider).isActive(threadParent.guildId)) {
      ref.read(deepLinkHandlerProvider.notifier).handlePath(path);
      return;
    }
    unawaited(_openThreadParent(threadParent));
  }

  Future<void> _openThreadParent(
    ({String guildId, String parentId}) threadParent,
  ) async {
    final Channel? parent = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(threadParent.parentId);
    if (!ref.mounted) {
      return;
    }
    ref
        .read(deepLinkHandlerProvider.notifier)
        .handlePath(
          parent != null &&
                  parent.guildId == threadParent.guildId &&
                  !isThreadFeatureChannelType(parent.type)
              ? RoutePaths.guildChannel(
                  threadParent.guildId,
                  threadParent.parentId,
                )
              : RoutePaths.guild(threadParent.guildId),
        );
  }
}
