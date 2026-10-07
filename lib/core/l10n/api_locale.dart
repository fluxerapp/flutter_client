import 'dart:ui' as ui;

import 'package:fluxer_dart/export.dart' as sdk;

sdk.Locale apiLocaleFromFlutterLocale(ui.Locale locale) {
  final languageCode = locale.languageCode.toLowerCase();
  final countryCode = locale.countryCode?.toUpperCase();
  final exactTag = countryCode == null || countryCode.isEmpty
      ? languageCode
      : '$languageCode-$countryCode';
  final exact = _localeByWireValue[exactTag];
  if (exact != null) {
    return exact;
  }

  final languageOnly = _localeByWireValue[languageCode];
  if (languageOnly != null) {
    return languageOnly;
  }

  return switch (languageCode) {
    'en' => sdk.Locale.enUs,
    'es' => countryCode == 'ES' ? sdk.Locale.esEs : sdk.Locale.es419,
    'pt' => sdk.Locale.ptBr,
    'sv' => sdk.Locale.svSe,
    'zh' => countryCode == 'CN' ? sdk.Locale.zhCn : sdk.Locale.zhTw,
    _ => sdk.Locale.enUs,
  };
}

final Map<String, sdk.Locale> _localeByWireValue = <String, sdk.Locale>{
  for (final locale in sdk.Locale.$valuesDefined)
    if (locale.json != null) locale.json!: locale,
};
