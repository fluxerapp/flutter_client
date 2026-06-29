import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/export.dart';

class GuildAuditLogState {
  const GuildAuditLogState({
    required this.entries,
    required this.users,
    required this.userDisplays,
    required this.filterMembers,
    required this.hasMore,
    this.isLoadingMore = false,
    this.selectedUserId,
    this.selectedActionType,
    this.hasSuccessfulEmptyLoad = false,
    this.hasResolvedProfiles = false,
  });

  final List<GuildAuditLogEntry> entries;
  final Map<String, GuildAuditLogUser> users;
  final Map<String, GuildUserDisplay> userDisplays;
  final List<Member> filterMembers;
  final bool hasMore;
  final bool isLoadingMore;
  final String? selectedUserId;
  final AuditLogActionType? selectedActionType;
  final bool hasSuccessfulEmptyLoad;
  final bool hasResolvedProfiles;

  Map<String, String> get userNames {
    final Map<String, String> names = <String, String>{};
    for (final Member member in filterMembers) {
      names[member.id] = member.displayName;
    }
    for (final MapEntry<String, GuildUserDisplay> entry
        in userDisplays.entries) {
      names[entry.key] = entry.value.displayName;
    }
    return names;
  }

  String? actorAvatarUrl(String? userId) {
    if (userId == null || userId.isEmpty) {
      return null;
    }
    final GuildUserDisplay? display = userDisplays[userId];
    if (display != null) {
      return display.avatarUrl;
    }
    if (!hasResolvedProfiles) {
      return null;
    }
    return users[userId]?.avatarUrl;
  }

  int? actorAvatarColor(String? userId) {
    if (userId == null || userId.isEmpty) {
      return null;
    }
    final GuildUserDisplay? display = userDisplays[userId];
    if (display?.avatarColor != null) {
      return display!.avatarColor;
    }
    if (!hasResolvedProfiles) {
      return null;
    }
    return users[userId]?.avatarColor;
  }

  int? filterMemberAvatarColor(String userId) {
    final int? displayColor = userDisplays[userId]?.avatarColor;
    if (displayColor != null) {
      return displayColor;
    }
    if (!hasResolvedProfiles) {
      return null;
    }
    for (final Member member in filterMembers) {
      if (member.id == userId) {
        return member.avatarColor;
      }
    }
    return null;
  }

  String? filterMemberAvatarUrl(String userId) {
    return userDisplays[userId]?.avatarUrl;
  }

  String actorName(String? userId, String unknownLabel) {
    if (userId == null || userId.isEmpty) {
      return unknownLabel;
    }
    return userNames[userId] ?? unknownLabel;
  }

  GuildAuditLogState copyWith({
    List<GuildAuditLogEntry>? entries,
    Map<String, GuildAuditLogUser>? users,
    Map<String, GuildUserDisplay>? userDisplays,
    List<Member>? filterMembers,
    bool? hasMore,
    bool? isLoadingMore,
    String? selectedUserId,
    AuditLogActionType? selectedActionType,
    bool? hasSuccessfulEmptyLoad,
    bool? hasResolvedProfiles,
    bool clearSelectedUserId = false,
    bool clearSelectedActionType = false,
  }) {
    return GuildAuditLogState(
      entries: entries ?? this.entries,
      users: users ?? this.users,
      userDisplays: userDisplays ?? this.userDisplays,
      filterMembers: filterMembers ?? this.filterMembers,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      selectedUserId: clearSelectedUserId
          ? null
          : (selectedUserId ?? this.selectedUserId),
      selectedActionType: clearSelectedActionType
          ? null
          : (selectedActionType ?? this.selectedActionType),
      hasSuccessfulEmptyLoad:
          hasSuccessfulEmptyLoad ?? this.hasSuccessfulEmptyLoad,
      hasResolvedProfiles: hasResolvedProfiles ?? this.hasResolvedProfiles,
    );
  }
}
