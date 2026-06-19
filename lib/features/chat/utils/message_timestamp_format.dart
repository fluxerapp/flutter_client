import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:intl/intl.dart';

/// Formats an inline chat message timestamp for today, yesterday, or older dates.
///
/// [localDateTime] must already be in local time. [locale] is typically
/// `Localizations.localeOf(context).toString()`.
String formatMessageTimestamp(
  DateTime localDateTime,
  FluxerLocalizations l10n,
  String locale, {
  DateTime? now,
}) {
  final DateTime reference = now ?? DateTime.now();
  final String time = DateFormat.jm(locale).format(localDateTime);
  if (_isSameCalendarDay(localDateTime, reference)) {
    return l10n.chatMessageTimestampToday(time);
  }
  final DateTime yesterday = DateTime(
    reference.year,
    reference.month,
    reference.day,
  ).subtract(const Duration(days: 1));
  if (_isSameCalendarDay(localDateTime, yesterday)) {
    return l10n.chatMessageTimestampYesterday(time);
  }
  return DateFormat.yMd(locale).add_jm().format(localDateTime);
}

bool _isSameCalendarDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
