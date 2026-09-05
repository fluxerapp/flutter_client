import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/retry_after.dart';

/// Reads the Fluxer API `code` field from a [DioException] response body.
String? apiErrorCodeFromDioException(DioException error) {
  final Object? data = error.response?.data;
  if (data is Map<String, dynamic>) {
    final Object? code = data['code'];
    if (code is String && code.isNotEmpty) {
      return code;
    }
    if (code is int) {
      return code.toString();
    }
  }
  return null;
}

/// Reads the retry window from a [DioException], preferring body fields then
/// `Retry-After` / `X-RateLimit-Reset-After` headers.
int? retryAfterMsFromDioException(DioException error) {
  return featureRetryAfterMs(
    headers: error.response?.headers,
    data: error.response?.data,
  );
}

/// Reads the Fluxer API `message` field from a [DioException] response body.
String? apiMessageFromDioException(DioException error) {
  final Object? data = error.response?.data;
  if (data is Map<String, dynamic>) {
    final String? message = data['message'] as String?;
    if (message != null && message.isNotEmpty) {
      return message;
    }
  }
  return null;
}

/// Returns [apiMessageFromDioException], then the transport message, then [fallback].
String dioExceptionMessage(DioException error, String fallback) {
  final String? apiMessage = apiMessageFromDioException(error);
  if (apiMessage != null) {
    return apiMessage;
  }
  final String? transportMessage = error.message;
  if (transportMessage != null && transportMessage.isNotEmpty) {
    return transportMessage;
  }
  return fallback;
}

/// Returns a user facing message for [error].
///
/// For [DioException], the Fluxer API `message` field is preferred. Otherwise
/// [fallback] is returned.
String userFacingErrorMessage(Object error, String fallback) {
  if (error is DioException) {
    return apiMessageFromDioException(error) ?? fallback;
  }
  return fallback;
}
