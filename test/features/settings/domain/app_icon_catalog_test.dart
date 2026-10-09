import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_catalog_android.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_catalog_ios.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_preview_assets.dart';

void main() {
  test('android catalog is empty until launcher aliases are configured', () {
    expect(androidAppIconChoiceCatalog(), isEmpty);
  });

  test('ios catalog uses ios preview assets', () {
    final choices = iosAppIconChoiceCatalog();
    expect(choices, hasLength(9));
    for (final choice in choices) {
      expect(
        choice.previewAssetPath.startsWith(AppIconPreviewAssets.iosRoot),
        isTrue,
      );
    }
    expect(choices.map((c) => c.alternateIconName).toList(), <String?>[
      null,
      kIosStarfieldAlternateIconName,
      kIosSwedenAlternateIconName,
      kIosGreyscaleAlternateIconName,
      kIosRainbowAlternateIconName,
      kIosWavesAlternateIconName,
      kIosChromaticAberrationAlternateIconName,
      kIosDefaultBrutalistAlternateIconName,
      kIosGreyscaleBrutalistAlternateIconName,
    ]);
  });
}
