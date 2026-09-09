import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/quick_actions/home_quick_action.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pending_home_quick_action_provider.g.dart';

/// Queues a home-screen shortcut until auth and gateway are ready.
@Riverpod(keepAlive: true)
class PendingHomeQuickAction extends _$PendingHomeQuickAction {
  HomeQuickAction? _queued;

  @override
  HomeQuickAction? build() {
    ref
      ..listen<bool>(gatewayReadyProvider, (_, bool next) {
        if (next) {
          flushIfReady();
        }
      })
      ..listen<bool>(authStateProvider, (_, bool next) {
        if (next) {
          flushIfReady();
        }
      })
      ..listen<bool>(gatewayConnectionFailedProvider, (_, bool next) {
        if (!next) {
          flushIfReady();
        }
      })
      ..listen<int>(gatewaySessionRecoveryProvider, (int? previous, int next) {
        if (next > 0 && previous != next) {
          flushIfReady();
        }
      })
      ..listen<InstanceRuntimeConfig>(instanceRuntimeConfigProvider, (
        InstanceRuntimeConfig? previous,
        InstanceRuntimeConfig next,
      ) {
        if (next.directMessagesDisabled && _queued == HomeQuickAction.dms) {
          talker.info('[HomeQuickAction] Dropped DMs shortcut; DMs disabled');
          clear();
        }
      });
    return null;
  }

  void store(HomeQuickAction action) {
    if (action == HomeQuickAction.dms &&
        ref.read(instanceRuntimeConfigProvider).directMessagesDisabled) {
      talker.info('[HomeQuickAction] Ignored DMs shortcut; DMs disabled');
      return;
    }
    _queued = action;
    talker.info('[HomeQuickAction] Queued ${action.type}');
    flushIfReady();
  }

  void clear() {
    _queued = null;
    state = null;
  }

  void flushIfReady() {
    final HomeQuickAction? pending = _queued;
    if (pending == null) {
      return;
    }
    if (pending == HomeQuickAction.dms &&
        ref.read(instanceRuntimeConfigProvider).directMessagesDisabled) {
      talker.info('[HomeQuickAction] Dropped DMs shortcut; DMs disabled');
      clear();
      return;
    }
    if (!isPendingNavigationReady(
      isAuthenticated: ref.read(authStateProvider),
      isGatewayReady: ref.read(gatewayReadyProvider),
      isConnectionFailed: ref.read(gatewayConnectionFailedProvider),
    )) {
      return;
    }
    talker.info('[HomeQuickAction] Ready to present ${pending.type}');
    state = pending;
  }
}
