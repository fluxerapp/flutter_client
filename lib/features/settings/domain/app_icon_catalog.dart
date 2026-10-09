import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_catalog_android.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_catalog_ios.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_choice.dart';

List<AppIconChoice> appIconChoiceCatalog() {
  return switch (defaultTargetPlatform) {
    TargetPlatform.iOS => iosAppIconChoiceCatalog(),
    TargetPlatform.android => androidAppIconChoiceCatalog(),
    _ => const <AppIconChoice>[],
  };
}

List<AppIconChoice> resolveAppIconChoices(Set<String> nativeAlternateNames) {
  return appIconChoiceCatalog()
      .where(
        (AppIconChoice choice) =>
            choice.alternateIconName == null ||
            nativeAlternateNames.contains(choice.alternateIconName),
      )
      .toList(growable: false);
}
