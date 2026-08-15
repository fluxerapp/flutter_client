import 'dart:async';

import 'package:material_ui/material_ui.dart';

/// Mixin that manages a resend countdown timer for verification code flows.
///
/// Call [disposeResendTimer] from the consuming widget's `dispose()`.
mixin ResendTimerMixin<T extends StatefulWidget> on State<T> {
  DateTime? _resendAvailableAt;
  Timer? _resendTimer;
  int _resendCountdown = 0;

  int get resendCountdown => _resendCountdown;

  void startResendTimer(String? resendAvailableAt) {
    _resendTimer?.cancel();
    _resendAvailableAt = resendAvailableAt != null
        ? (DateTime.tryParse(resendAvailableAt) ??
              DateTime.now().add(const Duration(seconds: 30)))
        : DateTime.now().add(const Duration(seconds: 30));
    _updateResendCountdown();
    _resendTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateResendCountdown(),
    );
  }

  void _updateResendCountdown() {
    if (_resendAvailableAt == null) {
      setState(() => _resendCountdown = 0);
      return;
    }
    final remaining = _resendAvailableAt!.difference(DateTime.now()).inSeconds;
    setState(() => _resendCountdown = remaining > 0 ? remaining : 0);
    if (remaining <= 0) {
      _resendTimer?.cancel();
    }
  }

  void disposeResendTimer() {
    _resendTimer?.cancel();
  }
}
