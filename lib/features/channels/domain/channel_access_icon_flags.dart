import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';

/// True when the @everyone role overwrite fully denies [Permission.viewChannel]
/// (text-like channels) or [Permission.connect] (voice-like)
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
  // No explicit @everyone entry means normal guild channel — no lock.
  // Regular guilds have an @everyone entry granting base permissions.
  if (everyoneOverwrite == null) {
    return false;
  }
  final BigInt allow = everyoneOverwrite.allow;
  final BigInt deny = everyoneOverwrite.deny;
  switch (type) {
    case ChannelType.voice:
    case ChannelType.stage:
      // For voice/stage channels, only show a lock overlay when the @everyone
      // entry denies CONNECT AND has no base permissions at all (allow == '0')
      // this indicates a truly private server where the channel is not
      // visible to most users. A role-restricted guild will have an @everyone
      // entry with allow > 0 and deny CONNECT; those channels should NOT show
      // a lock since the channel is publicly visible in the sidebar.
      final BigInt connectMask = BigInt.from(Permission.connect.value);
      return (allow == BigInt.zero) && (deny & connectMask) == connectMask;
    case ChannelType.text:
    case ChannelType.announcement:
    case ChannelType.link:
      final BigInt mask = BigInt.from(Permission.viewChannel.value);
      return (deny & mask) == mask;
    case ChannelType.category:
      return false;
  }
}
