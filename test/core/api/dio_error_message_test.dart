import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';

void main() {
  group('apiMessageFromDioException', () {
    test('returns message from response map', () {
      final DioException error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response<dynamic>(
          requestOptions: RequestOptions(path: '/test'),
          data: <String, dynamic>{'message': 'Invite expired'},
        ),
      );
      expect(apiMessageFromDioException(error), 'Invite expired');
    });

    test('returns null when message is missing', () {
      final DioException error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response<dynamic>(
          requestOptions: RequestOptions(path: '/test'),
          data: <String, dynamic>{},
        ),
      );
      expect(apiMessageFromDioException(error), isNull);
    });
  });

  group('retryAfterMsFromDioException', () {
    test('converts retry_after seconds to milliseconds', () {
      final DioException error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response<dynamic>(
          requestOptions: RequestOptions(path: '/test'),
          data: <String, dynamic>{'retry_after': 18.5},
        ),
      );
      expect(retryAfterMsFromDioException(error), 18500);
    });

    test('returns null when retry_after is missing', () {
      final DioException error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response<dynamic>(
          requestOptions: RequestOptions(path: '/test'),
          data: <String, dynamic>{},
        ),
      );
      expect(retryAfterMsFromDioException(error), isNull);
    });

    test('falls back to Retry-After header when body has no window', () {
      final DioException error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response<dynamic>(
          requestOptions: RequestOptions(path: '/test'),
          data: <String, dynamic>{},
          headers: Headers.fromMap(<String, List<String>>{
            'retry-after': <String>['3'],
          }),
        ),
      );
      expect(retryAfterMsFromDioException(error), 3000);
    });
  });

  group('dioExceptionMessage', () {
    test('prefers API message over fallback', () {
      final DioException error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response<dynamic>(
          requestOptions: RequestOptions(path: '/test'),
          data: <String, dynamic>{'message': 'Rate limited'},
        ),
      );
      expect(dioExceptionMessage(error, 'fallback'), 'Rate limited');
    });

    test('uses fallback when response has no message', () {
      final DioException error = DioException(
        requestOptions: RequestOptions(path: '/test'),
      );
      expect(dioExceptionMessage(error, 'fallback'), 'fallback');
    });
  });
}
