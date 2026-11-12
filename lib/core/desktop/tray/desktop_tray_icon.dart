import 'dart:io';

import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';

String desktopTrayIconAsset() {
  final String channel =
      AppBuildConfig.environment == AppBuildEnvironment.canary
      ? 'canary'
      : 'stable';
  final String directory = 'assets/images/tray/$channel';
  if (Platform.isMacOS) {
    return '$directory/FluxerTrayTemplate.png';
  }
  if (Platform.isWindows) {
    return '$directory/icon.ico';
  }
  return '$directory/256x256.png';
}
