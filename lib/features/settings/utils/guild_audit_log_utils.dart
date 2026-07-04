import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';

class GuildAuditLogUtils {
  GuildAuditLogUtils._();

  static DateTime? parseSnowflakeTimestamp(String snowflake) {
    return dateTimeFromUserSnowflakeOrNull(snowflake);
  }

  static String formatAuditLogTimestamp(
    DateTime timestamp,
    FluxerLocalizations l10n,
    String locale, {
    required bool use12Hour,
  }) {
    final DateTime local = timestamp.toLocal();
    return formatUserMediumDateTime(local, locale, use12Hour: use12Hour);
  }

  static String maybeUrlDecodeReason(String raw) {
    if (!RegExp('%[0-9A-Fa-f]{2}').hasMatch(raw)) {
      return raw;
    }
    try {
      final String decoded = Uri.decodeComponent(raw);
      return decoded == raw ? raw : decoded;
    } on Object {
      return raw;
    }
  }

  static bool looksLikeSnowflake(String value) {
    return RegExp(r'^\d{17,20}$').hasMatch(value);
  }

  static Set<String> collectUserIdsFromEntries(
    List<GuildAuditLogEntry> entries,
  ) {
    final Set<String> userIds = <String>{};
    for (final GuildAuditLogEntry entry in entries) {
      final String? actorId = entry.userId;
      if (actorId != null && actorId.isNotEmpty) {
        userIds.add(actorId);
      }
      final String? targetId = entry.targetId;
      if (targetId != null && targetId.isNotEmpty) {
        userIds.add(targetId);
      }
      final String? inviterId = entry.options?.inviterId;
      if (inviterId != null && inviterId.isNotEmpty) {
        userIds.add(inviterId);
      }
    }
    return userIds;
  }

  static String? findChangeScalar(
    List<GuildAuditLogChange> changes,
    String key,
  ) {
    for (final GuildAuditLogChange change in changes) {
      if (change.key != key) {
        continue;
      }
      final Object? value = change.newValue ?? change.oldValue;
      return scalarToString(value);
    }
    return null;
  }

  static String? findChangeNewScalar(
    List<GuildAuditLogChange> changes,
    String key,
  ) {
    for (final GuildAuditLogChange change in changes) {
      if (change.key == key) {
        return scalarToString(change.newValue);
      }
    }
    return null;
  }

  static String? scalarToString(Object? value) {
    if (value == null) {
      return null;
    }
    if (value is String) {
      return value.trim().isEmpty ? null : value;
    }
    if (value is num || value is bool) {
      return value.toString();
    }
    return null;
  }

  static String formatChangeKeyLabel(String key) {
    return key.replaceAll('_', ' ').trim();
  }
}
