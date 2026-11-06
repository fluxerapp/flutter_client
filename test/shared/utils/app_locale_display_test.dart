import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/app_locale_display.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;

void main() {
  test('language picker offers only locales with bundled catalogs', () {
    final List<sdk.Locale> locales = sortedAppSdkLocales();
    final Set<sdk.Locale> expected = sdk.Locale.$valuesDefined.toSet();

    expect(locales, hasLength(expected.length));
    expect(locales.toSet(), expected);
    for (final sdk.Locale locale in locales) {
      final mapped = tryFlutterLocaleFromSdkLocale(locale);
      expect(mapped, isNotNull, reason: locale.toString());
      expect(
        FluxerLocalizations.supportedLocales,
        contains(mapped),
        reason: locale.toString(),
      );
      expect(
        () => lookupFluxerLocalizations(mapped!),
        returnsNormally,
        reason: locale.toString(),
      );
    }
  });

  test('appLanguageDisplayName uses English language names', () {
    expect(appLanguageDisplayName('de'), 'German');
    expect(appLanguageDisplayName('de-DE'), 'German');
    expect(appLanguageDisplayName('ja'), 'Japanese');
    expect(appLanguageDisplayName('zh'), 'Chinese');
    expect(appLanguageDisplayName('zh-CN'), 'Chinese');
    expect(appLanguageDisplayName('nb'), 'Norwegian');
    expect(appLanguageDisplayName('tl'), 'Filipino');
    expect(appLanguageDisplayName('pt-PT'), 'Portuguese');
    expect(appLanguageDisplayName('bn'), 'Bangla');
  });

  test('newer languages have a catalog and an explicit flag', () {
    const List<String> tags = <String>[
      'be',
      'bn',
      'ca',
      'fil',
      'lv',
      'pt-PT',
      'sk',
      'sl',
      'sq',
      'tok',
    ];
    for (final String tag in tags) {
      final AppLocaleDisplayInfo info = appLocaleDisplayInfoForTag(tag);
      expect(info.name, isNot(tag), reason: tag);
      expect(tryFlutterLocaleFromLocaleTag(tag), isNotNull, reason: tag);
      final String? flagAsset = info.flagAsset;
      expect(
        flagAsset != null || info.countryCode != null,
        isTrue,
        reason: tag,
      );
      if (flagAsset != null) {
        expect(File(flagAsset).existsSync(), isTrue, reason: flagAsset);
      }
    }
    for (final String tag in <String>['be', 'ca', 'tok']) {
      expect(appLocaleDisplayInfoForTag(tag).flagAsset, isNotNull, reason: tag);
    }
  });
}
