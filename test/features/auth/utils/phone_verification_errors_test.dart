import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/auth/domain/phone_verification_failure.dart';
import 'package:fluxer_app/features/auth/utils/phone_verification_errors.dart';

DioException _dioException({
  required int? statusCode,
  required Map<String, dynamic> data,
}) {
  return DioException(
    requestOptions: RequestOptions(path: '/test'),
    response: Response<Map<String, dynamic>>(
      requestOptions: RequestOptions(path: '/test'),
      statusCode: statusCode,
      data: data,
    ),
    type: DioExceptionType.badResponse,
  );
}

void main() {
  group('phoneVerificationFailureFromDio', () {
    test('maps invalid phone verification code to code field', () {
      final PhoneVerificationFailure failure = phoneVerificationFailureFromDio(
        _dioException(
          statusCode: 400,
          data: const <String, dynamic>{'code': kInvalidPhoneVerificationCode},
        ),
        context: PhoneVerificationErrorContext.phoneCode,
      );
      expect(failure.kind, PhoneVerificationErrorKind.invalidVerificationCode);
      expect(failure.field, PhoneVerificationErrorField.code);
    });

    test('maps phone already used to phone field', () {
      final PhoneVerificationFailure failure = phoneVerificationFailureFromDio(
        _dioException(
          statusCode: 400,
          data: const <String, dynamic>{'code': kPhoneAlreadyUsedCode},
        ),
      );
      expect(failure.kind, PhoneVerificationErrorKind.phoneAlreadyUsed);
      expect(failure.field, PhoneVerificationErrorField.phone);
    });

    test('maps rate limit responses to general field', () {
      final PhoneVerificationFailure failure = phoneVerificationFailureFromDio(
        _dioException(
          statusCode: 429,
          data: const <String, dynamic>{'code': kPhoneRateLimitExceededCode},
        ),
      );
      expect(failure.kind, PhoneVerificationErrorKind.rateLimited);
      expect(failure.field, PhoneVerificationErrorField.general);
    });

    test('maps invalid form body phone format to phone field', () {
      final PhoneVerificationFailure failure = phoneVerificationFailureFromDio(
        _dioException(
          statusCode: 400,
          data: const <String, dynamic>{
            'code': kInvalidFormBodyCode,
            'errors': <Map<String, String>>[
              <String, String>{
                'path': 'phone',
                'code': kPhoneNumberInvalidFormatCode,
              },
            ],
          },
        ),
      );
      expect(failure.kind, PhoneVerificationErrorKind.invalidPhoneFormat);
      expect(failure.field, PhoneVerificationErrorField.phone);
    });
  });

  test('normalizeVerificationCode strips spaces', () {
    expect(normalizeVerificationCode('12 34 56'), '123456');
  });
}
