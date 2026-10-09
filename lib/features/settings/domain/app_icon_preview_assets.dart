import 'package:fluxer_app/core/build/app_build_config.dart';

abstract final class AppIconPreviewAssets {
  static const String iosRoot = 'assets/images/app_icon_previews/ios';

  static const String iosStarfield = '$iosRoot/starfield.png';
  static const String iosSweden = '$iosRoot/sweden.png';
  static const String iosGreyscale = '$iosRoot/greyscale.png';
  static const String iosRainbow = '$iosRoot/rainbow.png';
  static const String iosWaves = '$iosRoot/waves.png';
  static const String iosChromaticAberration =
      '$iosRoot/chromatic_aberration.png';
  static const String iosDefaultBrutalist = '$iosRoot/default_brutalist.png';
  static const String iosGreyscaleBrutalist =
      '$iosRoot/greyscale_brutalist.png';
  static const String iosCanaryBrutalist =
      '$iosRoot/default_canary_brutalist.png';
}

String appIconPreviewIosDefault() {
  if (AppBuildConfig.isCanary) {
    return '${AppIconPreviewAssets.iosRoot}/default_canary.png';
  }
  return '${AppIconPreviewAssets.iosRoot}/default.png';
}
