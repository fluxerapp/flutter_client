import 'package:fluxer_dart/export.dart';
import 'package:intl/intl.dart';

const List<String> _twelveHourLocalePrefixes = <String>[
  'en-us',
  'en-ca',
  'en-au',
  'en-nz',
  'en-ph',
  'en-in',
  'en-pk',
  'en-bd',
  'en-za',
  'es-mx',
  'es-co',
  'ar',
  'hi',
  'bn',
  'ur',
  'fil',
  'tl',
];

bool localeUses12Hour(String locale) {
  final String normalized = locale.toLowerCase();
  return _twelveHourLocalePrefixes.any(normalized.startsWith);
}

bool resolveUse12Hour({
  required TimeFormatTypes timeFormat,
  required bool useSystemLocaleForTimeFormat,
  required String appLocale,
  required String systemLocale,
}) {
  return switch (timeFormat) {
    TimeFormatTypes.twelveHour => true,
    TimeFormatTypes.twentyFourHour => false,
    TimeFormatTypes.auto => localeUses12Hour(
      useSystemLocaleForTimeFormat ? systemLocale : appLocale,
    ),
    TimeFormatTypes.$unknown => localeUses12Hour(appLocale),
  };
}

String formatUserTime(
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
}) {
  final DateFormat formatter = use12Hour
      ? DateFormat.jm(locale)
      : DateFormat.Hm(locale);
  return formatter.format(localDateTime);
}

String formatUserDateTime(
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
}) {
  final DateFormat formatter = use12Hour
      ? DateFormat.yMd(locale).add_jm()
      : DateFormat.yMd(locale).add_Hm();
  return formatter.format(localDateTime);
}

String formatUserMediumDate(DateTime localDateTime, String locale) {
  return DateFormat.yMMMd(locale).format(localDateTime);
}

String formatUserMediumDateTime(
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
}) {
  final DateFormat formatter = use12Hour
      ? DateFormat.yMMMd(locale).add_jm()
      : DateFormat.yMMMd(locale).add_Hm();
  return formatter.format(localDateTime);
}
