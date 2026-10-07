import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show NotifierProviderFamily;
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';

typedef ThreadSearchParent = ({String guildId, String parentId});

enum ThreadSearchStatus { idle, loading, indexing, failed, done }

class ThreadSearchState {
  const ThreadSearchState({
    this.query = '',
    this.archived = false,
    this.status = ThreadSearchStatus.idle,
    this.threadIds = const <String>[],
  });

  final String query;
  final bool archived;
  final ThreadSearchStatus status;
  final List<String> threadIds;

  bool get isSearching => query.trim().isNotEmpty;

  ThreadSearchState copyWith({
    String? query,
    bool? archived,
    ThreadSearchStatus? status,
    List<String>? threadIds,
  }) => ThreadSearchState(
    query: query ?? this.query,
    archived: archived ?? this.archived,
    status: status ?? this.status,
    threadIds: threadIds ?? this.threadIds,
  );
}

class ThreadSearchController extends Notifier<ThreadSearchState> {
  ThreadSearchController(this.parent);

  final ThreadSearchParent parent;
  Timer? _timer;
  int _generation = 0;

  @override
  ThreadSearchState build() {
    ref.onDispose(() => _timer?.cancel());
    return const ThreadSearchState();
  }

  void setQuery(String query) {
    if (query == state.query) {
      return;
    }
    state = state.copyWith(query: query);
    _schedule(forumSearchDebounce);
  }

  void setArchived({required bool archived}) {
    if (archived == state.archived) {
      return;
    }
    state = state.copyWith(archived: archived);
    _schedule(Duration.zero);
  }

  void retry() => _schedule(Duration.zero);

  void _schedule(Duration delay) {
    _timer?.cancel();
    final int generation = ++_generation;
    if (!state.isSearching) {
      state = state.copyWith(
        status: ThreadSearchStatus.idle,
        threadIds: const <String>[],
      );
      return;
    }
    state = state.copyWith(status: ThreadSearchStatus.loading);
    _timer = Timer(delay, () => unawaited(_run(generation, 0)));
  }

  Future<void> _run(int generation, int attempt) async {
    final ForumSearchOutcome outcome;
    try {
      outcome = await ref
          .read(forumRepositoryProvider)
          .searchPosts(
            guildId: parent.guildId,
            forumId: parent.parentId,
            query: ForumSearchQuery(
              name: state.query.trim(),
              archived: state.archived,
            ),
          );
    } on Object catch (error, stackTrace) {
      if (ref.mounted && generation == _generation) {
        talker.warning(
          '[Threads] Search failed in ${parent.parentId}',
          error,
          stackTrace,
        );
        state = state.copyWith(status: ThreadSearchStatus.failed);
      }
      return;
    }
    if (!ref.mounted || generation != _generation) {
      return;
    }
    switch (outcome) {
      case ForumSearchPage():
        state = state.copyWith(
          status: ThreadSearchStatus.done,
          threadIds: outcome.postIds,
        );
      case ForumSearchNotReady() when attempt < forumSearchRetryMaxAttempts:
        state = state.copyWith(status: ThreadSearchStatus.indexing);
        _timer = Timer(
          forumSearchRetryDelay(outcome.retryAfterSeconds, attempt),
          () => unawaited(_run(generation, attempt + 1)),
        );
      case ForumSearchNotReady():
      case ForumSearchUnavailable():
        state = state.copyWith(status: ThreadSearchStatus.failed);
    }
  }
}

final NotifierProviderFamily<
  ThreadSearchController,
  ThreadSearchState,
  ThreadSearchParent
>
threadSearchProvider = NotifierProvider.autoDispose
    .family<ThreadSearchController, ThreadSearchState, ThreadSearchParent>(
      ThreadSearchController.new,
    );
