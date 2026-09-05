import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/service_unavailable.dart';

DioException _dio({
  int? statusCode,
  DioExceptionType type = DioExceptionType.badResponse,
}) {
  return DioException(
    requestOptions: RequestOptions(path: '/test'),
    type: type,
    response: statusCode == null
        ? null
        : Response<dynamic>(
            requestOptions: RequestOptions(path: '/test'),
            statusCode: statusCode,
          ),
  );
}

void main() {
  group('isHttpServiceUnavailable', () {
    test('is true for 502, 503, and 504', () {
      expect(isHttpServiceUnavailable(_dio(statusCode: 502)), isTrue);
      expect(isHttpServiceUnavailable(_dio(statusCode: 503)), isTrue);
      expect(isHttpServiceUnavailable(_dio(statusCode: 504)), isTrue);
    });

    test('is true for ServiceUnavailableException', () {
      expect(
        isHttpServiceUnavailable(
          const ServiceUnavailableException(statusCode: 503),
        ),
        isTrue,
      );
    });

    test('is false for 401, 429, and connection timeouts', () {
      expect(isHttpServiceUnavailable(_dio(statusCode: 401)), isFalse);
      expect(isHttpServiceUnavailable(_dio(statusCode: 429)), isFalse);
      expect(
        isHttpServiceUnavailable(
          _dio(type: DioExceptionType.connectionTimeout),
        ),
        isFalse,
      );
    });
  });
}
