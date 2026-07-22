import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_utils.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;

void main() {
  test('tryFlutterLocaleFromSdkLocale maps supported regional tags', () {
    expect(
      tryFlutterLocaleFromSdkLocale(sdk.Locale.enUs),
      const Locale('en', 'US'),
    );
    expect(
      tryFlutterLocaleFromSdkLocale(sdk.Locale.enGb),
      const Locale('en', 'GB'),
    );
    expect(
      tryFlutterLocaleFromSdkLocale(sdk.Locale.es419),
      const Locale('es', '419'),
    );
    expect(
      tryFlutterLocaleFromSdkLocale(sdk.Locale.zhTw),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    );
    expect(tryFlutterLocaleFromSdkLocale(sdk.Locale.de), const Locale('de'));
  });

  test('tryFlutterLocaleFromSdkLocale rejects missing catalogs', () {
    const List<sdk.Locale> unsupported = <sdk.Locale>[
      sdk.Locale.bg,
      sdk.Locale.he,
      sdk.Locale.hi,
      sdk.Locale.hr,
      sdk.Locale.id,
      sdk.Locale.nl,
      sdk.Locale.ro,
      sdk.Locale.vi,
      sdk.Locale.$unknown,
    ];

    for (final sdk.Locale locale in unsupported) {
      expect(tryFlutterLocaleFromSdkLocale(locale), isNull);
    }
  });

  test(
    'resolveSupportedFluxerLocales preserves regional and script variants',
    () {
      const List<Locale> variants = <Locale>[
        Locale('de', 'CH'),
        Locale('en', 'GB'),
        Locale('en', 'US'),
        Locale('es', '419'),
        Locale('fr', 'CA'),
        Locale('pt', 'BR'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      ];

      for (final Locale locale in variants) {
        expect(resolveSupportedFluxerLocales(<Locale>[locale]), locale);
      }
    },
  );

  test('resolveSupportedFluxerLocales checks every preferred locale', () {
    expect(
      resolveSupportedFluxerLocales(const <Locale>[
        Locale('xx', 'XX'),
        Locale('fr', 'CA'),
      ]),
      const Locale('fr', 'CA'),
    );
  });

  test('unsupported locales fall back to the default supported locale', () {
    expect(
      resolveSupportedFluxerLocales(const <Locale>[Locale('xx', 'XX')]),
      const Locale('en'),
    );
  });
}
