import 'package:fluxer_app/features/auth/domain/login_error.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

extension LoginErrorL10n on LoginError {
  String resolve(FluxerLocalizations l10n) {
    return switch (this) {
      LoginError.invalidEmail => l10n.emailInvalid,
      LoginError.invalidCredentials => l10n.errorInvalidEmailOrPassword,
      LoginError.unableToCreateAccount => l10n.errorUnableToCreateAccount,
      LoginError.unableToSignIn => l10n.errorUnableToSignIn,
      LoginError.unableToSendResetLink => l10n.errorUnableToSendResetLink,
      LoginError.unableToResetPassword => l10n.errorUnableToResetPassword,
      LoginError.passkeyNoCredentials => l10n.passkeyNoCredentials,
      LoginError.passkeyDeviceNotSupported => l10n.passkeyDeviceNotSupported,
      LoginError.passkeyDomainNotAssociated => l10n.passkeyDomainNotAssociated,
      LoginError.passkeyTimeout => l10n.passkeyTimeout,
      LoginError.passkeyFailed => l10n.passkeyFailed,
    };
  }
}

/// Returns the display error string from a [LoginViewState], resolving
/// [LoginError] types via l10n and falling back to the raw error message.
String? resolveLoginError(LoginViewState state, FluxerLocalizations l10n) {
  if (state.errorType != null) {
    return state.errorType!.resolve(l10n);
  }
  final msg = state.errorMessage;
  if (msg != null && msg.isNotEmpty) {
    return msg;
  }
  return null;
}
