import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_availability_provider.g.dart';

@Riverpod(keepAlive: true)
class GuildAvailability extends _$GuildAvailability {
  @override
  Set<String> build() => {};

  void loadFromReady(List<Map<String, dynamic>> rawGuilds) {
    state = {
      for (final rawGuild in rawGuilds)
        if (_isTrackedUnavailable(rawGuild)) rawGuild['id'] as String,
    };
  }

  void handleGuildAvailability(
    String guildId, {
    required bool unavailable,
    bool unavailableHidden = false,
  }) {
    if (unavailable && !unavailableHidden) {
      state = {...state, guildId};
      return;
    }
    if (state.contains(guildId)) {
      state = Set.of(state)..remove(guildId);
    }
  }

  void setGuildAvailable(String guildId) {
    if (state.contains(guildId)) {
      state = Set.of(state)..remove(guildId);
    }
  }

  void clear() {
    state = {};
  }

  bool _isTrackedUnavailable(Map<String, dynamic> rawGuild) {
    final unavailable = rawGuild['unavailable'] as bool? ?? false;
    if (!unavailable) {
      return false;
    }
    return !(rawGuild['unavailable_hidden'] as bool? ?? false);
  }
}

@Riverpod(keepAlive: true)
class GuildDegraded extends _$GuildDegraded {
  @override
  Set<String> build() => <String>{};

  void loadFromReady(List<Map<String, dynamic>> rawGuilds) {
    final Set<String> next = <String>{
      for (final Map<String, dynamic> rawGuild in rawGuilds)
        if (rawGuild['degraded'] == true &&
            rawGuild['unavailable'] != true &&
            rawGuild['id'] is String)
          rawGuild['id'] as String,
    };
    if (!setEquals(next, state)) {
      state = next;
    }
  }

  void setDegraded(String guildId, {required bool degraded}) {
    if (state.contains(guildId) == degraded) {
      return;
    }
    state = degraded
        ? <String>{...state, guildId}
        : (Set<String>.of(state)..remove(guildId));
  }

  void clear() {
    if (state.isNotEmpty) {
      state = <String>{};
    }
  }
}
