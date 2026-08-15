import 'package:country_flags/country_flags.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_utils.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;
import 'package:material_ui/material_ui.dart';

class AppLocaleDisplayInfo {
  const AppLocaleDisplayInfo({
    required this.name,
    required this.nativeName,
    required this.languageCode,
    this.countryCode,
  });

  final String name;
  final String nativeName;
  final String languageCode;
  final String? countryCode;

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
      ),
      'bg': AppLocaleDisplayInfo(
        name: 'Bulgarian',
        nativeName: 'Български',
        languageCode: 'bg',
        countryCode: 'BG',
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
        countryCode: 'MX',
      ),
      'fi': AppLocaleDisplayInfo(
        name: 'Finnish',
        nativeName: 'Suomi',
        languageCode: 'fi',
        countryCode: 'FI',
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
