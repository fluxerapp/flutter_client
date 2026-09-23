import 'package:fluxer_app/features/guilds/utils/invite_code.dart';
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
    final String code;
    final ChannelPartialResponse channel;
    final int uses;
    final int maxUses;
    final DateTime createdAt;
    final DateTime? expiresAt;
    final UserPartialResponse? inviter;
    if (inviteMetadataIsGuild(response)) {
      final InviteMetadataResponseSchemaGuildInviteMetadataResponse invite =
          response.toGuildInviteMetadataResponse();
      code = invite.code;
      channel = invite.channel;
      uses = invite.uses;
      maxUses = invite.maxUses;
      createdAt = invite.createdAt;
      expiresAt = invite.expiresAt;
      inviter = invite.inviter;
    } else {
      final InviteMetadataResponseSchemaGroupDmInviteMetadataResponse invite =
          response.toGroupDmInviteMetadataResponse();
      code = invite.code;
      channel = invite.channel;
      uses = invite.uses;
      maxUses = invite.maxUses;
      createdAt = invite.createdAt;
      expiresAt = invite.expiresAt;
      inviter = invite.inviter;
    }
    return GuildInviteEntry(
      code: code,
      channelId: channel.id,
      channelName: channel.name ?? '',
      channelType: channel.type.json ?? 0,
      uses: uses,
      maxUses: maxUses,
      createdAt: createdAt,
      expiresAt: expiresAt,
      inviterId: inviter?.id,
      inviterUsername: inviter?.username,
      inviterGlobalName: inviter?.globalName,
      inviterAvatar: inviter?.avatar,
      inviterAvatarColor: inviter?.avatarColor,
    );
  }
}
