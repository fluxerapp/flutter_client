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
    'S' => formatUserDateTime(
      localDateTime,
      locale,
      use12Hour: use12Hour,
      withSeconds: true,
    ),
    't' => formatUserTime(localDateTime, locale, use12Hour: use12Hour),
    'T' => formatUserTime(
      localDateTime,
      locale,
      use12Hour: use12Hour,
      withSeconds: true,
    ),
    'd' => DateFormat.yMd(locale).format(localDateTime),
    'D' => DateFormat.yMMMMd(locale).format(localDateTime),
    'F' => _dateWithTime(
      DateFormat.yMMMMEEEEd(locale),
      localDateTime,
      locale,
      use12Hour: use12Hour,
    ),
    'R' => relativeTimestamp(localDateTime, l10n, now: now ?? DateTime.now()),
    _ => _dateWithTime(
      DateFormat.yMMMMd(locale),
      localDateTime,
      locale,
      use12Hour: use12Hour,
    ),
  };
}

String _dateWithTime(
  DateFormat dateFormat,
  DateTime localDateTime,
  String locale, {
  required bool use12Hour,
}) {
  return '${dateFormat.format(localDateTime)} ${formatUserTime(localDateTime, locale, use12Hour: use12Hour)}';
}
