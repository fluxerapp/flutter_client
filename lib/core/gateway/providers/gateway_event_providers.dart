import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart' show mapEquals;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_voice_state.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gateway_event_providers.g.dart';

String _voiceStateStorageKey(VoiceState voiceState) {
  if (voiceState.channelId == null) {
    throw StateError('Storage key is only for in-channel states.');
  }
  if (voiceState.connectionId != null) {
    return voiceState.connectionId!;
  }
  return voiceStateSyntheticStorageKey(
    userId: voiceState.userId,
    channelId: voiceState.channelId!,
  );
}

List<VoiceState> _voiceStatesInGuildChannel(
  Map<String, VoiceState> map,
  String guildId,
  String channelId,
) {
  final List<VoiceState> out = <VoiceState>[];
  for (final VoiceState vs in map.values) {
    if (vs.channelId == channelId && vs.guildId == guildId) {
      out.add(vs);
    }
  }
  return out;
}

bool _isInPrivateChannel(VoiceState voiceState, String channelId) {
  final String? guildId = voiceState.guildId;
  return voiceState.channelId == channelId &&
      (guildId == null || guildId.isEmpty);
}

bool _isNewerVoiceState(VoiceState voiceState, VoiceState other) {
  final int? version = voiceState.version;
  final int? otherVersion = other.version;
  return version != null && otherVersion != null && version > otherVersion;
}

List<VoiceState> _voiceStatesInPrivateChannel(
  Map<String, VoiceState> map,
  String channelId,
) {
  return <VoiceState>[
    for (final VoiceState vs in map.values)
      if (_isInPrivateChannel(vs, channelId)) vs,
  ];
}

String _voiceStatesFingerprint(Iterable<VoiceState> states) {
  final List<String> parts = <String>[];
  for (final VoiceState vs in states) {
    parts.add('${_voiceStateStorageKey(vs)}:${vs.hashCode}');
  }
  parts.sort();
  return parts.join('|');
}

int _distinctUserCountInChannel(Iterable<VoiceState> states) {
  final Set<String> userIds = <String>{};
  for (final VoiceState vs in states) {
    userIds.add(vs.userId);
  }
  return userIds.length;
}

List<VoiceState> otherUserConnectionsInChannel({
  required Map<String, VoiceState> voiceStates,
  required String? guildId,
  required String channelId,
  required String currentUserId,
  String? localConnectionId,
}) {
  bool matchesGuild(VoiceState vs) {
    if (guildId == null) {
      return vs.guildId == null;
    }
    return vs.guildId == guildId;
  }

  return voiceStates.values
      .where(
        (VoiceState vs) =>
            vs.channelId == channelId &&
            vs.userId == currentUserId &&
            vs.connectionId != null &&
            vs.connectionId != localConnectionId &&
            matchesGuild(vs),
      )
      .toList();
}

typedef SelfVoiceConnectionsForJoin = ({
  List<VoiceState> stale,
  List<VoiceState> otherDevices,
});

SelfVoiceConnectionsForJoin partitionSelfVoiceConnectionsForJoin({
  required Map<String, VoiceState> voiceStates,
  required String? guildId,
  required String channelId,
  required String currentUserId,
  required String? gatewaySessionId,
  required VoiceSessionState session,
}) {
  final List<VoiceState> candidates = otherUserConnectionsInChannel(
    voiceStates: voiceStates,
    guildId: guildId,
    channelId: channelId,
    currentUserId: currentUserId,
    localConnectionId: session.activeConnectionId,
  );
  if (session.isInVoice || candidates.isEmpty || gatewaySessionId == null) {
    return (stale: const <VoiceState>[], otherDevices: candidates);
  }
  final List<VoiceState> stale = <VoiceState>[];
  final List<VoiceState> otherDevices = <VoiceState>[];
  for (final VoiceState vs in candidates) {
    if (vs.sessionId == gatewaySessionId) {
      stale.add(vs);
    } else {
      otherDevices.add(vs);
    }
  }
  return (stale: stale, otherDevices: otherDevices);
}

const Duration kTypingExpiry = Duration(seconds: 10);

@Riverpod(keepAlive: true)
class TypingIndicators extends _$TypingIndicators {
  Timer? _expiryTimer;

  @override
  Map<String, Map<String, DateTime>> build() {
    ref.onDispose(() => _expiryTimer?.cancel());
    return const <String, Map<String, DateTime>>{};
  }

  void addTyping(String channelId, String userId) {
    final DateTime expiresAt = clock.now().add(kTypingExpiry);
    final Map<String, Map<String, DateTime>> next =
        Map<String, Map<String, DateTime>>.from(state);
    final Map<String, DateTime> channelEntries = Map<String, DateTime>.from(
      next[channelId] ?? const <String, DateTime>{},
    );
    channelEntries[userId] = expiresAt;
    next[channelId] = channelEntries;
    state = next;
    _scheduleExpiry(clock.now());
  }

  void removeTyping(String channelId, String userId) {
    final Map<String, DateTime>? existing = state[channelId];
    if (existing == null || !existing.containsKey(userId)) {
      return;
    }
    final Map<String, Map<String, DateTime>> next =
        Map<String, Map<String, DateTime>>.from(state);
    final Map<String, DateTime> channelEntries = Map<String, DateTime>.from(
      existing,
    )..remove(userId);
    if (channelEntries.isEmpty) {
      next.remove(channelId);
    } else {
      next[channelId] = channelEntries;
    }
    state = next;
    _scheduleExpiry(clock.now());
  }

  void clearAll() {
    _expiryTimer?.cancel();
    _expiryTimer = null;
    state = const <String, Map<String, DateTime>>{};
  }

  void _scheduleExpiry(DateTime now) {
    _expiryTimer?.cancel();
    _expiryTimer = null;
    DateTime? nearest;
    for (final Map<String, DateTime> entries in state.values) {
      for (final DateTime expiresAt in entries.values) {
        if (nearest == null || expiresAt.isBefore(nearest)) {
          nearest = expiresAt;
        }
      }
    }
    if (nearest == null) {
      return;
    }
    final Duration delay = nearest.isAfter(now)
        ? nearest.difference(now)
        : Duration.zero;
    _expiryTimer = Timer(delay, _pruneExpired);
  }

  void _pruneExpired() {
    _expiryTimer = null;
    final DateTime now = clock.now();
    Map<String, Map<String, DateTime>>? next;
    state.forEach((String channelId, Map<String, DateTime> entries) {
      if (!entries.values.any((DateTime e) => !e.isAfter(now))) {
        return;
      }
      next ??= Map<String, Map<String, DateTime>>.from(state);
      final Map<String, DateTime> kept = <String, DateTime>{
        for (final MapEntry<String, DateTime> e in entries.entries)
          if (e.value.isAfter(now)) e.key: e.value,
      };
      if (kept.isEmpty) {
        next!.remove(channelId);
      } else {
        next![channelId] = kept;
      }
    });
    if (next != null) {
      state = next!;
    }
    _scheduleExpiry(now);
  }
}

@Riverpod(keepAlive: true)
class VoiceStatesMap extends _$VoiceStatesMap {
  @override
  Map<String, VoiceState> build() => {};

  void update(VoiceState voiceState) {
    final Map<String, VoiceState> next = Map<String, VoiceState>.of(state);
    if (voiceState.channelId == null) {
      final String? connectionId = voiceState.connectionId;
      if (connectionId != null) {
        final List<String> keysToRemove = next.entries
            .where(
              (MapEntry<String, VoiceState> e) =>
                  e.key == connectionId || e.value.connectionId == connectionId,
            )
            .map((MapEntry<String, VoiceState> e) => e.key)
            .toList();
        if (keysToRemove.isEmpty) {
          return;
        }
        for (final String k in keysToRemove) {
          next.remove(k);
        }
      } else {
        final List<String> keysToRemove = next.entries
            .where(
              (MapEntry<String, VoiceState> e) =>
                  e.value.userId == voiceState.userId,
            )
            .map((MapEntry<String, VoiceState> e) => e.key)
            .toList();
        if (keysToRemove.isEmpty) {
          return;
        }
        for (final String k in keysToRemove) {
          next.remove(k);
        }
      }
      state = next;
      return;
    }
    final String key = _voiceStateStorageKey(voiceState);
    final VoiceState? existing = next[key];
    if (existing == voiceState ||
        (existing != null && _isNewerVoiceState(existing, voiceState))) {
      return;
    }
    if (voiceState.connectionId != null &&
        voiceState.channelId != null &&
        key !=
            voiceStateSyntheticStorageKey(
              userId: voiceState.userId,
              channelId: voiceState.channelId!,
            )) {
      next.remove(
        voiceStateSyntheticStorageKey(
          userId: voiceState.userId,
          channelId: voiceState.channelId!,
        ),
      );
    }
    next[key] = voiceState;
    state = next;
  }

  void updateBulk(List<VoiceState> voiceStates) {
    final Map<String, VoiceState> updated = Map<String, VoiceState>.of(state);
    bool hasChanges = false;
    for (final VoiceState vs in voiceStates) {
      if (vs.channelId == null) {
        if (vs.connectionId != null) {
          final List<String> keysToRemove = updated.entries
              .where(
                (MapEntry<String, VoiceState> e) =>
                    e.key == vs.connectionId ||
                    e.value.connectionId == vs.connectionId,
              )
              .map((MapEntry<String, VoiceState> e) => e.key)
              .toList();
          if (keysToRemove.isNotEmpty) {
            hasChanges = true;
            for (final String k in keysToRemove) {
              updated.remove(k);
            }
          }
        } else {
          final List<String> keysToRemove = updated.entries
              .where(
                (MapEntry<String, VoiceState> e) => e.value.userId == vs.userId,
              )
              .map((MapEntry<String, VoiceState> e) => e.key)
              .toList();
          if (keysToRemove.isNotEmpty) {
            hasChanges = true;
            for (final String k in keysToRemove) {
              updated.remove(k);
            }
          }
        }
      } else {
        final String key = _voiceStateStorageKey(vs);
        final VoiceState? existing = updated[key];
        if (existing != vs) {
          if (vs.connectionId != null && vs.channelId != null) {
            updated.remove(
              voiceStateSyntheticStorageKey(
                userId: vs.userId,
                channelId: vs.channelId!,
              ),
            );
          }
          updated[key] = vs;
          hasChanges = true;
        }
      }
    }
    if (hasChanges) {
      state = updated;
    }
  }

  void replaceGuild(String guildId, List<VoiceState> voiceStates) {
    final Map<String, VoiceState> next = <String, VoiceState>{
      for (final MapEntry<String, VoiceState> entry in state.entries)
        if (entry.value.guildId != guildId) entry.key: entry.value,
    };
    for (final VoiceState voiceState in voiceStates) {
      if (voiceState.channelId != null) {
        next[_voiceStateStorageKey(voiceState)] = voiceState;
      }
    }
    if (mapEquals(next, state)) {
      return;
    }
    state = next;
  }

  void replacePrivateChannel(String channelId, List<VoiceState> voiceStates) {
    final List<VoiceState> listed = <VoiceState>[
      for (final VoiceState voiceState in voiceStates)
        if (_isInPrivateChannel(voiceState, channelId)) voiceState,
    ];
    final Set<String> listedUserIds = <String>{
      for (final VoiceState voiceState in listed) voiceState.userId,
    };
    final Map<String, VoiceState> next = <String, VoiceState>{
      for (final MapEntry<String, VoiceState> entry in state.entries)
        if (!_isInPrivateChannel(entry.value, channelId) ||
            listedUserIds.contains(entry.value.userId))
          entry.key: entry.value,
    };
    for (final VoiceState voiceState in listed) {
      final String key = _voiceStateStorageKey(voiceState);
      final VoiceState? live = state[key];
      if (live == null || !_isNewerVoiceState(live, voiceState)) {
        next[key] = voiceState;
      }
    }
    if (mapEquals(next, state)) {
      return;
    }
    state = next;
  }

  void clear() => state = {};
}

class CallState {
  const CallState({
    required this.channelId,
    this.messageId,
    this.region,
    this.ringing = const [],
    this.pendingRingUserIds = const {},
  });

  final String channelId;
  final String? messageId;
  final String? region;

  final List<String> ringing;

  final Set<String> pendingRingUserIds;

  CallState copyWith({
    String? messageId,
    String? region,
    List<String>? ringing,
    Set<String>? pendingRingUserIds,
  }) {
    return CallState(
      channelId: channelId,
      messageId: messageId ?? this.messageId,
      region: region ?? this.region,
      ringing: ringing ?? this.ringing,
      pendingRingUserIds: pendingRingUserIds ?? this.pendingRingUserIds,
    );
  }
}

@Riverpod(keepAlive: true)
class ActiveCalls extends _$ActiveCalls {
  @override
  Map<String, CallState> build() => {};

  static Set<String> _normalizeRingIds(List<String>? ringing) =>
      ringing == null ? <String>{} : Set<String>.from(ringing);

  void createCall(
    String channelId, {
    String? messageId,
    String? region,
    List<String>? ringing,
  }) {
    final List<String> ringList = List<String>.from(ringing ?? const []);
    state = {
      ...state,
      channelId: CallState(
        channelId: channelId,
        messageId: messageId,
        region: region,
        ringing: ringList,
        pendingRingUserIds: _normalizeRingIds(ringing),
      ),
    };
  }

  void updateCall(
    String channelId, {
    String? messageId,
    String? region,
    List<String>? ringing,
  }) {
    final CallState? existing = state[channelId];
    if (existing == null) {
      createCall(
        channelId,
        messageId: messageId,
        region: region,
        ringing: ringing,
      );
      return;
    }
    final bool hasRingPayload = ringing != null;
    final List<String> nextRing = ringing != null
        ? List<String>.from(ringing)
        : existing.ringing;
    final Set<String> nextPending = hasRingPayload
        ? _normalizeRingIds(ringing)
        : existing.pendingRingUserIds;
    state = {
      ...state,
      channelId: CallState(
        channelId: channelId,
        messageId: messageId ?? existing.messageId,
        region: region ?? existing.region,
        ringing: nextRing,
        pendingRingUserIds: nextPending,
      ),
    };
  }

  void removeUserFromPendingRing({
    required String channelId,
    required String userId,
  }) {
    final CallState? existing = state[channelId];
    if (existing == null) {
      return;
    }
    final Set<String> next = {...existing.pendingRingUserIds}..remove(userId);
    if (next.length == existing.pendingRingUserIds.length) {
      return;
    }
    state = {...state, channelId: existing.copyWith(pendingRingUserIds: next)};
  }

  void clearPendingRingForChannel(String channelId) {
    final CallState? existing = state[channelId];
    if (existing == null) {
      return;
    }
    state = {...state, channelId: existing.copyWith(pendingRingUserIds: {})};
  }

  void deleteCall(String channelId) {
    state = Map.of(state)..remove(channelId);
  }

  void clear() => state = {};
}

@Riverpod(keepAlive: true)
class OutgoingVoiceCallInitiator extends _$OutgoingVoiceCallInitiator {
  @override
  Set<String> build() => {};

  void markInitiated({
    required String channelId,
    required List<String> outboundRingRecipients,
  }) {
    final List<String> filtered = outboundRingRecipients
        .map((String s) => s.trim())
        .where((String s) => s.isNotEmpty)
        .toList();
    if (filtered.isEmpty) {
      state = {...state}..remove(channelId);
      return;
    }
    state = {...state, channelId};
  }

  void clearChannel(String channelId) {
    if (!state.contains(channelId)) {
      return;
    }
    state = {...state}..remove(channelId);
  }

  void clearAll() => state = {};
}

@riverpod
VoiceState? voiceStateForConnection(Ref ref, String connectionId) {
  return ref.watch(
    voiceStatesMapProvider.select(
      (Map<String, VoiceState> map) => map[connectionId],
    ),
  );
}

@riverpod
List<VoiceState> voiceStatesInChannel(
  Ref ref,
  String guildId,
  String channelId,
) {
  ref.watch(
    voiceStatesMapProvider.select(
      (Map<String, VoiceState> map) => _voiceStatesFingerprint(
        _voiceStatesInGuildChannel(map, guildId, channelId),
      ),
    ),
  );
  final Map<String, VoiceState> map = ref.read(voiceStatesMapProvider);
  return List<VoiceState>.unmodifiable(
    _voiceStatesInGuildChannel(map, guildId, channelId),
  );
}

@riverpod
List<VoiceState> voiceStatesInPrivateChannel(Ref ref, String channelId) {
  ref.watch(
    voiceStatesMapProvider.select(
      (Map<String, VoiceState> map) =>
          _voiceStatesFingerprint(_voiceStatesInPrivateChannel(map, channelId)),
    ),
  );
  final Map<String, VoiceState> map = ref.read(voiceStatesMapProvider);
  return List<VoiceState>.unmodifiable(
    _voiceStatesInPrivateChannel(map, channelId),
  );
}

@riverpod
List<VoiceState> voiceStatesInGuild(Ref ref, String guildId) {
  final Map<String, VoiceState> map = ref.watch(voiceStatesMapProvider);
  return map.values.where((VoiceState vs) => vs.guildId == guildId).toList();
}

@riverpod
int privateChannelVoiceParticipantCount(Ref ref, String channelId) {
  return ref.watch(
    voiceStatesMapProvider.select(
      (Map<String, VoiceState> map) => _distinctUserCountInChannel(
        _voiceStatesInPrivateChannel(map, channelId),
      ),
    ),
  );
}

@riverpod
int guildChannelVoiceParticipantCount(
  Ref ref,
  String guildId,
  String channelId,
) {
  return ref.watch(
    voiceStatesMapProvider.select(
      (Map<String, VoiceState> map) => _distinctUserCountInChannel(
        _voiceStatesInGuildChannel(map, guildId, channelId),
      ),
    ),
  );
}

@Riverpod(keepAlive: true)
void gatewayEphemeralStateRecoveryListener(Ref ref) {
  ref.listen<int>(gatewayFullRecoveryProvider, (int? previous, int next) {
    if (next <= 0 || previous == next) {
      return;
    }
    ref.read(typingIndicatorsProvider.notifier).clearAll();
    ref.read(voiceStatesMapProvider.notifier).clear();
    ref.read(activeCallsProvider.notifier).clear();
    ref.read(outgoingVoiceCallInitiatorProvider.notifier).clearAll();
  });
}

@Riverpod(keepAlive: true)
class InviteCache extends _$InviteCache {
  @override
  Map<String, Map<String, dynamic>> build() => {};

  void addInvite(Map<String, dynamic> data) {
    final code = data['code'] as String?;
    if (code != null) {
      state = {...state, code: data};
    }
  }

  void removeInvite(String code) {
    state = Map.of(state)..remove(code);
  }
}
