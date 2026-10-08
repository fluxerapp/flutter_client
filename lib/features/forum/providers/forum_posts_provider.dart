import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart'
    show NotifierProviderFamily, StreamProviderFamily;
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/gateway/channel_last_message_index.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/providers/forum_first_messages_provider.dart';
import 'package:fluxer_app/features/notifications/data/merge_void_streams.dart';

enum ForumListKind { archived, search }

class ForumListState {
  const ForumListState({
    this.ids = const <String>[],
    this.hasMore = true,
    this.loading = false,
    this.loaded = false,
    this.indexing = false,
    this.failed = false,
  });

  final List<String> ids;
  final bool hasMore;
  final bool loading;
  final bool loaded;
  final bool indexing;
  final bool failed;

  ForumListState copyWith({
    List<String>? ids,
    bool? hasMore,
    bool? loading,
    bool? loaded,
    bool? indexing,
    bool? failed,
  }) => ForumListState(
    ids: ids ?? this.ids,
    hasMore: hasMore ?? this.hasMore,
    loading: loading ?? this.loading,
    loaded: loaded ?? this.loaded,
    indexing: indexing ?? this.indexing,
    failed: failed ?? this.failed,
  );
}

class ForumViewState {
  const ForumViewState({
    this.query = '',
    this.tagFilter = const <String>[],
    this.sortOverride,
    this.layoutOverride,
    this.archived = const ForumListState(),
    this.search = const ForumListState(),
    this.searchUnavailable = false,
  });

  final String query;
  final List<String> tagFilter;
  final ForumSortOrder? sortOverride;
  final ForumLayout? layoutOverride;
  final ForumListState archived;
  final ForumListState search;
  final bool searchUnavailable;

  bool get isSearching => query.trim().isNotEmpty;

  ForumListState list(ForumListKind kind) =>
      kind == ForumListKind.search ? search : archived;

  ForumSortOrder sortOrder(Channel forum) =>
      sortOverride ?? forumDefaultSortOrder(forum);

  ForumLayout layout(Channel forum) =>
      layoutOverride ?? forumDefaultLayout(forum);

  ForumViewState copyWith({
    String? query,
    List<String>? tagFilter,
    ForumSortOrder? sortOverride,
    ForumLayout? layoutOverride,
    ForumListState? archived,
    ForumListState? search,
    bool? searchUnavailable,
  }) => ForumViewState(
    query: query ?? this.query,
    tagFilter: tagFilter ?? this.tagFilter,
    sortOverride: sortOverride ?? this.sortOverride,
    layoutOverride: layoutOverride ?? this.layoutOverride,
    archived: archived ?? this.archived,
    search: search ?? this.search,
    searchUnavailable: searchUnavailable ?? this.searchUnavailable,
  );

  ForumViewState withList(ForumListKind kind, ForumListState value) =>
      kind == ForumListKind.search
      ? copyWith(search: value)
      : copyWith(archived: value);
}

class ForumPostsController extends Notifier<ForumViewState> {
  ForumPostsController(this.forumId);

  final String forumId;
  final Map<ForumListKind, int> _generations = <ForumListKind, int>{};
  final Map<ForumListKind, int> _attempts = <ForumListKind, int>{};
  final Map<ForumListKind, Timer> _retryTimers = <ForumListKind, Timer>{};
  Timer? _searchTimer;

  @override
  ForumViewState build() {
    ref.onDispose(() {
      _searchTimer?.cancel();
      for (final Timer timer in _retryTimers.values) {
        timer.cancel();
      }
    });
    return const ForumViewState();
  }

  Future<Channel?> _forum() async {
    final db.Channel? row = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(forumId);
    if (row == null || !isThreadOnlyChannelType(row.type)) {
      return null;
    }
    return Channel.fromRow(row);
  }

  void ensureLoaded() {
    if (!state.archived.loaded && !state.archived.loading) {
      unawaited(_fetch(ForumListKind.archived, append: false));
    }
  }

  void loadMore(ForumListKind kind) {
    final ForumListState list = state.list(kind);
    if (list.loading || !list.hasMore || list.indexing) {
      return;
    }
    unawaited(_fetch(kind, append: list.loaded));
  }

  void retry(ForumListKind kind) {
    _attempts.remove(kind);
    final ForumListState list = state.list(kind);
    unawaited(_fetch(kind, append: list.loaded && list.ids.isNotEmpty));
  }

  void setQuery(String query) {
    _searchTimer?.cancel();
    state = state.copyWith(query: query);
    if (query.trim().isEmpty) {
      _reset(ForumListKind.search);
      return;
    }
    state = state.withList(
      ForumListKind.search,
      state.list(ForumListKind.search).copyWith(loaded: false),
    );
    _searchTimer = Timer(forumSearchDebounce, () {
      unawaited(_fetch(ForumListKind.search, append: false));
    });
  }

  void toggleTag(String tagId) {
    final List<String> current = state.tagFilter;
    setTagFilter(
      current.contains(tagId)
          ? <String>[
              for (final String id in current)
                if (id != tagId) id,
            ]
          : <String>[...current, tagId],
    );
  }

  void setTagFilter(List<String> tagIds) {
    state = state.copyWith(tagFilter: List<String>.unmodifiable(tagIds));
    _reset(ForumListKind.archived);
    unawaited(_fetch(ForumListKind.archived, append: false));
    if (state.isSearching) {
      _searchTimer?.cancel();
      unawaited(_fetch(ForumListKind.search, append: false));
    }
  }

  void setSortOrder(ForumSortOrder sortOrder) {
    if (state.sortOverride == sortOrder) {
      return;
    }
    state = state.copyWith(sortOverride: sortOrder);
    _reset(ForumListKind.archived);
    unawaited(_fetch(ForumListKind.archived, append: false));
  }

  void setLayout(ForumLayout layout) {
    state = state.copyWith(layoutOverride: layout);
  }

  void _reset(ForumListKind kind) {
    _generations[kind] = (_generations[kind] ?? 0) + 1;
    _retryTimers.remove(kind)?.cancel();
    _attempts.remove(kind);
    state = state.withList(kind, const ForumListState());
  }

  Future<void> _fetch(ForumListKind kind, {required bool append}) async {
    final Channel? forum = await _forum();
    if (!ref.mounted || forum == null) {
      return;
    }
    final String query = state.query.trim();
    if (kind == ForumListKind.search && query.isEmpty) {
      return;
    }
    final int generation = (_generations[kind] ?? 0) + 1;
    _generations[kind] = generation;
    _retryTimers.remove(kind)?.cancel();
    final ForumListState base = append
        ? state.list(kind)
        : const ForumListState();
    state = state.withList(kind, base.copyWith(loading: true, failed: false));
    final ForumRepository repository = ref.read(forumRepositoryProvider);
    try {
      final ForumSearchOutcome outcome =
          kind == ForumListKind.archived && state.searchUnavailable
          ? await _archivedFallback(repository, forum, base)
          : await repository.searchPosts(
              guildId: forum.guildId,
              forumId: forumId,
              query: ForumSearchQuery(
                name: kind == ForumListKind.search ? query : null,
                tagIds: state.tagFilter,
                tagMatch: forumTagMatch(forum),
                archived: kind == ForumListKind.archived ? true : null,
                sortOrder: state.sortOrder(forum),
                offset: append ? base.ids.length : 0,
              ),
            );
      if (!ref.mounted || _generations[kind] != generation) {
        return;
      }
      switch (outcome) {
        case ForumSearchPage():
          _attempts.remove(kind);
          ref
              .read(forumFirstMessagesProvider.notifier)
              .putAll(outcome.firstMessages);
          state = state.withList(
            kind,
            ForumListState(
              ids: <String>[
                ...base.ids,
                for (final String id in outcome.postIds)
                  if (!base.ids.contains(id)) id,
              ],
              hasMore: outcome.hasMore,
              loaded: true,
            ),
          );
        case ForumSearchNotReady():
          _scheduleRetry(kind, base, append, outcome.retryAfterSeconds);
        case ForumSearchUnavailable():
          _searchTimer?.cancel();
          state = state.copyWith(
            searchUnavailable: true,
            query: '',
            search: const ForumListState(),
          );
          if (kind == ForumListKind.archived) {
            await _fetch(kind, append: append);
          }
      }
    } on Object catch (error, stackTrace) {
      if (!ref.mounted || _generations[kind] != generation) {
        return;
      }
      talker.warning(
        '[Forum] Failed to load ${kind.name} posts for $forumId',
        error,
        stackTrace,
      );
      state = state.withList(
        kind,
        base.copyWith(loading: false, indexing: false, failed: true),
      );
    }
  }

  Future<ForumSearchOutcome> _archivedFallback(
    ForumRepository repository,
    Channel forum,
    ForumListState base,
  ) async {
    String? before;
    if (base.ids.isNotEmpty) {
      before =
          (await ref
                  .read(fluxerDatabaseProvider)
                  .channelDao
                  .getChannelById(base.ids.last))
              ?.threadArchiveTimestamp;
    }
    return repository.listArchivedPosts(
      guildId: forum.guildId,
      forumId: forumId,
      before: before,
    );
  }

  void _scheduleRetry(
    ForumListKind kind,
    ForumListState base,
    bool append,
    num? retryAfterSeconds,
  ) {
    final int attempt = _attempts[kind] ?? 0;
    if (attempt >= forumSearchRetryMaxAttempts) {
      _attempts.remove(kind);
      state = state.withList(
        kind,
        base.copyWith(loading: false, indexing: false, failed: true),
      );
      return;
    }
    _attempts[kind] = attempt + 1;
    state = state.withList(
      kind,
      base.copyWith(loading: false, indexing: true, failed: false),
    );
    final int? generation = _generations[kind];
    _retryTimers[kind] = Timer(
      forumSearchRetryDelay(retryAfterSeconds, attempt),
      () {
        _retryTimers.remove(kind);
        if (ref.mounted && _generations[kind] == generation) {
          unawaited(_fetch(kind, append: append));
        }
      },
    );
  }
}

final NotifierProviderFamily<ForumPostsController, ForumViewState, String>
forumPostsProvider =
    NotifierProvider.family<ForumPostsController, ForumViewState, String>(
      ForumPostsController.new,
    );

class ForumStoredPosts {
  const ForumStoredPosts({
    this.posts = const <Channel>[],
    this.lastMessageIds = const <String, String?>{},
  });

  final List<Channel> posts;
  final Map<String, String?> lastMessageIds;
}

final StreamProviderFamily<ForumStoredPosts, String> forumStoredPostsProvider =
    StreamProvider.autoDispose.family<ForumStoredPosts, String>((
      Ref ref,
      String forumId,
    ) {
      final db.FluxerDatabase database = ref.watch(fluxerDatabaseProvider);
      final ChannelLastMessageIndex lastMessageIndex = ref.watch(
        channelLastMessageIndexProvider,
      );
      Set<String> postIds = const <String>{};
      return mergeVoidStreams(<Stream<dynamic>>[
        database.threadDao.watchThreadsForParent(forumId),
        lastMessageIndex.flushStream.where(
          (Map<String, String> updates) => updates.keys.any(postIds.contains),
        ),
      ]).asyncMap((_) async {
        final List<db.Channel> rows = await database.threadDao
            .getThreadsForParent(forumId);
        postIds = <String>{for (final db.Channel row in rows) row.id};
        return ForumStoredPosts(
          posts: <Channel>[
            for (final db.Channel row in rows) Channel.fromRow(row),
          ],
          lastMessageIds: <String, String?>{
            for (final db.Channel row in rows) row.id: row.lastMessageId,
          },
        );
      });
    });
