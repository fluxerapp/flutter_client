import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_catalog_android.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_catalog_ios.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_preview_assets.dart';

void main() {
  test('android catalog uses android preview assets', () {
    final choices = androidAppIconChoiceCatalog();
    expect(choices, hasLength(9));
    for (final choice in choices) {
      expect(
        choice.previewAssetPath.startsWith(AppIconPreviewAssets.androidRoot),
        isTrue,
      );
    }
    expect(choices.map((c) => c.alternateIconName).toList(), <String?>[
      null,
      kAndroidStarfieldAlternateIconName,
      kAndroidSwedenAlternateIconName,
      kAndroidGreyscaleAlternateIconName,
      kAndroidRainbowAlternateIconName,
      kAndroidWavesAlternateIconName,
      kAndroidChromaticAberrationAlternateIconName,
      kAndroidDefaultBrutalistAlternateIconName,
      kAndroidGreyscaleBrutalistAlternateIconName,
    ]);
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

  test('every android alternate icon has a launcher alias and resources', () {
    final String manifest = File(
      'android/app/src/main/AndroidManifest.xml',
    ).readAsStringSync();
    final String canaryManifest = File(
      'android/app/src/canary/AndroidManifest.xml',
    ).readAsStringSync();
    final Set<String> names = <String>{
      for (final choice in androidAppIconChoiceCatalog())
        if (choice.alternateIconName != null) choice.alternateIconName!,
      kAndroidDefaultBrutalistAlternateIconName,
      kAndroidCanaryBrutalistAlternateIconName,
    };
    for (final String name in names) {
      final String source = name == kAndroidCanaryBrutalistAlternateIconName
          ? canaryManifest
          : manifest;
      expect(
        source,
        contains('android:name="\${appIconAliasPrefix}.$name"'),
        reason: name,
      );
      final String icon = name == kAndroidCanaryBrutalistAlternateIconName
          ? 'fluxer_icon_default_canary_brutalist'
          : 'fluxer_icon_$name';
      expect(source, contains('android:icon="@mipmap/$icon"'), reason: name);
      expect(
        File(
          'android/app/src/main/res/mipmap-anydpi-v26/$icon.xml',
        ).existsSync(),
        isTrue,
        reason: icon,
      );
      for (final String density in <String>[
        'mdpi',
        'hdpi',
        'xhdpi',
        'xxhdpi',
        'xxxhdpi',
      ]) {
        expect(
          File(
            'android/app/src/main/res/mipmap-$density/$icon.webp',
          ).existsSync(),
          isTrue,
          reason: '$density $icon',
        );
      }
    }
    for (final choice in androidAppIconChoiceCatalog()) {
      expect(File(choice.previewAssetPath).existsSync(), isTrue);
    }
  });
}
