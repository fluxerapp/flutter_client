import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';

int getViewerOffsetMinutes() {
  return DateTime.now().timeZoneOffset.inMinutes;
}

DateTime dateTimeAtOffset(DateTime now, int offsetMinutes) {
  return DateTime.fromMillisecondsSinceEpoch(
    now.millisecondsSinceEpoch + offsetMinutes * 60 * 1000,
    isUtc: true,
  );
}

String formatProfileLocalTime({
  required DateTime now,
  required int offsetMinutes,
  required String locale,
  required bool use12Hour,
}) {
  final DateTime utcAdjusted = dateTimeAtOffset(now, offsetMinutes);
  final DateTime wallClock = DateTime(
    utcAdjusted.year,
    utcAdjusted.month,
    utcAdjusted.day,
    utcAdjusted.hour,
    utcAdjusted.minute,
  );
  return formatUserTime(wallClock, locale, use12Hour: use12Hour);
}

String formatOffsetDifferenceDuration(FluxerLocalizations l10n, int minutes) {
  final int absolute = minutes.abs();
  final int hours = absolute ~/ 60;
  final int remainingMinutes = absolute % 60;
  if (hours > 0 && remainingMinutes > 0) {
    return l10n.userProfileTimezoneDurationHoursMinutes(
      hours,
      remainingMinutes,
    );
  }
  if (hours > 0) {
    return l10n.userProfileTimezoneDurationHours(hours);
  }
  return l10n.userProfileTimezoneDurationMinutes(remainingMinutes);
}

String formatTimezoneDifferenceText({
  required FluxerLocalizations l10n,
  required int profileOffsetMinutes,
  required int viewerOffsetMinutes,
}) {
  final int offsetDifference = profileOffsetMinutes - viewerOffsetMinutes;
  if (offsetDifference == 0) {
    return l10n.userProfileSameTimeAsYou;
  }
  if (offsetDifference > 0) {
    return l10n.userProfileTimeAheadOfYou(
      formatOffsetDifferenceDuration(l10n, offsetDifference),
    );
  }
  return l10n.userProfileTimeBehindYou(
    formatOffsetDifferenceDuration(l10n, offsetDifference),
  );
}
