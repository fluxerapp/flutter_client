import 'package:dio/dio.dart';

const Set<int> _kHttpServiceUnavailableStatusCodes = <int>{502, 503, 504};

const Duration kServiceUnavailableRetryDelay = Duration(seconds: 3);

class ServiceUnavailableException implements Exception {
  const ServiceUnavailableException({this.statusCode});

  final int? statusCode;

  @override
  String toString() => 'ServiceUnavailableException(statusCode: $statusCode)';
}

bool isHttpServiceUnavailable(Object error) {
  if (error is ServiceUnavailableException) {
    return true;
  }
  if (error is DioException) {
    final int? statusCode = error.response?.statusCode;
    return statusCode != null &&
        _kHttpServiceUnavailableStatusCodes.contains(statusCode);
  }
  return false;
}
