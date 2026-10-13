import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';

bool isChannelEveryonePrivateForIcon({
  required ChannelType type,
  required String guildId,
  required String? permissionOverwritesJson,
}) {
  if (guildId.isEmpty) {
    return false;
  }
  final List<ChannelOverwriteEntry> entries =
      parseChannelPermissionOverwritesJson(permissionOverwritesJson);
  ChannelOverwriteEntry? everyoneOverwrite;
  for (final ChannelOverwriteEntry e in entries) {
    if (e.isRoleType && e.id == guildId) {
      everyoneOverwrite = e;
      break;
    }
  }
  if (everyoneOverwrite == null) {
    return false;
  }
  final BigInt allow = everyoneOverwrite.allow;
  final BigInt deny = everyoneOverwrite.deny;
  switch (type) {
    case ChannelType.guildVoice:
      final BigInt connectMask = BigInt.from(Permission.connect.value);
      return (allow == BigInt.zero) && (deny & connectMask) == connectMask;
    case ChannelType.guildText:
    case ChannelType.guildAnnouncement:
    case ChannelType.guildLink:
    case ChannelType.guildForum:
    case ChannelType.guildMedia:
      final BigInt mask = BigInt.from(Permission.viewChannel.value);
      return (deny & mask) == mask;
    case ChannelType.guildCategory:
    case ChannelType.unknown:
    case ChannelType.announcementThread:
    case ChannelType.publicThread:
    case ChannelType.privateThread:
    case ChannelType.dm:
    case ChannelType.groupDm:
    case ChannelType.dmPersonalNotes:
      return false;
  }
}
