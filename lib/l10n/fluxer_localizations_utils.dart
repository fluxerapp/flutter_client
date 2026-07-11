import 'dart:ui' show Locale;

import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;

/// Maps a backend [sdk.Locale] to the closest supported Flutter [Locale].
Locale flutterLocaleFromSdkLocale(sdk.Locale locale) {
  final String? tag = locale.json;
  if (tag == null) {
    return FluxerLocalizations.supportedLocales.first;
  }
  return _flutterLocaleFromTag(tag);
}

Locale _flutterLocaleFromTag(String tag) {
  switch (tag) {
    case 'en-US':
      return const Locale('en', 'US');
    case 'en-GB':
      return const Locale('en', 'GB');
    case 'es-ES':
      return const Locale('es');
    case 'es-419':
      return const Locale('es', '419');
    case 'pt-BR':
      return const Locale('pt', 'BR');
    case 'sv-SE':
      return const Locale('sv');
    case 'zh-CN':
      return const Locale('zh');
    case 'zh-TW':
      return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');
    case 'no':
      return const Locale('nb');
    default:
      final String languageCode = tag.split('-').first;
      for (final Locale supported in FluxerLocalizations.supportedLocales) {
        if (supported.languageCode == languageCode) {
          return supported;
        }
      }
      return FluxerLocalizations.supportedLocales.first;
  }
}

/// Picks the closest [FluxerLocalizations.supportedLocales] entry for [locale].
Locale resolveSupportedFluxerLocale(Locale locale) {
  for (final Locale supported in FluxerLocalizations.supportedLocales) {
    if (supported.languageCode == locale.languageCode) {
      return supported;
    }
  }
  return FluxerLocalizations.supportedLocales.first;
}

/// Like [lookupFluxerLocalizations], but never throws for unsupported locales.
FluxerLocalizations lookupFluxerLocalizationsWithFallback(Locale locale) {
  return lookupFluxerLocalizations(resolveSupportedFluxerLocale(locale));
}
