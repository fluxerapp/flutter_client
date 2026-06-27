import 'package:dio/dio.dart';

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
