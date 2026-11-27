import 'package:flutter/foundation.dart';
import 'package:fluxer_dart/gateway_client/gateway_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_availability_provider.g.dart';

@Riverpod(keepAlive: true)
class GuildAvailability extends _$GuildAvailability {
  @override
  Set<String> build() => {};

  void loadFromReady(List<ReadyUnavailableGuild> unavailableGuilds) {
    state = {
      for (final ReadyUnavailableGuild guild in unavailableGuilds)
        if (!guild.hidden) guild.id,
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
}

@Riverpod(keepAlive: true)
class GuildDegraded extends _$GuildDegraded {
  @override
  Set<String> build() => <String>{};

  void loadFromReady(List<GuildCreateData> guilds) {
    final Set<String> next = <String>{
      for (final GuildCreateData guild in guilds)
        if (guild.degraded ?? false) guild.guild.id,
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
