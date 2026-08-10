import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String formatPrivacyCooldown(FluxerLocalizations l10n, int remainingMs) {
  final int totalSeconds = (remainingMs / 1000).ceil().clamp(0, 1 << 30);
  final int hours = totalSeconds ~/ 3600;
  final int minutes = (totalSeconds % 3600) ~/ 60;
  final int seconds = totalSeconds % 60;
  if (hours > 0) {
    if (minutes > 0) {
      return l10n.privacyDashboardDurationHoursMinutes(hours, minutes);
    }
    return l10n.privacyDashboardDurationHours(hours);
  }
  if (minutes > 0) {
    return l10n.privacyDashboardDurationMinutes(minutes);
  }
  return l10n.privacyDashboardDurationSeconds(seconds);
}
