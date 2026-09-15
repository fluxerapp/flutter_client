import 'dart:async';

import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/domain/auth_session.dart';
import 'package:fluxer_app/features/auth/domain/ip_auth_poll_result.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ip_authorization_view_model.g.dart';

enum IpAuthPollingState { polling, error, expired }

class IpAuthViewState {
  final IpAuthPollingState pollingState;
  final int resendIn;
  final bool resendUsed;
  final AuthSession? completedSession;

  const IpAuthViewState({
    required this.pollingState,
    required this.resendIn,
    required this.resendUsed,
    required this.completedSession,
  });

  IpAuthViewState copyWith({
    IpAuthPollingState? pollingState,
    int? resendIn,
    bool? resendUsed,
    AuthSession? completedSession,
  }) {
    return IpAuthViewState(
      pollingState: pollingState ?? this.pollingState,
      resendIn: resendIn ?? this.resendIn,
      resendUsed: resendUsed ?? this.resendUsed,
      completedSession: completedSession ?? this.completedSession,
    );
  }
}

@riverpod
class IpAuthorizationViewModel extends _$IpAuthorizationViewModel {
  static const _pollInterval = Duration(seconds: 2);
  static const _maxPollErrors = 3;

  Timer? _pollTimer;
  Timer? _countdownTimer;
  int _consecutiveErrors = 0;
  bool _pollInFlight = false;
  bool _pollQueued = false;

  @override
  IpAuthViewState build(String ticket, int initialResendIn) {
    ref
      ..onDispose(() {
        _pollTimer?.cancel();
        _countdownTimer?.cancel();
      })
      ..listen(appUiForegroundProvider, (bool? previous, bool next) {
        if (next && previous == false) {
          _pollNow();
        }
      });

    _startPolling();
    _startCountdown(initialResendIn);

    return IpAuthViewState(
      pollingState: IpAuthPollingState.polling,
      resendIn: initialResendIn,
      resendUsed: false,
      completedSession: null,
    );
  }

  void _startPolling() {
    _pollTimer?.cancel();
    _consecutiveErrors = 0;
    unawaited(_poll());
  }

  void _pollNow() {
    if (state.pollingState != IpAuthPollingState.polling ||
        state.completedSession != null) {
      return;
    }
    _pollTimer?.cancel();
    unawaited(_poll());
  }

  Future<void> _poll() async {
    if (_pollInFlight) {
      _pollQueued = true;
      return;
    }
    _pollInFlight = true;
    try {
      final result = await ref
          .read(authRepositoryProvider)
          .pollIpAuthorization(ticket);
      switch (result) {
        case IpAuthCompleted(:final session):
          _pollTimer?.cancel();
          state = state.copyWith(completedSession: session);
        case IpAuthExpired():
          _pollTimer?.cancel();
          state = state.copyWith(pollingState: IpAuthPollingState.expired);
        case IpAuthPending():
          _consecutiveErrors = 0;
          if (!_pollQueued) {
            _pollTimer = Timer(_pollInterval, _poll);
          }
      }
    } on Exception catch (e) {
      _consecutiveErrors++;
      if (_consecutiveErrors >= _maxPollErrors) {
        _pollTimer?.cancel();
        talker.error(
          '[IpAuth] Polling failed after $_maxPollErrors retries',
          e,
        );
        state = state.copyWith(pollingState: IpAuthPollingState.error);
      } else if (!_pollQueued) {
        _pollTimer = Timer(_pollInterval, _poll);
      }
    } finally {
      _pollInFlight = false;
      if (!_pollQueued) {
        return;
      }
      _pollQueued = false;
      if (!ref.mounted) {
        return;
      }
      if (state.pollingState != IpAuthPollingState.polling ||
          state.completedSession != null) {
        return;
      }
      unawaited(_poll());
    }
  }

  void _startCountdown(int seconds) {
    _countdownTimer?.cancel();
    if (seconds <= 0) {
      return;
    }

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final next = state.resendIn - 1;
      state = state.copyWith(resendIn: next);
      if (next <= 0) {
        _countdownTimer?.cancel();
      }
    });
  }

  Future<void> resend() async {
    if (state.resendIn > 0 || state.resendUsed) {
      return;
    }
    try {
      await ref.read(authRepositoryProvider).resendIpAuthorization(ticket);
      state = state.copyWith(resendUsed: true);
      _startCountdown(30);
    } on Exception catch (e) {
      talker.error('[IpAuth] Failed to resend email', e);
      _startCountdown(30);
    }
  }

  void retry() {
    state = state.copyWith(pollingState: IpAuthPollingState.polling);
    _startPolling();
  }
}
