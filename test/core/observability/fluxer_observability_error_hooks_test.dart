import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:measure_flutter/measure_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeMeasure implements MeasureApi {
  @override
  Future<void> start() async {}

  @override
  Future<void> stop() async {}

  @override
  void trackEvent({
    required String name,
    Map<String, AttributeValue> attributes = const <String, AttributeValue>{},
    int? timestamp,
  }) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const String _raw =
    "Failed host lookup: 'chat.example.org' for "
    'wss://gateway.chat.example.org/?v=1 in channel 1558633981610557440';
const String _scrubbed =
    "Exception: Failed host lookup: 'instance' for wss://instance/ in "
    'channel :id';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FlutterExceptionHandler? originalFlutterHandler;
  late bool Function(Object, StackTrace)? originalPlatformHandler;
  final List<FlutterErrorDetails> measureFlutterErrors =
      <FlutterErrorDetails>[];
  final List<Object> measurePlatformErrors = <Object>[];
  final List<FlutterErrorDetails> localErrors = <FlutterErrorDetails>[];

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    SharedPreferences.setMockInitialValues(<String, Object>{});
    originalFlutterHandler = FlutterError.onError;
    originalPlatformHandler = PlatformDispatcher.instance.onError;
    measureFlutterErrors.clear();
    measurePlatformErrors.clear();
    localErrors.clear();
    FlutterError.onError = measureFlutterErrors.add;
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      measurePlatformErrors.add(error);
      return false;
    };
  });

  tearDown(() {
    FlutterError.onError = originalFlutterHandler;
    PlatformDispatcher.instance.onError = originalPlatformHandler;
    debugDefaultTargetPlatformOverride = null;
  });

  Future<FluxerObservability> routedObservability({required bool on}) async {
    final FluxerObservability observability = FluxerObservability.forTesting(
      _FakeMeasure(),
      () async => true,
    )..routeMeasureErrorHooksThroughScrubber(localErrors.add);
    if (on) {
      await observability.start();
    }
    return observability;
  }

  test('uncaught Flutter errors reach Measure only scrubbed', () async {
    await routedObservability(on: true);

    FlutterError.onError!(
      FlutterErrorDetails(exception: Exception(_raw), stack: StackTrace.empty),
    );

    expect(localErrors.single.exception.toString(), 'Exception: $_raw');
    expect(measureFlutterErrors.single.exception.toString(), _scrubbed);
  });

  test('uncaught platform errors reach Measure only scrubbed', () async {
    await routedObservability(on: true);

    PlatformDispatcher.instance.onError!(Exception(_raw), StackTrace.empty);

    expect(measurePlatformErrors.single.toString(), _scrubbed);
  });

  test('nothing reaches Measure while the switch is off', () async {
    await routedObservability(on: false);

    FlutterError.onError!(
      FlutterErrorDetails(exception: Exception(_raw), stack: StackTrace.empty),
    );
    PlatformDispatcher.instance.onError!(Exception(_raw), StackTrace.empty);

    expect(localErrors, hasLength(1));
    expect(measureFlutterErrors, isEmpty);
    expect(measurePlatformErrors, isEmpty);
  });
}
