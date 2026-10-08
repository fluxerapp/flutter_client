import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/threads/providers/thread_search_provider.dart';

class _FakeRepository implements ForumRepository {
  final List<ForumSearchQuery> queries = <ForumSearchQuery>[];
  final List<ForumSearchOutcome> outcomes = <ForumSearchOutcome>[];
  int failures = 0;

  @override
  Future<ForumSearchOutcome> searchPosts({
    required String guildId,
    required String forumId,
    required ForumSearchQuery query,
  }) async {
    queries.add(query);
    if (failures > 0) {
      failures--;
      throw Exception('offline');
    }
    return outcomes.isEmpty ? _page() : outcomes.removeAt(0);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

ForumSearchPage _page([List<String> ids = const <String>[]]) => ForumSearchPage(
  postIds: ids,
  hasMore: false,
  firstMessages: const <String, Message>{},
);

const ThreadSearchParent _parent = (guildId: 'g1', parentId: '100');

void main() {
  late _FakeRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = _FakeRepository();
    container = ProviderContainer(
      overrides: <Override>[
        forumRepositoryProvider.overrideWithValue(repository),
      ],
    )..listen(threadSearchProvider(_parent), (_, _) {});
  });

  tearDown(() => container.dispose());

  ThreadSearchController controller() =>
      container.read(threadSearchProvider(_parent).notifier);

  ThreadSearchState state() => container.read(threadSearchProvider(_parent));

  test('typing is debounced into one name search of the active tab', () {
    fakeAsync((FakeAsync async) {
      repository.outcomes.add(_page(<String>['101']));
      controller()
        ..setQuery('b')
        ..setQuery('bu')
        ..setQuery('bug');
      expect(state().status, ThreadSearchStatus.loading);
      async
        ..elapse(forumSearchDebounce - const Duration(milliseconds: 1))
        ..flushMicrotasks();
      expect(repository.queries, isEmpty);
      async
        ..elapse(const Duration(milliseconds: 1))
        ..flushMicrotasks();
      expect(repository.queries, hasLength(1));
      expect(repository.queries.single.name, 'bug');
      expect(repository.queries.single.archived, isFalse);
      expect(state().status, ThreadSearchStatus.done);
      expect(state().threadIds, <String>['101']);
    });
  });

  test('switching to closed threads searches archived ones at once', () {
    fakeAsync((FakeAsync async) {
      controller().setQuery('bug');
      async
        ..elapse(forumSearchDebounce)
        ..flushMicrotasks();
      controller().setArchived(archived: true);
      async
        ..elapse(Duration.zero)
        ..flushMicrotasks();
      expect(repository.queries, hasLength(2));
      expect(repository.queries.last.archived, isTrue);
      expect(state().status, ThreadSearchStatus.done);
      expect(state().threadIds, isEmpty);
    });
  });

  test('clearing the query drops a pending search and goes idle', () {
    fakeAsync((FakeAsync async) {
      controller()
        ..setQuery('bug')
        ..setQuery('  ');
      async
        ..elapse(forumSearchDebounce * 2)
        ..flushMicrotasks();
      expect(repository.queries, isEmpty);
      expect(state().status, ThreadSearchStatus.idle);
      expect(state().isSearching, isFalse);
    });
  });

  test('an index that is not ready retries and then lands the results', () {
    fakeAsync((FakeAsync async) {
      repository.outcomes.addAll(<ForumSearchOutcome>[
        const ForumSearchNotReady(retryAfterSeconds: 2),
        _page(<String>['101']),
      ]);
      controller().setQuery('bug');
      async
        ..elapse(forumSearchDebounce)
        ..flushMicrotasks();
      expect(state().status, ThreadSearchStatus.indexing);
      async
        ..elapse(const Duration(seconds: 2))
        ..flushMicrotasks();
      expect(repository.queries, hasLength(2));
      expect(state().status, ThreadSearchStatus.done);
      expect(state().threadIds, <String>['101']);
    });
  });

  test('a failed search can be retried', () {
    fakeAsync((FakeAsync async) {
      repository
        ..failures = 1
        ..outcomes.add(_page(<String>['101']));
      controller().setQuery('bug');
      async
        ..elapse(forumSearchDebounce)
        ..flushMicrotasks();
      expect(state().status, ThreadSearchStatus.failed);
      controller().retry();
      async
        ..elapse(Duration.zero)
        ..flushMicrotasks();
      expect(state().status, ThreadSearchStatus.done);
      expect(state().threadIds, <String>['101']);
    });
  });
}
