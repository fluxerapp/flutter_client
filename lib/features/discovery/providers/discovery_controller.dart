import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluxer_app/features/discovery/data/discovery_repository.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discovery_controller.g.dart';

const int discoveryPageSize = 36;
const Duration discoverySearchDebounce = Duration(milliseconds: 300);

class DiscoveryState {
  const DiscoveryState({
    this.query = '',
    this.categoryId,
    this.language,
    this.guilds = const <DiscoveryGuildListResponseGuilds>[],
    this.total = 0,
    this.categories = const <DiscoveryCategoryResponse>[],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.joiningGuildIds = const <String>{},
  });

  final String query;
  final int? categoryId;
  final String? language;
  final List<DiscoveryGuildListResponseGuilds> guilds;
  final int total;
  final List<DiscoveryCategoryResponse> categories;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final Set<String> joiningGuildIds;

  DiscoveryState copyWith({
    String? query,
    Object? categoryId = _unset,
    Object? language = _unset,
    List<DiscoveryGuildListResponseGuilds>? guilds,
    int? total,
    List<DiscoveryCategoryResponse>? categories,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    Set<String>? joiningGuildIds,
  }) {
    return DiscoveryState(
      query: query ?? this.query,
      categoryId: categoryId == _unset ? this.categoryId : categoryId as int?,
      language: language == _unset ? this.language : language as String?,
      guilds: guilds ?? this.guilds,
      total: total ?? this.total,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      joiningGuildIds: joiningGuildIds ?? this.joiningGuildIds,
    );
  }
}

const Object _unset = Object();

@Riverpod(keepAlive: true)
class DiscoveryController extends _$DiscoveryController {
  Timer? _debounceTimer;
  int _searchToken = 0;

  @override
  DiscoveryState build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });
    unawaited(_initialize());
    return const DiscoveryState(isLoading: true);
  }

  Future<void> _initialize() async {
    await _loadCategories();
    if (!ref.mounted) {
      return;
    }
    await search(reset: true);
  }

  Future<void> _loadCategories() async {
    final DiscoveryRepository repository = ref.read(
      discoveryRepositoryProvider,
    );
    try {
      final List<DiscoveryCategoryResponse> categories = await repository
          .listCategories();
      if (!ref.mounted) {
        return;
      }
      state = state.copyWith(categories: categories);
    } on Object {
      if (!ref.mounted) {
        return;
      }
      state = state.copyWith(categories: const <DiscoveryCategoryResponse>[]);
    }
  }

  void setQuery(String query) {
    state = state.copyWith(query: query);
    _debounceTimer?.cancel();
    _debounceTimer = Timer(discoverySearchDebounce, () {
      unawaited(search(reset: true));
    });
  }

  void setCategory(int? categoryId) {
    if (state.categoryId == categoryId) {
      return;
    }
    state = state.copyWith(categoryId: categoryId);
    unawaited(search(reset: true));
  }

  void setLanguage(String? language) {
    if (state.language == language) {
      return;
    }
    state = state.copyWith(language: language);
    unawaited(search(reset: true));
  }

  Future<void> search({required bool reset}) async {
    final int token = ++_searchToken;
    final int offset = reset ? 0 : state.guilds.length;
    if (reset) {
      state = state.copyWith(
        isLoading: true,
        isLoadingMore: false,
        guilds: const <DiscoveryGuildListResponseGuilds>[],
        hasMore: true,
      );
    } else {
      if (state.isLoadingMore || !state.hasMore) {
        return;
      }
      state = state.copyWith(isLoadingMore: true);
    }
    final DiscoveryRepository repository = ref.read(
      discoveryRepositoryProvider,
    );
    try {
      final DiscoverySearchResult result = await repository.searchGuilds(
        query: state.query,
        category: state.categoryId,
        language: state.language,
        offset: offset,
      );
      if (token != _searchToken) {
        return;
      }
      if (!ref.mounted) {
        return;
      }
      final List<DiscoveryGuildListResponseGuilds> mergedGuilds = reset
          ? result.guilds
          : <DiscoveryGuildListResponseGuilds>[
              ...state.guilds,
              ...result.guilds,
            ];
      state = state.copyWith(
        guilds: mergedGuilds,
        total: result.total,
        isLoading: false,
        isLoadingMore: false,
        hasMore: result.guilds.length >= discoveryPageSize,
      );
    } on Object {
      if (token != _searchToken) {
        return;
      }
      if (!ref.mounted) {
        return;
      }
      state = state.copyWith(isLoading: false, isLoadingMore: false);
    }
  }

  Future<void> loadMore() async {
    await search(reset: false);
  }

  Future<void> joinGuild(String guildId) async {
    if (state.joiningGuildIds.contains(guildId)) {
      return;
    }
    state = state.copyWith(
      joiningGuildIds: <String>{...state.joiningGuildIds, guildId},
    );
    final DiscoveryRepository repository = ref.read(
      discoveryRepositoryProvider,
    );
    try {
      await repository.joinGuild(guildId);
      await ref.read(guildRepositoryProvider).syncServers();
      state = state.copyWith(
        joiningGuildIds: state.joiningGuildIds
            .where((String id) => id != guildId)
            .toSet(),
      );
    } on DioException {
      state = state.copyWith(
        joiningGuildIds: state.joiningGuildIds
            .where((String id) => id != guildId)
            .toSet(),
      );
      rethrow;
    }
  }
}
