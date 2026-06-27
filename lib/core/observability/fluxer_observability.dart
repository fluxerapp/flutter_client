import 'dart:async';
import 'dart:isolate';

import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/providers/app_runtime_info.dart';
import 'package:opentelemetry/api.dart' as otel;
import 'package:opentelemetry/sdk.dart' as otel_sdk;
import 'package:shared_preferences/shared_preferences.dart';

const String _kObservabilitySessionActiveKey = 'observability_session_active';

class FluxerObservability {
  FluxerObservability._();

  static final FluxerObservability instance = FluxerObservability._();

  otel_sdk.TracerProviderBase? _provider;
  otel.Tracer? _tracer;
  otel.W3CTraceContextPropagator? _propagator;
  RawReceivePort? _isolateErrorPort;
  bool _runtimeObserversStarted = false;
  bool _sessionStarted = false;
  bool _enabled = false;

  bool get isEnabled => _enabled && _tracer != null;

  Future<void> start({AppRuntimeInfo? runtimeInfo}) async {
    if (!AppBuildConfig.hasObservabilityConfig) {
      return;
    }
    _enabled = true;
    _ensureInitialized(runtimeInfo: runtimeInfo);
    _startRuntimeObservers();
    await _markSessionStarted();
  }

  Future<void> stop() async {
    _enabled = false;
    _provider?.forceFlush();
  }

  void forceFlush() {
    _provider?.forceFlush();
  }

  otel.Span? startSpan(
    String name, {
    otel.SpanKind kind = otel.SpanKind.internal,
    List<otel.Attribute> attributes = const <otel.Attribute>[],
  }) {
    if (!isEnabled) {
      return null;
    }
    return _tracer!.startSpan(name, kind: kind, attributes: attributes);
  }

  Future<T> traceAsync<T>(
    String name,
    Future<T> Function() body, {
    otel.SpanKind kind = otel.SpanKind.internal,
    List<otel.Attribute> attributes = const <otel.Attribute>[],
  }) async {
    final otel.Span? span = startSpan(name, kind: kind, attributes: attributes);
    if (span == null) {
      return body();
    }
    try {
      final T result = await body();
      span.setStatus(otel.StatusCode.ok);
      return result;
    } on Object catch (error, stackTrace) {
      _recordExceptionOnSpan(span, error, stackTrace);
      rethrow;
    } finally {
      span.end();
    }
  }

  T traceSync<T>(
    String name,
    T Function() body, {
    otel.SpanKind kind = otel.SpanKind.internal,
    List<otel.Attribute> attributes = const <otel.Attribute>[],
  }) {
    final otel.Span? span = startSpan(name, kind: kind, attributes: attributes);
    if (span == null) {
      return body();
    }
    try {
      final T result = body();
      span.setStatus(otel.StatusCode.ok);
      return result;
    } on Object catch (error, stackTrace) {
      _recordExceptionOnSpan(span, error, stackTrace);
      rethrow;
    } finally {
      span.end();
    }
  }

  void injectTraceHeaders(Map<String, dynamic> headers, otel.Span span) {
    if (!isEnabled) {
      return;
    }
    _propagator?.inject(
      otel.contextWithSpan(otel.Context.current, span),
      headers,
      const _DioHeaderSetter(),
    );
  }

  void recordFlutterError(FlutterErrorDetails details) {
    recordError(
      details.exception,
      stackTrace: details.stack,
      source: details.library ?? 'flutter',
      context: details.context?.toDescription(),
    );
  }

  void recordError(
    Object error, {
    required String source,
    StackTrace? stackTrace,
    String? context,
  }) {
    final otel.Span? span = startSpan(
      'flutter.error',
      attributes: <otel.Attribute>[
        otel.Attribute.fromString('exception.source', source),
        if (context != null && context.trim().isNotEmpty)
          otel.Attribute.fromString('exception.context', context.trim()),
      ],
    );
    if (span == null) {
      return;
    }
    _recordExceptionOnSpan(span, error, stackTrace ?? StackTrace.current);
    span.end();
  }

  void recordLifecycleState(AppLifecycleState state) {
    final otel.Span? span = startSpan(
      'app.lifecycle',
      attributes: <otel.Attribute>[
        otel.Attribute.fromString('app.lifecycle.state', state.name),
      ],
    );
    span?.end();
    if (state == AppLifecycleState.detached) {
      unawaited(_markSessionCleanExit());
    }
  }

  void _ensureInitialized({AppRuntimeInfo? runtimeInfo}) {
    if (_tracer != null) {
      return;
    }
    final Uri endpoint = Uri.parse(AppBuildConfig.signozOtlpTracesEndpoint);
    final otel_sdk.CollectorExporter exporter = otel_sdk.CollectorExporter(
      endpoint,
    );
    final otel_sdk.BatchSpanProcessor processor = otel_sdk.BatchSpanProcessor(
      exporter,
    );
    final otel_sdk.TracerProviderBase provider = otel_sdk.TracerProviderBase(
      processors: <otel_sdk.SpanProcessor>[processor],
      resource: otel_sdk.Resource(_buildResourceAttributes(runtimeInfo)),
    );
    _provider = provider;
    _propagator = otel.W3CTraceContextPropagator();
    _tracer = provider.getTracer('fluxer-flutter', version: '1.0.0');
  }

  void _recordExceptionOnSpan(
    otel.Span span,
    Object error,
    StackTrace stackTrace,
  ) {
    span
      ..recordException(error, escaped: true, stackTrace: stackTrace)
      ..setStatus(otel.StatusCode.error, error.toString());
  }

  Future<void> _markSessionStarted() async {
    if (_sessionStarted) {
      return;
    }
    _sessionStarted = true;
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final bool previousSessionWasActive =
          preferences.getBool(_kObservabilitySessionActiveKey) ?? false;
      await preferences.setBool(_kObservabilitySessionActiveKey, true);
      if (previousSessionWasActive) {
        final otel.Span? span = startSpan(
          'app.previous_session_unclean_exit',
          attributes: <otel.Attribute>[
            otel.Attribute.fromBoolean('app.crash.detected', true),
          ],
        );
        span?.setStatus(
          otel.StatusCode.error,
          'Previous app session did not exit cleanly',
        );
        span?.end();
      }
    } on Object {
      // Session crash detection should never block app startup.
    }
  }

  Future<void> _markSessionCleanExit() async {
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setBool(_kObservabilitySessionActiveKey, false);
    } on Object {
      // Best-effort shutdown marker only.
    }
  }

  void _startRuntimeObservers() {
    if (_runtimeObserversStarted) {
      return;
    }
    _runtimeObserversStarted = true;
    SchedulerBinding.instance.addTimingsCallback(_recordFrameTimings);
    WidgetsBinding.instance.addObserver(_FluxerAppLifecycleObserver());
    _startIsolateErrorListener();
  }

  void _startIsolateErrorListener() {
    if (_isolateErrorPort != null) {
      return;
    }
    final RawReceivePort port = RawReceivePort((dynamic message) {
      final _IsolateError isolateError = _parseIsolateError(message);
      recordError(
        isolateError.error,
        source: 'isolate',
        stackTrace: isolateError.stackTrace,
      );
      forceFlush();
    });
    _isolateErrorPort = port;
    Isolate.current.addErrorListener(port.sendPort);
  }

  _IsolateError _parseIsolateError(dynamic message) {
    if (message is List<dynamic> && message.isNotEmpty) {
      final Object error = message.first is Object
          ? message.first as Object
          : 'Unknown isolate error';
      final StackTrace? stackTrace = message.length > 1 && message[1] != null
          ? StackTrace.fromString(message[1].toString())
          : null;
      return _IsolateError(error: error, stackTrace: stackTrace);
    }
    return _IsolateError(
      error: message is Object ? message : 'Unknown isolate error',
    );
  }

  void _recordFrameTimings(List<FrameTiming> timings) {
    if (!isEnabled) {
      return;
    }
    for (final FrameTiming timing in timings) {
      final Duration total = timing.totalSpan;
      final Duration build = timing.buildDuration;
      final Duration raster = timing.rasterDuration;
      final bool slowBuild = build.inMilliseconds >= 16;
      final bool slowRaster = raster.inMilliseconds >= 16;
      final bool janky = total.inMilliseconds >= 33;
      if (!slowBuild && !slowRaster && !janky) {
        continue;
      }
      final otel.Span? span = startSpan(
        'flutter.frame',
        attributes: <otel.Attribute>[
          otel.Attribute.fromInt('frame.total_us', total.inMicroseconds),
          otel.Attribute.fromInt('frame.build_us', build.inMicroseconds),
          otel.Attribute.fromInt('frame.raster_us', raster.inMicroseconds),
          otel.Attribute.fromInt(
            'frame.vsync_overhead_us',
            timing.vsyncOverhead.inMicroseconds,
          ),
          otel.Attribute.fromBoolean('frame.slow_build', slowBuild),
          otel.Attribute.fromBoolean('frame.slow_raster', slowRaster),
          otel.Attribute.fromBoolean('frame.janky', janky),
          otel.Attribute.fromString(
            'frame.performance_class',
            _framePerformanceClass(total),
          ),
        ],
      );
      span?.end();
    }
  }

  String _framePerformanceClass(Duration total) {
    if (total.inMilliseconds >= 100) {
      return 'frozen';
    }
    if (total.inMilliseconds >= 33) {
      return 'janky';
    }
    return 'slow';
  }

  List<otel.Attribute> _buildResourceAttributes(AppRuntimeInfo? runtimeInfo) {
    final String releaseChannel = mapAppBuildEnvironmentToReleaseChannel(
      runtimeInfo?.environment ?? AppBuildConfig.environment,
    );
    final String? releaseVersion = normalizeOptionalString(
      runtimeInfo?.releaseVersion,
    );
    final String? buildNumber = normalizeOptionalString(
      runtimeInfo?.buildNumber,
    );
    final String? packageName = normalizeOptionalString(
      runtimeInfo?.packageName,
    );
    final List<otel.Attribute> attributes = <otel.Attribute>[
      otel.Attribute.fromString('service.name', 'fluxer-flutter'),
      otel.Attribute.fromString('service.namespace', 'fluxer'),
      otel.Attribute.fromString('deployment.environment', releaseChannel),
      otel.Attribute.fromString('deployment.environment.name', releaseChannel),
      otel.Attribute.fromString('telemetry.sdk.language', 'dart'),
      otel.Attribute.fromString('telemetry.distro.name', 'fluxer'),
    ];
    if (releaseVersion != null) {
      attributes.add(
        otel.Attribute.fromString('service.version', releaseVersion),
      );
    }
    if (buildNumber != null) {
      attributes.add(
        otel.Attribute.fromString('app.build_number', buildNumber),
      );
    }
    if (packageName != null) {
      attributes.add(
        otel.Attribute.fromString('app.package_name', packageName),
      );
    }
    return attributes;
  }
}

class _IsolateError {
  const _IsolateError({required this.error, this.stackTrace});

  final Object error;
  final StackTrace? stackTrace;
}

class _FluxerAppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    FluxerObservability.instance.recordLifecycleState(state);
  }
}

class _DioHeaderSetter implements otel.TextMapSetter<Map<String, dynamic>> {
  const _DioHeaderSetter();

  @override
  void set(Map<String, dynamic> carrier, String key, String value) {
    carrier[key] = value;
  }
}
