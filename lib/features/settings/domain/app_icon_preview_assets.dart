import 'package:fluxer_app/core/build/app_build_config.dart';

abstract final class AppIconPreviewAssets {
  static const String iosRoot = 'assets/images/app_icon_previews/ios';

  static const String iosStarfield = '$iosRoot/starfield.png';
  static const String iosSweden = '$iosRoot/sweden.png';
}

String appIconPreviewIosDefault() {
  if (AppBuildConfig.isCanary) {
    return '${AppIconPreviewAssets.iosRoot}/default_canary.png';
  }
  return '${AppIconPreviewAssets.iosRoot}/default.png';
}
