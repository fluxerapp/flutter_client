import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/guild_channel_ordering.dart';
import 'package:fluxer_app/features/channels/utils/channel_invite_capability.dart';

class InvitableChannelMatch {
  const InvitableChannelMatch({
    required this.channel,
    required this.capability,
  });

  final Channel channel;
  final ChannelInviteCapability capability;
}

InvitableChannelMatch? resolveInvitableChannel({
  required List<Channel> channels,
  required String guildId,
  required int? Function(String channelId) permissionBitsFor,
  String? selectedChannelId,
  String? vanityUrlCode,
  bool preferSelectedChannel = true,
}) {
  InvitableChannelMatch? matchFor(Channel channel) {
    if (!isGuildTextBasedChannelType(channel.type)) {
      return null;
    }
    final int? permissionBits = permissionBitsFor(channel.id);
    if (permissionBits == null) {
      return null;
    }
    final ChannelInviteCapability capability = resolveChannelInviteCapability(
      permissionBits: permissionBits,
      channel: channel,
      guildId: guildId,
      vanityUrlCode: vanityUrlCode,
    );
    if (!capability.canInvite) {
      return null;
    }
    return InvitableChannelMatch(channel: channel, capability: capability);
  }

  if (preferSelectedChannel &&
      selectedChannelId != null &&
      selectedChannelId.isNotEmpty) {
    for (final Channel channel in channels) {
      if (channel.id != selectedChannelId) {
        continue;
      }
      final InvitableChannelMatch? selected = matchFor(channel);
      if (selected != null) {
        return selected;
      }
      break;
    }
  }

  for (final Channel channel in GuildChannelOrdering.sortChannelsForOrdering(
    channels,
  )) {
    final InvitableChannelMatch? match = matchFor(channel);
    if (match != null) {
      return match;
    }
  }
  return null;
}
