import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
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
  return '_u_${voiceState.userId}_${voiceState.channelId}';
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

List<VoiceState> _voiceStatesInPrivateChannel(
  Map<String, VoiceState> map,
  String channelId,
) {
  final List<VoiceState> out = <VoiceState>[];
  for (final VoiceState vs in map.values) {
    if (vs.channelId != channelId) {
      continue;
    }
    if (vs.guildId != null && vs.guildId!.isNotEmpty) {
      continue;
    }
    out.add(vs);
  }
  return out;
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

const Duration _kTypingExpiry = Duration(seconds: 10);

@Riverpod(keepAlive: true)
class TypingIndicators extends _$TypingIndicators {
  Timer? _expiryTimer;

  @override
  Map<String, Map<String, DateTime>> build() {
    ref.onDispose(() => _expiryTimer?.cancel());
    return const <String, Map<String, DateTime>>{};
  }

  void addTyping(String channelId, String userId) {
    final DateTime expiresAt = clock.now().add(_kTypingExpiry);
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

/// Tracks voice state per gateway [VoiceState.connectionId] (or a synthetic key
/// when [VoiceState.connectionId] is null) so the same user can have multiple
/// simultaneous connections. Map keys are not user ids.
@Riverpod(keepAlive: true)
class VoiceStatesMap extends _$VoiceStatesMap {
  @override
  Map<String, VoiceState> build() => {};

  void update(VoiceState voiceState) {
    final Map<String, VoiceState> next = Map<String, VoiceState>.of(state);
    if (voiceState.channelId == null) {
      final String? connectionId = voiceState.connectionId;
      if (connectionId != null) {
        if (!next.containsKey(connectionId)) {
          return;
        }
        next.remove(connectionId);
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
    if (existing == voiceState) {
      return;
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
          if (updated.containsKey(vs.connectionId)) {
            updated.remove(vs.connectionId);
            hasChanges = true;
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
          updated[key] = vs;
          hasChanges = true;
        }
      }
    }
    if (hasChanges) {
      state = updated;
    }
  }

  List<VoiceState> getForChannel(String channelId) =>
      state.values.where((VoiceState v) => v.channelId == channelId).toList();

  void clear() => state = {};
}

/// Active call state per channel.
class CallState {
  const CallState({
    required this.channelId,
    this.messageId,
    this.region,
    this.ringing = const [],
    this.pendingRingUserIds = const {},
    this.voiceStates = const [],
  });

  final String channelId;
  final String? messageId;
  final String? region;

  /// Last gateway snapshot of user IDs receiving a ring tone.
  final List<String> ringing;

  /// Subset tracked for incoming-call UI (reset from gateway `ringing` when
  /// present; mutated locally after accept/reject/ignore until next update).
  final Set<String> pendingRingUserIds;
  final List<VoiceState> voiceStates;

  CallState copyWith({
    String? messageId,
    String? region,
    List<String>? ringing,
    Set<String>? pendingRingUserIds,
    List<VoiceState>? voiceStates,
  }) {
    return CallState(
      channelId: channelId,
      messageId: messageId ?? this.messageId,
      region: region ?? this.region,
      ringing: ringing ?? this.ringing,
      pendingRingUserIds: pendingRingUserIds ?? this.pendingRingUserIds,
      voiceStates: voiceStates ?? this.voiceStates,
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
    List<VoiceState>? voiceStates,
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
        voiceStates: voiceStates ?? const [],
      ),
    };
  }

  void updateCall(
    String channelId, {
    String? messageId,
    String? region,
    List<String>? ringing,
    List<VoiceState>? voiceStates,
  }) {
    final CallState? existing = state[channelId];
    if (existing == null) {
      createCall(
        channelId,
        messageId: messageId,
        region: region,
        ringing: ringing,
        voiceStates: voiceStates,
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
        voiceStates: voiceStates ?? existing.voiceStates,
      ),
    };
  }

  bool isChannelPendingRingForUser({
    required String channelId,
    required String userId,
  }) {
    return state[channelId]?.pendingRingUserIds.contains(userId) ?? false;
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

/// Tracks channels where this client initiated an outbound ring (suppresses
/// incoming overlay for caller), matching the web `CallInitiator`.
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

  bool hasInitiated(String channelId) => state.contains(channelId);

  void clearChannel(String channelId) {
    if (!state.contains(channelId)) {
      return;
    }
    state = {...state}..remove(channelId);
  }

  void clearAll() => state = {};
}

/// Returns the [VoiceState] for a specific connection ID.
/// Uses select to only rebuild when this connection's state changes.
@riverpod
VoiceState? voiceStateForConnection(Ref ref, String connectionId) {
  return ref.watch(
    voiceStatesMapProvider.select(
      (Map<String, VoiceState> map) => map[connectionId],
    ),
  );
}

/// Returns voice states for a specific guild channel.
/// Only emits when voice states for this specific channel change.
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

/// Returns voice states for a specific DM/private channel.
/// Only emits when voice states for this specific channel change.
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

/// Returns voice states for a specific guild (all channels).
/// Only emits when voice states for this guild change.
@riverpod
List<VoiceState> voiceStatesInGuild(Ref ref, String guildId) {
  final Map<String, VoiceState> map = ref.watch(voiceStatesMapProvider);
  return map.values.where((VoiceState vs) => vs.guildId == guildId).toList();
}

/// Returns the count of unique participants in a private DM channel.
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

/// Returns the count of unique participants in a guild voice channel.
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

/// Clears ephemeral gateway derived UI state after session recovery
@Riverpod(keepAlive: true)
void gatewayEphemeralStateRecoveryListener(Ref ref) {
  ref.listen<int>(gatewaySessionRecoveryProvider, (int? previous, int next) {
    if (next <= 0 || previous == next) {
      return;
    }
    ref.read(typingIndicatorsProvider.notifier).clearAll();
    ref.read(voiceStatesMapProvider.notifier).clear();
    ref.read(activeCallsProvider.notifier).clear();
    ref.read(outgoingVoiceCallInitiatorProvider.notifier).clearAll();
  });
}

/// In-memory invite cache.
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

  void clear() => state = {};
}
