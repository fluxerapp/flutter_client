import 'package:fluxer_app/features/auth/domain/login_error.dart';
import 'package:passkeys/exceptions.dart';

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
    UnhandledAuthenticatorException(:final message) when message != null => (
      null,
      message,
    ),
    _ => (LoginError.passkeyFailed, null),
  };
}
