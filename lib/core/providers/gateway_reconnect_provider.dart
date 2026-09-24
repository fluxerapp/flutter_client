import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_sync_provider.dart';
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
const Duration kReconnectBannerDelay = Duration(seconds: 2);
const Duration kReconnectBannerSuccessHold = Duration(milliseconds: 1400);

enum GatewayReconnectBannerPhase { hidden, reconnecting, connected }

/// True while a foreground resume reconnect nudge is in flight.
@Riverpod(keepAlive: true)
class GatewayResumeReconnectInFlight extends _$GatewayResumeReconnectInFlight {
  @override
  bool build() => false;

  // Resume reconnect state is toggled by gateway lifecycle callbacks.
  void setInFlight({required bool value}) {
    state = value;
  }
}

/// Nudges the gateway socket after resume, giving the network stack one
/// [kResumeReconnectDelay] beat to wake when connectivity is not up yet.
Future<void> nudgeGatewayReconnectAfterResume(
  GatewayConnection connection, {
  void Function({required bool inFlight})? onResumeReconnectInFlight,
  Future<bool> Function() hasConnectivity = _hasAnyConnectivity,
}) async {
  onResumeReconnectInFlight?.call(inFlight: true);
  var hasConnection = await hasConnectivity();
  if (!hasConnection) {
    await Future<void>.delayed(kResumeReconnectDelay);
    hasConnection = await hasConnectivity();
  }
  if (!hasConnection) {
    talker.warning('[Gateway] Resume reconnect skipped: no connectivity');
    onResumeReconnectInFlight?.call(inFlight: false);
    return;
  }
  talker.info('[Gateway] Resume reconnect starting');
  if (connection.state == GatewayState.connecting ||
      connection.state == GatewayState.reconnecting) {
    onResumeReconnectInFlight?.call(inFlight: false);
    return;
  }
  if (connection.state == GatewayState.connected) {
    await connection.reconnectNow();
    return;
  }
  await connection.nudgeReconnect();
}

Future<bool> _hasAnyConnectivity() async {
  final List<ConnectivityResult> results = await Connectivity()
      .checkConnectivity();
  return results.any((ConnectivityResult r) => r != ConnectivityResult.none);
}

bool shouldKeepGatewayConnectedForVoiceFromState({
  required bool isInVoice,
  required List<String> pendingIncomingChannelIds,
  bool hasCallKitIncoming = false,
}) {
  if (isInVoice || hasCallKitIncoming) {
    return true;
  }
  return pendingIncomingChannelIds.isNotEmpty;
}

class CallKitIncomingHold extends Notifier<bool> {
  @override
  bool build() => false;

  void setActive({required bool value}) {
    if (state == value) {
      return;
    }
    state = value;
  }
}

final NotifierProvider<CallKitIncomingHold, bool> callKitIncomingHoldProvider =
    NotifierProvider<CallKitIncomingHold, bool>(CallKitIncomingHold.new);

bool shouldKeepGatewayConnectedForVoice(Ref ref) {
  return shouldKeepGatewayConnectedForVoiceFromState(
    isInVoice: ref.read(voiceSessionProvider).isInVoice,
    pendingIncomingChannelIds: ref.read(pendingIncomingVoiceChannelIdsProvider),
    hasCallKitIncoming: ref.read(callKitIncomingHoldProvider),
  );
}

Future<bool> waitUntilGatewayConnected(
  GatewayConnection connection, {
  Duration timeout = const Duration(seconds: 15),
}) async {
  if (connection.state == GatewayState.connected) {
    return true;
  }
  try {
    if (connection.isReconnectSuspended) {
      await connection.unsuspendAndReconnect();
    } else if (connection.state != GatewayState.connecting &&
        connection.state != GatewayState.reconnecting) {
      await connection.reconnectNow();
    }
  } on Object {
    return false;
  }
  final DateTime deadline = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(deadline)) {
    if (connection.state == GatewayState.connected) {
      return true;
    }
    await Future<void>.delayed(const Duration(milliseconds: 200));
  }
  return connection.state == GatewayState.connected;
}

Future<bool> waitUntilGatewayReadyForCall(
  Ref ref, {
  Duration timeout = const Duration(seconds: 20),
}) async {
  final GatewayConnection connection = ref.read(gatewayConnectionProvider);
  final bool connected = await waitUntilGatewayConnected(
    connection,
    timeout: timeout,
  );
  if (!connected) {
    return false;
  }
  if (ref.read(gatewayReadyProvider)) {
    return true;
  }
  final DateTime deadline = DateTime.now().add(const Duration(seconds: 10));
  while (DateTime.now().isBefore(deadline)) {
    if (ref.read(gatewayReadyProvider) &&
        connection.state == GatewayState.connected) {
      return true;
    }
    if (connection.state == GatewayState.failed) {
      return false;
    }
    await Future<void>.delayed(const Duration(milliseconds: 200));
  }
  return ref.read(gatewayReadyProvider) &&
      connection.state == GatewayState.connected;
}

@Riverpod(keepAlive: true)
class GatewayConnectionFailed extends _$GatewayConnectionFailed {
  @override
  bool build() => false;

  // Failure state is toggled by gateway lifecycle callbacks.
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
class GatewayReconnectBanner extends _$GatewayReconnectBanner {
  Timer? _successHideTimer;

  @override
  GatewayReconnectBannerPhase build() {
    ref.onDispose(_cancelSuccessHide);
    return GatewayReconnectBannerPhase.hidden;
  }

  void _cancelSuccessHide() {
    _successHideTimer?.cancel();
    _successHideTimer = null;
  }

  void showReconnecting() {
    _cancelSuccessHide();
    state = GatewayReconnectBannerPhase.reconnecting;
  }

  void showConnected() {
    _cancelSuccessHide();
    state = GatewayReconnectBannerPhase.connected;
    _successHideTimer = Timer(kReconnectBannerSuccessHold, hide);
  }

  void hide() {
    _cancelSuccessHide();
    state = GatewayReconnectBannerPhase.hidden;
  }
}

@Riverpod(keepAlive: true)
void gatewayReconnectBannerListener(Ref ref) {
  GatewayState? previousState;
  var reconnectBannerShown = false;
  Timer? pendingReconnectBannerTimer;
  final connection = ref.watch(gatewayConnectionProvider);

  void clearPendingReconnectBanner() {
    pendingReconnectBannerTimer?.cancel();
    pendingReconnectBannerTimer = null;
  }

  void hideBanner() {
    reconnectBannerShown = false;
    ref.read(gatewayReconnectBannerProvider.notifier).hide();
  }

  bool isReconnectingState(GatewayState state) {
    return state == GatewayState.connecting ||
        state == GatewayState.reconnecting;
  }

  ref.listen<bool>(gatewayConnectionFailedProvider, (
    bool? previous,
    bool next,
  ) {
    if (!next) {
      return;
    }
    clearPendingReconnectBanner();
    hideBanner();
  });

  final subscription = connection.stateChanges.listen((GatewayState state) {
    if (ref.read(gatewayConnectionFailedProvider)) {
      clearPendingReconnectBanner();
      hideBanner();
      previousState = state;
      return;
    }
    final GatewayState? prior = previousState;
    previousState = state;
    if (prior == null) {
      return;
    }
    final bool wasConnected = prior == GatewayState.connected;
    final bool isReconnecting = isReconnectingState(state);
    final bool isConnected = state == GatewayState.connected;
    if (wasConnected && isReconnecting) {
      final GatewayReconnectBanner banner = ref.read(
        gatewayReconnectBannerProvider.notifier,
      );
      final GatewayReconnectBannerPhase phase = ref.read(
        gatewayReconnectBannerProvider,
      );
      if (phase == GatewayReconnectBannerPhase.connected) {
        reconnectBannerShown = true;
        banner.showReconnecting();
      } else if (!reconnectBannerShown) {
        clearPendingReconnectBanner();
        pendingReconnectBannerTimer = Timer(kReconnectBannerDelay, () {
          pendingReconnectBannerTimer = null;
          if (ref.read(gatewayConnectionFailedProvider)) {
            return;
          }
          if (!isReconnectingState(connection.state)) {
            return;
          }
          reconnectBannerShown = true;
          ref.read(gatewayReconnectBannerProvider.notifier).showReconnecting();
        });
      }
    }
    if (isConnected && isReconnectingState(prior)) {
      clearPendingReconnectBanner();
      if (reconnectBannerShown) {
        reconnectBannerShown = false;
        ref.read(gatewayReconnectBannerProvider.notifier).showConnected();
      }
    }
    if (isConnected) {
      reconnectBannerShown = false;
    }
  });

  ref.onDispose(() {
    clearPendingReconnectBanner();
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
      final GatewayState state = connection.state;
      if (state == GatewayState.connected ||
          state == GatewayState.connecting ||
          state == GatewayState.reconnecting) {
        return;
      }
      talker.info('[Gateway] Network restored, reconnecting');
      unawaited(connection.nudgeReconnect());
    });
  });

  ref.onDispose(() {
    clearDebounce();
    unawaited(subscription.cancel());
  });
  return subscription;
}
