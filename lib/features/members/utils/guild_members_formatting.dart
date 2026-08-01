import 'package:flutter/widgets.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:intl/intl.dart';

sealed class GuildMembersPaginationItem {
  const GuildMembersPaginationItem();
}

class GuildMembersPageNumber extends GuildMembersPaginationItem {
  const GuildMembersPageNumber(this.page);

  final int page;
}

class GuildMembersPaginationEllipsis extends GuildMembersPaginationItem {
  const GuildMembersPaginationEllipsis({required this.isLeft});

  final bool isLeft;
}

String formatGuildMemberTimestampRelative(BuildContext context, DateTime date) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final Duration diff = DateTime.now().difference(date);
  if (diff.inDays < 1) {
    if (diff.inMinutes < 1) {
      return l10n.guildMembersJoinedJustNow;
    }
    if (diff.inHours < 1) {
      final int minutes = diff.inMinutes < 1 ? 1 : diff.inMinutes;
      return l10n.guildMembersJoinedMinutesAgo(minutes);
    }
    return l10n.guildMembersJoinedHoursAgo(diff.inHours);
  }
  return relativeTime(date, l10n);
}

String formatGuildMemberTimestampAbsolute(DateTime date) {
  return DateFormat('d MMMM yyyy, HH:mm').format(date);
}

String formatGuildMemberJoinMethodPillLabel(
  FluxerLocalizations l10n,
  GuildMemberDisplayData member,
) {
  final JoinSourceType? source = member.joinSourceType;
  if (source == null) {
    return l10n.guildMembersJoinSourceInvite;
  }
  return switch (source) {
    JoinSourceType.creator => l10n.guildMembersJoinSourceCreator,
    JoinSourceType.instantInvite =>
      member.sourceInviteCode != null
          ? l10n.guildMembersJoinSourceInviteCode(member.sourceInviteCode!)
          : l10n.guildMembersJoinSourceInvite,
    JoinSourceType.vanityUrl => l10n.guildMembersJoinSourceVanityUrl,
    JoinSourceType.botInvite => l10n.guildMembersJoinSourceBotInvite,
    JoinSourceType.adminForceAdd => l10n.guildMembersJoinSourcePlatformAdmin,
    JoinSourceType.discovery => l10n.guildMembersJoinSourceDiscovery,
    JoinSourceType.$unknown => l10n.guildMembersJoinSourceInvite,
  };
}

String? formatGuildMemberJoinMethodTooltip(
  FluxerLocalizations l10n,
  GuildMemberDisplayData member, {
  String? inviterDisplayName,
}) {
  final JoinSourceType? source = member.joinSourceType;
  if (source == JoinSourceType.instantInvite &&
      member.inviterId != null &&
      inviterDisplayName != null) {
    return l10n.guildMembersJoinSourceInvitedBy(inviterDisplayName);
  }
  if (source == JoinSourceType.adminForceAdd) {
    return l10n.guildMembersJoinSourcePlatformAdmin;
  }
  return null;
}

List<GuildMembersPaginationItem> buildGuildMembersPaginationRange({
  required int currentPage,
  required int totalPages,
  int maxVisible = guildMembersMaxVisiblePages,
}) {
  if (totalPages <= 0) {
    return const <GuildMembersPaginationItem>[];
  }
  final int effectiveMax = maxVisible < 3 ? 3 : maxVisible;
  if (totalPages <= effectiveMax) {
    return List<GuildMembersPaginationItem>.generate(
      totalPages,
      (int index) => GuildMembersPageNumber(index + 1),
    );
  }

  final int innerSlots = effectiveMax - 2;
  int start = currentPage - innerSlots ~/ 2;
  int end = currentPage + (innerSlots + 1) ~/ 2 - 1;
  start = start < 2 ? 2 : start;
  end = end > totalPages - 1 ? totalPages - 1 : end;
  while (end - start + 1 < innerSlots) {
    if (start > 2) {
      start -= 1;
    } else if (end < totalPages - 1) {
      end += 1;
    } else {
      break;
    }
  }

  final List<GuildMembersPaginationItem> range = <GuildMembersPaginationItem>[
    const GuildMembersPageNumber(1),
  ];
  if (start > 2) {
    range.add(const GuildMembersPaginationEllipsis(isLeft: true));
  }
  for (int page = start; page <= end; page++) {
    range.add(GuildMembersPageNumber(page));
  }
  if (end < totalPages - 1) {
    range.add(const GuildMembersPaginationEllipsis(isLeft: false));
  }
  range.add(GuildMembersPageNumber(totalPages));
  return range;
}
