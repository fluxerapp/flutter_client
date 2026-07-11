enum PhoneVerificationErrorKind {
  invalidPhoneNumber,
  invalidPhoneFormat,
  invalidVerificationCode,
  phoneAlreadyUsed,
  rateLimited,
  smsUnavailable,
  phoneNotEligible,
  captchaRequired,
  unknown,
}

enum PhoneVerificationErrorField { phone, code, general }

class PhoneVerificationFailure {
  const PhoneVerificationFailure({required this.kind, required this.field});

  final PhoneVerificationErrorKind kind;
  final PhoneVerificationErrorField field;
}
