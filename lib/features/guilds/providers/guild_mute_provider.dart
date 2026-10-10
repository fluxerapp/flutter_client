import 'dart:convert';

import 'package:fluxer_app/features/guilds/providers/user_guild_settings_data_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_mute_provider.g.dart';

class GuildMuteState {
  final bool isMuted;
  final DateTime? muteEndTime;
  final bool hideMutedChannels;

  const GuildMuteState({
    this.isMuted = false,
    this.muteEndTime,
    this.hideMutedChannels = false,
  });
}

@riverpod
AsyncValue<GuildMuteState> guildMute(Ref ref, String guildId) {
  return watchUserGuildSettingsData(
    ref,
    guildId,
  ).whenData(guildMuteStateFromData);
}

GuildMuteState guildMuteStateFromData(String? settings) {
  if (settings == null) {
    return const GuildMuteState();
  }

  final data = jsonDecode(settings) as Map<String, dynamic>;
  final gs = UserGuildSettingsResponse.fromJson(data);

  if (!gs.muted) {
    return GuildMuteState(hideMutedChannels: gs.hideMutedChannels);
  }

  final endTimeStr = gs.muteConfig?.endTime;
  DateTime? endTime;
  if (endTimeStr != null) {
    endTime = DateTime.tryParse(endTimeStr);
    if (endTime != null && endTime.isBefore(DateTime.now())) {
      return GuildMuteState(hideMutedChannels: gs.hideMutedChannels);
    }
  }

  return GuildMuteState(
    isMuted: true,
    muteEndTime: endTime,
    hideMutedChannels: gs.hideMutedChannels,
  );
}
