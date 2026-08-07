import 'dart:ui' show Locale;

String formatTtsLocaleTag(Locale locale) {
  final String? country = locale.countryCode;
  if (country == null || country.isEmpty) {
    return locale.languageCode;
  }
  return '${locale.languageCode}-$country';
}
