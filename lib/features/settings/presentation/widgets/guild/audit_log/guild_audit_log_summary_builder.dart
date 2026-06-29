import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/audit_log/guild_audit_log_change_formatters.dart';
import 'package:fluxer_app/features/settings/utils/guild_audit_log_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

class GuildAuditLogSummaryBuilder {
  GuildAuditLogSummaryBuilder._();

  static GuildAuditLogSummaryParts buildSummary({
    required GuildAuditLogEntry entry,
    required FluxerLocalizations l10n,
    required Map<String, String> userNames,
    required Map<String, String> channelNames,
    required Map<String, String> roleNames,
  }) {
    final String actor = _resolveActor(entry.userId, userNames, l10n);
    final String target = _resolveTarget(
      entry: entry,
      userNames: userNames,
      channelNames: channelNames,
      roleNames: roleNames,
      l10n: l10n,
    );
    final String channel = GuildAuditLogChangeFormatters.resolveChannelLabel(
      entry: entry,
      channelNames: channelNames,
      l10n: l10n,
    );
    final String text = _summaryText(
      entry: entry,
      l10n: l10n,
      actor: actor,
      target: target,
      channel: channel,
    );
    return GuildAuditLogSummaryParts(
      text: text,
      actorLabel: actor,
      targetLabel: target,
    );
  }

  static String _summaryText({
    required GuildAuditLogEntry entry,
    required FluxerLocalizations l10n,
    required String actor,
    required String target,
    required String channel,
  }) {
    final AuditLogActionType action = entry.actionType;
    final int? pruneDays = int.tryParse(
      GuildAuditLogUtils.findChangeNewScalar(
            entry.changes,
            'prune_delete_days',
          ) ??
          '',
    );
    final int? bulkCount = entry.options?.count?.toInt();
    final bool hasChannel = channel.isNotEmpty;
    return switch (action) {
      AuditLogActionType.guildUpdate => l10n.auditLogSummaryGuildUpdate(actor),
      AuditLogActionType.channelCreate => l10n.auditLogSummaryChannelCreate(
        actor,
        target,
      ),
      AuditLogActionType.channelUpdate => l10n.auditLogSummaryChannelUpdate(
        actor,
        target,
      ),
      AuditLogActionType.channelDelete => l10n.auditLogSummaryChannelDelete(
        actor,
        target,
      ),
      AuditLogActionType.channelOverwriteCreate =>
        hasChannel
            ? l10n.auditLogSummaryChannelOverwriteCreateInChannel(
                actor,
                target,
                channel,
              )
            : l10n.auditLogSummaryChannelOverwriteCreate(actor, target),
      AuditLogActionType.channelOverwriteUpdate =>
        hasChannel
            ? l10n.auditLogSummaryChannelOverwriteUpdateInChannel(
                actor,
                target,
                channel,
              )
            : l10n.auditLogSummaryChannelOverwriteUpdate(actor, target),
      AuditLogActionType.channelOverwriteDelete =>
        hasChannel
            ? l10n.auditLogSummaryChannelOverwriteDeleteInChannel(
                actor,
                target,
                channel,
              )
            : l10n.auditLogSummaryChannelOverwriteDelete(actor, target),
      AuditLogActionType.memberKick => l10n.auditLogSummaryMemberKick(
        actor,
        target,
      ),
      AuditLogActionType.memberBanAdd => l10n.auditLogSummaryMemberBanAdd(
        actor,
        target,
      ),
      AuditLogActionType.memberBanRemove => l10n.auditLogSummaryMemberBanRemove(
        actor,
        target,
      ),
      AuditLogActionType.memberUpdate => l10n.auditLogSummaryMemberUpdate(
        actor,
        target,
      ),
      AuditLogActionType.memberRoleUpdate =>
        l10n.auditLogSummaryMemberRoleUpdate(actor, target),
      AuditLogActionType.memberPrune =>
        pruneDays != null && pruneDays > 0
            ? l10n.auditLogSummaryMemberPruneDays(actor, pruneDays)
            : l10n.auditLogSummaryMemberPrune(actor),
      AuditLogActionType.memberMove =>
        hasChannel
            ? l10n.auditLogSummaryMemberMoveToChannel(actor, target, channel)
            : l10n.auditLogSummaryMemberMove(actor, target),
      AuditLogActionType.memberDisconnect =>
        l10n.auditLogSummaryMemberDisconnect(actor, target),
      AuditLogActionType.botAdd => l10n.auditLogSummaryBotAdd(actor, target),
      AuditLogActionType.roleCreate => l10n.auditLogSummaryRoleCreate(
        actor,
        target,
      ),
      AuditLogActionType.roleUpdate => l10n.auditLogSummaryRoleUpdate(
        actor,
        target,
      ),
      AuditLogActionType.roleDelete => l10n.auditLogSummaryRoleDelete(
        actor,
        target,
      ),
      AuditLogActionType.inviteCreate =>
        hasChannel
            ? l10n.auditLogSummaryInviteCreateForChannel(actor, target, channel)
            : l10n.auditLogSummaryInviteCreate(actor, target),
      AuditLogActionType.inviteUpdate =>
        hasChannel
            ? l10n.auditLogSummaryInviteUpdateForChannel(actor, target, channel)
            : l10n.auditLogSummaryInviteUpdate(actor, target),
      AuditLogActionType.inviteDelete =>
        hasChannel
            ? l10n.auditLogSummaryInviteDeleteForChannel(actor, target, channel)
            : l10n.auditLogSummaryInviteDelete(actor, target),
      AuditLogActionType.webhookCreate => l10n.auditLogSummaryWebhookCreate(
        actor,
        target,
      ),
      AuditLogActionType.webhookUpdate => l10n.auditLogSummaryWebhookUpdate(
        actor,
        target,
      ),
      AuditLogActionType.webhookDelete => l10n.auditLogSummaryWebhookDelete(
        actor,
        target,
      ),
      AuditLogActionType.emojiCreate => l10n.auditLogSummaryEmojiCreate(
        actor,
        target,
      ),
      AuditLogActionType.emojiUpdate => l10n.auditLogSummaryEmojiUpdate(
        actor,
        target,
      ),
      AuditLogActionType.emojiDelete => l10n.auditLogSummaryEmojiDelete(
        actor,
        target,
      ),
      AuditLogActionType.stickerCreate => l10n.auditLogSummaryStickerCreate(
        actor,
        target,
      ),
      AuditLogActionType.stickerUpdate => l10n.auditLogSummaryStickerUpdate(
        actor,
        target,
      ),
      AuditLogActionType.stickerDelete => l10n.auditLogSummaryStickerDelete(
        actor,
        target,
      ),
      AuditLogActionType.messageDelete =>
        hasChannel
            ? l10n.auditLogSummaryMessageDeleteInChannel(actor, channel)
            : l10n.auditLogSummaryMessageDelete(actor),
      AuditLogActionType.messageBulkDelete => _bulkDeleteSummary(
        l10n: l10n,
        actor: actor,
        channel: channel,
        bulkCount: bulkCount,
      ),
      AuditLogActionType.messagePin =>
        hasChannel
            ? l10n.auditLogSummaryMessagePinInChannel(actor, channel)
            : l10n.auditLogSummaryMessagePin(actor),
      AuditLogActionType.messageUnpin =>
        hasChannel
            ? l10n.auditLogSummaryMessageUnpinInChannel(actor, channel)
            : l10n.auditLogSummaryMessageUnpin(actor),
      AuditLogActionType.$unknown => l10n.auditLogSummaryDefault(actor, target),
    };
  }

  static String _bulkDeleteSummary({
    required FluxerLocalizations l10n,
    required String actor,
    required String channel,
    required int? bulkCount,
  }) {
    final bool hasChannel = channel.isNotEmpty;
    if (bulkCount != null && bulkCount > 0) {
      if (hasChannel) {
        return l10n.auditLogSummaryMessageBulkDeleteCountInChannel(
          actor,
          bulkCount,
          channel,
        );
      }
      return l10n.auditLogSummaryMessageBulkDeleteCount(actor, bulkCount);
    }
    if (hasChannel) {
      return l10n.auditLogSummaryMessageBulkDeleteInChannel(actor, channel);
    }
    return l10n.auditLogSummaryMessageBulkDelete(actor);
  }

  static String _resolveActor(
    String? userId,
    Map<String, String> userNames,
    FluxerLocalizations l10n,
  ) {
    if (userId == null) {
      return l10n.guildSettingsAuditLogSomeone;
    }
    return userNames[userId] ?? l10n.guildSettingsAuditLogSomeone;
  }

  static String _resolveTarget({
    required GuildAuditLogEntry entry,
    required Map<String, String> userNames,
    required Map<String, String> channelNames,
    required Map<String, String> roleNames,
    required FluxerLocalizations l10n,
  }) {
    final String? changedName =
        GuildAuditLogUtils.findChangeScalar(entry.changes, 'name') ??
        GuildAuditLogUtils.findChangeScalar(entry.changes, 'nick') ??
        GuildAuditLogUtils.findChangeScalar(entry.changes, 'code') ??
        entry.options?.roleName;
    if (changedName != null && changedName.isNotEmpty) {
      return changedName;
    }
    final String? targetId = entry.targetId;
    if (targetId == null) {
      return l10n.guildSettingsAuditLogSomething;
    }
    if (GuildAuditLogUtils.looksLikeSnowflake(targetId)) {
      return userNames[targetId] ??
          channelNames[targetId] ??
          roleNames[targetId] ??
          l10n.guildSettingsAuditLogUnknownEntity;
    }
    return targetId;
  }
}

class GuildAuditLogSummaryParts {
  const GuildAuditLogSummaryParts({
    required this.text,
    required this.actorLabel,
    required this.targetLabel,
  });

  final String text;
  final String actorLabel;
  final String targetLabel;
}
