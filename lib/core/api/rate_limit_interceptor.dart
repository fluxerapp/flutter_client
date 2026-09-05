import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/retry_after.dart';

const _kPacedExtraKey = '_rateLimitPaced';

class _PaceHit {
  const _PaceHit({required this.until, required this.global, this.note});

  final DateTime until;
  final bool global;
  final String? note;
}

class RateLimitPacer {
  RateLimitPacer({DateTime Function()? now}) : _now = now ?? DateTime.now;

  final DateTime Function() _now;
  final Map<String, _PaceHit> _pacing = {};

  _PaceHit? consult(RequestOptions options) {
    return _activeHit(_globalKey(options)) ?? _activeHit(_pathKey(options));
  }

  void record(Response<dynamic> response) {
    if (response.statusCode != 429) {
      return;
    }
    if (response.requestOptions.extra[_kPacedExtraKey] == true) {
      return;
    }
    final options = response.requestOptions;
    final hit = _PaceHit(
      until: _now().add(
        Duration(
          milliseconds: transportRateLimitDelayMs(
            headers: response.headers,
            data: response.data,
            now: _now,
          ),
        ),
      ),
      global: isGlobalRateLimit(headers: response.headers, data: response.data),
      note: _messageFromBody(response.data),
    );
    _pacing[_pathKey(options)] = hit;
    if (hit.global) {
      _pacing[_globalKey(options)] = hit;
    }
  }

  DioException reject(RequestOptions options, _PaceHit hit) {
    options.extra[_kPacedExtraKey] = true;
    final remainingMs = hit.until.difference(_now()).inMilliseconds;
    final remainingSeconds = (remainingMs < 0 ? 0 : remainingMs) / 1000;
    return DioException(
      requestOptions: options,
      type: DioExceptionType.badResponse,
      response: Response<dynamic>(
        requestOptions: options,
        statusCode: 429,
        statusMessage: 'Too Many Requests',
        headers: Headers.fromMap(<String, List<String>>{
          'retry-after': <String>['${remainingSeconds.ceil()}'],
          Headers.contentTypeHeader: <String>['application/json'],
          if (hit.global) 'x-ratelimit-global': <String>['true'],
        }),
        data: <String, dynamic>{
          'message': hit.note ?? 'You are being rate limited.',
          'retry_after': remainingSeconds,
          'global': hit.global,
        },
      ),
    );
  }

  _PaceHit? _activeHit(String key) {
    final entry = _pacing[key];
    if (entry == null) {
      return null;
    }
    if (!entry.until.isAfter(_now())) {
      _pacing.remove(key);
      return null;
    }
    return entry;
  }

  String _pathKey(RequestOptions options) =>
      '${_origin(options)}${options.path}';

  String _globalKey(RequestOptions options) => 'global:${_origin(options)}';

  String _origin(RequestOptions options) {
    final uri = options.uri;
    if (uri.hasScheme && uri.host.isNotEmpty) {
      return uri.origin;
    }
    return options.baseUrl;
  }

  String? _messageFromBody(Object? data) {
    if (data is! Map) {
      return null;
    }
    final message = data['message'];
    if (message is String && message.isNotEmpty) {
      return message;
    }
    return null;
  }
}

final RateLimitPacer sharedRateLimitPacer = RateLimitPacer();

class RateLimitInterceptor extends Interceptor {
  RateLimitInterceptor({RateLimitPacer? pacer})
    : _pacer = pacer ?? sharedRateLimitPacer;

  final RateLimitPacer _pacer;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final hit = _pacer.consult(options);
    if (hit != null) {
      handler.reject(_pacer.reject(options, hit));
      return;
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _pacer.record(response);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    if (response != null) {
      _pacer.record(response);
    }
    handler.next(err);
  }
}
