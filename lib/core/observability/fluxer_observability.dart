import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/observability/error_log_rate_limiter.dart';
import 'package:fluxer_app/core/observability/measure_log_redaction.dart';
import 'package:fluxer_app/core/providers/app_runtime_info.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/voice/utils/voice_lifecycle_breadcrumb.dart';
import 'package:measure_flutter/measure_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kObservabilitySessionActiveKey = 'observability_session_active';

class FluxerObservability {
  FluxerObservability._();

  static final FluxerObservability instance = FluxerObservability._();

  RawReceivePort? _isolateErrorPort;
  bool _runtimeObserversStarted = false;
  bool _sessionStarted = false;
  bool _enabled = false;
  Future<void>? _measureInitFuture;
  bool _measureInitialized = false;
  final ErrorLogRateLimiter _errorLogRateLimiter = ErrorLogRateLimiter();

  bool get isEnabled => _enabled;

  bool get isSdkAvailable => _measureInitialized;

  Future<void> prepare() async {
    if (!AppBuildConfig.hasObservabilityConfig) {
      return;
    }
    await _ensureMeasureInitialized();
    if (!_measureInitialized) {
      talker.warning('[Measure] Native API key/URL missing');
    }
  }

  Future<void> start({AppRuntimeInfo? runtimeInfo}) async {
    if (!AppBuildConfig.hasObservabilityConfig) {
      return;
    }
    await _ensureMeasureInitialized();
    if (!_measureInitialized) {
      talker.warning('[Measure] Cannot start without native SDK configuration');
      return;
    }
    await Measure.instance.start();
    _enabled = true;
    talker.info('[Measure] Started');
    _startRuntimeObservers();
    await _markSessionStarted(runtimeInfo: runtimeInfo);
  }

  Future<void> stop() async {
    _enabled = false;
    if (_measureInitialized) {
      await Measure.instance.stop();
    }
  }

  void forceFlush() {}

  Span? startSpan(
    String name, {
    Map<String, AttributeValue> attributes = const <String, AttributeValue>{},
  }) {
    if (!isEnabled) {
      return null;
    }
    final Span span = Measure.instance.startSpan(name);
    if (attributes.isNotEmpty) {
      span.setAttributes(attributes);
    }
    return span;
  }

  Future<T> traceAsync<T>(
    String name,
    Future<T> Function() body, {
    Map<String, AttributeValue> attributes = const <String, AttributeValue>{},
  }) async {
    final Span? span = startSpan(name, attributes: attributes);
    if (span == null) {
      return body();
    }
    try {
      final T result = await body();
      span.setStatus(SpanStatus.ok);
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
    Map<String, AttributeValue> attributes = const <String, AttributeValue>{},
  }) {
    final Span? span = startSpan(name, attributes: attributes);
    if (span == null) {
      return body();
    }
    try {
      final T result = body();
      span.setStatus(SpanStatus.ok);
      return result;
    } on Object catch (error, stackTrace) {
      _recordExceptionOnSpan(span, error, stackTrace);
      rethrow;
    } finally {
      span.end();
    }
  }

  void injectTraceHeaders(Map<String, dynamic> headers, Span span) {
    if (!isEnabled || span.hasEnded()) {
      return;
    }
    headers[Measure.instance.getTraceParentHeaderKey()] = Measure.instance
        .getTraceParentHeaderValue(span);
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
    if (!_errorLogRateLimiter.shouldLog(
      error: error,
      stackTrace: stackTrace,
      source: source,
    )) {
      return;
    }
    final String trimmedContext = context?.trim() ?? '';
    talker.handle(
      error,
      stackTrace,
      trimmedContext.isEmpty ? source : '$source: $trimmedContext',
    );
    if (!isEnabled) {
      return;
    }
    final Map<String, AttributeValue> attributes = <String, AttributeValue>{
      'exception.source': StringAttr(source),
      if (trimmedContext.isNotEmpty)
        'exception.context': StringAttr(
          redactDomainsForMeasure(trimmedContext),
        ),
    };
    final StackTrace effectiveStack = stackTrace ?? StackTrace.current;
    unawaited(
      Measure.instance.trackHandledError(
        sanitizeErrorForMeasure(error),
        sanitizeStackTraceForMeasure(effectiveStack),
        attributes: attributes,
      ),
    );
  }

  void recordLifecycleState(AppLifecycleState state) {
    if (!isEnabled) {
      return;
    }
    final Span? span = startSpan(
      'app.lifecycle',
      attributes: <String, AttributeValue>{
        'app.lifecycle.state': StringAttr(state.name),
      },
    );
    span?.end();
    if (state == AppLifecycleState.detached) {
      unawaited(_markSessionCleanExit());
    }
  }

  Future<void> _ensureMeasureInitialized() async {
    if (_measureInitialized) {
      return;
    }
    _measureInitFuture ??= Measure.instance.init(
      () {},
      config: const MeasureConfig(autoStart: false, enableLogging: kDebugMode),
    );
    await _measureInitFuture;
    final Span probe = Measure.instance.startSpan('fluxer.sdk_probe');
    _measureInitialized = probe.traceId != 'invalid-trace-id';
    if (_measureInitialized) {
      probe.end();
    }
  }

  void _recordExceptionOnSpan(Span span, Object error, StackTrace stackTrace) {
    span
      ..setStatus(SpanStatus.error)
      ..setAttributeString(
        'exception.message',
        redactDomainsForMeasure(error.toString()),
      );
    unawaited(
      Measure.instance.trackHandledError(
        sanitizeErrorForMeasure(error),
        sanitizeStackTraceForMeasure(stackTrace),
      ),
    );
  }

  Future<void> _markSessionStarted({AppRuntimeInfo? runtimeInfo}) async {
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
        final Map<String, String>? voiceBreadcrumb =
            await readVoiceLifecycleBreadcrumb();
        final AttributeBuilder attributes = AttributeBuilder().add(
          'app.crash.detected',
          true,
        );
        if (voiceBreadcrumb != null) {
          for (final MapEntry<String, String> entry
              in voiceBreadcrumb.entries) {
            attributes.add(entry.key, redactDomainsForMeasure(entry.value));
          }
        }
        Measure.instance.trackEvent(
          name: 'app.previous_session_unclean_exit',
          attributes: attributes.build(),
        );
        await clearVoiceLifecycleBreadcrumb();
      }
      _trackSessionContext(runtimeInfo);
    } on Object {}
  }

  void _trackSessionContext(AppRuntimeInfo? runtimeInfo) {
    if (!isEnabled) {
      return;
    }
    final String releaseChannel = mapAppBuildEnvironmentToReleaseChannel(
      runtimeInfo?.environment ?? AppBuildConfig.environment,
    );
    final AttributeBuilder attributes = AttributeBuilder().add(
      'deployment.environment',
      releaseChannel,
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
    if (releaseVersion != null) {
      attributes.add('service.version', releaseVersion);
    }
    if (buildNumber != null) {
      attributes.add('app.build_number', buildNumber);
    }
    if (packageName != null) {
      attributes.add('app.package_name', packageName);
    }
    Measure.instance.trackEvent(
      name: 'app.observability_session_started',
      attributes: attributes.build(),
    );
  }

  Future<void> _markSessionCleanExit() async {
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setBool(_kObservabilitySessionActiveKey, false);
    } on Object {}
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
      final Span? span = startSpan(
        'flutter.frame',
        attributes: <String, AttributeValue>{
          'frame.total_us': IntAttr(total.inMicroseconds),
          'frame.build_us': IntAttr(build.inMicroseconds),
          'frame.raster_us': IntAttr(raster.inMicroseconds),
          'frame.vsync_overhead_us': IntAttr(
            timing.vsyncOverhead.inMicroseconds,
          ),
          'frame.slow_build': BooleanAttr(slowBuild),
          'frame.slow_raster': BooleanAttr(slowRaster),
          'frame.janky': BooleanAttr(janky),
          'frame.performance_class': StringAttr(_framePerformanceClass(total)),
        },
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
