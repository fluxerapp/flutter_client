import 'package:fluxer_app/core/build/app_build_config.dart';

abstract final class AppIconPreviewAssets {
  static const String iosRoot = 'assets/images/app_icon_previews/ios';
  static const String androidRoot = 'assets/images/app_icon_previews/android';

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

  static const String androidStarfield = '$androidRoot/starfield.png';
  static const String androidSweden = '$androidRoot/sweden.png';
  static const String androidGreyscale = '$androidRoot/greyscale.png';
  static const String androidRainbow = '$androidRoot/rainbow.png';
  static const String androidWaves = '$androidRoot/waves.png';
  static const String androidChromaticAberration =
      '$androidRoot/chromatic_aberration.png';
  static const String androidDefaultBrutalist =
      '$androidRoot/default_brutalist.png';
  static const String androidGreyscaleBrutalist =
      '$androidRoot/greyscale_brutalist.png';
  static const String androidCanaryBrutalist =
      '$androidRoot/default_canary_brutalist.png';
}

String appIconPreviewAndroidDefault() {
  if (AppBuildConfig.isCanary) {
    return '${AppIconPreviewAssets.androidRoot}/default_canary.png';
  }
  return '${AppIconPreviewAssets.androidRoot}/default.png';
}

String appIconPreviewIosDefault() {
  if (AppBuildConfig.isCanary) {
    return '${AppIconPreviewAssets.iosRoot}/default_canary.png';
  }
  return '${AppIconPreviewAssets.iosRoot}/default.png';
}
