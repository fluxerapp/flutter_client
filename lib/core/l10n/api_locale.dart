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
      _localeForLanguageCode(languageCode) ??
      sdk.Locale.enUs;
}

sdk.Locale? _localeForLanguageCode(String languageCode) {
  for (final String wireValue
      in _wireValuesByLanguageCode[languageCode] ?? const <String>[]) {
    final sdk.Locale? locale = _localeByWireValue[wireValue];
    if (locale != null) {
      return locale;
    }
  }
  return null;
}

const Set<String> _traditionalChineseSubtags = <String>{
  'hant',
  'tw',
  'hk',
  'mo',
};

const Set<String> _simplifiedChineseSubtags = <String>{'hans', 'cn', 'sg'};

const Map<String, List<String>> _wireValuesByLanguageCode =
    <String, List<String>>{
      'art': <String>['tok'],
      'en': <String>['en-us'],
      'es': <String>['es-es'],
      'nb': <String>['no'],
      'nn': <String>['no'],
      'pt': <String>['pt-pt', 'pt-br'],
      'sv': <String>['sv-se'],
      'tl': <String>['fil'],
      'zh': <String>['zh-cn'],
    };

final Map<String, sdk.Locale> _localeByWireValue = <String, sdk.Locale>{
  for (final locale in sdk.Locale.$valuesDefined)
    if (locale.json != null) locale.json!.toLowerCase(): locale,
};
