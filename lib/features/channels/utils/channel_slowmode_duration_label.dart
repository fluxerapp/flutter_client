import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String channelSlowmodeDurationLabel(FluxerLocalizations l10n, int seconds) {
  if (seconds <= 0) {
    return l10n.channelSettingsSlowmodeOff;
  }
  if (seconds < 60) {
    return l10n.channelSettingsSlowmodeSeconds(seconds);
  }
  if (seconds < 3600) {
    final int minutes = seconds ~/ 60;
    if (minutes == 1) {
      return l10n.channelSettingsSlowmodeOneMinute(minutes);
    }
    return l10n.channelSettingsSlowmodeMinutes(minutes);
  }
  final int hours = seconds ~/ 3600;
  if (hours == 1) {
    return l10n.channelSettingsSlowmodeOneHour(hours);
  }
  return l10n.channelSettingsSlowmodeHours(hours);
}
