import 'dart:ui' as ui;

import 'package:fluxer_dart/export.dart' as sdk;

sdk.Locale apiLocaleFromFlutterLocale(ui.Locale locale) {
  final languageCode = locale.languageCode.toLowerCase();
  final subtags = <String>[
    if (locale.scriptCode case final String scriptCode
        when scriptCode.isNotEmpty)
      scriptCode.toLowerCase(),
    if (locale.countryCode case final String countryCode
        when countryCode.isNotEmpty)
      countryCode.toLowerCase(),
  ];

  final exact =
      _localeByWireValue[<String>[languageCode, ...subtags].join('-')];
  if (exact != null) {
    return exact;
  }

  if (languageCode == 'zh') {
    for (final subtag in subtags) {
      if (_traditionalChineseSubtags.contains(subtag)) {
        return sdk.Locale.zhTw;
      }
      if (_simplifiedChineseSubtags.contains(subtag)) {
        return sdk.Locale.zhCn;
      }
    }
  }

  return _localeByWireValue[languageCode] ??
      _localeByLanguageCode[languageCode] ??
      sdk.Locale.enUs;
}

const Set<String> _traditionalChineseSubtags = <String>{
  'hant',
  'tw',
  'hk',
  'mo',
};

const Set<String> _simplifiedChineseSubtags = <String>{'hans', 'cn', 'sg'};

const Map<String, sdk.Locale> _localeByLanguageCode = <String, sdk.Locale>{
  'en': sdk.Locale.enUs,
  'es': sdk.Locale.esEs,
  'nb': sdk.Locale.no,
  'nn': sdk.Locale.no,
  'pt': sdk.Locale.ptBr,
  'sv': sdk.Locale.svSe,
  'zh': sdk.Locale.zhCn,
};

final Map<String, sdk.Locale> _localeByWireValue = <String, sdk.Locale>{
  for (final locale in sdk.Locale.$valuesDefined)
    if (locale.json != null) locale.json!.toLowerCase(): locale,
};
