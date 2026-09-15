import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/voice/utils/channel_e2ee_status.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_channel_e2ee_status_provider.g.dart';

@Riverpod(keepAlive: true)
ChannelE2eeStatus voiceChannelE2eeStatus(
  Ref ref, {
  required String? guildId,
  required String channelId,
  ChannelE2eeStatus emptyChannelStatus = ChannelE2eeStatus.none,
}) {
  final Map<String, VoiceState> voiceStates = ref.watch(voiceStatesMapProvider);
  final List<Guild> guilds = ref.watch(guildListViewModelProvider).guilds;
  final bool guildHasVoiceE2ee =
      guildId == null ||
      guilds.any((Guild g) => g.id == guildId && g.hasVoiceE2ee);
  return computeChannelE2eeStatus(
    voiceStates: voiceStates,
    guildId: guildId,
    channelId: channelId,
    guildHasVoiceE2ee: guildHasVoiceE2ee,
    emptyChannelStatus: emptyChannelStatus,
  );
}
