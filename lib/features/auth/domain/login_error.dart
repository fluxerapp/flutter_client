/// User-facing error categories surfaced by the auth flows (login + MFA).
///
/// These are resolved to localized copy by `LoginErrorL10n` in
/// `lib/features/auth/providers/login_error_l10n.dart`.
enum LoginError {
  invalidEmail,
  invalidCredentials,
  unableToCreateAccount,
  unableToSignIn,
  unableToSendResetLink,
  unableToResetPassword,
  passkeyNoCredentials,
  passkeyDeviceNotSupported,
  passkeyDomainNotAssociated,
  passkeyTimeout,
  passkeyFailed,
}
