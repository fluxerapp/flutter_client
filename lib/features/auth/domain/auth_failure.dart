import 'package:fluxer_app/features/auth/domain/enforcement_notice.dart';

enum AuthFailureKind {
  invalidCredentials,
  serviceUnavailable,
  verificationFailed,
  accountRestricted,
}

class AuthFailure implements Exception {
  final String message;
  final Map<String, String> fieldErrors;
  final AuthFailureKind? kind;
  final EnforcementNotice? notice;

  const AuthFailure(
    this.message, {
    this.fieldErrors = const {},
    this.kind,
    this.notice,
  });

  @override
  String toString() => message;
}

class SessionExpiredFailure implements Exception {
  const SessionExpiredFailure();
}

class AccountSwitchSupersededFailure implements Exception {
  const AccountSwitchSupersededFailure();
}
