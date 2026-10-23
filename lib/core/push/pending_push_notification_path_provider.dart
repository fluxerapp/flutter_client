import 'package:fluxer_app/core/deep_links/deep_link_handler.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/providers/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_route.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pending_push_notification_path_provider.g.dart';

bool isPendingNavigationReady({
  required bool isAuthenticated,
  required bool isGatewayReady,
  required bool isConnectionFailed,
}) {
  return isAuthenticated && isGatewayReady && !isConnectionFailed;
}

bool shouldApplyPendingPushNavigation({
  required bool isAuthenticated,
  required bool isGatewayReady,
  required bool isConnectionFailed,
  required bool splashExitAllowed,
}) {
  return isPendingNavigationReady(
        isAuthenticated: isAuthenticated,
        isGatewayReady: isGatewayReady,
        isConnectionFailed: isConnectionFailed,
      ) &&
      splashExitAllowed;
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
    if (!shouldApplyPendingPushNavigation(
      isAuthenticated: ref.read(authStateProvider),
      isGatewayReady: ref.read(gatewayReadyProvider),
      isConnectionFailed: ref.read(gatewayConnectionFailedProvider),
      splashExitAllowed: ref.read(splashExitAllowedProvider),
    )) {
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
    open(pending.path);
  }

  void open(String path) {
    ref.read(deepLinkHandlerProvider.notifier).handlePath(path);
  }
}
