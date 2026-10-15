import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'observability_reporting_provider.g.dart';

const String kObservabilityReportingEnabledKey =
    'observability_reporting_enabled';

bool observabilityReportingIsAvailable(FluxerObservability observability) {
  return AppBuildConfig.hasObservabilityConfig && observability.isSdkAvailable;
}

@Riverpod(keepAlive: true)
FluxerObservability fluxerObservability(Ref ref) =>
    FluxerObservability.instance;

@Riverpod(keepAlive: true)
class ObservabilityReporting extends _$ObservabilityReporting {
  @override
  bool build() => false;

  FluxerObservability get _observability =>
      ref.read(fluxerObservabilityProvider);

  Future<void> load() async {
    if (!observabilityReportingIsAvailable(_observability)) {
      return;
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool isEnabled =
        preferences.getBool(kObservabilityReportingEnabledKey) ?? false;
    state = isEnabled;
    if (!isEnabled) {
      return;
    }
    await _start();
  }

  Future<void> setEnabled({required bool value}) async {
    if (!observabilityReportingIsAvailable(_observability)) {
      return;
    }
    if (value) {
      await _start();
    } else {
      await _observability.stop();
    }
    final bool enabled = value && _observability.isEnabled;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(kObservabilityReportingEnabledKey, enabled);
    state = enabled;
  }

  Future<void> _start() async {
    try {
      final runtimeInfo = await ref.read(appRuntimeInfoProvider.future);
      await _observability.start(runtimeInfo: runtimeInfo);
    } on Object {
      await _observability.start();
    }
    if (!_observability.isEnabled) {
      state = false;
    }
  }
}
