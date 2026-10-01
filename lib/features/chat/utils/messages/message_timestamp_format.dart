import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';

/// Formats an inline chat message timestamp for today, yesterday, or older dates.
///
/// [localDateTime] must already be in local time. [locale] is typically
/// `Localizations.localeOf(context).toString()`.
String formatMessageTimestamp(
  DateTime localDateTime,
  FluxerLocalizations l10n,
  String locale, {
  required bool use12Hour,
  DateTime? now,
}) {
  final DateTime reference = now ?? DateTime.now();
  if (_isSameCalendarDay(localDateTime, reference)) {
    return l10n.chatMessageTimestampToday(
      formatUserTime(localDateTime, locale, use12Hour: use12Hour),
    );
  }
  final DateTime yesterday = DateTime(
    reference.year,
    reference.month,
    reference.day,
  ).subtract(const Duration(days: 1));
  if (_isSameCalendarDay(localDateTime, yesterday)) {
    return l10n.chatMessageTimestampYesterday(
      formatUserTime(localDateTime, locale, use12Hour: use12Hour),
    );
  }
  return formatUserDateTime(localDateTime, locale, use12Hour: use12Hour);
}

bool _isSameCalendarDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
