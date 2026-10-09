import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';

class AppRuntimeInfo {
  const AppRuntimeInfo({
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.environment,
    required this.pushProvider,
    required this.buildTimestamp,
    this.deviceModel,
    this.osVersionLabel = '',
  });
  final String packageName;
  final String version;
  final String buildNumber;
  final AppBuildEnvironment environment;
  final PushProviderKind pushProvider;
  final String buildTimestamp;
  final String? deviceModel;
  final String osVersionLabel;

  String get deviceModelLabel => deviceModel ?? '';

  String get releaseVersion {
    final int dashIndex = version.indexOf('-');
    if (dashIndex == -1) {
      return version;
    }
    return version.substring(0, dashIndex);
  }
}
