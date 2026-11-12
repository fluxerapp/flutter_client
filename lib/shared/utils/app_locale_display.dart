import 'package:country_flags/country_flags.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_utils.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;

class AppLocaleDisplayInfo {
  const AppLocaleDisplayInfo({
    required this.name,
    required this.nativeName,
    required this.languageCode,
    this.countryCode,
    this.flagAsset,
  });

  final String name;
  final String nativeName;
  final String languageCode;
  final String? countryCode;
  final String? flagAsset;

  String get label => name;

  String get searchText => '$name $nativeName $languageCode';
}

const ImageTheme _appLocaleFlagTheme = ImageTheme(
  width: 20,
  height: 14,
  shape: RoundedRectangle(2),
);

const Map<String, AppLocaleDisplayInfo> _appLocaleDisplayInfoByTag =
    <String, AppLocaleDisplayInfo>{
      'ar': AppLocaleDisplayInfo(
        name: 'Arabic',
        nativeName: 'العربية',
        languageCode: 'ar',
        flagAsset: 'assets/flags/language.svg',
      ),
      'be': AppLocaleDisplayInfo(
        name: 'Belarusian',
        nativeName: 'Беларуская',
        languageCode: 'be',
        flagAsset: 'assets/flags/language.svg',
      ),
      'bg': AppLocaleDisplayInfo(
        name: 'Bulgarian',
        nativeName: 'Български',
        languageCode: 'bg',
        countryCode: 'BG',
      ),
      'bn': AppLocaleDisplayInfo(
        name: 'Bangla',
        nativeName: 'বাংলা',
        languageCode: 'bn',
        countryCode: 'BD',
      ),
      'ca': AppLocaleDisplayInfo(
        name: 'Catalan',
        nativeName: 'Català',
        languageCode: 'ca',
        flagAsset: 'assets/flags/language.svg',
      ),
      'cs': AppLocaleDisplayInfo(
        name: 'Czech',
        nativeName: 'Čeština',
        languageCode: 'cs',
        countryCode: 'CZ',
      ),
      'da': AppLocaleDisplayInfo(
        name: 'Danish',
        nativeName: 'Dansk',
        languageCode: 'da',
        countryCode: 'DK',
      ),
      'de': AppLocaleDisplayInfo(
        name: 'German',
        nativeName: 'Deutsch',
        languageCode: 'de',
        countryCode: 'DE',
      ),
      'el': AppLocaleDisplayInfo(
        name: 'Greek',
        nativeName: 'Ελληνικά',
        languageCode: 'el',
        countryCode: 'GR',
      ),
      'en-GB': AppLocaleDisplayInfo(
        name: 'English (United Kingdom)',
        nativeName: 'English',
        languageCode: 'en',
        countryCode: 'GB',
      ),
      'en-US': AppLocaleDisplayInfo(
        name: 'English (United States)',
        nativeName: 'English',
        languageCode: 'en',
        countryCode: 'US',
      ),
      'es-ES': AppLocaleDisplayInfo(
        name: 'Spanish (Spain)',
        nativeName: 'Español (España)',
        languageCode: 'es',
        countryCode: 'ES',
      ),
      'es-419': AppLocaleDisplayInfo(
        name: 'Spanish (Latin America)',
        nativeName: 'Español (Latinoamérica)',
        languageCode: 'es',
        flagAsset: 'assets/flags/language.svg',
      ),
      'fi': AppLocaleDisplayInfo(
        name: 'Finnish',
        nativeName: 'Suomi',
        languageCode: 'fi',
        countryCode: 'FI',
      ),
      'fil': AppLocaleDisplayInfo(
        name: 'Filipino',
        nativeName: 'Filipino',
        languageCode: 'fil',
        countryCode: 'PH',
      ),
      'fr': AppLocaleDisplayInfo(
        name: 'French',
        nativeName: 'Français',
        languageCode: 'fr',
        countryCode: 'FR',
      ),
      'he': AppLocaleDisplayInfo(
        name: 'Hebrew',
        nativeName: 'עברית',
        languageCode: 'he',
        countryCode: 'IL',
      ),
      'hi': AppLocaleDisplayInfo(
        name: 'Hindi',
        nativeName: 'हिन्दी',
        languageCode: 'hi',
        countryCode: 'IN',
      ),
      'hr': AppLocaleDisplayInfo(
        name: 'Croatian',
        nativeName: 'Hrvatski',
        languageCode: 'hr',
        countryCode: 'HR',
      ),
      'hu': AppLocaleDisplayInfo(
        name: 'Hungarian',
        nativeName: 'Magyar',
        languageCode: 'hu',
        countryCode: 'HU',
      ),
      'id': AppLocaleDisplayInfo(
        name: 'Indonesian',
        nativeName: 'Bahasa Indonesia',
        languageCode: 'id',
        countryCode: 'ID',
      ),
      'it': AppLocaleDisplayInfo(
        name: 'Italian',
        nativeName: 'Italiano',
        languageCode: 'it',
        countryCode: 'IT',
      ),
      'ja': AppLocaleDisplayInfo(
        name: 'Japanese',
        nativeName: '日本語',
        languageCode: 'ja',
        countryCode: 'JP',
      ),
      'ko': AppLocaleDisplayInfo(
        name: 'Korean',
        nativeName: '한국어',
        languageCode: 'ko',
        countryCode: 'KR',
      ),
      'lt': AppLocaleDisplayInfo(
        name: 'Lithuanian',
        nativeName: 'Lietuvių',
        languageCode: 'lt',
        countryCode: 'LT',
      ),
      'lv': AppLocaleDisplayInfo(
        name: 'Latvian',
        nativeName: 'Latviešu',
        languageCode: 'lv',
        countryCode: 'LV',
      ),
      'nl': AppLocaleDisplayInfo(
        name: 'Dutch',
        nativeName: 'Nederlands',
        languageCode: 'nl',
        countryCode: 'NL',
      ),
      'no': AppLocaleDisplayInfo(
        name: 'Norwegian',
        nativeName: 'Norsk',
        languageCode: 'no',
        countryCode: 'NO',
      ),
      'pl': AppLocaleDisplayInfo(
        name: 'Polish',
        nativeName: 'Polski',
        languageCode: 'pl',
        countryCode: 'PL',
      ),
      'pt-BR': AppLocaleDisplayInfo(
        name: 'Portuguese (Brazil)',
        nativeName: 'Português (Brasil)',
        languageCode: 'pt',
        countryCode: 'BR',
      ),
      'pt-PT': AppLocaleDisplayInfo(
        name: 'Portuguese (Portugal)',
        nativeName: 'Português (Portugal)',
        languageCode: 'pt',
        countryCode: 'PT',
      ),
      'ro': AppLocaleDisplayInfo(
        name: 'Romanian',
        nativeName: 'Română',
        languageCode: 'ro',
        countryCode: 'RO',
      ),
      'ru': AppLocaleDisplayInfo(
        name: 'Russian',
        nativeName: 'Русский',
        languageCode: 'ru',
        countryCode: 'RU',
      ),
      'sk': AppLocaleDisplayInfo(
        name: 'Slovak',
        nativeName: 'Slovenčina',
        languageCode: 'sk',
        countryCode: 'SK',
      ),
      'sl': AppLocaleDisplayInfo(
        name: 'Slovenian',
        nativeName: 'Slovenščina',
        languageCode: 'sl',
        countryCode: 'SI',
      ),
      'sq': AppLocaleDisplayInfo(
        name: 'Albanian',
        nativeName: 'Shqip',
        languageCode: 'sq',
        countryCode: 'AL',
      ),
      'sv-SE': AppLocaleDisplayInfo(
        name: 'Swedish',
        nativeName: 'Svenska',
        languageCode: 'sv',
        countryCode: 'SE',
      ),
      'th': AppLocaleDisplayInfo(
        name: 'Thai',
        nativeName: 'ไทย',
        languageCode: 'th',
        countryCode: 'TH',
      ),
      'tok': AppLocaleDisplayInfo(
        name: 'Toki Pona',
        nativeName: 'toki pona',
        languageCode: 'tok',
        flagAsset: 'assets/flags/language.svg',
      ),
      'tr': AppLocaleDisplayInfo(
        name: 'Turkish',
        nativeName: 'Türkçe',
        languageCode: 'tr',
        countryCode: 'TR',
      ),
      'uk': AppLocaleDisplayInfo(
        name: 'Ukrainian',
        nativeName: 'Українська',
        languageCode: 'uk',
        countryCode: 'UA',
      ),
      'vi': AppLocaleDisplayInfo(
        name: 'Vietnamese',
        nativeName: 'Tiếng Việt',
        languageCode: 'vi',
        countryCode: 'VN',
      ),
      'zh-CN': AppLocaleDisplayInfo(
        name: 'Chinese (Simplified)',
        nativeName: '中文 (简体)',
        languageCode: 'zh',
        countryCode: 'CN',
      ),
      'zh-TW': AppLocaleDisplayInfo(
        name: 'Chinese (Traditional)',
        nativeName: '中文 (繁體)',
        languageCode: 'zh',
        countryCode: 'TW',
      ),
    };

AppLocaleDisplayInfo appLocaleDisplayInfo(sdk.Locale locale) {
  final String? tag = locale.json;
  if (tag == null) {
    return AppLocaleDisplayInfo(
      name: locale.toString(),
      nativeName: locale.toString(),
      languageCode: locale.toString(),
    );
  }
  return appLocaleDisplayInfoForTag(tag);
}

AppLocaleDisplayInfo appLocaleDisplayInfoForTag(String tag) {
  final AppLocaleDisplayInfo? info = _appLocaleDisplayInfoByTag[tag];
  if (info != null) {
    return info;
  }
  final String languageCode = tag.split('-').first;
  return AppLocaleDisplayInfo(
    name: tag,
    nativeName: tag,
    languageCode: languageCode,
    countryCode: _countryCodeFromLocaleTag(tag),
  );
}

List<sdk.Locale> sortedAppSdkLocales() {
  final List<sdk.Locale> locales =
      sdk.Locale.$valuesDefined
          .where(
            (sdk.Locale locale) =>
                tryFlutterLocaleFromSdkLocale(locale) != null,
          )
          .toList()
        ..sort(
          (sdk.Locale a, sdk.Locale b) => appLocaleDisplayInfo(a).name
              .toLowerCase()
              .compareTo(appLocaleDisplayInfo(b).name.toLowerCase()),
        );
  return locales;
}

Widget appLocaleFlag(sdk.Locale locale) {
  final AppLocaleDisplayInfo info = appLocaleDisplayInfo(locale);
  final String? flagAsset = info.flagAsset;
  if (flagAsset != null) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: SvgPicture.asset(
        flagAsset,
        width: _appLocaleFlagTheme.width,
        height: _appLocaleFlagTheme.height,
        fit: BoxFit.fill,
      ),
    );
  }
  if (info.countryCode != null) {
    return CountryFlag.fromCountryCode(
      info.countryCode!,
      theme: _appLocaleFlagTheme,
    );
  }
  return CountryFlag.fromLanguageCode(
    info.languageCode,
    theme: _appLocaleFlagTheme,
  );
}

String? _countryCodeFromLocaleTag(String tag) {
  final List<String> parts = tag.split('-');
  if (parts.length < 2 || parts[1].length != 2) {
    return null;
  }
  return parts[1].toUpperCase();
}

const Map<String, String> _languageCodeAliases = <String, String>{
  'nb': 'no',
  'nn': 'no',
  'iw': 'he',
  'in': 'id',
  'tl': 'fil',
};

final Map<String, AppLocaleDisplayInfo> _appLocaleDisplayInfoByLanguageCode =
    <String, AppLocaleDisplayInfo>{
      for (final AppLocaleDisplayInfo info in _appLocaleDisplayInfoByTag.values)
        info.languageCode: info,
    };

String appLanguageDisplayName(String languageTag) {
  final String normalized = languageTag.trim().replaceAll('_', '-');
  if (normalized.isEmpty) {
    return languageTag;
  }
  final AppLocaleDisplayInfo? exact = _appLocaleDisplayInfoByTag[normalized];
  if (exact != null) {
    return _languageOnlyDisplayName(exact);
  }
  final String language = normalized.split('-').first.toLowerCase();
  final String lookup = _languageCodeAliases[language] ?? language;
  final AppLocaleDisplayInfo? info =
      _appLocaleDisplayInfoByTag[lookup] ??
      _appLocaleDisplayInfoByLanguageCode[lookup];
  if (info != null) {
    return _languageOnlyDisplayName(info);
  }
  return language;
}

String _languageOnlyDisplayName(AppLocaleDisplayInfo info) {
  final int paren = info.name.indexOf(' (');
  if (paren > 0) {
    return info.name.substring(0, paren);
  }
  return info.name;
}
