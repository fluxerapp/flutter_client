import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_channel_member_count_provider.g.dart';

/// Distinct connected user count for a guild voice channel.
///
/// [guildChannelKey] is `'<guildId>|<channelId>'`
/// (see `voiceChannelParticipantsFamilyKey`).
@riverpod
int voiceChannelMemberCount(Ref ref, String guildChannelKey) {
  final int sep = guildChannelKey.indexOf('|');
  if (sep < 0 || sep == guildChannelKey.length - 1) {
    return 0;
  }
  final String guildId = guildChannelKey.substring(0, sep);
  final String channelId = guildChannelKey.substring(sep + 1);
  return ref.watch(
    guildChannelVoiceParticipantCountProvider(guildId, channelId),
  );
}
