import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_cluster.dart';

List<AvatarClusterMember> groupDmClusterMembers(List<GroupMemberInfo> members) {
  return <AvatarClusterMember>[
    for (final GroupMemberInfo member in members.take(3))
      AvatarClusterMember(
        userId: member.id,
        fallbackText: member.name,
        imageUrl: FluxerMediaUrl.userAvatar(
          userId: member.id,
          hash: member.avatar,
        ),
      ),
  ];
}

FluxerAvatarCluster groupDmAvatarCluster({
  required DmConversation dm,
  required double size,
  required String? status,
}) {
  return FluxerAvatarCluster(
    channelId: dm.id,
    iconUrl: FluxerMediaUrl.guildIcon(guildId: dm.id, hash: dm.icon),
    status: status,
    members: groupDmClusterMembers(dm.groupMembers),
    size: size,
  );
}
