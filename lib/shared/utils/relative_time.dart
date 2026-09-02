import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

/// Long-form relative time (e.g. "5 minutes ago", "just now").
///
/// Mirrors the long-form used in Security & Login. Uses the existing
/// `relativeTime*` ARB keys.
String relativeTime(DateTime date, FluxerLocalizations l10n, {DateTime? now}) {
  final diff = (now ?? DateTime.now()).difference(date);
  if (diff.inDays > 365) {
    return l10n.relativeTimeYears((diff.inDays / 365).floor());
  }
  if (diff.inDays > 30) {
    return l10n.relativeTimeMonths((diff.inDays / 30).floor());
  }
  if (diff.inDays > 0) {
    return l10n.relativeTimeDays(diff.inDays);
  }
  if (diff.inHours > 0) {
    return l10n.relativeTimeHours(diff.inHours);
  }
  if (diff.inMinutes > 0) {
    return l10n.relativeTimeMinutes(diff.inMinutes);
  }
  return l10n.relativeTimeJustNow;
}

/// Relative time for markdown timestamps (`<t:unix:R>`).
///
/// Matches the web unit cascade for both past and future instants.
String relativeTimestamp(
  DateTime date,
  FluxerLocalizations l10n, {
  DateTime? now,
}) {
  final Duration delta = date.difference(now ?? DateTime.now());
  final bool future = !delta.isNegative;
  final Duration abs = delta.abs();
  final int absDays = abs.inDays;

  if (absDays >= 365) {
    final int years = absDays ~/ 365;
    return future
        ? l10n.relativeTimeInYears(years)
        : l10n.relativeTimeYears(years);
  }
  if (absDays >= 30) {
    final int months = absDays ~/ 30;
    return future
        ? l10n.relativeTimeInMonths(months)
        : l10n.relativeTimeMonths(months);
  }
  if (absDays >= 7) {
    final int weeks = absDays ~/ 7;
    return future
        ? l10n.relativeTimeInWeeks(weeks)
        : l10n.relativeTimeWeeks(weeks);
  }
  if (absDays > 0) {
    return future
        ? l10n.relativeTimeInDays(absDays)
        : l10n.relativeTimeDays(absDays);
  }
  if (abs.inHours > 0) {
    return future
        ? l10n.relativeTimeInHours(abs.inHours)
        : l10n.relativeTimeHours(abs.inHours);
  }
  if (abs.inMinutes > 0) {
    return future
        ? l10n.relativeTimeInMinutes(abs.inMinutes)
        : l10n.relativeTimeMinutes(abs.inMinutes);
  }
  return l10n.relativeTimeJustNow;
}

/// Short-form relative time (e.g. "5m", "2h", "3d", "2mo", "1y", "now").
///
/// Mirrors the web app's `formatShortRelativeTime` output. Used in compact
/// card layouts like Linked Devices.
String relativeTimeShort(DateTime date, FluxerLocalizations l10n) {
  final diff = DateTime.now().difference(date);
  if (diff.inDays > 365) {
    return l10n.relativeTimeShortYears((diff.inDays / 365).floor());
  }
  if (diff.inDays > 30) {
    return l10n.relativeTimeShortMonths((diff.inDays / 30).floor());
  }
  if (diff.inDays > 0) {
    return l10n.relativeTimeShortDays(diff.inDays);
  }
  if (diff.inHours > 0) {
    return l10n.relativeTimeShortHours(diff.inHours);
  }
  if (diff.inMinutes > 0) {
    return l10n.relativeTimeShortMinutes(diff.inMinutes);
  }
  return l10n.relativeTimeShortNow;
}
