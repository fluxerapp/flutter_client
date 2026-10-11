import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/providers/forum_posts_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';

import '../../helpers/open_test_database.dart';

class _FakeRepository implements ForumRepository {
  final List<ForumSearchQuery> queries = <ForumSearchQuery>[];
  final List<ForumSearchOutcome> outcomes = <ForumSearchOutcome>[];
  Exception? error;

  @override
  Future<ForumSearchOutcome> searchPosts({
    required String guildId,
    required String forumId,
    required ForumSearchQuery query,
  }) async {
    queries.add(query);
    if (error case final Exception error) {
      throw error;
    }
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

  void storeForum(FakeAsync async, {String id = 'f1'}) {
    unawaited(
      database.channelDao.upsertChannel(
        db.ChannelsCompanion.insert(
          id: id,
          guildId: 'g1',
          name: 'forum',
          type: const Value(15),
        ),
      ),
    );
    async.flushMicrotasks();
  }

  test('a forum without read message history loads once access arrives', () {
    fakeAsync((FakeAsync async) {
      repository = _FakeRepository()
        ..outcomes.add(
          const ForumSearchPage(
            postIds: <String>['p1'],
            hasMore: false,
            firstMessages: <String, Message>{},
          ),
        );
      storeForum(async);
      container = ProviderContainer(
        overrides: <Override>[
          fluxerDatabaseProvider.overrideWithValue(database),
          forumRepositoryProvider.overrideWithValue(repository),
          parentThreadActorProvider(
            'g1',
            'f1',
          ).overrideWith((Ref ref) => ref.watch(_accessProvider)),
        ],
      );
      final ProviderSubscription<ForumViewState> sub = container.listen(
        forumPostsProvider('f1'),
        (_, _) {},
      );
      addTearDown(sub.close);
      final ForumPostsController controller = container.read(
        forumPostsProvider('f1').notifier,
      )..ensureLoaded();
      async.flushMicrotasks();
      controller.loadMore(ForumListKind.archived);
      async.flushMicrotasks();

      expect(repository.queries, isEmpty);
      expect(sub.read().archived.loaded, isFalse);
      expect(sub.read().archived.failed, isFalse);

      container.read(_accessProvider.notifier).grant();
      async.elapse(Duration.zero);

      expect(repository.queries, hasLength(1));
      expect(sub.read().archived.loaded, isTrue);
      expect(sub.read().archived.ids, <String>['p1']);
      container.dispose();
    });
  });

  test('a fresh READY drops the archived page and fetches it again', () {
    fakeAsync((FakeAsync async) {
      repository = _FakeRepository()
        ..outcomes.addAll(<ForumSearchOutcome>[
          const ForumSearchPage(
            postIds: <String>['p1'],
            hasMore: false,
            firstMessages: <String, Message>{},
          ),
          const ForumSearchPage(
            postIds: <String>['p2'],
            hasMore: false,
            firstMessages: <String, Message>{},
          ),
        ]);
      storeForum(async);
      container = createContainer();
      final ProviderSubscription<ForumViewState> sub = container.listen(
        forumPostsProvider('f1'),
        (_, _) {},
      );
      addTearDown(sub.close);
      container.read(forumPostsProvider('f1').notifier)
        ..ensureLoaded()
        ..setLayout(ForumLayout.gallery);
      async.flushMicrotasks();
      expect(container.read(forumPostsProvider('f1')).archived.ids, <String>[
        'p1',
      ]);

      container.read(gatewayFullRecoveryProvider.notifier).bump();
      async.flushMicrotasks();

      final ForumViewState state = container.read(forumPostsProvider('f1'));
      expect(repository.queries, hasLength(2));
      expect(state.archived.ids, <String>['p2']);
      expect(state.layoutOverride, ForumLayout.gallery);
      container.dispose();
    });
  });

  test('a fresh READY leaves forums off screen for their next open', () {
    fakeAsync((FakeAsync async) {
      repository = _FakeRepository();
      storeForum(async);
      storeForum(async, id: 'f2');
      container = createContainer();
      final ProviderSubscription<ForumViewState> open = container.listen(
        forumPostsProvider('f1'),
        (_, _) {},
      );
      addTearDown(open.close);
      final ProviderSubscription<ForumViewState> visited = container.listen(
        forumPostsProvider('f2'),
        (_, _) {},
      );
      final ForumPostsController offScreen = container.read(
        forumPostsProvider('f2').notifier,
      )..ensureLoaded();
      container.read(forumPostsProvider('f1').notifier).ensureLoaded();
      offScreen.setQuery('bug');
      async
        ..elapse(forumSearchDebounce)
        ..flushMicrotasks();
      visited.close();
      expect(repository.queries, hasLength(3));

      container.read(gatewayFullRecoveryProvider.notifier).bump();
      async.flushMicrotasks();
      expect(repository.queries, hasLength(4));
      expect(container.read(forumPostsProvider('f2')).archived.loaded, isFalse);
      expect(container.read(forumPostsProvider('f2')).search.loaded, isFalse);

      offScreen.ensureLoaded();
      async.flushMicrotasks();
      expect(repository.queries, hasLength(6));
      expect(repository.queries.last.name, 'bug');
      expect(container.read(forumPostsProvider('f2')).search.loaded, isTrue);
      container.dispose();
    });
  });

  test('a failed list is only requested again by retry', () {
    fakeAsync((FakeAsync async) {
      repository = _FakeRepository()..error = Exception('forbidden');
      storeForum(async);
      container = createContainer();
      final ForumPostsController controller = container.read(
        forumPostsProvider('f1').notifier,
      )..ensureLoaded();
      async.flushMicrotasks();
      expect(container.read(forumPostsProvider('f1')).archived.failed, isTrue);

      controller
        ..loadMore(ForumListKind.archived)
        ..loadMore(ForumListKind.archived);
      async.flushMicrotasks();
      expect(repository.queries, hasLength(1));

      controller.retry(ForumListKind.archived);
      async.flushMicrotasks();
      expect(repository.queries, hasLength(2));
      container.dispose();
    });
  });

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

class _Access extends Notifier<ThreadActor?> {
  @override
  ThreadActor? build() =>
      ThreadActor(permissions: Permission.viewChannel.value);

  void grant() => state = ThreadActor(
    permissions:
        Permission.viewChannel.value | Permission.readMessageHistory.value,
  );
}

final NotifierProvider<_Access, ThreadActor?> _accessProvider =
    NotifierProvider<_Access, ThreadActor?>(_Access.new);
