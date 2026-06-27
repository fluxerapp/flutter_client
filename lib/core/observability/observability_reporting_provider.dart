import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'observability_reporting_provider.g.dart';

const String _kObservabilityReportingEnabledKey =
    'observability_reporting_enabled';

bool observabilityReportingIsAvailable() {
  if (kIsWeb) {
    return false;
  }
  return AppBuildConfig.hasObservabilityConfig;
}

@Riverpod(keepAlive: true)
class ObservabilityReporting extends _$ObservabilityReporting {
  @override
  bool build() => false;

  Future<void> load() async {
    if (!observabilityReportingIsAvailable()) {
      return;
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool isEnabled =
        preferences.getBool(_kObservabilityReportingEnabledKey) ?? false;
    state = isEnabled;
    if (!isEnabled) {
      return;
    }
    await _start();
  }

  Future<void> setEnabled({required bool value}) async {
    if (!observabilityReportingIsAvailable()) {
      return;
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kObservabilityReportingEnabledKey, value);
    if (value) {
      await _start();
    } else {
      await FluxerObservability.instance.stop();
    }
    state = value;
  }

  Future<void> _start() async {
    try {
      final runtimeInfo = await ref.read(appRuntimeInfoProvider.future);
      await FluxerObservability.instance.start(runtimeInfo: runtimeInfo);
    } on Object {
      await FluxerObservability.instance.start();
    }
  }
}
