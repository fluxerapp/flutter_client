import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_state.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_audit_log_member_repository_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_repository_provider.dart';
import 'package:fluxer_app/features/settings/utils/guild_audit_log_utils.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_audit_log_provider.g.dart';

const int _kAuditLogPageSize = 50;
const int _kAuditLogFilterMemberLimit = 200;

@riverpod
class GuildAuditLog extends _$GuildAuditLog {
  String? _selectedUserId;
  AuditLogActionType? _selectedActionType;

  @override
  Future<GuildAuditLogState> build(String guildId) async {
    return _loadState();
  }

  Future<void> setUserFilter(String? userId) async {
    _selectedUserId = (userId == null || userId.isEmpty) ? null : userId;
    state = const AsyncLoading<GuildAuditLogState>();
    state = AsyncData<GuildAuditLogState>(await _loadState());
  }

  Future<void> setActionFilter(AuditLogActionType? actionType) async {
    _selectedActionType = actionType;
    state = const AsyncLoading<GuildAuditLogState>();
    state = AsyncData<GuildAuditLogState>(await _loadState());
  }

  Future<void> reload() async {
    state = const AsyncLoading<GuildAuditLogState>();
    state = AsyncData<GuildAuditLogState>(await _loadState());
  }

  Future<void> loadMore() async {
    final GuildAuditLogState? current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) {
      return;
    }
    state = AsyncData<GuildAuditLogState>(
      current.copyWith(isLoadingMore: true),
    );
    final String? before = current.entries.isEmpty
        ? null
        : current.entries.last.id;
    final GuildAuditLogPage page = await _fetchPage(before: before);
    final Set<String> newUserIds = GuildAuditLogUtils.collectUserIdsFromEntries(
      page.entries,
    )..removeWhere(current.userDisplays.containsKey);
    final Map<String, GuildUserDisplay> newDisplays = newUserIds.isEmpty
        ? const <String, GuildUserDisplay>{}
        : await _resolveUserDisplays(
            userIds: newUserIds,
            auditLogUsers: page.users.values,
          );
    state = AsyncData<GuildAuditLogState>(
      current.copyWith(
        entries: <GuildAuditLogEntry>[...current.entries, ...page.entries],
        users: <String, GuildAuditLogUser>{...current.users, ...page.users},
        userDisplays: <String, GuildUserDisplay>{
          ...current.userDisplays,
          ...newDisplays,
        },
        hasMore: page.entries.length >= _kAuditLogPageSize,
        isLoadingMore: false,
        hasResolvedProfiles: true,
      ),
    );
  }

  Future<GuildAuditLogState> _loadState() async {
    final GuildAuditLogPage page = await _fetchPage();
    final List<Member> filterMembers = await ref
        .read(memberRepositoryProvider)
        .getMembers(guildId, limit: _kAuditLogFilterMemberLimit);
    final Set<String> userIds = _collectProfileUserIds(
      page: page,
      filterMembers: filterMembers,
    );
    final Map<String, GuildUserDisplay> userDisplays =
        await _resolveUserDisplays(
          userIds: userIds,
          auditLogUsers: page.users.values,
        );
    return GuildAuditLogState(
      entries: page.entries,
      users: page.users,
      userDisplays: userDisplays,
      filterMembers: filterMembers,
      hasMore: page.entries.length >= _kAuditLogPageSize,
      selectedUserId: _selectedUserId,
      selectedActionType: _selectedActionType,
      hasSuccessfulEmptyLoad: page.entries.isEmpty,
      hasResolvedProfiles: true,
    );
  }

  Future<GuildAuditLogPage> _fetchPage({String? before}) async {
    return ref
        .read(guildSettingsRepositoryProvider)
        .listAuditLogs(
          guildId: guildId,
          limit: _kAuditLogPageSize,
          before: before,
          userId: _selectedUserId,
          actionType: _selectedActionType,
        );
  }

  Set<String> _collectProfileUserIds({
    required GuildAuditLogPage page,
    required List<Member> filterMembers,
  }) {
    return GuildAuditLogUtils.collectUserIdsFromEntries(page.entries)
      ..addAll(page.users.keys)
      ..addAll(filterMembers.map((Member member) => member.id));
  }

  Future<Map<String, GuildUserDisplay>> _resolveUserDisplays({
    required Set<String> userIds,
    required Iterable<GuildAuditLogUser> auditLogUsers,
  }) {
    return ref
        .read(guildAuditLogMemberRepositoryProvider)
        .resolveUserDisplays(
          guildId: guildId,
          userIds: userIds,
          auditLogUsers: auditLogUsers,
          onMemberFetched: (String userId) {
            ref.invalidate(memberRoleColorProvider((userId, guildId)));
          },
        );
  }
}
