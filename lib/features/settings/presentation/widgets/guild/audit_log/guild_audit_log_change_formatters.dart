import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/features/settings/utils/guild_audit_log_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

class GuildAuditLogChangeFormatters {
  GuildAuditLogChangeFormatters._();

  static String formatChange({
    required GuildAuditLogChange change,
    required AuditLogActionType actionType,
    required FluxerLocalizations l10n,
    required Map<String, String> channelNames,
    required Map<String, String> roleNames,
    required Map<String, String> userNames,
  }) {
    final String? specialized = _formatSpecializedChange(
      change: change,
      actionType: actionType,
      l10n: l10n,
      channelNames: channelNames,
      roleNames: roleNames,
      userNames: userNames,
    );
    if (specialized != null) {
      return specialized;
    }
    return _formatFallbackChange(
      change,
      l10n,
      userNames,
      channelNames,
      roleNames,
    );
  }

  static String formatOption({
    required String key,
    required Object? value,
    required FluxerLocalizations l10n,
    required Map<String, String> channelNames,
    required Map<String, String> userNames,
  }) {
    if (key == 'channel_id' || key == 'channel') {
      return l10n.auditLogOptionChannel(
        _resolveValue(value, l10n, userNames, channelNames),
      );
    }
    if (key == 'message_id') {
      return l10n.auditLogOptionMessage(
        _resolveValue(value, l10n, userNames, channelNames),
      );
    }
    if (key == 'inviter_id') {
      return l10n.auditLogOptionInvitedBy(
        _resolveValue(value, l10n, userNames, channelNames),
      );
    }
    if (key == 'count' ||
        key == 'delete_count' ||
        key == 'messages' ||
        key == 'message_count') {
      final int count = _parseCount(value);
      return l10n.auditLogOptionDeletedMessages(count);
    }
    if (key == 'members_removed' || key == 'members_pruned') {
      final int count = _parseCount(value);
      return l10n.auditLogOptionRemovedMembers(count);
    }
    if (key == 'max_age') {
      final int seconds = _parseCount(value);
      if (seconds == 0) {
        return l10n.auditLogOptionInviteNeverExpires;
      }
    }
    if (key == 'temporary') {
      if (value == true) {
        return l10n.auditLogOptionTemporaryMembership;
      }
      if (value == false) {
        return l10n.auditLogOptionPermanentMembership;
      }
    }
    final String field = GuildAuditLogUtils.formatChangeKeyLabel(key);
    if (value == null) {
      return l10n.auditLogChangeUpdated(field);
    }
    return l10n.auditLogChangeSetTo(
      field,
      _resolveValue(value, l10n, userNames, channelNames),
    );
  }

  static String? _formatSpecializedChange({
    required GuildAuditLogChange change,
    required AuditLogActionType actionType,
    required FluxerLocalizations l10n,
    required Map<String, String> channelNames,
    required Map<String, String> roleNames,
    required Map<String, String> userNames,
  }) {
    return switch (change.key) {
      'name' when actionType == AuditLogActionType.guildUpdate =>
        l10n.auditLogChangeRenamedCommunity(
          _resolveValue(change.newValue, l10n, userNames, channelNames),
        ),
      'icon_hash' when actionType == AuditLogActionType.guildUpdate =>
        l10n.auditLogChangeUpdatedCommunityIcon,
      'name' when _isChannelAction(actionType) =>
        l10n.auditLogChangeRenamedChannel(
          _resolveValue(change.newValue, l10n, userNames, channelNames),
        ),
      'topic' when change.newValue == null || _isEmptyString(change.newValue) =>
        l10n.auditLogChangeClearedTopic,
      'topic' => l10n.auditLogChangeUpdatedTopic(
        _resolveValue(change.newValue, l10n, userNames, channelNames),
      ),
      'nsfw' when change.newValue == true =>
        l10n.auditLogChangeEnabledMatureContent,
      'nsfw' when change.newValue == false =>
        l10n.auditLogChangeDisabledMatureContent,
      'nick' when change.newValue == null => l10n.auditLogChangeRemovedNickname(
        _resolveValue(change.oldValue, l10n, userNames, channelNames),
      ),
      'nick' => l10n.auditLogChangeSetNickname(
        _resolveValue(change.newValue, l10n, userNames, channelNames),
      ),
      'mute' when change.newValue == true => l10n.auditLogChangeMutedMember,
      'mute' when change.newValue == false => l10n.auditLogChangeUnmutedMember,
      'deaf' when change.newValue == true => l10n.auditLogChangeDeafenedMember,
      'deaf' when change.newValue == false =>
        l10n.auditLogChangeUndeafenedMember,
      'roles' ||
      r'$add' => _formatRoleDiff(change, l10n, roleNames, isAdd: true),
      r'$remove' => _formatRoleDiff(change, l10n, roleNames, isAdd: false),
      _ => null,
    };
  }

  static String _formatFallbackChange(
    GuildAuditLogChange change,
    FluxerLocalizations l10n,
    Map<String, String> userNames,
    Map<String, String> channelNames,
    Map<String, String> roleNames,
  ) {
    final String field = GuildAuditLogUtils.formatChangeKeyLabel(change.key);
    final String oldValue = _resolveValue(
      change.oldValue,
      l10n,
      userNames,
      channelNames,
      roleNames: roleNames,
    );
    final String newValue = _resolveValue(
      change.newValue,
      l10n,
      userNames,
      channelNames,
      roleNames: roleNames,
    );
    if (change.oldValue != null && change.newValue != null) {
      return l10n.auditLogChangeUpdatedFromTo(field, oldValue, newValue);
    }
    if (change.newValue != null) {
      return l10n.auditLogChangeSetTo(field, newValue);
    }
    if (change.oldValue != null) {
      return l10n.auditLogChangeCleared(field, oldValue);
    }
    return l10n.auditLogChangeUpdated(field);
  }

  static String? _formatRoleDiff(
    GuildAuditLogChange change,
    FluxerLocalizations l10n,
    Map<String, String> roleNames, {
    required bool isAdd,
  }) {
    final List<String> roleIds = _normalizeStringList(
      isAdd ? change.newValue : change.oldValue,
    );
    if (roleIds.isEmpty) {
      return null;
    }
    final String labels = roleIds
        .map((String roleId) => roleNames[roleId] ?? roleId)
        .join(', ');
    return isAdd
        ? l10n.auditLogChangeAddedRoles(labels)
        : l10n.auditLogChangeRemovedRoles(labels);
  }

  static bool _isChannelAction(AuditLogActionType actionType) {
    return actionType == AuditLogActionType.channelCreate ||
        actionType == AuditLogActionType.channelUpdate ||
        actionType == AuditLogActionType.channelDelete;
  }

  static bool _isEmptyString(Object? value) {
    return value is String && value.trim().isEmpty;
  }

  static int _parseCount(Object? value) {
    if (value is num) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  static List<String> _normalizeStringList(Object? value) {
    if (value is! List<Object?>) {
      return const <String>[];
    }
    return value.whereType<String>().toList();
  }

  static String _resolveValue(
    Object? value,
    FluxerLocalizations l10n,
    Map<String, String> userNames,
    Map<String, String> channelNames, {
    Map<String, String> roleNames = const <String, String>{},
  }) {
    final String? scalar = GuildAuditLogUtils.scalarToString(value);
    if (scalar == null) {
      return l10n.guildSettingsAuditLogNothing;
    }
    if (GuildAuditLogUtils.looksLikeSnowflake(scalar)) {
      return userNames[scalar] ??
          channelNames[scalar] ??
          roleNames[scalar] ??
          l10n.guildSettingsAuditLogUnknownEntity;
    }
    return scalar;
  }

  static String resolveChannelLabel({
    required GuildAuditLogEntry entry,
    required Map<String, String> channelNames,
    required FluxerLocalizations l10n,
  }) {
    final String? channelId = entry.options?.channelId;
    if (channelId == null) {
      return '';
    }
    return channelNames[channelId] ?? channelId;
  }
}
