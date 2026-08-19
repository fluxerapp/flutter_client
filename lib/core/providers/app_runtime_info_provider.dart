import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/app_diagnostic_clipboard_text.dart';
import 'package:fluxer_app/core/providers/app_runtime_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

export 'package:fluxer_app/core/providers/app_runtime_info.dart';

final FutureProvider<AppRuntimeInfo> appRuntimeInfoProvider =
    FutureProvider<AppRuntimeInfo>((Ref ref) async {
      final (
        PackageInfo packageInfo,
        String deviceModel,
        String osVersionLabel,
      ) = await (
        PackageInfo.fromPlatform(),
        resolveDeviceModelName(),
        resolveOsVersionLabel(),
      ).wait;
      return AppRuntimeInfo(
        appName: packageInfo.appName,
        packageName: packageInfo.packageName,
        version: packageInfo.version,
        buildNumber: packageInfo.buildNumber,
        environment: AppBuildConfig.environment,
        pushProvider: AppBuildConfig.pushProvider,
        buildTimestamp: AppBuildConfig.buildTimestamp,
        deviceModel: deviceModel,
        osVersionLabel: osVersionLabel,
      );
    });
