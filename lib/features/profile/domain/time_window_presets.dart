import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

enum TimeWindowKey {
  tenS,
  fifteenM,
  thirtyM,
  oneH,
  threeH,
  fourH,
  eightH,
  twentyFourH,
  threeD,
  never,
}

class TimeWindowPreset {
  const TimeWindowPreset({required this.key, required this.minutes});

  final TimeWindowKey key;

  /// Duration in minutes; `null` means no expiry.
  final double? minutes;
}

const Duration kExpiryMatchTolerance = Duration(minutes: 1);

const List<TimeWindowPreset> kBaseTimeWindowPresets = <TimeWindowPreset>[
  TimeWindowPreset(key: TimeWindowKey.fifteenM, minutes: 15),
  TimeWindowPreset(key: TimeWindowKey.thirtyM, minutes: 30),
  TimeWindowPreset(key: TimeWindowKey.oneH, minutes: 60),
  TimeWindowPreset(key: TimeWindowKey.threeH, minutes: 180),
  TimeWindowPreset(key: TimeWindowKey.fourH, minutes: 240),
  TimeWindowPreset(key: TimeWindowKey.eightH, minutes: 480),
  TimeWindowPreset(key: TimeWindowKey.twentyFourH, minutes: 1440),
  TimeWindowPreset(key: TimeWindowKey.threeD, minutes: 4320),
  TimeWindowPreset(key: TimeWindowKey.never, minutes: null),
];

const TimeWindowPreset kDeveloperTimeWindowPreset = TimeWindowPreset(
  key: TimeWindowKey.tenS,
  minutes: 10 / 60,
);

Duration? minutesToDuration(double? minutes) {
  if (minutes == null) {
    return null;
  }
  return Duration(milliseconds: (minutes * 60 * 1000).round());
}

List<TimeWindowPreset> getTimeWindowPresets({
  required bool includeDeveloperOptions,
  bool includeNever = true,
}) {
  final List<TimeWindowPreset> presets = includeDeveloperOptions
      ? <TimeWindowPreset>[
          kDeveloperTimeWindowPreset,
          ...kBaseTimeWindowPresets,
        ]
      : List<TimeWindowPreset>.from(kBaseTimeWindowPresets);
  if (!includeNever) {
    return presets
        .where((TimeWindowPreset preset) => preset.key != TimeWindowKey.never)
        .toList(growable: false);
  }
  final int neverIndex = presets.indexWhere(
    (TimeWindowPreset preset) => preset.key == TimeWindowKey.never,
  );
  if (neverIndex <= 0) {
    return presets;
  }
  final TimeWindowPreset neverPreset = presets[neverIndex];
  final List<TimeWindowPreset> withoutNever = List<TimeWindowPreset>.from(
    presets,
  )..removeAt(neverIndex);
  return <TimeWindowPreset>[neverPreset, ...withoutNever];
}

String statusExpiryLabel(TimeWindowKey key, FluxerLocalizations l10n) {
  return switch (key) {
    TimeWindowKey.never => l10n.statusUntilIChangeIt,
    TimeWindowKey.tenS => l10n.statusFor10Seconds,
    TimeWindowKey.fifteenM => l10n.dmMuteFor15Min,
    TimeWindowKey.thirtyM => l10n.dmMuteFor30Min,
    TimeWindowKey.oneH => l10n.dmMuteFor1Hour,
    TimeWindowKey.threeH => l10n.dmMuteFor3Hours,
    TimeWindowKey.fourH => l10n.dmMuteFor4Hours,
    TimeWindowKey.eightH => l10n.dmMuteFor8Hours,
    TimeWindowKey.twentyFourH => l10n.dmMuteFor24Hours,
    TimeWindowKey.threeD => l10n.dmMuteFor3Days,
  };
}

String customStatusExpiryLabel(TimeWindowKey key, FluxerLocalizations l10n) {
  if (key == TimeWindowKey.never) {
    return l10n.statusDontClear;
  }
  return switch (key) {
    TimeWindowKey.tenS => l10n.statusClearAfter10Seconds,
    TimeWindowKey.fifteenM => l10n.statusClearAfter15Minutes,
    TimeWindowKey.thirtyM => l10n.statusClearAfter30Minutes,
    TimeWindowKey.oneH => l10n.statusClearAfter1Hour,
    TimeWindowKey.threeH => l10n.statusClearAfter3Hours,
    TimeWindowKey.fourH => l10n.statusClearAfter4Hours,
    TimeWindowKey.eightH => l10n.statusClearAfter8Hours,
    TimeWindowKey.twentyFourH => l10n.statusClearAfter24Hours,
    TimeWindowKey.threeD => l10n.statusClearAfter3Days,
    TimeWindowKey.never => l10n.statusDontClear,
  };
}

TimeWindowKey getTimeWindowKeyForExpiresAt(
  DateTime? expiresAt, {
  required bool includeDeveloperOptions,
  DateTime? referenceTime,
  TimeWindowKey fallbackKey = TimeWindowKey.twentyFourH,
}) {
  if (expiresAt == null) {
    return TimeWindowKey.never;
  }
  final DateTime reference = referenceTime ?? DateTime.now().toUtc();
  final Duration remaining = expiresAt.toUtc().difference(reference);
  if (remaining <= Duration.zero) {
    return fallbackKey;
  }
  final List<TimeWindowPreset> finitePresets = getTimeWindowPresets(
    includeDeveloperOptions: includeDeveloperOptions,
    includeNever: false,
  );
  for (final TimeWindowPreset preset in finitePresets) {
    final Duration? duration = minutesToDuration(preset.minutes);
    if (duration != null && remaining <= duration + kExpiryMatchTolerance) {
      return preset.key;
    }
  }
  return finitePresets.last.key;
}
