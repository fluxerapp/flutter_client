import 'dart:async';

import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_status_service.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'status_expiry_scheduler.g.dart';

class StatusExpiryScheduler {
  StatusExpiryScheduler(this._ref);

  final Ref _ref;
  Timer? _timer;
  bool _resetInFlight = false;
  int? _attemptedResetsAtMs;

  void bind() {
    _ref
      ..listen<UserSettingsResponse?>(
        userSettingsStatusProvider,
        (_, UserSettingsResponse? settings) => _scheduleFromSettings(settings),
        fireImmediately: true,
      )
      ..listen<String?>(currentUserIdProvider, (_, _) {
        _attemptedResetsAtMs = null;
        _scheduleFromSettings(_ref.read(userSettingsStatusProvider));
      })
      ..onDispose(_cancelTimer);
  }

  void _scheduleFromSettings(UserSettingsResponse? settings) {
    final DateTime? resetsAt = settings?.statusResetsAt?.toUtc();
    if (resetsAt == null) {
      _cancelTimer();
      if (!_resetInFlight) {
        _attemptedResetsAtMs = null;
      }
      return;
    }
    final Duration delay = resetsAt.difference(DateTime.now().toUtc());
    if (delay <= Duration.zero) {
      if (_resetInFlight ||
          _attemptedResetsAtMs == resetsAt.millisecondsSinceEpoch) {
        return;
      }
      _cancelTimer();
      unawaited(_handleExpiry(settings?.statusResetsTo, resetsAt));
      return;
    }
    _cancelTimer();
    if (!_resetInFlight) {
      _attemptedResetsAtMs = null;
    }
    _timer = Timer(delay, () {
      unawaited(_handleExpiry(settings?.statusResetsTo, resetsAt));
    });
  }

  Future<void> _handleExpiry(String? resetsTo, DateTime resetsAt) async {
    if (_resetInFlight ||
        _attemptedResetsAtMs == resetsAt.millisecondsSinceEpoch) {
      return;
    }
    _resetInFlight = true;
    _attemptedResetsAtMs = resetsAt.millisecondsSinceEpoch;
    final PresenceStatus fallbackStatus = _parseStatusType(resetsTo);
    try {
      await _ref
          .read(userStatusServiceProvider)
          .applyScheduledStatusReset(fallbackStatus: fallbackStatus);
    } on Object catch (error, stackTrace) {
      talker.error('[StatusExpiryScheduler] Reset failed', error, stackTrace);
    } finally {
      _resetInFlight = false;
    }
  }

  PresenceStatus _parseStatusType(String? value) {
    if (value == null) {
      return PresenceStatus.online;
    }
    final PresenceStatus parsed = PresenceStatus.fromJson(value);
    return parsed == PresenceStatus.$unknown ? PresenceStatus.online : parsed;
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}

@Riverpod(keepAlive: true)
StatusExpiryScheduler statusExpiryScheduler(Ref ref) {
  final StatusExpiryScheduler scheduler = StatusExpiryScheduler(ref)..bind();
  return scheduler;
}

@Riverpod(keepAlive: true)
void statusExpiryBinding(Ref ref) {
  ref.watch(statusExpirySchedulerProvider);
}
