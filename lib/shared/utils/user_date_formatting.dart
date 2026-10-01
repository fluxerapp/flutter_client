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
  bool withSeconds = false,
}) {
  return _cachedFormat(
    _UserFormatKind.time,
    locale,
    use12Hour: use12Hour,
    withSeconds: withSeconds,
  ).format(localDateTime);
}

String formatUserDateTime(
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
  bool withSeconds = false,
}) {
  return _cachedFormat(
    _UserFormatKind.shortDateTime,
    locale,
    use12Hour: use12Hour,
    withSeconds: withSeconds,
  ).format(localDateTime);
}

String formatUserMediumDate(DateTime localDateTime, String locale) {
  return DateFormat.yMMMd(locale).format(localDateTime);
}

String formatUserMediumDateTime(
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
}) {
  return _cachedFormat(
    _UserFormatKind.mediumDateTime,
    locale,
    use12Hour: use12Hour,
    withSeconds: false,
  ).format(localDateTime);
}

enum _UserFormatKind { time, shortDateTime, mediumDateTime }

typedef _UserFormatKey = ({
  _UserFormatKind kind,
  String locale,
  bool use12Hour,
  bool withSeconds,
});

final Map<_UserFormatKey, DateFormat> _formatCache =
    <_UserFormatKey, DateFormat>{};

DateFormat _cachedFormat(
  _UserFormatKind kind,
  String locale, {
  required bool use12Hour,
  required bool withSeconds,
}) {
  final _UserFormatKey key = (
    kind: kind,
    locale: locale,
    use12Hour: use12Hour,
    withSeconds: withSeconds,
  );
  return _formatCache[key] ??= _buildFormat(
    kind,
    locale,
    _timePattern(locale, use12Hour: use12Hour, withSeconds: withSeconds),
  );
}

DateFormat _buildFormat(
  _UserFormatKind kind,
  String locale,
  String timePattern,
) {
  return switch (kind) {
    _UserFormatKind.time => DateFormat(timePattern, locale),
    _UserFormatKind.shortDateTime => DateFormat.yMd(
      locale,
    ).addPattern(timePattern),
    _UserFormatKind.mediumDateTime => DateFormat.yMMMd(
      locale,
    ).addPattern(timePattern),
  };
}

String _timePattern(
  String locale, {
  required bool use12Hour,
  required bool withSeconds,
}) {
  if (!use12Hour) {
    final DateFormat format = withSeconds
        ? DateFormat.Hms(locale)
        : DateFormat.Hm(locale);
    return format.pattern ?? (withSeconds ? 'HH:mm:ss' : 'HH:mm');
  }
  final DateFormat preferred = withSeconds
      ? DateFormat.jms(locale)
      : DateFormat.jm(locale);
  final String pattern =
      preferred.pattern ?? (withSeconds ? 'h:mm:ss a' : 'h:mm a');
  // jm follows the locale clock, so en_GB and similar stay 24-hour.
  if (pattern.contains('H') || pattern.contains('k')) {
    return withSeconds ? 'h:mm:ss a' : 'h:mm a';
  }
  return pattern;
}
