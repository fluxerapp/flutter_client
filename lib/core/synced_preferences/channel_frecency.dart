import 'dart:math' as math;

import 'package:flutter/foundation.dart';

const int kChannelFrecencyMaxItems = 100;
const int kChannelFrecencyMaxSamples = 10;

const int _dayMs = 86400000;
const int _minuteMs = 60000;

final RegExp _trackableId = RegExp(r'^\d{17,19}$');

bool isTrackableChannelFrecencyId(String? id) =>
    id != null && _trackableId.hasMatch(id);

@immutable
class ChannelFrecencyUse {
  const ChannelFrecencyUse({required this.totalUses, required this.recentUses});

  final int totalUses;
  final List<int> recentUses;

  @override
  bool operator ==(Object other) =>
      other is ChannelFrecencyUse &&
      other.totalUses == totalUses &&
      listEquals(other.recentUses, recentUses);

  @override
  int get hashCode => Object.hash(totalUses, Object.hashAll(recentUses));

  @override
  String toString() => 'ChannelFrecencyUse($totalUses, $recentUses)';
}

typedef ChannelFrecencyUsage = Map<String, ChannelFrecencyUse>;

int _utcOffsetMinutes(int timestampMs) =>
    DateTime.fromMillisecondsSinceEpoch(timestampMs).timeZoneOffset.inMinutes;

int channelFrecencyDayDiff(int nowMs, int thenMs) {
  final int zoneDeltaMs =
      (_utcOffsetMinutes(thenMs) - _utcOffsetMinutes(nowMs)) * _minuteMs;
  return (nowMs - thenMs - zoneDeltaMs) ~/ _dayMs;
}

int channelFrecencyWeight(int dayDiff) => switch (dayDiff) {
  0 => 100,
  >= 1 && < 2 => 70,
  >= 2 && < 4 => 50,
  >= 4 && < 7 => 30,
  >= 7 => 10,
  _ => 1,
};

int _scoreRecentUses(List<int> recentUses, int nowMs) {
  final int samples = math.min(recentUses.length, kChannelFrecencyMaxSamples);
  var score = 0;
  for (var index = 0; index < samples; index++) {
    score += channelFrecencyWeight(
      channelFrecencyDayDiff(nowMs, recentUses[index]),
    );
  }
  return score;
}

int channelFrecencyHeat(ChannelFrecencyUse use, int nowMs) {
  final int score = _scoreRecentUses(use.recentUses, nowMs);
  if (score <= 0) {
    return 0;
  }
  return (use.totalUses * (score / use.recentUses.length)).ceil();
}

ChannelFrecencyUsage _dropUnscored(ChannelFrecencyUsage usage, int nowMs) => {
  for (final MapEntry(:key, :value) in usage.entries)
    if (_scoreRecentUses(value.recentUses, nowMs) > 0) key: value,
};

ChannelFrecencyUsage capChannelFrecencyUsage(ChannelFrecencyUsage usage) {
  final next = Map<String, ChannelFrecencyUse>.of(usage);
  while (next.length > kChannelFrecencyMaxItems) {
    String? oldestKey;
    var oldestLastUse = double.infinity;
    for (final MapEntry(:key, :value) in next.entries) {
      if (value.recentUses.isEmpty) {
        continue;
      }
      final int lastUse = value.recentUses.last;
      if (lastUse < oldestLastUse) {
        oldestKey = key;
        oldestLastUse = lastUse.toDouble();
      }
    }
    if (oldestKey == null) {
      break;
    }
    next.remove(oldestKey);
  }
  return next;
}

ChannelFrecencyUsage trackChannelFrecencyUse(
  ChannelFrecencyUsage usage,
  String key,
  int nowMs,
) {
  final ChannelFrecencyUse? existing = usage[key];
  final next = Map<String, ChannelFrecencyUse>.of(usage);
  next[key] = existing == null
      ? ChannelFrecencyUse(totalUses: 1, recentUses: [nowMs])
      : ChannelFrecencyUse(
          totalUses: existing.totalUses + 1,
          recentUses: _lastSamples([...existing.recentUses, nowMs]),
        );
  return _dropUnscored(capChannelFrecencyUsage(next), nowMs);
}

List<int> _lastSamples(List<int> uses) =>
    uses.length > kChannelFrecencyMaxSamples
    ? uses.sublist(uses.length - kChannelFrecencyMaxSamples)
    : uses;

ChannelFrecencyUsage sanitizeChannelFrecencyUsage(
  ChannelFrecencyUsage usage,
  int nowMs,
) => _dropUnscored({
  for (final MapEntry(:key, :value) in usage.entries)
    key: ChannelFrecencyUse(
      totalUses: value.totalUses,
      recentUses: value.recentUses.where((use) => use > 0).toList(),
    ),
}, nowMs);

ChannelFrecencyUsage mergeChannelFrecencyUsage(
  ChannelFrecencyUsage local,
  ChannelFrecencyUsage incoming,
  int nowMs,
) {
  final merged = <String, ChannelFrecencyUse>{};
  for (final key in <String>{...local.keys, ...incoming.keys}) {
    final ChannelFrecencyUse? localUse = local[key];
    final ChannelFrecencyUse? incomingUse = incoming[key];
    final List<int> uses = <int>{
      ...?localUse?.recentUses.where((use) => use > 0),
      ...?incomingUse?.recentUses.where((use) => use > 0),
    }.toList()..sort();
    if (uses.isEmpty) {
      continue;
    }
    final int totalUses = math.max(
      localUse?.totalUses ?? 0,
      incomingUse?.totalUses ?? 0,
    );
    if (totalUses <= 0) {
      continue;
    }
    merged[key] = ChannelFrecencyUse(
      totalUses: totalUses,
      recentUses: _lastSamples(uses),
    );
  }
  return capChannelFrecencyUsage(_dropUnscored(merged, nowMs));
}

List<String> rankFrequentChannelIds(ChannelFrecencyUsage usage, int nowMs) {
  final ranked = [
    for (final MapEntry(:key, :value) in usage.entries)
      (id: key, heat: channelFrecencyHeat(value, nowMs)),
  ];
  mergeSort(ranked, compare: (a, b) => b.heat.compareTo(a.heat));
  return [for (final item in ranked.take(kChannelFrecencyMaxItems)) item.id];
}

bool channelFrecencyUsageEqual(
  ChannelFrecencyUsage a,
  ChannelFrecencyUsage b,
) => mapEquals(a, b);
