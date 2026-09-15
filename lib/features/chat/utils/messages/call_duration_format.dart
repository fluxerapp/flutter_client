import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

typedef _DurationUnit = ({String name, int minutes});

const List<_DurationUnit> _kCallDurationUnits = <_DurationUnit>[
  (name: 'year', minutes: 525600),
  (name: 'month', minutes: 43800),
  (name: 'week', minutes: 10080),
  (name: 'day', minutes: 1440),
  (name: 'hour', minutes: 60),
  (name: 'minute', minutes: 1),
];

String formatCallDuration({
  required FluxerLocalizations l10n,
  required double durationSeconds,
}) {
  if (durationSeconds < 60) {
    return l10n.systemCallDurationFewSeconds;
  }
  final int roundedMinutes = durationSeconds < 60
      ? 1
      : (durationSeconds / 60).ceil().clamp(1, 1 << 30);
  final List<String> parts = <String>[];
  int remainingMinutes = roundedMinutes;
  for (final _DurationUnit unit in _kCallDurationUnits) {
    if (remainingMinutes < unit.minutes) {
      continue;
    }
    final int count = remainingMinutes ~/ unit.minutes;
    remainingMinutes -= count * unit.minutes;
    parts.add(_formatDurationUnit(l10n: l10n, value: count, unit: unit.name));
  }
  if (parts.isEmpty) {
    return l10n.systemCallDurationMinute;
  }
  return _formatConjunction(parts);
}

String _formatConjunction(List<String> parts) {
  if (parts.length == 1) {
    return parts.first;
  }
  if (parts.length == 2) {
    return '${parts[0]} and ${parts[1]}';
  }
  return '${parts.sublist(0, parts.length - 1).join(', ')} and ${parts.last}';
}

String _formatDurationUnit({
  required FluxerLocalizations l10n,
  required int value,
  required String unit,
}) {
  if (value == 1) {
    return switch (unit) {
      'year' => l10n.systemCallDurationOneYear,
      'month' => l10n.systemCallDurationOneMonth,
      'week' => l10n.systemCallDurationOneWeek,
      'day' => l10n.systemCallDurationOneDay,
      'hour' => l10n.systemCallDurationOneHour,
      _ => l10n.systemCallDurationMinute,
    };
  }
  return switch (unit) {
    'year' => l10n.systemCallDurationYears(value),
    'month' => l10n.systemCallDurationMonths(value),
    'week' => l10n.systemCallDurationWeeks(value),
    'day' => l10n.systemCallDurationDays(value),
    'hour' => l10n.systemCallDurationHours(value),
    _ => l10n.systemCallDurationMinutes(value),
  };
}
