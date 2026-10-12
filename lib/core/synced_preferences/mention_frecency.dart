import 'dart:math' as math;

import 'package:flutter/foundation.dart';

const int kMentionFrecencyHalfLifeMs = 14 * 24 * 60 * 60 * 1000;
const int kMentionFrecencyMaxEntriesPerScope = 100;
const String kMentionFrecencyGlobalScope = '';

@immutable
class MentionFrecencyEntry {
  const MentionFrecencyEntry({required this.count, required this.lastAtMs});

  final int count;
  final int lastAtMs;

  @override
  bool operator ==(Object other) =>
      other is MentionFrecencyEntry &&
      other.count == count &&
      other.lastAtMs == lastAtMs;

  @override
  int get hashCode => Object.hash(count, lastAtMs);

  @override
  String toString() => 'MentionFrecencyEntry($count, $lastAtMs)';
}

typedef MentionFrecencyScopes = Map<String, Map<String, MentionFrecencyEntry>>;

double mentionFrecencyScore(MentionFrecencyEntry entry, int nowMs) {
  final int ageMs = math.max(0, nowMs - entry.lastAtMs);
  return (math.log(entry.count + 1) / math.ln2) *
      math.pow(0.5, ageMs / kMentionFrecencyHalfLifeMs);
}

MentionFrecencyScopes recordMentionFrecency(
  MentionFrecencyScopes scopes, {
  required String? guildId,
  required String userId,
  required int nowMs,
}) {
  final String scope = guildId ?? kMentionFrecencyGlobalScope;
  final Map<String, MentionFrecencyEntry> entries = {...?scopes[scope]};
  entries[userId] = MentionFrecencyEntry(
    count: (entries[userId]?.count ?? 0) + 1,
    lastAtMs: nowMs,
  );
  return {...scopes, scope: _pruneScope(entries, nowMs)};
}

Map<String, MentionFrecencyEntry> _pruneScope(
  Map<String, MentionFrecencyEntry> entries,
  int nowMs,
) {
  if (entries.length <= kMentionFrecencyMaxEntriesPerScope) {
    return entries;
  }
  final ranked = [
    for (final MapEntry(:key, :value) in entries.entries)
      (key: key, score: mentionFrecencyScore(value, nowMs)),
  ];
  mergeSort(ranked, compare: (a, b) => b.score.compareTo(a.score));
  final Set<String> dropped = {
    for (final item in ranked.skip(kMentionFrecencyMaxEntriesPerScope))
      item.key,
  };
  return {
    for (final MapEntry(:key, :value) in entries.entries)
      if (!dropped.contains(key)) key: value,
  };
}

bool mentionFrecencyScopesEqual(
  MentionFrecencyScopes a,
  MentionFrecencyScopes b,
) {
  if (a.length != b.length) {
    return false;
  }
  for (final MapEntry(:key, :value) in a.entries) {
    final Map<String, MentionFrecencyEntry>? other = b[key];
    if (other == null || !mapEquals(value, other)) {
      return false;
    }
  }
  return true;
}
