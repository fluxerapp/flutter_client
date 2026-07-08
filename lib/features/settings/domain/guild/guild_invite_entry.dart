import 'package:fluxer_dart/export.dart';

class GuildInviteEntry {
  const GuildInviteEntry({
    required this.code,
    required this.channelId,
    required this.channelName,
    required this.channelType,
    required this.uses,
    required this.maxUses,
    this.channelParentId,
    this.createdAt,
    this.expiresAt,
    this.inviterId,
    this.inviterUsername,
    this.inviterGlobalName,
    this.inviterAvatar,
    this.inviterAvatarColor,
  });

  final String code;
  final String channelId;
  final String channelName;
  final int channelType;
  final String? channelParentId;
  final int uses;
  final int maxUses;
  final DateTime? createdAt;
  final DateTime? expiresAt;
  final String? inviterId;
  final String? inviterUsername;
  final String? inviterGlobalName;
  final String? inviterAvatar;
  final int? inviterAvatarColor;

  factory GuildInviteEntry.fromResponse(InviteMetadataResponseSchema response) {
    final InviteMetadataResponseSchemaGuildInviteMetadataResponse invite =
        response.toGuildInviteMetadataResponse();
    final ChannelPartialResponse channel = invite.channel;
    final UserPartialResponse? inviter = invite.inviter;
    return GuildInviteEntry(
      code: invite.code,
      channelId: channel.id,
      channelName: channel.name ?? '',
      channelType: channel.type,
      uses: invite.uses,
      maxUses: invite.maxUses,
      createdAt: invite.createdAt,
      expiresAt: invite.expiresAt,
      inviterId: inviter?.id,
      inviterUsername: inviter?.username,
      inviterGlobalName: inviter?.globalName,
      inviterAvatar: inviter?.avatar,
      inviterAvatarColor: inviter?.avatarColor,
    );
  }
}
