import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/providers/forum_posts_provider.dart';

import '../../helpers/open_test_database.dart';

class _FakeRepository implements ForumRepository {
  final List<ForumSearchQuery> queries = <ForumSearchQuery>[];
  final List<ForumSearchOutcome> outcomes = <ForumSearchOutcome>[];

  @override
  Future<ForumSearchOutcome> searchPosts({
    required String guildId,
    required String forumId,
    required ForumSearchQuery query,
  }) async {
    queries.add(query);
    return outcomes.isEmpty
        ? const ForumSearchPage(
            postIds: <String>[],
            hasMore: false,
            firstMessages: <String, Message>{},
          )
        : outcomes.removeAt(0);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late db.FluxerDatabase database;
  late _FakeRepository repository;
  late ProviderContainer container;

  setUp(() {
    database = openTestDatabase();
  });

  ProviderContainer createContainer() => ProviderContainer(
    overrides: <Override>[
      fluxerDatabaseProvider.overrideWithValue(database),
      forumRepositoryProvider.overrideWithValue(repository),
    ],
  );

  test('a 202 reply retries with backoff and then lands the page', () {
    fakeAsync((FakeAsync async) {
      repository = _FakeRepository()
        ..outcomes.addAll(<ForumSearchOutcome>[
          const ForumSearchNotReady(retryAfterSeconds: 2),
          const ForumSearchNotReady(retryAfterSeconds: 2),
          const ForumSearchPage(
            postIds: <String>['p1'],
            hasMore: false,
            firstMessages: <String, Message>{},
          ),
        ]);
      unawaited(
        database.channelDao.upsertChannel(
          db.ChannelsCompanion.insert(
            id: 'f1',
            guildId: 'g1',
            name: 'forum',
            type: const Value(15),
          ),
        ),
      );
      async.flushMicrotasks();
      container = createContainer();
      final ForumPostsController controller = container.read(
        forumPostsProvider('f1').notifier,
      );
      final ProviderSubscription<ForumViewState> sub = container.listen(
        forumPostsProvider('f1'),
        (_, _) {},
      );
      addTearDown(sub.close);

      controller.ensureLoaded();
      async.flushMicrotasks();
      expect(repository.queries, hasLength(1));
      expect(repository.queries.single.archived, isTrue);
      expect(sub.read().archived.indexing, isTrue);

      async
        ..elapse(const Duration(milliseconds: 1999))
        ..flushMicrotasks();
      expect(repository.queries, hasLength(1));
      async
        ..elapse(const Duration(milliseconds: 1))
        ..flushMicrotasks();
      expect(repository.queries, hasLength(2));
      expect(sub.read().archived.indexing, isTrue);

      async
        ..elapse(const Duration(seconds: 4))
        ..flushMicrotasks();
      expect(repository.queries, hasLength(3));
      final ForumListState list = sub.read().archived;
      expect(list.indexing, isFalse);
      expect(list.loaded, isTrue);
      expect(list.ids, <String>['p1']);

      container.dispose();
    });
  });

  test('changing the sort order drops a pending retry', () {
    fakeAsync((FakeAsync async) {
      repository = _FakeRepository()
        ..outcomes.add(const ForumSearchNotReady(retryAfterSeconds: 1));
      unawaited(
        database.channelDao.upsertChannel(
          db.ChannelsCompanion.insert(
            id: 'f1',
            guildId: 'g1',
            name: 'forum',
            type: const Value(15),
          ),
        ),
      );
      async.flushMicrotasks();
      container = createContainer();
      final ForumPostsController controller = container.read(
        forumPostsProvider('f1').notifier,
      )..ensureLoaded();
      async.flushMicrotasks();
      expect(repository.queries, hasLength(1));

      controller.setSortOrder(ForumSortOrder.creationTime);
      async.flushMicrotasks();
      expect(repository.queries, hasLength(2));
      expect(repository.queries.last.sortOrder, ForumSortOrder.creationTime);

      async
        ..elapse(const Duration(seconds: 5))
        ..flushMicrotasks();
      expect(repository.queries, hasLength(2));
      container.dispose();
    });
  });

  test('searching after the index was disabled stops sending queries', () {
    fakeAsync((FakeAsync async) {
      repository = _FakeRepository()
        ..outcomes.add(const ForumSearchUnavailable());
      unawaited(
        database.channelDao.upsertChannel(
          db.ChannelsCompanion.insert(
            id: 'f1',
            guildId: 'g1',
            name: 'forum',
            type: const Value(15),
          ),
        ),
      );
      async.flushMicrotasks();
      container = createContainer();
      container.read(forumPostsProvider('f1').notifier).setQuery('bug');
      async
        ..elapse(forumSearchDebounce)
        ..flushMicrotasks();
      expect(repository.queries.single.name, 'bug');
      final ForumViewState state = container.read(forumPostsProvider('f1'));
      expect(state.searchUnavailable, isTrue);
      expect(state.query, isEmpty);
      container.dispose();
    });
  });
}
