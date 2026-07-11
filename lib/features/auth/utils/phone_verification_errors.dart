import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/features/auth/domain/phone_verification_failure.dart';

const String kInvalidFormBodyCode = 'INVALID_FORM_BODY';
const String kPhoneNumberInvalidFormatCode = 'PHONE_NUMBER_INVALID_FORMAT';
const String kInvalidPhoneNumberCode = 'INVALID_PHONE_NUMBER';
const String kInvalidPhoneVerificationCode = 'INVALID_PHONE_VERIFICATION_CODE';
const String kPhoneAlreadyUsedCode = 'PHONE_ALREADY_USED';
const String kPhoneRateLimitExceededCode = 'PHONE_RATE_LIMIT_EXCEEDED';
const String kRateLimitedCode = 'RATE_LIMITED';
const String kSmsVerificationUnavailableCode = 'SMS_VERIFICATION_UNAVAILABLE';
const String kPhoneAddNotEligibleCode = 'PHONE_ADD_NOT_ELIGIBLE';
const String kPhoneVerificationRequiredCode = 'PHONE_VERIFICATION_REQUIRED';
const String kCaptchaRequiredCode = 'CAPTCHA_REQUIRED';
const String kInvalidCaptchaCode = 'INVALID_CAPTCHA';

enum PhoneVerificationErrorContext { phoneNumber, phoneCode, general }

String? _firstValidationCode(DioException error) {
  final Object? data = error.response?.data;
  if (data is! Map<String, dynamic>) {
    return null;
  }
  final Object? errors = data['errors'];
  if (errors is! List<dynamic>) {
    return null;
  }
  for (final Object? item in errors) {
    if (item is Map<String, dynamic>) {
      final Object? code = item['code'];
      if (code is String && code.isNotEmpty) {
        return code;
      }
    }
  }
  return null;
}

bool _isRateLimited(DioException error) {
  final int? status = error.response?.statusCode;
  final String? apiCode = apiErrorCodeFromDioException(error);
  if (status == 429 ||
      apiCode == kPhoneRateLimitExceededCode ||
      apiCode == kRateLimitedCode) {
    return true;
  }
  final Object? data = error.response?.data;
  if (data is Map<String, dynamic> && data['retry_after'] is num) {
    return true;
  }
  return false;
}

PhoneVerificationFailure phoneVerificationFailureFromDio(
  DioException error, {
  PhoneVerificationErrorContext context = PhoneVerificationErrorContext.general,
}) {
  if (_isRateLimited(error)) {
    return const PhoneVerificationFailure(
      kind: PhoneVerificationErrorKind.rateLimited,
      field: PhoneVerificationErrorField.general,
    );
  }
  final String? apiCode = apiErrorCodeFromDioException(error);
  if (apiCode == kInvalidFormBodyCode) {
    final String? validationCode = _firstValidationCode(error);
    if (validationCode == kPhoneNumberInvalidFormatCode) {
      return const PhoneVerificationFailure(
        kind: PhoneVerificationErrorKind.invalidPhoneFormat,
        field: PhoneVerificationErrorField.phone,
      );
    }
  }
  return switch (apiCode) {
    kInvalidPhoneNumberCode => PhoneVerificationFailure(
      kind: PhoneVerificationErrorKind.invalidPhoneNumber,
      field: context == PhoneVerificationErrorContext.phoneNumber
          ? PhoneVerificationErrorField.phone
          : PhoneVerificationErrorField.general,
    ),
    kInvalidPhoneVerificationCode => const PhoneVerificationFailure(
      kind: PhoneVerificationErrorKind.invalidVerificationCode,
      field: PhoneVerificationErrorField.code,
    ),
    kPhoneAlreadyUsedCode => const PhoneVerificationFailure(
      kind: PhoneVerificationErrorKind.phoneAlreadyUsed,
      field: PhoneVerificationErrorField.phone,
    ),
    kSmsVerificationUnavailableCode => const PhoneVerificationFailure(
      kind: PhoneVerificationErrorKind.smsUnavailable,
      field: PhoneVerificationErrorField.general,
    ),
    kPhoneAddNotEligibleCode ||
    kPhoneVerificationRequiredCode => const PhoneVerificationFailure(
      kind: PhoneVerificationErrorKind.phoneNotEligible,
      field: PhoneVerificationErrorField.general,
    ),
    kCaptchaRequiredCode ||
    kInvalidCaptchaCode => const PhoneVerificationFailure(
      kind: PhoneVerificationErrorKind.captchaRequired,
      field: PhoneVerificationErrorField.general,
    ),
    _ => const PhoneVerificationFailure(
      kind: PhoneVerificationErrorKind.unknown,
      field: PhoneVerificationErrorField.general,
    ),
  };
}

String normalizeVerificationCode(String code) {
  return code.split(' ').join();
}
