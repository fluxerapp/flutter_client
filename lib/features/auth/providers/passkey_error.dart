import 'package:fluxer_app/features/auth/domain/login_error.dart';
import 'package:passkeys/exceptions.dart';

/// Maps a passkeys [AuthenticatorException] to a user-facing [LoginError], or
/// to a passthrough message for OS-localized unknown errors.
///
/// Shared by the login and MFA flows so both surface the same friendly copy
/// instead of swallowing the failure. Returns `(errorType, message)` where at
/// most one is non-null: a [LoginError] for known cases, or a raw message for
/// [UnhandledAuthenticatorException] (already localized by the platform).
(LoginError?, String?) mapPasskeyAuthError(AuthenticatorException e) {
  return switch (e) {
    NoCredentialsAvailableException() => (
      LoginError.passkeyNoCredentials,
      null,
    ),
    DeviceNotSupportedException() => (
      LoginError.passkeyDeviceNotSupported,
      null,
    ),
    DomainNotAssociatedException() => (
      LoginError.passkeyDomainNotAssociated,
      null,
    ),
    TimeoutException() => (LoginError.passkeyTimeout, null),
    // TYPE_UNKNOWN includes OS-localized messages (e.g. verification failure,
    // domain mismatch). Pass the message through since it's already in the
    // user's language.
    UnhandledAuthenticatorException(:final message) when message != null => (
      null,
      message,
    ),
    _ => (LoginError.passkeyFailed, null),
  };
}
