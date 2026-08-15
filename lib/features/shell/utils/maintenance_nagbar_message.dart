import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

String formatMaintenanceDurationLabel({
  required int durationMinutes,
  required Locale locale,
}) {
  final int normalizedDurationMinutes = durationMinutes.clamp(1, 1 << 30);
  if (normalizedDurationMinutes % (24 * 60) == 0) {
    final int days = normalizedDurationMinutes ~/ (24 * 60);
    return _formatUnit(days, 'day', locale);
  }
  if (normalizedDurationMinutes % 60 == 0) {
    final int hours = normalizedDurationMinutes ~/ 60;
    return _formatUnit(hours, 'hour', locale);
  }
  return _formatUnit(normalizedDurationMinutes, 'minute', locale);
}

String _formatUnit(int value, String unit, Locale locale) {
  try {
    return '${NumberFormat.decimalPattern(locale.toString()).format(value)} $unit${value == 1 ? '' : 's'}';
  } on Object {
    return '$value $unit${value == 1 ? '' : 's'}';
  }
}

String formatMaintenanceTimeLabel({
  required DateTime start,
  required Locale locale,
}) {
  return DateFormat.yMMMd(locale.toString()).add_jm().format(start.toLocal());
}

String maintenanceNagbarMessage({
  required BuildContext context,
  required ServiceStatusMaintenance maintenance,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final Locale locale = Localizations.localeOf(context);
  final String duration = formatMaintenanceDurationLabel(
    durationMinutes: maintenance.durationMinutes,
    locale: locale,
  );
  return switch (maintenance.status) {
    ServiceStatusMaintenanceStatus.inProgress =>
      l10n.nagbarMaintenanceInProgress(duration),
    ServiceStatusMaintenanceStatus.completed => l10n.nagbarMaintenanceComplete,
    ServiceStatusMaintenanceStatus.scheduled => l10n.nagbarMaintenanceScheduled(
      formatMaintenanceTimeLabel(start: maintenance.start, locale: locale),
      duration,
    ),
  };
}

Color maintenanceNagbarBackgroundColor(ServiceStatusMaintenance maintenance) {
  return switch (maintenance.status) {
    ServiceStatusMaintenanceStatus.scheduled => const Color(0xFF1D4ED8),
    ServiceStatusMaintenanceStatus.inProgress => const Color(0xFF9A3412),
    ServiceStatusMaintenanceStatus.completed => const Color(0xFF166534),
  };
}
