import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_choice.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_preview_assets.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const String kIosStarfieldAlternateIconName = 'AppIconStarfield';
const String kIosSwedenAlternateIconName = 'AppIconSweden';
const String kIosGreyscaleAlternateIconName = 'AppIconGreyscale';
const String kIosRainbowAlternateIconName = 'AppIconRainbow';
const String kIosWavesAlternateIconName = 'AppIconWaves';
const String kIosChromaticAberrationAlternateIconName =
    'AppIconChromaticAberration';
const String kIosDefaultBrutalistAlternateIconName = 'AppIconDefaultBrutalist';
const String kIosGreyscaleBrutalistAlternateIconName =
    'AppIconGreyscaleBrutalist';
const String kIosCanaryBrutalistAlternateIconName = 'AppIconCanaryBrutalist';

AppIconChoice _iosDefaultBrutalistAppIconChoice() {
  if (AppBuildConfig.isCanary) {
    return AppIconChoice(
      alternateIconName: kIosCanaryBrutalistAlternateIconName,
      previewAssetPath: AppIconPreviewAssets.iosCanaryBrutalist,
      label: (FluxerLocalizations l10n) => l10n.appIconOptionDefaultBrutalist,
    );
  }
  return AppIconChoice(
    alternateIconName: kIosDefaultBrutalistAlternateIconName,
    previewAssetPath: AppIconPreviewAssets.iosDefaultBrutalist,
    label: (FluxerLocalizations l10n) => l10n.appIconOptionDefaultBrutalist,
  );
}

List<AppIconChoice> iosAppIconChoiceCatalog() {
  return [
    AppIconChoice(
      alternateIconName: null,
      previewAssetPath: appIconPreviewIosDefault(),
      label: (FluxerLocalizations l10n) => l10n.appIconOptionDefault,
    ),
    AppIconChoice(
      alternateIconName: kIosStarfieldAlternateIconName,
      previewAssetPath: AppIconPreviewAssets.iosStarfield,
      label: (FluxerLocalizations l10n) => l10n.appIconOptionStarfield,
    ),
    AppIconChoice(
      alternateIconName: kIosSwedenAlternateIconName,
      previewAssetPath: AppIconPreviewAssets.iosSweden,
      label: (FluxerLocalizations l10n) => l10n.appIconOptionSweden,
    ),
    AppIconChoice(
      alternateIconName: kIosGreyscaleAlternateIconName,
      previewAssetPath: AppIconPreviewAssets.iosGreyscale,
      label: (FluxerLocalizations l10n) => l10n.appIconOptionGreyscale,
    ),
    AppIconChoice(
      alternateIconName: kIosRainbowAlternateIconName,
      previewAssetPath: AppIconPreviewAssets.iosRainbow,
      label: (FluxerLocalizations l10n) => l10n.appIconOptionRainbow,
    ),
    AppIconChoice(
      alternateIconName: kIosWavesAlternateIconName,
      previewAssetPath: AppIconPreviewAssets.iosWaves,
      label: (FluxerLocalizations l10n) => l10n.appIconOptionWaves,
    ),
    AppIconChoice(
      alternateIconName: kIosChromaticAberrationAlternateIconName,
      previewAssetPath: AppIconPreviewAssets.iosChromaticAberration,
      label: (FluxerLocalizations l10n) =>
          l10n.appIconOptionChromaticAberration,
    ),
    _iosDefaultBrutalistAppIconChoice(),
    AppIconChoice(
      alternateIconName: kIosGreyscaleBrutalistAlternateIconName,
      previewAssetPath: AppIconPreviewAssets.iosGreyscaleBrutalist,
      label: (FluxerLocalizations l10n) => l10n.appIconOptionGreyscaleBrutalist,
    ),
  ];
}
