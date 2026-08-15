import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/app_locale_display.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;

void main() {
  test('language picker offers only locales with bundled catalogs', () {
    final List<sdk.Locale> locales = sortedAppSdkLocales();
    const Set<sdk.Locale> expected = <sdk.Locale>{
      sdk.Locale.ar,
      sdk.Locale.cs,
      sdk.Locale.da,
      sdk.Locale.de,
      sdk.Locale.el,
      sdk.Locale.enGb,
      sdk.Locale.enUs,
      sdk.Locale.esEs,
      sdk.Locale.es419,
      sdk.Locale.fi,
      sdk.Locale.fr,
      sdk.Locale.hu,
      sdk.Locale.it,
      sdk.Locale.ja,
      sdk.Locale.ko,
      sdk.Locale.lt,
      sdk.Locale.no,
      sdk.Locale.pl,
      sdk.Locale.ptBr,
      sdk.Locale.ru,
      sdk.Locale.svSe,
      sdk.Locale.th,
      sdk.Locale.tr,
      sdk.Locale.uk,
      sdk.Locale.zhCn,
      sdk.Locale.zhTw,
    };

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
  });
}
