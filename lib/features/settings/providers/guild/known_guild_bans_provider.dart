import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'known_guild_bans_provider.g.dart';

@Riverpod(keepAlive: true)
class KnownGuildBans extends _$KnownGuildBans {
  @override
  Map<String, Set<String>> build() => <String, Set<String>>{};

  bool isKnownBanned(String guildId, String userId) {
    return state[guildId]?.contains(userId) ?? false;
  }

  void noteBan(String guildId, String userId) {
    final Set<String> existing = state[guildId] ?? <String>{};
    if (existing.contains(userId)) {
      return;
    }
    state = <String, Set<String>>{
      ...state,
      guildId: <String>{...existing, userId},
    };
  }

  void noteUnban(String guildId, String userId) {
    final Set<String>? existing = state[guildId];
    if (existing == null || !existing.contains(userId)) {
      return;
    }
    final Set<String> next = <String>{...existing}..remove(userId);
    final Map<String, Set<String>> copy = Map<String, Set<String>>.from(state);
    if (next.isEmpty) {
      copy.remove(guildId);
    } else {
      copy[guildId] = next;
    }
    state = copy;
  }
}
