import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

const Duration guildMembersSearchDebounce = Duration(milliseconds: 300);
const int guildMembersDefaultPageSize = 25;
const List<int> guildMembersPageSizeOptions = <int>[12, 25, 50, 100];
const int guildMembersMaxVisiblePages = 7;

enum GuildMembersSortMode { newest, oldest }

class GuildMembersDateRangeFilter {
  const GuildMembersDateRangeFilter({this.gte, this.lte});

  final int? gte;
  final int? lte;

  bool get isActive => gte != null || lte != null;

  GuildMembersDateRangeFilter copyWith({
    int? Function()? gte,
    int? Function()? lte,
    bool clearGte = false,
    bool clearLte = false,
  }) {
    return GuildMembersDateRangeFilter(
      gte: clearGte ? null : (gte != null ? gte() : this.gte),
      lte: clearLte ? null : (lte != null ? lte() : this.lte),
    );
  }

  static const GuildMembersDateRangeFilter empty =
      GuildMembersDateRangeFilter();
}

class GuildMembersJoinMethodFilter {
  const GuildMembersJoinMethodFilter({
    this.sourceTypes = const <JoinSourceType>[],
    this.inviteCodes = const <String>[],
  });

  final List<JoinSourceType> sourceTypes;
  final List<String> inviteCodes;

  bool get isActive => sourceTypes.isNotEmpty || inviteCodes.isNotEmpty;

  GuildMembersJoinMethodFilter copyWith({
    List<JoinSourceType>? sourceTypes,
    List<String>? inviteCodes,
  }) {
    return GuildMembersJoinMethodFilter(
      sourceTypes: sourceTypes ?? this.sourceTypes,
      inviteCodes: inviteCodes ?? this.inviteCodes,
    );
  }

  static const GuildMembersJoinMethodFilter empty =
      GuildMembersJoinMethodFilter();
}

class GuildMemberDisplayData {
  const GuildMemberDisplayData({
    required this.userId,
    required this.displayName,
    required this.tag,
    required this.username,
    required this.discriminator,
    required this.nickname,
    required this.globalName,
    required this.avatar,
    required this.avatarColor,
    required this.roleIds,
    required this.joinedAt,
    required this.isBot,
    required this.joinSourceType,
    required this.sourceInviteCode,
    required this.inviterId,
    required this.userCreatedAt,
    required this.communicationDisabledUntil,
    this.serverAvatar,
    this.userAvatar,
  });

  final String userId;
  final String displayName;
  final String tag;
  final String username;
  final String discriminator;
  final String? nickname;
  final String? globalName;
  final String? avatar;
  final String? serverAvatar;
  final String? userAvatar;
  final int? avatarColor;
  final List<String> roleIds;
  final DateTime joinedAt;
  final bool isBot;
  final JoinSourceType? joinSourceType;
  final String? sourceInviteCode;
  final String? inviterId;
  final DateTime? userCreatedAt;
  final DateTime? communicationDisabledUntil;

  bool matchesSearchQuery(String queryLower) {
    if (queryLower.isEmpty) {
      return true;
    }
    return username.toLowerCase().contains(queryLower) ||
        displayName.toLowerCase().contains(queryLower) ||
        tag.toLowerCase().contains(queryLower) ||
        (nickname?.toLowerCase().contains(queryLower) ?? false) ||
        (globalName?.toLowerCase().contains(queryLower) ?? false);
  }

  String? avatarUrlFor(String guildId) {
    final String? guildAvatar = serverAvatar;
    if (guildAvatar != null && guildAvatar.isNotEmpty) {
      return FluxerMediaUrl.guildMemberMedia(
        guildId: guildId,
        userId: userId,
        type: GuildMemberMediaType.avatar,
        hash: guildAvatar,
      );
    }
    return FluxerMediaUrl.userAvatar(userId: userId, hash: avatar);
  }

  GuildMemberResponse toGuildMemberResponse() {
    return GuildMemberResponse(
      user: UserPartialResponse(
        id: userId,
        username: username,
        discriminator: discriminator,
        globalName: globalName,
        avatar: userAvatar ?? avatar,
        avatarColor: avatarColor,
        flags: 0,
      ),
      roles: roleIds,
      nick: nickname,
      avatar: serverAvatar,
      joinedAt: joinedAt,
      communicationDisabledUntil: communicationDisabledUntil,
      mute: false,
      deaf: false,
    );
  }

  static GuildMemberDisplayData fromCachedMember({
    required Member member,
    required db.Member? memberRow,
    required db.User? user,
    JoinSourceType? joinSourceType,
    String? sourceInviteCode,
    String? inviterId,
  }) {
    final String discriminator = user?.discriminator ?? '0';
    final String tag = '${member.username}#$discriminator';
    final bool isAvatarUnset =
        memberRow != null &&
        hasMemberProfileFlag(
          memberRow.profileFlags,
          guildProfileAvatarUnsetFlag,
        );
    final String? serverAvatar = isAvatarUnset ? null : memberRow?.serverAvatar;
    final String? resolvedAvatar = serverAvatar ?? user?.avatar;
    final List<String> roleIds = member.roles.isNotEmpty
        ? member.roles.map((MemberRole role) => role.id).toList()
        : _roleIdsFromMemberRow(memberRow);
    final DateTime? snowflakeTime = dateTimeFromUserSnowflakeOrNull(
      member.id,
    )?.toLocal();
    return GuildMemberDisplayData(
      userId: member.id,
      displayName: member.displayName,
      tag: tag,
      username: member.username,
      discriminator: discriminator,
      nickname: member.nickname,
      globalName: member.globalName,
      avatar: resolvedAvatar,
      serverAvatar: serverAvatar,
      userAvatar: user?.avatar,
      avatarColor: user?.avatarColor ?? member.avatarColor,
      roleIds: roleIds,
      joinedAt:
          memberRow?.joinedAt ??
          snowflakeTime ??
          DateTime.fromMillisecondsSinceEpoch(0),
      isBot: member.isBot,
      joinSourceType: joinSourceType,
      sourceInviteCode: sourceInviteCode,
      inviterId: inviterId,
      userCreatedAt: snowflakeTime,
      communicationDisabledUntil: member.communicationDisabledUntil,
    );
  }

  static List<String> _roleIdsFromMemberRow(db.Member? memberRow) {
    if (memberRow == null) {
      return const <String>[];
    }
    try {
      final Object? decoded = jsonDecode(memberRow.roleIdsJson);
      if (decoded is List) {
        return decoded.cast<String>();
      }
    } on Object {
      // Fall through.
    }
    return const <String>[];
  }
}

class GuildMembersSearchState {
  const GuildMembersSearchState({
    required this.searchQuery,
    required this.debouncedQuery,
    required this.sortMode,
    required this.page,
    required this.pageSize,
    required this.roleFilter,
    required this.memberSinceFilter,
    required this.joinedProductFilter,
    required this.joinMethodFilter,
    required this.members,
    required this.totalCount,
    required this.indexing,
    required this.isSearching,
    required this.isLoadingMore,
    required this.hasError,
    required this.initialLoadDone,
  });

  final String searchQuery;
  final String debouncedQuery;
  final GuildMembersSortMode sortMode;
  final int page;
  final int pageSize;
  final List<String> roleFilter;
  final GuildMembersDateRangeFilter memberSinceFilter;
  final GuildMembersDateRangeFilter joinedProductFilter;
  final GuildMembersJoinMethodFilter joinMethodFilter;
  final List<GuildMemberDisplayData> members;
  final int totalCount;
  final bool indexing;
  final bool isSearching;
  final bool isLoadingMore;
  final bool hasError;
  final bool initialLoadDone;

  int get totalPages =>
      totalCount == 0 ? 1 : (totalCount + pageSize - 1) ~/ pageSize;

  bool get hasMore => members.length < totalCount;

  bool get dataReady => initialLoadDone && !isSearching && !indexing;

  bool get showProgress =>
      !initialLoadDone || isSearching || indexing || isLoadingMore;

  bool get showTableProgress => !dataReady;

  bool get showEmptySearch => dataReady && members.isEmpty && !hasError;

  bool get showError => dataReady && hasError;

  bool get showFooter =>
      dataReady && !hasError && !showEmptySearch && totalCount > 0;

  bool get showPagination => showFooter && totalPages > 1;

  GuildMembersSearchState copyWith({
    String? searchQuery,
    String? debouncedQuery,
    GuildMembersSortMode? sortMode,
    int? page,
    int? pageSize,
    List<String>? roleFilter,
    GuildMembersDateRangeFilter? memberSinceFilter,
    GuildMembersDateRangeFilter? joinedProductFilter,
    GuildMembersJoinMethodFilter? joinMethodFilter,
    List<GuildMemberDisplayData>? members,
    int? totalCount,
    bool? indexing,
    bool? isSearching,
    bool? isLoadingMore,
    bool? hasError,
    bool? initialLoadDone,
  }) {
    return GuildMembersSearchState(
      searchQuery: searchQuery ?? this.searchQuery,
      debouncedQuery: debouncedQuery ?? this.debouncedQuery,
      sortMode: sortMode ?? this.sortMode,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      roleFilter: roleFilter ?? this.roleFilter,
      memberSinceFilter: memberSinceFilter ?? this.memberSinceFilter,
      joinedProductFilter: joinedProductFilter ?? this.joinedProductFilter,
      joinMethodFilter: joinMethodFilter ?? this.joinMethodFilter,
      members: members ?? this.members,
      totalCount: totalCount ?? this.totalCount,
      indexing: indexing ?? this.indexing,
      isSearching: isSearching ?? this.isSearching,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasError: hasError ?? this.hasError,
      initialLoadDone: initialLoadDone ?? this.initialLoadDone,
    );
  }

  static GuildMembersSearchState initial() {
    return const GuildMembersSearchState(
      searchQuery: '',
      debouncedQuery: '',
      sortMode: GuildMembersSortMode.newest,
      page: 1,
      pageSize: guildMembersDefaultPageSize,
      roleFilter: <String>[],
      memberSinceFilter: GuildMembersDateRangeFilter.empty,
      joinedProductFilter: GuildMembersDateRangeFilter.empty,
      joinMethodFilter: GuildMembersJoinMethodFilter.empty,
      members: <GuildMemberDisplayData>[],
      totalCount: 0,
      indexing: false,
      isSearching: false,
      isLoadingMore: false,
      hasError: false,
      initialLoadDone: false,
    );
  }
}
