import 'dart:async';

import 'package:fluxer_app/features/members/data/guild_members_search_repository.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_members_search_provider.g.dart';

@riverpod
class GuildMembersSearch extends _$GuildMembersSearch {
  Timer? _searchDebounce;
  Timer? _indexingPoll;
  int _searchGeneration = 0;

  @override
  GuildMembersSearchState build(String guildId) {
    ref.onDispose(() {
      _searchDebounce?.cancel();
      _indexingPoll?.cancel();
    });
    unawaited(Future<void>.microtask(_refreshMembers));
    return GuildMembersSearchState.initial();
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
    _searchDebounce?.cancel();
    _searchDebounce = Timer(guildMembersSearchDebounce, () {
      state = state.copyWith(debouncedQuery: query.trim(), page: 1);
      unawaited(_refreshMembers());
    });
  }

  void setSortMode(GuildMembersSortMode sortMode) {
    if (state.sortMode == sortMode) {
      return;
    }
    state = state.copyWith(sortMode: sortMode, page: 1);
    unawaited(_refreshMembers());
  }

  void setPage(int page) {
    if (state.page == page) {
      return;
    }
    state = state.copyWith(page: page);
    unawaited(_refreshMembers());
  }

  void setPageSize(int pageSize) {
    if (state.pageSize == pageSize) {
      return;
    }
    state = state.copyWith(pageSize: pageSize, page: 1);
    unawaited(_refreshMembers());
  }

  void setRoleFilter(List<String> roleIds) {
    state = state.copyWith(roleFilter: roleIds, page: 1);
    unawaited(_refreshMembers());
  }

  void setMemberSinceFilter(GuildMembersDateRangeFilter filter) {
    state = state.copyWith(memberSinceFilter: filter, page: 1);
    unawaited(_refreshMembers());
  }

  void setJoinedProductFilter(GuildMembersDateRangeFilter filter) {
    state = state.copyWith(joinedProductFilter: filter, page: 1);
    unawaited(_refreshMembers());
  }

  void setJoinMethodFilter(GuildMembersJoinMethodFilter filter) {
    state = state.copyWith(joinMethodFilter: filter, page: 1);
    unawaited(_refreshMembers());
  }

  Future<void> reload() async {
    await _refreshMembers();
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
    state = current.copyWith(isLoadingMore: true, hasError: false);
    final int generation = ++_searchGeneration;
    try {
      final GuildMembersSearchPageResult result = await ref
          .read(guildMembersSearchRepositoryProvider)
          .searchMembers(guildId: guildId, state: current, page: nextPage);
      if (generation != _searchGeneration) {
        return;
      }
      state = state.copyWith(
        members: <GuildMemberDisplayData>[
          ...current.members,
          ...result.members,
        ],
        totalCount: result.totalCount,
        indexing: result.indexing,
        page: nextPage,
        isLoadingMore: false,
        hasError: false,
        initialLoadDone: true,
      );
      _scheduleIndexingPoll(result.indexing);
    } on Object {
      if (generation != _searchGeneration) {
        return;
      }
      state = state.copyWith(isLoadingMore: false, hasError: true);
    }
  }

  Future<void> _refreshMembers() async {
    _indexingPoll?.cancel();
    state = state.copyWith(isSearching: true, hasError: false);
    final int generation = ++_searchGeneration;
    try {
      GuildMembersSearchState current = state;
      GuildMembersSearchPageResult result = await ref
          .read(guildMembersSearchRepositoryProvider)
          .searchMembers(guildId: guildId, state: current);
      if (generation != _searchGeneration) {
        return;
      }
      final int totalPages = result.totalCount == 0
          ? 1
          : (result.totalCount + current.pageSize - 1) ~/ current.pageSize;
      if (current.page > totalPages) {
        current = current.copyWith(page: totalPages);
        state = current;
        result = await ref
            .read(guildMembersSearchRepositoryProvider)
            .searchMembers(guildId: guildId, state: current, page: totalPages);
        if (generation != _searchGeneration) {
          return;
        }
      }
      state = current.copyWith(
        members: result.members,
        totalCount: result.totalCount,
        indexing: result.indexing,
        isSearching: false,
        hasError: false,
        initialLoadDone: true,
      );
      _scheduleIndexingPoll(result.indexing);
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

  void _scheduleIndexingPoll(bool indexing) {
    _indexingPoll?.cancel();
    if (!indexing) {
      return;
    }
    _indexingPoll = Timer(guildMembersIndexingPollInterval, () {
      unawaited(_refreshMembers());
    });
  }
}
