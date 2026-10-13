enum AuthFailureKind {
  invalidCredentials,
  serviceUnavailable,
  verificationFailed,
}

class AuthFailure implements Exception {
  final String message;
  final Map<String, String> fieldErrors;
  final AuthFailureKind? kind;

  const AuthFailure(this.message, {this.fieldErrors = const {}, this.kind});

  @override
  String toString() => message;
}

class SessionExpiredFailure implements Exception {
  const SessionExpiredFailure();
}

class AccountSwitchSupersededFailure implements Exception {
  const AccountSwitchSupersededFailure();
}
