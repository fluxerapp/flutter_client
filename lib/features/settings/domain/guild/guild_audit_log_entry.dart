import 'package:fluxer_dart/export.dart';

class GuildAuditLogChange {
  final String key;
  final Object? oldValue;
  final Object? newValue;

  const GuildAuditLogChange({required this.key, this.oldValue, this.newValue});
}

class GuildAuditLogEntryOptions {
  final String? channelId;
  final num? count;
  final String? deleteMemberDays;
  final String? id;
  final num? integrationType;
  final String? messageId;
  final num? membersRemoved;
  final String? roleName;
  final num? type;
  final String? inviterId;
  final num? maxAge;
  final num? maxUses;
  final bool? temporary;
  final num? uses;

  const GuildAuditLogEntryOptions({
    this.channelId,
    this.count,
    this.deleteMemberDays,
    this.id,
    this.integrationType,
    this.messageId,
    this.membersRemoved,
    this.roleName,
    this.type,
    this.inviterId,
    this.maxAge,
    this.maxUses,
    this.temporary,
    this.uses,
  });
}

class GuildAuditLogEntry {
  final String id;
  final AuditLogActionType actionType;
  final String? userId;
  final String? targetId;
  final String? reason;
  final GuildAuditLogEntryOptions? options;
  final List<GuildAuditLogChange> changes;
  final DateTime? createdAt;

  const GuildAuditLogEntry({
    required this.id,
    required this.actionType,
    this.userId,
    this.targetId,
    this.reason,
    this.options,
    this.changes = const <GuildAuditLogChange>[],
    this.createdAt,
  });

  int? get actionTypeValue => actionType.json;
}

class GuildAuditLogUser {
  final String id;
  final String username;
  final String? globalName;
  final String? avatarHash;
  final int? avatarColor;
  final bool isBot;
  final String displayName;
  final String? avatarUrl;

  const GuildAuditLogUser({
    required this.id,
    required this.username,
    required this.displayName,
    this.globalName,
    this.avatarHash,
    this.avatarColor,
    this.isBot = false,
    this.avatarUrl,
  });
}

class GuildAuditLogPage {
  final List<GuildAuditLogEntry> entries;
  final Map<String, String> userNames;
  final Map<String, GuildAuditLogUser> users;
  final String? nextBefore;

  const GuildAuditLogPage({
    required this.entries,
    required this.userNames,
    required this.users,
    this.nextBefore,
  });
}
