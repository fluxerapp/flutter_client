import 'dart:async';

import 'package:fluxer_app/features/members/data/guild_members_gateway_list_repository.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_app/features/members/utils/guild_members_local_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_members_search_provider.g.dart';

@riverpod
class GuildMembersSearch extends _$GuildMembersSearch {
  Timer? _searchDebounce;
  int _searchGeneration = 0;
  List<GuildMemberDisplayData> _filteredMembers = <GuildMemberDisplayData>[];
  Object? _filteredMembersCacheKey;

  @override
  GuildMembersSearchState build(String guildId) {
    ref.onDispose(() {
      _searchDebounce?.cancel();
    });
    Future<void>.microtask(_refreshFilteredMembers);
    return GuildMembersSearchState.initial();
  }

  void setSearchQuery(String query) {
    final GuildMembersSearchState current = state;
    state = current.copyWith(searchQuery: query);
    _searchDebounce?.cancel();
    _searchDebounce = Timer(guildMembersSearchDebounce, () {
      state = state.copyWith(debouncedQuery: query.trim(), page: 1);
      unawaited(_refreshFilteredMembers());
    });
  }

  void setSortMode(GuildMembersSortMode sortMode) {
    if (state.sortMode == sortMode) {
      return;
    }
    state = state.copyWith(sortMode: sortMode, page: 1);
    unawaited(_refreshFilteredMembers());
  }

  void setPage(int page) {
    if (state.page == page) {
      return;
    }
    state = state.copyWith(page: page);
    _applyPagination(page: page, append: false);
  }

  void setPageSize(int pageSize) {
    if (state.pageSize == pageSize) {
      return;
    }
    state = state.copyWith(pageSize: pageSize, page: 1);
    unawaited(_refreshFilteredMembers());
  }

  void setRoleFilter(List<String> roleIds) {
    state = state.copyWith(roleFilter: roleIds, page: 1);
    unawaited(_refreshFilteredMembers());
  }

  void setMemberSinceFilter(GuildMembersDateRangeFilter filter) {
    state = state.copyWith(memberSinceFilter: filter, page: 1);
    unawaited(_refreshFilteredMembers());
  }

  void setJoinedProductFilter(GuildMembersDateRangeFilter filter) {
    state = state.copyWith(joinedProductFilter: filter, page: 1);
    unawaited(_refreshFilteredMembers());
  }

  void setJoinMethodFilter(GuildMembersJoinMethodFilter filter) {
    state = state.copyWith(joinMethodFilter: filter, page: 1);
    unawaited(_refreshFilteredMembers());
  }

  Future<void> reload() async {
    _filteredMembersCacheKey = null;
    await _refreshFilteredMembers();
  }

  Future<void> loadMore() async {
    final GuildMembersSearchState current = state;
    if (current.isLoadingMore ||
        current.isSearching ||
        current.indexing ||
        !current.hasMore) {
      return;
    }
    final int nextPage = (current.members.length ~/ current.pageSize) + 1;
    state = current.copyWith(isLoadingMore: true);
    _applyPagination(page: nextPage, append: true);
    state = state.copyWith(isLoadingMore: false);
  }

  Object _filteredMembersCacheKeyFor(GuildMembersSearchState current) {
    return Object.hash(
      current.debouncedQuery,
      current.sortMode,
      current.roleFilter,
      current.memberSinceFilter.gte,
      current.memberSinceFilter.lte,
      current.joinedProductFilter.gte,
      current.joinedProductFilter.lte,
      current.joinMethodFilter.sourceTypes,
      current.joinMethodFilter.inviteCodes,
    );
  }

  Future<void> _refreshFilteredMembers() async {
    state = state.copyWith(isSearching: true, hasError: false);
    final int generation = ++_searchGeneration;
    final GuildMembersSearchState current = state;
    final Object cacheKey = _filteredMembersCacheKeyFor(current);
    try {
      if (_filteredMembersCacheKey != cacheKey) {
        _filteredMembers = await ref
            .read(guildMembersGatewayListRepositoryProvider)
            .fetchFilteredMembers(guildId: guildId, state: current);
        _filteredMembersCacheKey = cacheKey;
      }
      if (generation != _searchGeneration) {
        return;
      }
      _applyPagination(page: current.page, append: false);
      state = state.copyWith(
        isSearching: false,
        hasError: false,
        initialLoadDone: true,
      );
    } on Object {
      if (generation != _searchGeneration) {
        return;
      }
      state = state.copyWith(
        isSearching: false,
        hasError: true,
        initialLoadDone: true,
      );
    }
  }

  void _applyPagination({required int page, required bool append}) {
    final GuildMembersSearchState current = state;
    final int totalCount = _filteredMembers.length;
    final int totalPages = totalCount == 0
        ? 1
        : (totalCount + current.pageSize - 1) ~/ current.pageSize;
    int resolvedPage = page;
    if (!append && page > totalPages) {
      resolvedPage = totalPages;
    }
    final List<GuildMemberDisplayData> pageMembers =
        paginateGuildMemberDisplayData(
          _filteredMembers,
          page: resolvedPage,
          pageSize: current.pageSize,
        );
    final List<GuildMemberDisplayData> members = append
        ? <GuildMemberDisplayData>[...current.members, ...pageMembers]
        : pageMembers;
    state = current.copyWith(
      members: members,
      totalCount: totalCount,
      page: resolvedPage,
    );
  }
}
