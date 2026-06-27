import 'package:dio/dio.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:opentelemetry/api.dart' as otel;

const String _spanExtraKey = 'fluxer.otel.span';

class FluxerOtelDioInterceptor extends Interceptor {
  const FluxerOtelDioInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final Uri uri = options.uri;
    final otel.Span? span = FluxerObservability.instance.startSpan(
      'HTTP ${options.method.toUpperCase()} ${uri.host}',
      kind: otel.SpanKind.client,
      attributes: <otel.Attribute>[
        otel.Attribute.fromString(
          'http.request.method',
          options.method.toUpperCase(),
        ),
        otel.Attribute.fromString('url.full', _redactedUrl(uri)),
        otel.Attribute.fromString('url.scheme', uri.scheme),
        otel.Attribute.fromString('server.address', uri.host),
        if (uri.hasPort) otel.Attribute.fromInt('server.port', uri.port),
      ],
    );
    if (span != null) {
      options.extra[_spanExtraKey] = span;
      FluxerObservability.instance.injectTraceHeaders(options.headers, span);
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final otel.Span? span = _takeSpan(response.requestOptions);
    final int? statusCode = response.statusCode;
    if (span != null) {
      if (statusCode != null) {
        span.setAttribute(
          otel.Attribute.fromInt('http.response.status_code', statusCode),
        );
        if (statusCode >= 400) {
          span.setStatus(otel.StatusCode.error, 'HTTP $statusCode');
        } else {
          span.setStatus(otel.StatusCode.ok);
        }
      }
      span.end();
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final otel.Span? span = _takeSpan(err.requestOptions);
    if (span != null) {
      final int? statusCode = err.response?.statusCode;
      if (statusCode != null) {
        span.setAttribute(
          otel.Attribute.fromInt('http.response.status_code', statusCode),
        );
      }
      span
        ..recordException(err, escaped: true, stackTrace: err.stackTrace)
        ..setStatus(otel.StatusCode.error, err.type.name)
        ..end();
    }
    handler.next(err);
  }

  otel.Span? _takeSpan(RequestOptions options) {
    final Object? span = options.extra.remove(_spanExtraKey);
    if (span is otel.Span) {
      return span;
    }
    return null;
  }

  String _redactedUrl(Uri uri) {
    return uri.replace(query: '', fragment: '').toString();
  }
}
