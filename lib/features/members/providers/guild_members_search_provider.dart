import 'dart:async';

import 'package:fluxer_app/features/members/data/guild_members_search_repository.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_dart/export.dart';
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
    Future<void>.microtask(_performSearch);
    return GuildMembersSearchState.initial();
  }

  void setSearchQuery(String query) {
    final GuildMembersSearchState current = state;
    state = current.copyWith(searchQuery: query);
    _searchDebounce?.cancel();
    _searchDebounce = Timer(guildMembersSearchDebounce, () {
      state = state.copyWith(debouncedQuery: query.trim(), page: 1);
      unawaited(_performSearch());
    });
  }

  void setSortMode(GuildMembersSortMode sortMode) {
    if (state.sortMode == sortMode) {
      return;
    }
    state = state.copyWith(sortMode: sortMode, page: 1);
    unawaited(_performSearch());
  }

  void setPage(int page) {
    if (state.page == page) {
      return;
    }
    state = state.copyWith(page: page);
    unawaited(_performSearch());
  }

  void setPageSize(int pageSize) {
    if (state.pageSize == pageSize) {
      return;
    }
    state = state.copyWith(pageSize: pageSize, page: 1);
    unawaited(_performSearch());
  }

  void setRoleFilter(List<String> roleIds) {
    state = state.copyWith(roleFilter: roleIds, page: 1);
    unawaited(_performSearch());
  }

  void setMemberSinceFilter(GuildMembersDateRangeFilter filter) {
    state = state.copyWith(memberSinceFilter: filter, page: 1);
    unawaited(_performSearch());
  }

  void setJoinedProductFilter(GuildMembersDateRangeFilter filter) {
    state = state.copyWith(joinedProductFilter: filter, page: 1);
    unawaited(_performSearch());
  }

  void setJoinMethodFilter(GuildMembersJoinMethodFilter filter) {
    state = state.copyWith(joinMethodFilter: filter, page: 1);
    unawaited(_performSearch());
  }

  Future<void> reload() async {
    await _performSearch();
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
    await _fetchPage(page: nextPage, append: true);
  }

  Future<void> _performSearch() async {
    state = state.copyWith(isSearching: true, hasError: false);
    await _fetchPage(page: state.page, append: false);
  }

  Future<void> _fetchPage({required int page, required bool append}) async {
    final int generation = ++_searchGeneration;
    try {
      final GuildMemberSearchResponse response = await ref
          .read(guildMembersSearchRepositoryProvider)
          .search(guildId: guildId, state: state, page: page);
      if (generation != _searchGeneration) {
        return;
      }
      final List<GuildMemberDisplayData> displayMembers = response.members
          .map(GuildMemberDisplayData.fromSearchResult)
          .toList();
      final int totalPages = response.totalResultCount == 0
          ? 1
          : (response.totalResultCount + state.pageSize - 1) ~/ state.pageSize;
      int resolvedPage = page;
      if (!append && page > totalPages) {
        resolvedPage = totalPages;
        if (resolvedPage != page) {
          await _fetchPage(page: resolvedPage, append: false);
          return;
        }
      }
      final List<GuildMemberDisplayData> members = append
          ? <GuildMemberDisplayData>[...state.members, ...displayMembers]
          : displayMembers;
      state = state.copyWith(
        members: members,
        totalCount: response.totalResultCount,
        indexing: response.indexing,
        isSearching: false,
        isLoadingMore: false,
        hasError: false,
        initialLoadDone: true,
        page: resolvedPage,
      );
      _syncIndexingPoll(response.indexing);
    } on Object {
      if (generation != _searchGeneration) {
        return;
      }
      state = state.copyWith(
        isSearching: false,
        isLoadingMore: false,
        hasError: true,
        initialLoadDone: true,
      );
    }
  }

  void _syncIndexingPoll(bool indexing) {
    _indexingPoll?.cancel();
    if (!indexing) {
      return;
    }
    _indexingPoll = Timer.periodic(guildMembersIndexingPollInterval, (_) {
      unawaited(_performSearch());
    });
  }
}
