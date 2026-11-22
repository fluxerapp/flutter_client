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

const String kRegionalFormatSystem = 'system';

const List<String> kRegionalFormatLocales = <String>[
  'ar-AE',
  'ar-EG',
  'ar-SA',
  'be-BY',
  'bg-BG',
  'bn-BD',
  'bn-IN',
  'ca-ES',
  'cs-CZ',
  'da-DK',
  'de-AT',
  'de-CH',
  'de-DE',
  'el-GR',
  'en-AU',
  'en-CA',
  'en-GB',
  'en-IE',
  'en-IN',
  'en-NZ',
  'en-PH',
  'en-SG',
  'en-US',
  'en-ZA',
  'es-419',
  'es-AR',
  'es-CL',
  'es-CO',
  'es-ES',
  'es-MX',
  'es-US',
  'et-EE',
  'fi-FI',
  'fil-PH',
  'fr-BE',
  'fr-CA',
  'fr-CH',
  'fr-FR',
  'he-IL',
  'hi-IN',
  'hr-HR',
  'hu-HU',
  'id-ID',
  'is-IS',
  'it-CH',
  'it-IT',
  'ja-JP',
  'ko-KR',
  'lt-LT',
  'lv-LV',
  'ms-MY',
  'nb-NO',
  'nl-BE',
  'nl-NL',
  'pl-PL',
  'pt-BR',
  'pt-PT',
  'ro-RO',
  'ru-RU',
  'sk-SK',
  'sl-SI',
  'sq-AL',
  'sr-RS',
  'sv-FI',
  'sv-SE',
  'th-TH',
  'tr-TR',
  'uk-UA',
  'vi-VN',
  'zh-CN',
  'zh-HK',
  'zh-TW',
];

String? _regionalLocaleOverride;
TimestampFormatTypes _timestampFormat = TimestampFormatTypes.auto;

String? resolveIntlLocale(String locale) {
  final String canonical = Intl.canonicalizedLocale(
    locale.replaceAll('-', '_'),
  );
  if (DateFormat.localeExists(canonical)) {
    return canonical;
  }
  final String language = canonical.split('_').first;
  return DateFormat.localeExists(language) ? language : null;
}

void configureUserDateFormatting({
  required String? regionalLocale,
  required TimestampFormatTypes timestampFormat,
}) {
  final String? resolved = regionalLocale == null
      ? null
      : resolveIntlLocale(regionalLocale);
  if (resolved == _regionalLocaleOverride &&
      timestampFormat == _timestampFormat) {
    return;
  }
  _regionalLocaleOverride = resolved;
  _timestampFormat = timestampFormat;
  _formatCache.clear();
}

String _formattingLocale(String locale) => _regionalLocaleOverride ?? locale;

String? numericDatePatternFor(TimestampFormatTypes format) {
  return switch (format) {
    TimestampFormatTypes.iso8601 => 'yyyy-MM-dd',
    TimestampFormatTypes.dayMonthYear => 'dd/MM/yyyy',
    TimestampFormatTypes.monthDayYear => 'MM/dd/yyyy',
    _ => null,
  };
}

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
    _formattingLocale(locale),
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
    _formattingLocale(locale),
    use12Hour: use12Hour,
    withSeconds: withSeconds,
  ).format(localDateTime);
}

String formatUserCompactDateTime(
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
}) {
  final String formatting = _formattingLocale(locale);
  final String datePattern =
      numericDatePatternFor(_timestampFormat) ??
      DateFormat.yMd(formatting).pattern!.replaceAll(RegExp('y+'), 'yy');
  final String date = DateFormat(datePattern, formatting).format(localDateTime);
  final String time = formatUserTime(
    localDateTime,
    locale,
    use12Hour: use12Hour,
  );
  return '$date, $time';
}

String formatUserFullDate(DateTime localDateTime, String locale) {
  return DateFormat.yMMMMEEEEd(_formattingLocale(locale)).format(localDateTime);
}

String formatUserMediumDate(DateTime localDateTime, String locale) {
  return DateFormat.yMMMd(_formattingLocale(locale)).format(localDateTime);
}

String formatUserMediumDateTime(
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
}) {
  return _cachedFormat(
    _UserFormatKind.mediumDateTime,
    _formattingLocale(locale),
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
    _UserFormatKind.shortDateTime => _numericDateFormat(
      locale,
    ).addPattern(timePattern),
    _UserFormatKind.mediumDateTime => DateFormat.yMMMd(
      locale,
    ).addPattern(timePattern),
  };
}

DateFormat _numericDateFormat(String locale) {
  final String? pattern = numericDatePatternFor(_timestampFormat);
  return pattern == null ? DateFormat.yMd(locale) : DateFormat(pattern, locale);
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
  if (pattern.contains('H') || pattern.contains('k')) {
    return withSeconds ? 'h:mm:ss a' : 'h:mm a';
  }
  return pattern;
}
