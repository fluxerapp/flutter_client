import 'dart:async';

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

class TypingUser {
  final String userId;
  final String channelId;
  final DateTime expiresAt;

  const TypingUser({
    required this.userId,
    required this.channelId,
    required this.expiresAt,
  });
}

const Duration _kTypingExpiry = Duration(seconds: 10);
const Duration _kTypingCleanupInterval = Duration(seconds: 1);

@Riverpod(keepAlive: true)
class TypingIndicators extends _$TypingIndicators {
  Timer? _cleanupTimer;

  @override
  List<TypingUser> build() {
    _cleanupTimer = Timer.periodic(_kTypingCleanupInterval, (_) => _cleanup());
    ref.onDispose(() => _cleanupTimer?.cancel());
    return const [];
  }

  void addTyping(String channelId, String userId) {
    final expiresAt = DateTime.now().add(_kTypingExpiry);

    state = [
      ...state.where((t) => !(t.channelId == channelId && t.userId == userId)),
      TypingUser(userId: userId, channelId: channelId, expiresAt: expiresAt),
    ];
  }

  void removeTyping(String channelId, String userId) {
    state = state
        .where((t) => !(t.channelId == channelId && t.userId == userId))
        .toList();
  }

  List<TypingUser> typingInChannel(String channelId) {
    final now = DateTime.now();
    return state
        .where((t) => t.channelId == channelId && t.expiresAt.isAfter(now))
        .toList();
  }

  void _cleanup() {
    final now = DateTime.now();
    final updated = state.where((t) => t.expiresAt.isAfter(now)).toList();
    if (updated.length != state.length) {
      state = updated;
    }
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
        next.remove(connectionId);
      } else {
        final List<String> keysToRemove = next.entries
            .where(
              (MapEntry<String, VoiceState> e) =>
                  e.value.userId == voiceState.userId,
            )
            .map((MapEntry<String, VoiceState> e) => e.key)
            .toList();
        for (final String k in keysToRemove) {
          next.remove(k);
        }
      }
      state = next;
      return;
    }
    final String key = _voiceStateStorageKey(voiceState);
    next[key] = voiceState;
    state = next;
  }

  void updateBulk(List<VoiceState> voiceStates) {
    final Map<String, VoiceState> updated = Map<String, VoiceState>.of(state);
    for (final VoiceState vs in voiceStates) {
      if (vs.channelId == null) {
        if (vs.connectionId != null) {
          updated.remove(vs.connectionId);
        } else {
          final List<String> keysToRemove = updated.entries
              .where(
                (MapEntry<String, VoiceState> e) => e.value.userId == vs.userId,
              )
              .map((MapEntry<String, VoiceState> e) => e.key)
              .toList();
          for (final String k in keysToRemove) {
            updated.remove(k);
          }
        }
      } else {
        final String key = _voiceStateStorageKey(vs);
        updated[key] = vs;
      }
    }
    state = updated;
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
    this.voiceStates = const [],
  });

  final String channelId;
  final String? messageId;
  final String? region;
  final List<String> ringing;
  final List<VoiceState> voiceStates;
}

@Riverpod(keepAlive: true)
class ActiveCalls extends _$ActiveCalls {
  @override
  Map<String, CallState> build() => {};

  void createCall(
    String channelId, {
    String? messageId,
    String? region,
    List<String>? ringing,
    List<VoiceState>? voiceStates,
  }) {
    state = {
      ...state,
      channelId: CallState(
        channelId: channelId,
        messageId: messageId,
        region: region,
        ringing: ringing ?? const [],
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
    final existing = state[channelId];
    if (existing == null) {
      return;
    }
    state = {
      ...state,
      channelId: CallState(
        channelId: channelId,
        messageId: messageId ?? existing.messageId,
        region: region ?? existing.region,
        ringing: ringing ?? existing.ringing,
        voiceStates: voiceStates ?? existing.voiceStates,
      ),
    };
  }

  void deleteCall(String channelId) {
    state = Map.of(state)..remove(channelId);
  }

  void clear() => state = {};
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
