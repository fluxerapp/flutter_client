import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:dio/dio.dart';

const Set<int> _kHttpServiceUnavailableStatusCodes = <int>{502, 503, 504};

const Duration kServiceUnavailableRetryDelay = Duration(seconds: 3);

class ServiceUnavailableException implements Exception {
  const ServiceUnavailableException({this.statusCode});

  final int? statusCode;

  @override
  String toString() => 'ServiceUnavailableException(statusCode: $statusCode)';
}

int? httpErrorStatusCode(Object error) {
  if (error is ServiceUnavailableException) {
    return error.statusCode;
  }
  if (error is DioException) {
    return error.response?.statusCode;
  }
  if (error is HttpExceptionWithStatus) {
    return error.statusCode;
  }
  return null;
}

bool isHttpServiceUnavailable(Object error) {
  if (error is ServiceUnavailableException) {
    return true;
  }
  final int? statusCode = httpErrorStatusCode(error);
  return statusCode != null &&
      _kHttpServiceUnavailableStatusCodes.contains(statusCode);
}
