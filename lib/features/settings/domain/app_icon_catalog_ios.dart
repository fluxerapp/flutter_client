import 'package:fluxer_app/features/settings/domain/app_icon_choice.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_preview_assets.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const String kIosStarfieldAlternateIconName = 'AppIconStarfield';
const String kIosSwedenAlternateIconName = 'AppIconSweden';

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
  ];
}
