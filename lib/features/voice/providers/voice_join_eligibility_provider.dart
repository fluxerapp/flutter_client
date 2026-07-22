import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_join_eligibility_provider.g.dart';

class VoiceJoinEligibility {
  const VoiceJoinEligibility({required this.canJoin});

  final bool canJoin;
}

bool canJoinGuildVoiceChannelFromBits({
  required String guildId,
  required ChannelType channelType,
  required int? permissionBits,
}) {
  if (guildId.isEmpty) {
    return true;
  }
  if (channelType != ChannelType.guildVoice) {
    return true;
  }
  if (permissionBits == null) {
    return true;
  }
  return hasPermission(permissionBits, Permission.connect);
}

@riverpod
Future<VoiceJoinEligibility> voiceJoinEligibility(
  Ref ref,
  String channelId,
) async {
  if (channelId.isEmpty) {
    return const VoiceJoinEligibility(canJoin: false);
  }
  final channelRow = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannelById(channelId);
  if (channelRow == null) {
    return const VoiceJoinEligibility(canJoin: false);
  }
  final ChannelType channelType = ChannelType.fromWire(channelRow.type);
  if (channelRow.guildId.isEmpty) {
    return const VoiceJoinEligibility(canJoin: true);
  }
  ref.watch(channelPermissionCacheProvider);
  final int localBits = await readLocalGuildChannelPermissionBitsRef(
    ref: ref,
    channelId: channelId,
  );
  final bool canJoin = canJoinGuildVoiceChannelFromBits(
    guildId: channelRow.guildId,
    channelType: channelType,
    permissionBits: localBits,
  );
  return VoiceJoinEligibility(canJoin: canJoin);
}
