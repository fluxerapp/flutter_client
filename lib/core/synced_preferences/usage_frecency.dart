import 'dart:convert';
import 'dart:math' as math;

import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;

const int kUsageFrecencyHalfLifeMs = 7 * 24 * 60 * 60 * 1000;
const int kMaxTrackedUsageKeys = 200;
const int kMaxUsageCount = 100000;
const int kMaxUsageKeyLength = 256;

@immutable
class UsageEntry {
  const UsageEntry({required this.count, required this.lastUsedMs});

  final int count;
  final int lastUsedMs;

  @override
  bool operator ==(Object other) =>
      other is UsageEntry &&
      other.count == count &&
      other.lastUsedMs == lastUsedMs;

  @override
  int get hashCode => Object.hash(count, lastUsedMs);

  @override
  String toString() => 'UsageEntry($count, $lastUsedMs)';
}

bool isValidUsageKey(String key) =>
    key.isNotEmpty && key.length <= kMaxUsageKeyLength;

double usageFrecencyScore(UsageEntry entry, int nowMs) {
  final int ageMs = math.max(0, nowMs - entry.lastUsedMs);
  return (math.log(entry.count + 1) / math.ln2) *
      math.pow(0.5, ageMs / kUsageFrecencyHalfLifeMs);
}

UsageEntry bumpUsageEntry(UsageEntry? existing, int nowMs) => UsageEntry(
  count: math.min((existing?.count ?? 0) + 1, kMaxUsageCount),
  lastUsedMs: nowMs,
);

UsageEntry? _sanitizeUsageEntry(UsageEntry entry, int nowMs) {
  final int count = math.min(entry.count, kMaxUsageCount);
  if (count < 1) {
    return null;
  }
  final int lastUsedMs = entry.lastUsedMs.clamp(0, math.max(0, nowMs));
  return UsageEntry(count: count, lastUsedMs: lastUsedMs);
}

typedef _RankedUsage = ({String key, UsageEntry entry, double score});

int _compareRankedUsage(_RankedUsage a, _RankedUsage b) {
  if (a.score != b.score) {
    return b.score.compareTo(a.score);
  }
  if (a.entry.lastUsedMs != b.entry.lastUsedMs) {
    return b.entry.lastUsedMs.compareTo(a.entry.lastUsedMs);
  }
  if (a.entry.count != b.entry.count) {
    return b.entry.count.compareTo(a.entry.count);
  }
  return a.key.compareTo(b.key);
}

List<_RankedUsage> _rankEntries(Map<String, UsageEntry> usage, int nowMs) {
  return [
    for (final MapEntry(:key, :value) in usage.entries)
      (key: key, entry: value, score: usageFrecencyScore(value, nowMs)),
  ]..sort(_compareRankedUsage);
}

List<String> rankUsageKeys(Map<String, UsageEntry> usage, int nowMs) => [
  for (final ranked in _rankEntries(usage, nowMs)) ranked.key,
];

Map<String, double> usageScores(Map<String, UsageEntry> usage, int nowMs) => {
  for (final MapEntry(:key, :value) in usage.entries)
    key: usageFrecencyScore(value, nowMs),
};

Map<String, UsageEntry> sanitizeUsageMap(
  Map<String, UsageEntry> input,
  int nowMs, {
  int maxKeys = kMaxTrackedUsageKeys,
}) {
  final sanitized = <String, UsageEntry>{};
  for (final MapEntry(:key, :value) in input.entries) {
    if (!isValidUsageKey(key)) {
      continue;
    }
    final UsageEntry? entry = _sanitizeUsageEntry(value, nowMs);
    if (entry != null) {
      sanitized[key] = entry;
    }
  }
  if (sanitized.length <= maxKeys) {
    return sanitized;
  }
  return {
    for (final ranked in _rankEntries(sanitized, nowMs).take(maxKeys))
      ranked.key: ranked.entry,
  };
}

Map<String, UsageEntry> mergeUsageMaps(
  Map<String, UsageEntry> local,
  Map<String, UsageEntry> incoming,
  int nowMs, {
  int maxKeys = kMaxTrackedUsageKeys,
}) {
  final merged = <String, UsageEntry>{};
  for (final source in [local, incoming]) {
    for (final MapEntry(:key, :value) in source.entries) {
      final UsageEntry? existing = merged[key];
      merged[key] = existing == null
          ? value
          : UsageEntry(
              count: math.max(existing.count, value.count),
              lastUsedMs: math.max(existing.lastUsedMs, value.lastUsedMs),
            );
    }
  }
  return sanitizeUsageMap(merged, nowMs, maxKeys: maxKeys);
}

Map<String, UsageEntry> trackUsageKey(
  Map<String, UsageEntry> usage,
  String key,
  int nowMs,
) {
  final next = Map<String, UsageEntry>.of(usage)
    ..[key] = bumpUsageEntry(usage[key], nowMs);
  if (next.length > kMaxTrackedUsageKeys) {
    return sanitizeUsageMap(next, nowMs);
  }
  return next;
}

bool usageMapsEqual(Map<String, UsageEntry> a, Map<String, UsageEntry> b) {
  if (a.length != b.length) {
    return false;
  }
  for (final MapEntry(:key, :value) in a.entries) {
    if (b[key] != value) {
      return false;
    }
  }
  return true;
}

List<String> dedupeBoundedIds(Iterable<String> ids, int maxIds) {
  final deduped = <String>[];
  final seen = <String>{};
  for (final id in ids) {
    if (!isValidUsageKey(id) || !seen.add(id)) {
      continue;
    }
    deduped.add(id);
    if (deduped.length >= maxIds) {
      break;
    }
  }
  return deduped;
}

Map<String, UsageEntry> usageMapFromWire(
  Map<String, pickers_pb.UsageStat> wire,
) => {
  for (final MapEntry(:key, :value) in wire.entries)
    key: UsageEntry(count: value.count, lastUsedMs: value.lastUsedMs.toInt()),
};

void writeUsageMapToWire(
  Map<String, pickers_pb.UsageStat> wire,
  Map<String, UsageEntry> usage,
) {
  wire
    ..clear()
    ..addAll({
      for (final MapEntry(:key, :value) in usage.entries)
        key: pickers_pb.UsageStat(
          count: value.count,
          lastUsedMs: Int64(value.lastUsedMs),
        ),
    });
}

String encodeUsageMapJson(Map<String, UsageEntry> usage) => jsonEncode({
  for (final MapEntry(:key, :value) in usage.entries)
    key: [value.count, value.lastUsedMs],
});

Map<String, UsageEntry> decodeUsageMapJson(String? encoded) {
  if (encoded == null || encoded.isEmpty) {
    return const {};
  }
  final Object? decoded;
  try {
    decoded = jsonDecode(encoded);
  } on FormatException {
    return const {};
  }
  if (decoded is! Map<String, Object?>) {
    return const {};
  }
  final usage = <String, UsageEntry>{};
  for (final MapEntry(:key, :value) in decoded.entries) {
    if (value case [final int count, final int lastUsedMs]) {
      usage[key] = UsageEntry(count: count, lastUsedMs: lastUsedMs);
    }
  }
  return usage;
}
