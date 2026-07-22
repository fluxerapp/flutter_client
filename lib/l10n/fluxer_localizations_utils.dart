import 'dart:ui' show Locale;

import 'package:flutter/widgets.dart' show basicLocaleListResolution;
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;

/// Maps a backend [sdk.Locale] only when the app bundles its Flutter catalog.
Locale? tryFlutterLocaleFromSdkLocale(sdk.Locale locale) {
  final String? tag = locale.json;
  if (tag == null) {
    return null;
  }
  final Locale? candidate = switch (tag) {
    'en-US' => const Locale('en', 'US'),
    'en-GB' => const Locale('en', 'GB'),
    'es-ES' => const Locale('es'),
    'es-419' => const Locale('es', '419'),
    'pt-BR' => const Locale('pt', 'BR'),
    'sv-SE' => const Locale('sv'),
    'zh-CN' => const Locale('zh'),
    'zh-TW' => const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    'no' => const Locale('nb'),
    _ when !tag.contains('-') => Locale(tag),
    _ => null,
  };
  return candidate != null &&
          FluxerLocalizations.supportedLocales.contains(candidate)
      ? candidate
      : null;
}

/// Picks the closest supported locale from the ordered platform preferences.
Locale resolveSupportedFluxerLocales(List<Locale> preferredLocales) {
  return basicLocaleListResolution(
    preferredLocales,
    FluxerLocalizations.supportedLocales,
  );
}
