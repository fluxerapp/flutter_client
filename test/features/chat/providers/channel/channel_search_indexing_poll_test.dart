import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';

import '../../../../helpers/open_test_database.dart';

const String _channelId = 'chan_1';

class _QueuedSearchRepository implements MessageSearchRepository {
  _QueuedSearchRepository(this.pages);

  final List<MessageSearchPage> pages;
  final List<MessageSearchQuery> queries = <MessageSearchQuery>[];

  @override
  Future<MessageSearchPage> searchMessages(MessageSearchQuery query) async {
    queries.add(query);
    return pages.length > 1 ? pages.removeAt(0) : pages.single;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

MessageSearchPage _resultsPage() => MessageSearchPage(
  results: <MessageSearchResultEntry>[
    MessageSearchResultEntry(
      message: Message(
        id: '1000000000000000001',
        channelId: _channelId,
        authorId: '1000000000000000009',
        authorName: 'Author',
        content: 'hello',
        timestamp: DateTime.utc(2024),
      ),
    ),
  ],
  total: 1,
  page: 1,
  hitsPerPage: kMessageSearchPageSize,
  indexing: false,
);

void main() {
  test('poll interval backs off from 1.5s by 1.25x up to 5s', () {
    expect(
      channelSearchIndexingPollInterval(0),
      const Duration(milliseconds: 1500),
    );
    expect(
      channelSearchIndexingPollInterval(1),
      const Duration(milliseconds: 1875),
    );
    expect(channelSearchIndexingPollInterval(20), const Duration(seconds: 5));
  });

  test(
    'an indexing reply re-runs the same search until results arrive',
    () async {
      final FluxerDatabase database = openTestDatabase();
      addTearDown(database.close);
      final _QueuedSearchRepository repository = _QueuedSearchRepository(
        <MessageSearchPage>[const MessageSearchPage.indexing(), _resultsPage()],
      );
      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(database),
          messageSearchRepositoryProvider.overrideWithValue(repository),
          shouldShowMatureContentGateProvider(
            _channelId,
          ).overrideWith((Ref ref) => Future<bool>.value(false)),
        ],
      );
      addTearDown(container.dispose);
      final provider = channelSearchProvider(_channelId, null);
      final ProviderSubscription<ChannelSearchState> subscription = container
          .listen(provider, (_, _) {});
      addTearDown(subscription.close);

      await container.read(provider.notifier).search(rawQuery: 'hello');
      expect(container.read(provider).indexing, isTrue);

      final DateTime deadline = DateTime.now().add(const Duration(seconds: 4));
      while (container.read(provider).results.isEmpty &&
          DateTime.now().isBefore(deadline)) {
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }

      final ChannelSearchState state = container.read(provider);
      expect(state.indexing, isFalse);
      expect(state.results, hasLength(1));
      expect(repository.queries, hasLength(2));
      expect(repository.queries.last.rawQuery, 'hello');
    },
  );
}
