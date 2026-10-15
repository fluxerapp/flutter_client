import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:fluxer_app/core/observability/observability_reporting_provider.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:measure_flutter/measure_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeMeasure implements MeasureApi {
  int starts = 0;
  int stops = 0;

  @override
  Future<void> start() async {
    starts++;
  }

  @override
  Future<void> stop() async {
    stops++;
  }

  @override
  void trackEvent({
    required String name,
    Map<String, AttributeValue> attributes = const <String, AttributeValue>{},
    int? timestamp,
  }) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _Harness {
  _Harness({required bool nativeConfigured}) {
    observability = FluxerObservability.forTesting(measure, () async {
      nativeInitializations++;
      return nativeConfigured;
    });
    container = ProviderContainer(
      overrides: [
        fluxerObservabilityProvider.overrideWithValue(observability),
        appRuntimeInfoProvider.overrideWith(
          (Ref ref) => AppRuntimeInfo(
            packageName: 'com.fluxer.test',
            version: '1.0.0',
            buildNumber: '1',
            environment: AppBuildConfig.environment,
            pushProvider: AppBuildConfig.pushProvider,
            buildTimestamp: '',
          ),
        ),
      ],
    );
  }

  final _FakeMeasure measure = _FakeMeasure();
  late final FluxerObservability observability;
  late final ProviderContainer container;
  int nativeInitializations = 0;

  ObservabilityReporting get notifier =>
      container.read(observabilityReportingProvider.notifier);

  bool get state => container.read(observabilityReportingProvider);
}

Future<bool?> _storedSwitch() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool(kObservabilityReportingEnabledKey);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  test(
    'a fresh install leaves reporting off and never starts the SDK',
    () async {
      final _Harness harness = _Harness(nativeConfigured: true);
      addTearDown(harness.container.dispose);

      await harness.notifier.load();

      expect(harness.state, isFalse);
      expect(await _storedSwitch(), isNull);
      expect(harness.nativeInitializations, 0);
      expect(harness.measure.starts, 0);
      expect(harness.observability.isEnabled, isFalse);
    },
  );

  test('turning the switch on starts native first, then the SDK', () async {
    final _Harness harness = _Harness(nativeConfigured: true);
    addTearDown(harness.container.dispose);

    await harness.notifier.setEnabled(value: true);

    expect(harness.state, isTrue);
    expect(await _storedSwitch(), isTrue);
    expect(harness.nativeInitializations, 1);
    expect(harness.measure.starts, 1);
    expect(harness.observability.isEnabled, isTrue);
  });

  test('turning the switch off stops the SDK and saves off', () async {
    final _Harness harness = _Harness(nativeConfigured: true);
    addTearDown(harness.container.dispose);

    await harness.notifier.setEnabled(value: true);
    await harness.notifier.setEnabled(value: false);

    expect(harness.state, isFalse);
    expect(await _storedSwitch(), isFalse);
    expect(harness.measure.stops, 1);
    expect(harness.observability.isEnabled, isFalse);
  });

  test('a saved on switch starts the SDK on the next launch', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'flutter.$kObservabilityReportingEnabledKey': true,
    });
    final _Harness harness = _Harness(nativeConfigured: true);
    addTearDown(harness.container.dispose);

    await harness.notifier.load();

    expect(harness.state, isTrue);
    expect(harness.nativeInitializations, 1);
    expect(harness.measure.starts, 1);
  });

  test('a build without native keys never starts and saves off', () async {
    final _Harness harness = _Harness(nativeConfigured: false);
    addTearDown(harness.container.dispose);

    await harness.notifier.setEnabled(value: true);

    expect(harness.state, isFalse);
    expect(await _storedSwitch(), isFalse);
    expect(harness.nativeInitializations, 1);
    expect(harness.measure.starts, 0);
    expect(harness.observability.isEnabled, isFalse);
  });
}
