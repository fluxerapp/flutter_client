import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';

class ApiException implements Exception {
  const ApiException({this.code, this.message});

  factory ApiException.fromDio(DioException error) {
    return ApiException(
      code: apiErrorCodeFromDioException(error),
      message: apiMessageFromDioException(error),
    );
  }

  factory ApiException.from(Object error) {
    return switch (error) {
      final ApiException e => e,
      final DioException e => ApiException.fromDio(e),
      _ => const ApiException(),
    };
  }

  final String? code;
  final String? message;

  @override
  String toString() => message ?? code ?? 'ApiException';
}
