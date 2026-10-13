import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/data/ban_view_repository.dart';
import 'package:fluxer_app/features/auth/domain/ban_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ban_view_provider.g.dart';

class BanViewState {
  final BanViewInfo info;
  final BanStatus? status;
  final bool isLoading;
  final bool isSubmittingAppeal;
  final String? error;
  final int recheckCooldown;

  const BanViewState({
    required this.info,
    this.status,
    this.isLoading = false,
    this.isSubmittingAppeal = false,
    this.error,
    this.recheckCooldown = 0,
  });

  BanViewState copyWith({
    BanStatus? status,
    bool? isLoading,
    bool? isSubmittingAppeal,
    String? error,
    int? recheckCooldown,
    bool clearError = false,
  }) {
    return BanViewState(
      info: info,
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      isSubmittingAppeal: isSubmittingAppeal ?? this.isSubmittingAppeal,
      error: clearError ? null : (error ?? this.error),
      recheckCooldown: recheckCooldown ?? this.recheckCooldown,
    );
  }
}

@Riverpod(keepAlive: true)
class BanView extends _$BanView {
  static const _pollInterval = Duration(minutes: 2);
  static const _refreshInterval = Duration(minutes: 25);
  static const _recheckCooldownSeconds = 60;

  Timer? _pollTimer;
  Timer? _refreshTimer;
  Timer? _cooldownTimer;

  BanViewRepository get _repo {
    final baseUrl = ref.read(fluxerBaseUrlProvider);
    return BanViewRepository(baseUrl);
  }

  @override
  BanViewState? build() {
    ref.onDispose(_stopTimers);
    return null;
  }

  Future<void> initialize(BanViewInfo info) async {
    _stopTimers();
    state = BanViewState(info: info, isLoading: true);
    await _fetchStatus();
    _startPolling();
    _startTokenRefresh();
  }

  Future<void> submitAppeal(String rationale) async {
    final current = state;
    if (current == null) {
      return;
    }

    state = current.copyWith(isSubmittingAppeal: true, clearError: true);

    try {
      await _repo.submitAppeal(token: current.info.token, rationale: rationale);
      await _fetchStatus();
    } on Object catch (e) {
      talker.error('[BanView] Submit appeal failed: $e');
      state = state?.copyWith(
        error: 'Failed to submit appeal. Please try again.',
        isSubmittingAppeal: false,
      );
    }
  }

  Future<void> recheck() async {
    final current = state;
    if (current == null || current.recheckCooldown > 0) {
      return;
    }

    state = current.copyWith(isLoading: true, clearError: true);

    try {
      await _repo.recheck(current.info.token);
      await _fetchStatus();
      _startCooldown();
    } on Object catch (e) {
      talker.error('[BanView] Recheck failed: $e');
      state = state?.copyWith(
        error: 'Failed to check status. Please try again.',
        isLoading: false,
      );
    }
  }

  void clear() {
    _stopTimers();
    state = null;
  }

  Future<void> _fetchStatus() async {
    final current = state;
    if (current == null) {
      return;
    }

    try {
      final status = await _repo.getStatus(current.info.token);
      state = current.copyWith(
        status: status,
        isLoading: false,
        isSubmittingAppeal: false,
        clearError: true,
      );
    } on Object catch (e) {
      talker.error('[BanView] Fetch status failed: $e');
      state = current.copyWith(
        error: 'Failed to load ban information.',
        isLoading: false,
      );
    }
  }

  void _startPolling() {
    _pollTimer = Timer.periodic(_pollInterval, (_) => _fetchStatus());
  }

  void _startTokenRefresh() {
    _refreshTimer = Timer.periodic(_refreshInterval, (_) async {
      final current = state;
      if (current == null) {
        return;
      }

      try {
        final newToken = await _repo.refreshToken(current.info.token);
        state = BanViewState(
          info: BanViewInfo(token: newToken, banType: current.info.banType),
          status: current.status,
          recheckCooldown: current.recheckCooldown,
        );
      } on Object catch (e) {
        talker.error('[BanView] Token refresh failed: $e');
        clear();
      }
    });
  }

  void _startCooldown() {
    var remaining = _recheckCooldownSeconds;
    state = state?.copyWith(recheckCooldown: remaining);

    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remaining--;
      if (remaining <= 0) {
        timer.cancel();
        state = state?.copyWith(recheckCooldown: 0);
      } else {
        state = state?.copyWith(recheckCooldown: remaining);
      }
    });
  }

  void _stopTimers() {
    _pollTimer?.cancel();
    _refreshTimer?.cancel();
    _cooldownTimer?.cancel();
    _pollTimer = null;
    _refreshTimer = null;
    _cooldownTimer = null;
  }
}
