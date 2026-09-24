import 'package:fluxer_app/core/deep_links/deep_link_handler.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_route.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
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

  void store(String path, {String? accountUserId}) {
    state = PendingPushNotificationRoute(
      path: path,
      accountUserId: accountUserId ?? ref.read(currentUserIdProvider),
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
    ref.read(deepLinkHandlerProvider.notifier).handlePath(pending.path);
  }
}
