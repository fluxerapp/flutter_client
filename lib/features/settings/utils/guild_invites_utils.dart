import 'package:fluxer_app/features/settings/domain/guild/guild_invite_entry.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';

abstract final class GuildInvitesUtils {
  static String buildInviteUrl({
    required String inviteBaseUrl,
    required String code,
  }) {
    final String trimmedBase = inviteBaseUrl.replaceAll(RegExp(r'/+$'), '');
    return '$trimmedBase/$code';
  }

  static String formatUses(GuildInviteEntry entry) {
    if (entry.maxUses > 0) {
      return '${entry.uses} / ${entry.maxUses}';
    }
    return '${entry.uses}';
  }

  static String formatCreatedDate(
    GuildInviteEntry entry,
    FluxerLocalizations l10n,
  ) {
    final DateTime? createdAt = entry.createdAt;
    if (createdAt == null) {
      return '';
    }
    return relativeTimeShort(createdAt, l10n);
  }

  static InviteCountdownState resolveCountdown({
    required DateTime? expiresAt,
    required String expiredLabel,
  }) {
    if (expiresAt == null) {
      return const InviteCountdownState(text: null, isMonospace: false);
    }
    final int remainingMs = expiresAt.difference(DateTime.now()).inMilliseconds;
    if (remainingMs <= 0) {
      return InviteCountdownState(text: expiredLabel, isMonospace: false);
    }
    final int totalSeconds = remainingMs ~/ 1000;
    final int days = totalSeconds ~/ 86400;
    final int hours = (totalSeconds % 86400) ~/ 3600;
    final int minutes = (totalSeconds % 3600) ~/ 60;
    final int seconds = totalSeconds % 60;
    final List<String> parts = <String>[];
    if (days > 0) {
      parts.add(days.toString().padLeft(2, '0'));
    }
    parts
      ..add(hours.toString().padLeft(2, '0'))
      ..add(minutes.toString().padLeft(2, '0'))
      ..add(seconds.toString().padLeft(2, '0'));
    return InviteCountdownState(text: parts.join(':'), isMonospace: true);
  }
}

class InviteCountdownState {
  const InviteCountdownState({required this.text, required this.isMonospace});

  final String? text;
  final bool isMonospace;
}
