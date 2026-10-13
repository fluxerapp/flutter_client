import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String durationOptionLabel(FluxerLocalizations l10n, int seconds) {
  return switch (seconds) {
    0 => l10n.durationPermanent,
    60 => l10n.duration60Seconds,
    300 => l10n.duration5Minutes,
    600 => l10n.duration10Minutes,
    3600 => l10n.duration1Hour,
    43200 => l10n.duration12Hours,
    86400 => l10n.duration1Day,
    259200 => l10n.duration3Days,
    432000 => l10n.duration5Days,
    604800 => l10n.duration1Week,
    1209600 => l10n.duration2Weeks,
    2592000 => l10n.duration1Month,
    _ => '$seconds',
  };
}
