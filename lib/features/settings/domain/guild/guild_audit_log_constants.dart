import 'package:flutter/material.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum AuditLogTargetType {
  all,
  guild,
  member,
  channel,
  user,
  role,
  invite,
  webhook,
  emoji,
  sticker,
  message,
}

enum AuditLogActionKind { create, update, delete, other }

class GuildAuditLogConstants {
  GuildAuditLogConstants._();

  static String getActionLabel(
    AuditLogActionType action,
    FluxerLocalizations l10n,
  ) {
    return switch (action) {
      AuditLogActionType.guildUpdate => l10n.auditLogActionGuildUpdate,
      AuditLogActionType.channelCreate => l10n.auditLogActionChannelCreate,
      AuditLogActionType.channelUpdate => l10n.auditLogActionChannelUpdate,
      AuditLogActionType.channelDelete => l10n.auditLogActionChannelDelete,
      AuditLogActionType.channelOverwriteCreate =>
        l10n.auditLogActionChannelOverwriteCreate,
      AuditLogActionType.channelOverwriteUpdate =>
        l10n.auditLogActionChannelOverwriteUpdate,
      AuditLogActionType.channelOverwriteDelete =>
        l10n.auditLogActionChannelOverwriteDelete,
      AuditLogActionType.memberKick => l10n.auditLogActionMemberKick,
      AuditLogActionType.memberPrune => l10n.auditLogActionMemberPrune,
      AuditLogActionType.memberBanAdd => l10n.auditLogActionMemberBanAdd,
      AuditLogActionType.memberBanRemove => l10n.auditLogActionMemberBanRemove,
      AuditLogActionType.memberUpdate => l10n.auditLogActionMemberUpdate,
      AuditLogActionType.memberRoleUpdate =>
        l10n.auditLogActionMemberRoleUpdate,
      AuditLogActionType.memberMove => l10n.auditLogActionMemberMove,
      AuditLogActionType.memberDisconnect =>
        l10n.auditLogActionMemberDisconnect,
      AuditLogActionType.botAdd => l10n.auditLogActionBotAdd,
      AuditLogActionType.roleCreate => l10n.auditLogActionRoleCreate,
      AuditLogActionType.roleUpdate => l10n.auditLogActionRoleUpdate,
      AuditLogActionType.roleDelete => l10n.auditLogActionRoleDelete,
      AuditLogActionType.inviteCreate => l10n.auditLogActionInviteCreate,
      AuditLogActionType.inviteUpdate => l10n.auditLogActionInviteUpdate,
      AuditLogActionType.inviteDelete => l10n.auditLogActionInviteDelete,
      AuditLogActionType.webhookCreate => l10n.auditLogActionWebhookCreate,
      AuditLogActionType.webhookUpdate => l10n.auditLogActionWebhookUpdate,
      AuditLogActionType.webhookDelete => l10n.auditLogActionWebhookDelete,
      AuditLogActionType.emojiCreate => l10n.auditLogActionEmojiCreate,
      AuditLogActionType.emojiUpdate => l10n.auditLogActionEmojiUpdate,
      AuditLogActionType.emojiDelete => l10n.auditLogActionEmojiDelete,
      AuditLogActionType.stickerCreate => l10n.auditLogActionStickerCreate,
      AuditLogActionType.stickerUpdate => l10n.auditLogActionStickerUpdate,
      AuditLogActionType.stickerDelete => l10n.auditLogActionStickerDelete,
      AuditLogActionType.messageDelete => l10n.auditLogActionMessageDelete,
      AuditLogActionType.messageBulkDelete =>
        l10n.auditLogActionMessageBulkDelete,
      AuditLogActionType.messagePin => l10n.auditLogActionMessagePin,
      AuditLogActionType.messageUnpin => l10n.auditLogActionMessageUnpin,
      AuditLogActionType.$unknown => l10n.guildSettingsAuditLogUnknownTarget,
    };
  }

  static IconData getActionIcon(AuditLogActionType action) {
    final AuditLogTargetType targetType = getTargetType(action);
    return _targetIconMap[targetType] ??
        _actionIconMap[action] ??
        PhosphorIconsFill.buildings;
  }

  static AuditLogTargetType getTargetType(AuditLogActionType action) {
    return switch (action) {
      AuditLogActionType.guildUpdate => AuditLogTargetType.guild,
      AuditLogActionType.channelCreate ||
      AuditLogActionType.channelUpdate ||
      AuditLogActionType.channelDelete ||
      AuditLogActionType.channelOverwriteCreate ||
      AuditLogActionType.channelOverwriteUpdate ||
      AuditLogActionType.channelOverwriteDelete ||
      AuditLogActionType.messageDelete ||
      AuditLogActionType.messageBulkDelete ||
      AuditLogActionType.messagePin ||
      AuditLogActionType.messageUnpin => AuditLogTargetType.channel,
      AuditLogActionType.memberKick ||
      AuditLogActionType.memberPrune ||
      AuditLogActionType.memberBanAdd ||
      AuditLogActionType.memberBanRemove ||
      AuditLogActionType.memberUpdate ||
      AuditLogActionType.memberRoleUpdate ||
      AuditLogActionType.memberMove ||
      AuditLogActionType.memberDisconnect ||
      AuditLogActionType.botAdd => AuditLogTargetType.member,
      AuditLogActionType.roleCreate ||
      AuditLogActionType.roleUpdate ||
      AuditLogActionType.roleDelete => AuditLogTargetType.role,
      AuditLogActionType.inviteCreate ||
      AuditLogActionType.inviteUpdate ||
      AuditLogActionType.inviteDelete => AuditLogTargetType.invite,
      AuditLogActionType.webhookCreate ||
      AuditLogActionType.webhookUpdate ||
      AuditLogActionType.webhookDelete => AuditLogTargetType.webhook,
      AuditLogActionType.emojiCreate ||
      AuditLogActionType.emojiUpdate ||
      AuditLogActionType.emojiDelete => AuditLogTargetType.emoji,
      AuditLogActionType.stickerCreate ||
      AuditLogActionType.stickerUpdate ||
      AuditLogActionType.stickerDelete => AuditLogTargetType.sticker,
      AuditLogActionType.$unknown => AuditLogTargetType.all,
    };
  }

  static AuditLogActionKind getActionKind(AuditLogActionType action) {
    return switch (action) {
      AuditLogActionType.channelCreate ||
      AuditLogActionType.channelOverwriteCreate ||
      AuditLogActionType.roleCreate ||
      AuditLogActionType.inviteCreate ||
      AuditLogActionType.webhookCreate ||
      AuditLogActionType.emojiCreate ||
      AuditLogActionType.stickerCreate ||
      AuditLogActionType.botAdd ||
      AuditLogActionType.memberBanRemove => AuditLogActionKind.create,
      AuditLogActionType.channelDelete ||
      AuditLogActionType.channelOverwriteDelete ||
      AuditLogActionType.roleDelete ||
      AuditLogActionType.inviteDelete ||
      AuditLogActionType.webhookDelete ||
      AuditLogActionType.emojiDelete ||
      AuditLogActionType.stickerDelete ||
      AuditLogActionType.memberKick ||
      AuditLogActionType.memberBanAdd ||
      AuditLogActionType.messageDelete ||
      AuditLogActionType.messageBulkDelete => AuditLogActionKind.delete,
      AuditLogActionType.guildUpdate ||
      AuditLogActionType.channelUpdate ||
      AuditLogActionType.channelOverwriteUpdate ||
      AuditLogActionType.memberUpdate ||
      AuditLogActionType.memberRoleUpdate ||
      AuditLogActionType.memberMove ||
      AuditLogActionType.memberDisconnect ||
      AuditLogActionType.roleUpdate ||
      AuditLogActionType.inviteUpdate ||
      AuditLogActionType.webhookUpdate ||
      AuditLogActionType.emojiUpdate ||
      AuditLogActionType.stickerUpdate ||
      AuditLogActionType.messagePin ||
      AuditLogActionType.messageUnpin => AuditLogActionKind.update,
      AuditLogActionType.memberPrune ||
      AuditLogActionType.$unknown => AuditLogActionKind.other,
    };
  }

  static List<AuditLogActionType> get filterableActions =>
      AuditLogActionType.$valuesDefined;

  static const Map<AuditLogActionType, IconData> _actionIconMap =
      <AuditLogActionType, IconData>{
        AuditLogActionType.guildUpdate: PhosphorIconsFill.gear,
        AuditLogActionType.channelCreate: PhosphorIconsRegular.hash,
        AuditLogActionType.channelUpdate: PhosphorIconsRegular.hash,
        AuditLogActionType.channelDelete: PhosphorIconsRegular.hash,
        AuditLogActionType.channelOverwriteCreate: PhosphorIconsRegular.hash,
        AuditLogActionType.channelOverwriteUpdate: PhosphorIconsRegular.hash,
        AuditLogActionType.channelOverwriteDelete: PhosphorIconsRegular.hash,
        AuditLogActionType.memberKick: PhosphorIconsFill.userGear,
        AuditLogActionType.memberPrune: PhosphorIconsFill.userGear,
        AuditLogActionType.memberBanAdd: PhosphorIconsFill.userGear,
        AuditLogActionType.memberBanRemove: PhosphorIconsFill.userGear,
        AuditLogActionType.memberUpdate: PhosphorIconsFill.userGear,
        AuditLogActionType.memberRoleUpdate: PhosphorIconsFill.userGear,
        AuditLogActionType.memberMove: PhosphorIconsFill.userGear,
        AuditLogActionType.memberDisconnect: PhosphorIconsFill.userGear,
        AuditLogActionType.botAdd: PhosphorIconsFill.userGear,
        AuditLogActionType.roleCreate: PhosphorIconsFill.tag,
        AuditLogActionType.roleUpdate: PhosphorIconsFill.tag,
        AuditLogActionType.roleDelete: PhosphorIconsFill.tag,
        AuditLogActionType.inviteCreate: PhosphorIconsRegular.link,
        AuditLogActionType.inviteUpdate: PhosphorIconsRegular.link,
        AuditLogActionType.inviteDelete: PhosphorIconsRegular.link,
        AuditLogActionType.webhookCreate: PhosphorIconsFill.plugs,
        AuditLogActionType.webhookUpdate: PhosphorIconsFill.plugs,
        AuditLogActionType.webhookDelete: PhosphorIconsFill.plugs,
        AuditLogActionType.emojiCreate: PhosphorIconsFill.smiley,
        AuditLogActionType.emojiUpdate: PhosphorIconsFill.smiley,
        AuditLogActionType.emojiDelete: PhosphorIconsFill.smiley,
        AuditLogActionType.stickerCreate: PhosphorIconsFill.stamp,
        AuditLogActionType.stickerUpdate: PhosphorIconsFill.stamp,
        AuditLogActionType.stickerDelete: PhosphorIconsFill.stamp,
        AuditLogActionType.messageDelete: PhosphorIconsFill.pencilSimple,
        AuditLogActionType.messageBulkDelete: PhosphorIconsFill.pencilSimple,
        AuditLogActionType.messagePin: PhosphorIconsFill.pencilSimple,
        AuditLogActionType.messageUnpin: PhosphorIconsFill.pencilSimple,
      };

  static const Map<AuditLogTargetType, IconData> _targetIconMap =
      <AuditLogTargetType, IconData>{
        AuditLogTargetType.all: PhosphorIconsFill.buildings,
        AuditLogTargetType.guild: PhosphorIconsFill.gear,
        AuditLogTargetType.member: PhosphorIconsFill.userGear,
        AuditLogTargetType.channel: PhosphorIconsRegular.hash,
        AuditLogTargetType.user: PhosphorIconsFill.userGear,
        AuditLogTargetType.role: PhosphorIconsFill.tag,
        AuditLogTargetType.invite: PhosphorIconsRegular.link,
        AuditLogTargetType.webhook: PhosphorIconsFill.plugs,
        AuditLogTargetType.emoji: PhosphorIconsFill.smiley,
        AuditLogTargetType.sticker: PhosphorIconsFill.stamp,
        AuditLogTargetType.message: PhosphorIconsFill.pencilSimple,
      };

  static bool usesChannelIcon(AuditLogActionType action) {
    return getTargetType(action) == AuditLogTargetType.channel;
  }
}
