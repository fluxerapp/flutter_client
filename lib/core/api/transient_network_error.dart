import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/service_unavailable.dart';
import 'package:http/http.dart' show ClientException;
import 'package:web_socket_channel/web_socket_channel.dart';

bool isTransientIoFailure(Object? error) =>
    error is SocketException || error is TlsException || error is HttpException;

const List<String> kTransientNetworkMessageFragments = <String>[
  'broken pipe',
  'connection closed',
  'connection refused',
  'connection reset',
  'failed host lookup',
  'network is unreachable',
  'software caused connection abort',
];

bool hasTransientNetworkMessage(Object error) {
  final String message = error.toString().toLowerCase();
  for (final String fragment in kTransientNetworkMessageFragments) {
    if (message.contains(fragment)) {
      return true;
    }
  }
  return false;
}

bool walkTransientNetworkError(Object? error, Set<int> seen) {
  if (error == null) {
    return false;
  }
  final int identity = identityHashCode(error);
  if (seen.contains(identity)) {
    return false;
  }
  seen.add(identity);

  if (error is DioException) {
    if (isTransientConnectionError(error) ||
        error.type == DioExceptionType.receiveTimeout ||
        error.response?.statusCode == 429 ||
        isHttpServiceUnavailable(error)) {
      return true;
    }
    if (error.type == DioExceptionType.unknown &&
        isTransientIoFailure(error.error)) {
      return true;
    }
    return walkTransientNetworkError(error.error, seen);
  }

  if (error is TimeoutException ||
      isTransientIoFailure(error) ||
      isHttpServiceUnavailable(error) ||
      httpErrorStatusCode(error) == 429) {
    return true;
  }

  if (error is ClientException) {
    return hasTransientNetworkMessage(error);
  }

  if (error is WebSocketChannelException) {
    if (error.inner != null) {
      return walkTransientNetworkError(error.inner, seen);
    }
    return hasTransientNetworkMessage(error);
  }

  if (error is IOException) {
    return hasTransientNetworkMessage(error);
  }

  return false;
}

bool isTransientConnectionError(DioException error) =>
    error.type == DioExceptionType.connectionError ||
    error.type == DioExceptionType.connectionTimeout ||
    error.type == DioExceptionType.sendTimeout ||
    error.error is HandshakeException;

bool isTransientNetworkError(Object error) {
  return walkTransientNetworkError(error, <int>{});
}
