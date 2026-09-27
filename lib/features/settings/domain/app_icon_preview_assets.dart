import 'package:fluxer_app/core/build/app_build_config.dart';

abstract final class AppIconPreviewAssets {
  static const String iosRoot = 'assets/images/app_icon_previews/ios';

  static String iosDefault() {
    if (AppBuildConfig.isCanary) {
      return '$iosRoot/default_canary.png';
    }
    return '$iosRoot/default.png';
  }

  static const String iosStarfield = '$iosRoot/starfield.png';
  static const String iosSweden = '$iosRoot/sweden.png';
}
