import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:intl/intl.dart';

String formatMarkdownTimestamp(
  DateTime localDateTime,
  String style,
  FluxerLocalizations l10n, {
  required bool use12Hour,
  DateTime? now,
}) {
  final String locale = l10n.localeName;
  return switch (style) {
    's' => formatUserDateTime(localDateTime, locale, use12Hour: use12Hour),
    'S' => _dateTimeWithSeconds(localDateTime, locale, use12Hour: use12Hour),
    't' => formatUserTime(localDateTime, locale, use12Hour: use12Hour),
    'T' => _timeWithSeconds(localDateTime, locale, use12Hour: use12Hour),
    'd' => DateFormat.yMd(locale).format(localDateTime),
    'D' => DateFormat.yMMMMd(locale).format(localDateTime),
    'F' => _fullDateTime(localDateTime, locale, use12Hour: use12Hour),
    'R' => _relativeOrFutureDateTime(
      localDateTime,
      l10n,
      use12Hour: use12Hour,
      now: now ?? DateTime.now(),
    ),
    _ => _longDateTime(localDateTime, locale, use12Hour: use12Hour),
  };
}

String _timeWithSeconds(
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
}) {
  final DateFormat formatter = use12Hour
      ? DateFormat.jms(locale)
      : DateFormat.Hms(locale);
  return formatter.format(localDateTime);
}

String _dateTimeWithSeconds(
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
}) {
  final DateFormat formatter = use12Hour
      ? DateFormat.yMd(locale).add_jms()
      : DateFormat.yMd(locale).add_Hms();
  return formatter.format(localDateTime);
}

String _longDateTime(
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
}) {
  final DateFormat formatter = use12Hour
      ? DateFormat.yMMMMd(locale).add_jm()
      : DateFormat.yMMMMd(locale).add_Hm();
  return formatter.format(localDateTime);
}

String _fullDateTime(
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
}) {
  final DateFormat formatter = use12Hour
      ? DateFormat.yMMMMEEEEd(locale).add_jm()
      : DateFormat.yMMMMEEEEd(locale).add_Hm();
  return formatter.format(localDateTime);
}

String _relativeOrFutureDateTime(
  DateTime localDateTime,
  FluxerLocalizations l10n, {
  required bool use12Hour,
  required DateTime now,
}) {
  if (!localDateTime.isAfter(now)) {
    return relativeTime(localDateTime, l10n, now: now);
  }
  return formatUserMediumDateTime(
    localDateTime,
    l10n.localeName,
    use12Hour: use12Hour,
  );
}
