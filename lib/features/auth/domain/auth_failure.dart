enum AuthFailureKind { invalidCredentials, serviceUnavailable }

class AuthFailure implements Exception {
  final String message;
  final Map<String, String> fieldErrors;
  final AuthFailureKind? kind;

  const AuthFailure(this.message, {this.fieldErrors = const {}, this.kind});

  @override
  String toString() => message;
}

/// Thrown when a stored account's token is no longer valid on the server.
class SessionExpiredFailure implements Exception {
  final String userId;

  const SessionExpiredFailure(this.userId);
}
