import 'package:fluxer_app/features/auth/domain/phone_verification_failure.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

extension PhoneVerificationFailureL10n on PhoneVerificationFailure {
  String resolve(FluxerLocalizations l10n) {
    return switch (kind) {
      PhoneVerificationErrorKind.invalidPhoneNumber =>
        field == PhoneVerificationErrorField.phone
            ? l10n.phoneEnterValidNumber
            : l10n.phoneCannotBeUsed,
      PhoneVerificationErrorKind.invalidPhoneFormat =>
        l10n.phoneEnterValidNumber,
      PhoneVerificationErrorKind.invalidVerificationCode =>
        l10n.phoneCodeDidNotWork,
      PhoneVerificationErrorKind.phoneAlreadyUsed => l10n.phoneAlreadyUsed,
      PhoneVerificationErrorKind.rateLimited => l10n.phoneTooManyAttempts,
      PhoneVerificationErrorKind.smsUnavailable => l10n.phoneSmsUnavailable,
      PhoneVerificationErrorKind.phoneNotEligible => l10n.phoneNotEligible,
      PhoneVerificationErrorKind.captchaRequired => l10n.phoneCaptchaRequired,
      PhoneVerificationErrorKind.unknown => l10n.phoneSomethingWentWrong,
    };
  }
}

String phoneVerificationClientValidationMessage(
  FluxerLocalizations l10n, {
  required bool isEmpty,
}) {
  if (isEmpty) {
    return l10n.phoneNumberRequired;
  }
  return l10n.phoneEnterValidNumber;
}
