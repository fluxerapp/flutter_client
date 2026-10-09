import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/l10n/api_locale.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;

final Map<Locale, String> _supportedLocaleCases = <Locale, String>{
  const Locale('en'): 'en-US',
  const Locale('ar'): 'ar',
  const Locale('bg'): 'bg',
  const Locale('cs'): 'cs',
  const Locale('da'): 'da',
  const Locale('de'): 'de',
  const Locale('el'): 'el',
  const Locale('en', 'GB'): 'en-GB',
  const Locale('en', 'US'): 'en-US',
  const Locale('es'): 'es-ES',
  const Locale('es', '419'): 'es-419',
  const Locale('fi'): 'fi',
  const Locale('fr'): 'fr',
  const Locale('he'): 'he',
  const Locale('hi'): 'hi',
  const Locale('hr'): 'hr',
  const Locale('hu'): 'hu',
  const Locale('id'): 'id',
  const Locale('it'): 'it',
  const Locale('ja'): 'ja',
  const Locale('ko'): 'ko',
  const Locale('lt'): 'lt',
  const Locale('nb'): 'no',
  const Locale('nl'): 'nl',
  const Locale('pl'): 'pl',
  const Locale('pt'): 'pt-BR',
  const Locale('pt', 'BR'): 'pt-BR',
  const Locale('ro'): 'ro',
  const Locale('ru'): 'ru',
  const Locale('sv'): 'sv-SE',
  const Locale('th'): 'th',
  const Locale('tr'): 'tr',
  const Locale('uk'): 'uk',
  const Locale('vi'): 'vi',
  const Locale('zh'): 'zh-CN',
  const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'): 'zh-TW',
};

void _expectCases(List<(Locale, String)> cases) {
  for (final (Locale locale, String wireValue) in cases) {
    expect(
      apiLocaleFromFlutterLocale(locale).json,
      wireValue,
      reason: locale.toString(),
    );
  }
}

void main() {
  test('every bundled UI locale maps to its API locale', () {
    expect(
      _supportedLocaleCases.keys.toSet(),
      FluxerLocalizations.supportedLocales.toSet(),
    );
    _expectCases(<(Locale, String)>[
      for (final MapEntry<Locale, String> entry
          in _supportedLocaleCases.entries)
        (entry.key, entry.value),
    ]);
  });

  test('Norwegian tags map to the API Norwegian locale', () {
    _expectCases(<(Locale, String)>[
      (const Locale('nb'), 'no'),
      (const Locale('nb', 'NO'), 'no'),
      (const Locale('nn'), 'no'),
      (const Locale('nn', 'NO'), 'no'),
      (const Locale('no'), 'no'),
      (const Locale('no', 'NO'), 'no'),
      (const Locale('NB'), 'no'),
    ]);
  });

  test('Chinese tags follow the script first, then the region', () {
    _expectCases(<(Locale, String)>[
      (const Locale('zh'), 'zh-CN'),
      (const Locale('zh', 'CN'), 'zh-CN'),
      (const Locale('zh', 'SG'), 'zh-CN'),
      (const Locale('zh', 'TW'), 'zh-TW'),
      (const Locale('zh', 'HK'), 'zh-TW'),
      (const Locale('zh', 'MO'), 'zh-TW'),
      (const Locale('zh', 'MY'), 'zh-CN'),
      (
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        'zh-CN',
      ),
      (
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
        'zh-TW',
      ),
      (
        const Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: 'Hans',
          countryCode: 'TW',
        ),
        'zh-CN',
      ),
      (
        const Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: 'Hant',
          countryCode: 'CN',
        ),
        'zh-TW',
      ),
      (
        const Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: 'Hant',
          countryCode: 'HK',
        ),
        'zh-TW',
      ),
    ]);
  });

  test('regional tags fall back to the API locale for the language', () {
    _expectCases(<(Locale, String)>[
      (const Locale('es', 'ES'), 'es-ES'),
      (const Locale('es', 'MX'), 'es-ES'),
      (const Locale('en', 'AU'), 'en-US'),
      (const Locale('pt', 'PT'), 'pt-BR'),
      (const Locale('sv', 'SE'), 'sv-SE'),
      (const Locale('sv', 'FI'), 'sv-SE'),
      (const Locale('de', 'AT'), 'de'),
      (const Locale('fr', 'CA'), 'fr'),
      (
        const Locale.fromSubtags(
          languageCode: 'sr',
          scriptCode: 'Latn',
          countryCode: 'RS',
        ),
        'en-US',
      ),
    ]);
  });

  test('tags are matched without regard to case', () {
    _expectCases(<(Locale, String)>[
      (const Locale('EN', 'gb'), 'en-GB'),
      (const Locale('PT', 'br'), 'pt-BR'),
      (const Locale('ZH', 'tw'), 'zh-TW'),
      (
        const Locale.fromSubtags(languageCode: 'ZH', scriptCode: 'HANT'),
        'zh-TW',
      ),
    ]);
  });

  test('languages the API does not know fall back to en-US', () {
    _expectCases(<(Locale, String)>[
      (const Locale('xx'), 'en-US'),
      (const Locale('xx', 'XX'), 'en-US'),
      (const Locale('eo'), 'en-US'),
    ]);
  });

  test('every API locale survives a round trip through the UI locale', () {
    for (final sdk.Locale locale in sdk.Locale.$valuesDefined) {
      final Locale? uiLocale = tryFlutterLocaleFromSdkLocale(locale);
      expect(uiLocale, isNotNull, reason: locale.toString());
      expect(
        apiLocaleFromFlutterLocale(uiLocale!),
        locale,
        reason: locale.toString(),
      );
    }
  });

  test('a mapped API locale always has a bundled UI catalog', () {
    for (final Locale locale in FluxerLocalizations.supportedLocales) {
      final Locale? back = tryFlutterLocaleFromSdkLocale(
        apiLocaleFromFlutterLocale(locale),
      );
      expect(back, isNotNull, reason: locale.toLanguageTag());
      expect(
        back!.languageCode,
        locale.languageCode,
        reason: locale.toLanguageTag(),
      );
      expect(
        back.scriptCode,
        locale.scriptCode,
        reason: locale.toLanguageTag(),
      );
    }
  });
}
