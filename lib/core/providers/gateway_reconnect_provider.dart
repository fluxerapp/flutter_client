import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/features/voice/providers/pending_incoming_voice_calls_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gateway_reconnect_provider.g.dart';

const Duration kGatewayReconnectFailureTimeout = Duration(seconds: 30);
const Duration kGatewayResumeReconnectFailureTimeout = Duration(seconds: 60);
const Duration kBackgroundGatewayDisconnectGrace = Duration(seconds: 45);
const Duration kResumeReconnectDelay = Duration(milliseconds: 500);
const Duration kConnectivityReconnectDebounce = Duration(milliseconds: 500);
const Duration kReconnectToastDelay = Duration(seconds: 2);

/// True while a foreground resume reconnect nudge is in flight.
@Riverpod(keepAlive: true)
class GatewayResumeReconnectInFlight extends _$GatewayResumeReconnectInFlight {
  @override
  bool build() => false;

  // Resume reconnect state is toggled by gateway lifecycle callbacks.
  // ignore: use_setters_to_change_properties
  void setInFlight({required bool value}) {
    state = value;
  }
}

/// Waits for the network stack after resume, then nudges the gateway socket.
Future<void> nudgeGatewayReconnectAfterResume(
  GatewayConnection connection, {
  void Function({required bool inFlight})? onResumeReconnectInFlight,
}) async {
  onResumeReconnectInFlight?.call(inFlight: true);
  await Future<void>.delayed(kResumeReconnectDelay);
  final List<ConnectivityResult> results = await Connectivity()
      .checkConnectivity();
  final bool hasConnection = results.any(
    (ConnectivityResult r) => r != ConnectivityResult.none,
  );
  if (!hasConnection) {
    talker.warning('[Gateway] Resume reconnect skipped: no connectivity');
    onResumeReconnectInFlight?.call(inFlight: false);
    return;
  }
  talker.info('[Gateway] Resume reconnect starting');
  if (connection.isReconnectSuspended) {
    await connection.unsuspendAndReconnect();
  } else {
    await connection.reconnectNow();
  }
}

bool shouldKeepGatewayConnectedForVoiceFromState({
  required bool isInVoice,
  required List<String> pendingIncomingChannelIds,
}) {
  if (isInVoice) {
    return true;
  }
  return pendingIncomingChannelIds.isNotEmpty;
}

bool shouldKeepGatewayConnectedForVoice(Ref ref) {
  return shouldKeepGatewayConnectedForVoiceFromState(
    isInVoice: ref.read(voiceSessionProvider).isInVoice,
    pendingIncomingChannelIds: ref.read(pendingIncomingVoiceChannelIdsProvider),
  );
}

@Riverpod(keepAlive: true)
class GatewayConnectionFailed extends _$GatewayConnectionFailed {
  @override
  bool build() => false;

  // Failure state is toggled by gateway lifecycle callbacks.
  // ignore: use_setters_to_change_properties
  void setFailed({required bool value}) {
    state = value;
  }

  void reset() {
    state = false;
  }
}

@Riverpod(keepAlive: true)
Raw<StreamSubscription<GatewayState>?> gatewayStateListener(Ref ref) {
  final connection = ref.watch(gatewayConnectionProvider);
  Timer? failureTimer;
  GatewayState? reconnectingState;

  void clearFailureTimer() {
    failureTimer?.cancel();
    failureTimer = null;
  }

  void markOnline() {
    clearFailureTimer();
    reconnectingState = null;
    ref
        .read(gatewayResumeReconnectInFlightProvider.notifier)
        .setInFlight(value: false);
    ref.read(serverReachableProvider.notifier).setReachable(value: true);
    ref.read(gatewayConnectionFailedProvider.notifier).reset();
  }

  void markFailed() {
    clearFailureTimer();
    reconnectingState = null;
    ref
        .read(gatewayResumeReconnectInFlightProvider.notifier)
        .setInFlight(value: false);
    ref.read(serverReachableProvider.notifier).setReachable(value: false);
    ref.read(gatewayConnectionFailedProvider.notifier).setFailed(value: true);
    ref.read(guildSyncProvider.notifier).clearAll();
  }

  // A fatal close is usually a rejected token (4004). Probe the session over
  // REST. On 401 sign out to login so a dead session stops looping on the
  // failure screen. Other outcomes keep it.
  var sessionExpiryProbeInFlight = false;
  Future<void> handlePossibleSessionExpiry() async {
    if (sessionExpiryProbeInFlight ||
        !ref.read(authStateProvider) ||
        ref.read(accountManagerProvider).isSwitching) {
      return;
    }
    sessionExpiryProbeInFlight = true;
    try {
      final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
      final bool expired = await ref
          .read(accountManagerProvider.notifier)
          .expireSessionIfInvalid();
      if (!expired) {
        return;
      }
      talker.warning('[Gateway] Session expired — signing out to login');
      // The probe got an HTTP verdict, so the server is reachable. Clearing
      // the failure state keeps the next login from bouncing to /reconnecting.
      markOnline();
      ref
          .read(toastProvider.notifier)
          .show(FluxerToast(message: l10n.sessionExpiredToast));
    } finally {
      sessionExpiryProbeInFlight = false;
    }
  }

  Duration failureTimeoutForCurrentReconnect() {
    if (ref.read(gatewayResumeReconnectInFlightProvider)) {
      return kGatewayResumeReconnectFailureTimeout;
    }
    return kGatewayReconnectFailureTimeout;
  }

  void scheduleFailureTimeout() {
    if (!ref.read(appUiForegroundProvider)) {
      clearFailureTimer();
      return;
    }
    clearFailureTimer();
    final Duration timeout = failureTimeoutForCurrentReconnect();
    failureTimer = Timer(timeout, () {
      if (!ref.read(appUiForegroundProvider)) {
        return;
      }
      if (connection.state != GatewayState.connected) {
        talker.warning('[Gateway] Reconnect failure timeout reached');
        markFailed();
      }
    });
  }

  void handleReconnectingState(GatewayState state) {
    reconnectingState = state;
    ref.read(serverReachableProvider.notifier).setReachable(value: true);
    final bool onFailureScreen = ref.read(gatewayConnectionFailedProvider);
    if (onFailureScreen) {
      clearFailureTimer();
    } else {
      ref.read(gatewayConnectionFailedProvider.notifier).reset();
      scheduleFailureTimeout();
    }
  }

  ref.listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
    if ((previous ?? false) && !next) {
      clearFailureTimer();
      return;
    }
    if ((previous ?? false) || !next) {
      return;
    }
    final GatewayState? pending = reconnectingState;
    if (pending == GatewayState.connecting ||
        pending == GatewayState.reconnecting) {
      scheduleFailureTimeout();
    }
  });

  final subscription = connection.stateChanges.listen((GatewayState state) {
    switch (state) {
      case GatewayState.connected:
        markOnline();
      case GatewayState.connecting:
      case GatewayState.reconnecting:
        handleReconnectingState(state);
      case GatewayState.disconnected:
        reconnectingState = null;
      case GatewayState.failed:
        talker.error('[Gateway] Fatal gateway close');
        markFailed();
        unawaited(handlePossibleSessionExpiry());
    }
  });

  ref.onDispose(() {
    clearFailureTimer();
    unawaited(subscription.cancel());
  });
  return subscription;
}

@Riverpod(keepAlive: true)
void gatewayForegroundListener(Ref ref) {
  Timer? backgroundDisconnectTimer;

  void clearBackgroundDisconnectTimer() {
    backgroundDisconnectTimer?.cancel();
    backgroundDisconnectTimer = null;
  }

  ref
    ..onDispose(clearBackgroundDisconnectTimer)
    ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
      if ((previous ?? true) && !next) {
        clearBackgroundDisconnectTimer();
        backgroundDisconnectTimer = Timer(
          kBackgroundGatewayDisconnectGrace,
          () {
            backgroundDisconnectTimer = null;
            if (ref.read(appUiForegroundProvider)) {
              return;
            }
            if (shouldKeepGatewayConnectedForVoice(ref)) {
              return;
            }
            final GatewayConnection connection = ref.read(
              gatewayConnectionProvider,
            );
            if (connection.isReconnectSuspended) {
              return;
            }
            final GatewayState state = connection.state;
            if (state == GatewayState.connected ||
                state == GatewayState.connecting ||
                state == GatewayState.reconnecting) {
              talker.info('[Gateway] Background suspend — disconnecting');
              unawaited(connection.suspend());
            }
          },
        );
        return;
      }
      if ((previous ?? true) || !next) {
        return;
      }
      clearBackgroundDisconnectTimer();
      final GatewayConnection connection = ref.read(gatewayConnectionProvider);
      if (connection.isReconnectSuspended) {
        talker.info('[Gateway] App resumed from background suspend');
      } else {
        if (connection.state == GatewayState.connected &&
            !connection.isLikelyStale) {
          return;
        }
        talker.info('[Gateway] App resumed, reconnecting (stale socket)');
      }
      unawaited(
        nudgeGatewayReconnectAfterResume(
          connection,
          onResumeReconnectInFlight: ({required bool inFlight}) {
            ref
                .read(gatewayResumeReconnectInFlightProvider.notifier)
                .setInFlight(value: inFlight);
          },
        ),
      );
    });
}

@Riverpod(keepAlive: true)
void gatewayReconnectToastListener(Ref ref) {
  GatewayState? previousState;
  var reconnectToastShown = false;
  Timer? pendingReconnectToastTimer;
  final connection = ref.watch(gatewayConnectionProvider);

  void clearPendingReconnectToast() {
    pendingReconnectToastTimer?.cancel();
    pendingReconnectToastTimer = null;
  }

  final subscription = connection.stateChanges.listen((GatewayState state) {
    if (ref.read(gatewayConnectionFailedProvider)) {
      clearPendingReconnectToast();
      previousState = state;
      return;
    }
    final GatewayState? prior = previousState;
    previousState = state;
    if (prior == null) {
      return;
    }
    final bool wasConnected = prior == GatewayState.connected;
    final bool isReconnecting =
        state == GatewayState.connecting || state == GatewayState.reconnecting;
    final bool isConnected = state == GatewayState.connected;
    if (wasConnected && isReconnecting && !reconnectToastShown) {
      clearPendingReconnectToast();
      pendingReconnectToastTimer = Timer(kReconnectToastDelay, () {
        pendingReconnectToastTimer = null;
        if (ref.read(gatewayConnectionFailedProvider)) {
          return;
        }
        final GatewayState current = connection.state;
        if (current != GatewayState.connecting &&
            current != GatewayState.reconnecting) {
          return;
        }
        reconnectToastShown = true;
        final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.gatewayReconnectingToast,
                duration: const Duration(seconds: 5),
              ),
            );
      });
    }
    if (isConnected &&
        (prior == GatewayState.connecting ||
            prior == GatewayState.reconnecting)) {
      clearPendingReconnectToast();
      if (reconnectToastShown) {
        reconnectToastShown = false;
        final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.gatewayConnectedToast,
                variant: FluxerToastVariant.success,
              ),
            );
      }
    }
    if (isConnected) {
      reconnectToastShown = false;
    }
  });

  ref.onDispose(() {
    clearPendingReconnectToast();
    unawaited(subscription.cancel());
  });
}

@Riverpod(keepAlive: true)
Raw<StreamSubscription<List<ConnectivityResult>>?> connectivityListener(
  Ref ref,
) {
  final connection = ref.watch(gatewayConnectionProvider);
  Timer? debounceTimer;

  void clearDebounce() {
    debounceTimer?.cancel();
    debounceTimer = null;
  }

  final subscription = Connectivity().onConnectivityChanged.listen((
    List<ConnectivityResult> results,
  ) {
    final bool hasConnection = results.any(
      (ConnectivityResult r) => r != ConnectivityResult.none,
    );
    if (!hasConnection || connection.state == GatewayState.connected) {
      clearDebounce();
      return;
    }
    if (!ref.read(appUiForegroundProvider) || connection.isReconnectSuspended) {
      clearDebounce();
      return;
    }
    if (ref.read(gatewayConnectionFailedProvider)) {
      return;
    }
    clearDebounce();
    debounceTimer = Timer(kConnectivityReconnectDebounce, () {
      debounceTimer = null;
      if (connection.state != GatewayState.connected) {
        talker.info('[Gateway] Network restored, reconnecting');
        unawaited(connection.reconnectNow());
      }
    });
  });

  ref.onDispose(() {
    clearDebounce();
    unawaited(subscription.cancel());
  });
  return subscription;
}
