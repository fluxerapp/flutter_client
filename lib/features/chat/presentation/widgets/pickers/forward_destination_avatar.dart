import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/messages/forward_destinations_provider.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_cluster.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kForwardDestinationAvatarSize = 40;

class ForwardDestinationAvatar extends StatelessWidget {
  const ForwardDestinationAvatar({
    required this.destination,
    this.size = kForwardDestinationAvatarSize,
    super.key,
  });

  final ForwardDestination destination;
  final double size;

  @override
  Widget build(BuildContext context) {
    switch (destination.kind) {
      case ForwardDestinationKind.dm:
        return FluxerAvatar.user(
          imageUrl: destination.avatarImageUrl,
          userId: destination.avatarUserId!,
          fallbackText: destination.displayName,
          showStatus: false,
          size: size,
        );
      case ForwardDestinationKind.group:
        return FluxerAvatarCluster(
          channelId: destination.channelId,
          iconUrl: destination.groupIconUrl,
          members: groupDmClusterMembers(destination.groupMembers),
          size: size,
        );
      case ForwardDestinationKind.personalNotes:
        return FluxerAvatar.icon(
          icon: PhosphorIconsFill.notePencil,
          iconColor: context.colors.interactiveNormal,
          iconBackgroundColor: context.colors.backgroundModifierAccent,
          size: size,
        );
      case ForwardDestinationKind.guildText:
      case ForwardDestinationKind.guildVoice:
        return _GuildChannelAvatar(destination: destination, size: size);
    }
  }
}

class _GuildChannelAvatar extends StatelessWidget {
  const _GuildChannelAvatar({required this.destination, required this.size});

  final ForwardDestination destination;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final double badgeSize = size * 0.4;
    final IconData channelIcon =
        destination.kind == ForwardDestinationKind.guildVoice
        ? PhosphorIconsBold.speakerHigh
        : PhosphorIconsBold.hash;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          FluxerGuildIconAvatar(
            name: destination.guildName ?? destination.displayName,
            imageUrl: destination.guildAvatarImageUrl,
            isCircle: true,
            size: size,
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: badgeSize,
              height: badgeSize,
              decoration: BoxDecoration(
                color: colors.backgroundHeaderSecondary,
                borderRadius: BorderRadius.circular(badgeSize / 2),
              ),
              child: Icon(
                channelIcon,
                size: badgeSize * 0.625,
                color: colors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
