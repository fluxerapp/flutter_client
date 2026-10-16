import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';
import 'package:fluxer_app/core/observability/error_log_rate_limiter.dart';
import 'package:fluxer_app/core/observability/measure_log_redaction.dart';
import 'package:fluxer_app/core/observability/measure_native_reporting.dart';
import 'package:fluxer_app/core/observability/measure_trace.dart';
import 'package:fluxer_app/core/observability/measure_version_metadata.dart';
import 'package:fluxer_app/core/providers/app_runtime_info.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/voice/utils/voice_lifecycle_breadcrumb.dart';
import 'package:measure_flutter/measure_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kObservabilitySessionActiveKey = 'observability_session_active';

class FluxerObservability {
  FluxerObservability._(this._measure, this._initializeNative);

  @visibleForTesting
  FluxerObservability.forTesting(this._measure, this._initializeNative)
    : _measureInitialized = true;

  static final FluxerObservability instance = FluxerObservability._(
    Measure.instance,
    initializeNativeMeasure,
  );

  final MeasureApi _measure;
  final Future<bool> Function() _initializeNative;

  RawReceivePort? _isolateErrorPort;
  bool _runtimeObserversStarted = false;
  bool _sessionStarted = false;
  bool _enabled = false;
  Future<void>? _measureInitFuture;
  bool _measureInitialized = false;
  bool _globalErrorHandlersInstalled = false;
  final ErrorLogRateLimiter _errorLogRateLimiter = ErrorLogRateLimiter();
  final Map<String, _SpanLogContext> _spanLogContext =
      <String, _SpanLogContext>{};

  bool get isEnabled => _enabled;

  bool get isSdkAvailable => _measureInitialized;

  bool get _shouldSendErrorsToMeasure => isEnabled && _measureInitialized;

  Future<void> prepare() async {
    if (!AppBuildConfig.hasObservabilityConfig) {
      return;
    }
    await _ensureMeasureInitialized();
    if (!_measureInitialized) {
      talker.warning('[Measure] SDK failed to initialize');
    }
  }

  Future<void> start({AppRuntimeInfo? runtimeInfo}) async {
    if (!AppBuildConfig.hasObservabilityConfig) {
      return;
    }
    await _ensureMeasureInitialized();
    if (!_measureInitialized) {
      talker.warning('[Measure] Cannot start before SDK init');
      return;
    }
    if (!await _initializeNative()) {
      talker.warning('[Measure] Native SDK is not configured');
      return;
    }
    await _measure.start();
    _enabled = true;
    talker.info('[Measure] Started');
    _startRuntimeObservers();
    await _markSessionStarted(runtimeInfo: runtimeInfo);
  }

  Future<void> stop() async {
    _enabled = false;
    if (_measureInitialized) {
      await _measure.stop();
    }
  }

  void forceFlush() {}

  Span? startSpan(
    String name, {
    Map<String, AttributeValue> attributes = const <String, AttributeValue>{},
    String? caller,
    StackTrace? stackTrace,
    bool logWhenFinished = true,
  }) {
    if (!isEnabled) {
      return null;
    }
    final Map<String, AttributeValue> resolvedAttributes =
        measureTraceAttributes(
          attributes: attributes,
          caller: caller,
          stackTrace: stackTrace,
        );
    final Span span = _measure.startSpan(name);
    if (resolvedAttributes.isNotEmpty) {
      span.setAttributes(resolvedAttributes);
    }
    final String? resolvedCaller =
        resolvedAttributes[kMeasureTraceCallerAttribute]?.value as String? ??
        caller;
    _spanLogContext[span.spanId] = _SpanLogContext(
      name: name,
      caller: resolvedCaller,
      logWhenFinished: logWhenFinished,
    );
    return span;
  }

  Future<T> traceAsync<T>(
    String name,
    Future<T> Function() body, {
    Map<String, AttributeValue> attributes = const <String, AttributeValue>{},
    String? caller,
    MeasureTraceKind kind = MeasureTraceKind.app,
  }) async {
    if (kind == MeasureTraceKind.network) {
      return body();
    }
    final StackTrace startStack = StackTrace.current;
    final Span? span = startSpan(
      name,
      attributes: attributes,
      caller: caller,
      stackTrace: startStack,
    );
    if (span == null) {
      return body();
    }
    final Stopwatch stopwatch = Stopwatch()..start();
    SpanStatus status = SpanStatus.ok;
    try {
      final T result = await body();
      span.setStatus(SpanStatus.ok);
      return result;
    } on Object catch (error, stackTrace) {
      status = SpanStatus.error;
      _recordExceptionOnSpan(span, error, stackTrace);
      rethrow;
    } finally {
      stopwatch.stop();
      _endObservabilitySpan(span, elapsed: stopwatch.elapsed, status: status);
    }
  }

  T traceSync<T>(
    String name,
    T Function() body, {
    Map<String, AttributeValue> attributes = const <String, AttributeValue>{},
    String? caller,
    MeasureTraceKind kind = MeasureTraceKind.app,
  }) {
    if (kind == MeasureTraceKind.network) {
      return body();
    }
    final StackTrace startStack = StackTrace.current;
    final Span? span = startSpan(
      name,
      attributes: attributes,
      caller: caller,
      stackTrace: startStack,
    );
    if (span == null) {
      return body();
    }
    final Stopwatch stopwatch = Stopwatch()..start();
    SpanStatus status = SpanStatus.ok;
    try {
      final T result = body();
      span.setStatus(SpanStatus.ok);
      return result;
    } on Object catch (error, stackTrace) {
      status = SpanStatus.error;
      _recordExceptionOnSpan(span, error, stackTrace);
      rethrow;
    } finally {
      stopwatch.stop();
      _endObservabilitySpan(span, elapsed: stopwatch.elapsed, status: status);
    }
  }

  void _endObservabilitySpan(
    Span span, {
    Duration? elapsed,
    SpanStatus? status,
    String? detail,
  }) {
    final _SpanLogContext? context = _spanLogContext.remove(span.spanId);
    span.end();
    if (context == null || elapsed == null) {
      return;
    }
    _logFinishedTrace(
      name: context.name,
      elapsed: elapsed,
      caller: context.caller,
      detail: detail,
      status: status,
      logWhenFinished: context.logWhenFinished,
    );
  }

  void _logFinishedTrace({
    required String name,
    required Duration elapsed,
    String? caller,
    String? detail,
    SpanStatus? status,
    bool logWhenFinished = true,
  }) {
    if (!isEnabled || !logWhenFinished) {
      return;
    }
    final int durationMs = elapsed.inMilliseconds;
    final bool failed = status == SpanStatus.error;
    if (!failed && durationMs < kMeasureTraceLocalLogMinDurationMs) {
      return;
    }
    talker.info(
      '[Measure] ${formatMeasureTraceLogLine(name: name, durationMs: durationMs, caller: caller, detail: detail, status: status)}',
    );
  }

  void injectTraceHeaders(Map<String, dynamic> headers, Span span) {
    if (!isEnabled || span.hasEnded()) {
      return;
    }
    headers[_measure.getTraceParentHeaderKey()] = _measure
        .getTraceParentHeaderValue(span);
  }

  void installGlobalErrorHandlers() {
    if (_globalErrorHandlersInstalled) {
      return;
    }
    _globalErrorHandlersInstalled = true;
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      recordFlutterError(details);
    };
  }

  void recordFlutterError(FlutterErrorDetails details) {
    _logErrorToTalker(
      details.exception,
      stackTrace: details.stack,
      source: details.library ?? 'flutter',
      context: details.context?.toDescription(),
    );
  }

  void reportUncaughtError(
    Object error,
    StackTrace stackTrace, {
    required String library,
  }) {
    final FlutterErrorDetails details = FlutterErrorDetails(
      exception: error,
      stack: stackTrace,
      library: library,
    );
    if (!_shouldSendErrorsToMeasure) {
      recordFlutterError(details);
      return;
    }
    FlutterError.reportError(details);
  }

  void recordError(
    Object error, {
    required String source,
    StackTrace? stackTrace,
    String? context,
  }) {
    _logErrorToTalker(
      error,
      stackTrace: stackTrace,
      source: source,
      context: context,
    );
    if (!_shouldSendErrorsToMeasure) {
      return;
    }
    final String trimmedContext = context?.trim() ?? '';
    final Map<String, AttributeValue> attributes = <String, AttributeValue>{
      'exception.source': StringAttr(source),
      if (trimmedContext.isNotEmpty)
        'exception.context': StringAttr(scrubForMeasure(trimmedContext)),
    };
    final StackTrace effectiveStack = stackTrace ?? StackTrace.current;
    _measure.trackHandledError(
      sanitizeErrorForMeasure(error),
      sanitizeStackTraceForMeasure(effectiveStack),
      attributes: attributes,
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
      logWhenFinished: false,
    );
    if (span != null) {
      _endObservabilitySpan(span, elapsed: Duration.zero);
    }
    if (state == AppLifecycleState.detached) {
      unawaited(_markSessionCleanExit());
    }
  }

  Future<void> _ensureMeasureInitialized() async {
    if (_measureInitialized) {
      return;
    }
    _measureInitFuture ??= _initializeMeasure();
    await _measureInitFuture;
  }

  Future<void> _initializeMeasure() async {
    final FlutterExceptionHandler? localHandler = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {};
    await Measure.instance.init(
      () {},
      config: const MeasureConfig(autoStart: false),
    );
    routeMeasureErrorHooksThroughScrubber(localHandler);
    _measureInitialized = true;
  }

  @visibleForTesting
  void routeMeasureErrorHooksThroughScrubber(
    FlutterExceptionHandler? localHandler,
  ) {
    final FlutterExceptionHandler? measureFlutterHandler = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      localHandler?.call(details);
      if (_shouldSendErrorsToMeasure) {
        measureFlutterHandler?.call(sanitizeErrorDetailsForMeasure(details));
      }
    };
    final bool Function(Object, StackTrace)? measurePlatformHandler =
        PlatformDispatcher.instance.onError;
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      if (isDriftCancellation(error)) {
        return true;
      }
      recordFlutterError(
        FlutterErrorDetails(
          exception: error,
          stack: stack,
          library: 'platform_dispatcher',
        ),
      );
      if (_shouldSendErrorsToMeasure && measurePlatformHandler != null) {
        measurePlatformHandler(
          sanitizeErrorForMeasure(error),
          sanitizeStackTraceForMeasure(stack),
        );
      }
      forceFlush();
      return false;
    };
  }

  void _logErrorToTalker(
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
  }

  void _recordExceptionOnSpan(Span span, Object error, StackTrace stackTrace) {
    span
      ..setStatus(SpanStatus.error)
      ..setAttributeString(
        'exception.message',
        scrubForMeasure(error.toString()),
      );
    if (!_shouldSendErrorsToMeasure) {
      return;
    }
    _measure.trackHandledError(
      sanitizeErrorForMeasure(error),
      sanitizeStackTraceForMeasure(stackTrace),
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
            attributes.add(entry.key, scrubForMeasure(entry.value));
          }
        }
        _measure.trackEvent(
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
    final AppBuildEnvironment environment =
        runtimeInfo?.environment ?? AppBuildConfig.environment;
    final String releaseChannel = mapAppBuildEnvironmentToReleaseChannel(
      environment,
    );
    final AttributeBuilder attributes = AttributeBuilder().add(
      'deployment.environment',
      releaseChannel,
    );
    final MeasureVersionMetadata? versionMetadata =
        resolveMeasureVersionMetadata(
          environment: environment,
          releaseVersion: runtimeInfo?.releaseVersion,
          platformBuildNumber: runtimeInfo?.buildNumber,
        );
    final String? packageName = normalizeOptionalString(
      runtimeInfo?.packageName,
    );
    if (versionMetadata != null) {
      attributes.add('service.version', versionMetadata.serviceVersion);
      final String? buildNumber = versionMetadata.buildNumber;
      if (buildNumber != null) {
        attributes.add('app.build_number', buildNumber);
      }
    }
    if (packageName != null) {
      attributes.add('app.package_name', packageName);
    }
    _measure.trackEvent(
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
      reportUncaughtError(
        isolateError.error,
        isolateError.stackTrace ?? StackTrace.current,
        library: 'isolate',
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
      final String performanceClass = _framePerformanceClass(total);
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
          'frame.performance_class': StringAttr(performanceClass),
        },
        caller: 'scheduler.frame_timings',
      );
      if (span != null) {
        _endObservabilitySpan(
          span,
          elapsed: total,
          detail:
              'class=$performanceClass build=${build.inMilliseconds}ms '
              'raster=${raster.inMilliseconds}ms',
        );
      }
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

class _SpanLogContext {
  const _SpanLogContext({
    required this.name,
    required this.caller,
    required this.logWhenFinished,
  });

  final String name;
  final String? caller;
  final bool logWhenFinished;
}

class _FluxerAppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    FluxerObservability.instance.recordLifecycleState(state);
  }
}
