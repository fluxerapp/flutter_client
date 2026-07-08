import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';

class ChannelInviteCapability {
  const ChannelInviteCapability({
    required this.canInvite,
    this.useVanityUrl = false,
    this.vanityUrlCode,
  });

  final bool canInvite;
  final bool useVanityUrl;
  final String? vanityUrlCode;
}

bool isChannelVisibleToEveryone({
  required Channel channel,
  required String guildId,
}) {
  final List<ChannelOverwriteEntry> overwrites =
      parseChannelPermissionOverwritesJson(channel.permissionOverwritesJson);
  for (final ChannelOverwriteEntry entry in overwrites) {
    if (entry.isRoleType && entry.id == guildId) {
      final BigInt viewChannel = BigInt.from(Permission.viewChannel.value);
      return (entry.deny & viewChannel) == BigInt.zero;
    }
  }
  return true;
}

ChannelInviteCapability resolveChannelInviteCapability({
  required int? permissionBits,
  required Channel channel,
  required String guildId,
  String? vanityUrlCode,
}) {
  final int bits = permissionBits ?? 0;
  if (hasPermission(bits, Permission.createInstantInvite)) {
    return const ChannelInviteCapability(canInvite: true);
  }
  if (vanityUrlCode != null &&
      vanityUrlCode.isNotEmpty &&
      isChannelVisibleToEveryone(channel: channel, guildId: guildId)) {
    return ChannelInviteCapability(
      canInvite: true,
      useVanityUrl: true,
      vanityUrlCode: vanityUrlCode,
    );
  }
  return const ChannelInviteCapability(canInvite: false);
}
