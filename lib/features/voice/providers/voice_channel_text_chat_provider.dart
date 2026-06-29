import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/unread_permission_utils.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_channel_text_chat_provider.g.dart';

class VoiceChannelTextChatAccess {
  const VoiceChannelTextChatAccess({required this.canOpen});

  final bool canOpen;
}

@riverpod
Future<VoiceChannelTextChatAccess> voiceChannelTextChatAccess(
  Ref ref,
  String channelId,
) async {
  if (channelId.isEmpty) {
    return const VoiceChannelTextChatAccess(canOpen: false);
  }
  final channelRow = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannelById(channelId);
  if (channelRow == null) {
    return const VoiceChannelTextChatAccess(canOpen: false);
  }
  if (channelRow.guildId.isEmpty) {
    return const VoiceChannelTextChatAccess(canOpen: true);
  }
  final ChannelType channelType = ChannelType.fromWire(channelRow.type);
  if (channelType != ChannelType.guildVoice) {
    return const VoiceChannelTextChatAccess(canOpen: false);
  }
  final String? currentUserId = ref.read(currentUserIdProvider);
  final bool canOpen = await canReadChannelForUnread(
    database: ref.read(fluxerDatabaseProvider),
    channel: channelRow,
    currentUserId: currentUserId,
  );
  return VoiceChannelTextChatAccess(canOpen: canOpen);
}

@riverpod
Future<bool> voiceChannelTextChatSupported(Ref ref, String channelId) async {
  final VoiceChannelTextChatAccess access = await ref.watch(
    voiceChannelTextChatAccessProvider(channelId).future,
  );
  return access.canOpen;
}
