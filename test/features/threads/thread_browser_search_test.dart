import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/threads/presentation/thread_browser_sheet.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../helpers/pump_fluxer_app.dart';

const Channel _parent = Channel(id: '100', guildId: 'g1', name: 'general');

Channel _thread(String id, String name, {bool archived = false}) => Channel(
  id: id,
  guildId: 'g1',
  name: name,
  type: ChannelType.publicThread,
  parentId: '100',
  threadArchived: archived,
  messageCount: 3,
);

final List<Channel> _threads = <Channel>[
  _thread('101', 'Bug triage'),
  _thread('102', 'Release notes'),
  _thread('103', 'Old bug bash', archived: true),
];

class _FakeRepository implements ForumRepository {
  final List<ForumSearchQuery> queries = <ForumSearchQuery>[];
  bool fail = false;

  @override
  Future<ForumSearchOutcome> searchPosts({
    required String guildId,
    required String forumId,
    required ForumSearchQuery query,
  }) async {
    queries.add(query);
    if (fail) {
      throw Exception('offline');
    }
    final String name = query.name!.toLowerCase();
    return ForumSearchPage(
      postIds: <String>[
        for (final Channel thread in _threads)
          if ((thread.threadArchived ?? false) == query.archived &&
              thread.name.toLowerCase().contains(name))
            thread.id,
      ],
      hasMore: false,
      firstMessages: const <String, Message>{},
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late _FakeRepository repository;

  Future<void> openBrowser(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      pumpFluxerApp(
        overrides: <Override>[
          forumRepositoryProvider.overrideWithValue(repository),
          threadChannelsActiveProvider('g1').overrideWithValue(true),
          parentThreadActorProvider('g1', '100').overrideWithValue(
            ThreadActor(
              permissions:
                  Permission.viewChannel.value |
                  Permission.readMessageHistory.value,
            ),
          ),
          parentThreadsProvider(
            'g1',
            '100',
          ).overrideWithValue(AsyncData<List<Channel>>(_threads)),
          joinedThreadIdsProvider.overrideWithValue(
            const AsyncData<Set<String>>(<String>{}),
          ),
          currentUserIdProvider.overrideWithValue('u1'),
          fluxerDatabaseProvider.overrideWith(
            (Ref ref) => throw UnimplementedError(),
          ),
        ],
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, _) => Scaffold(
            body: TextButton(
              onPressed: () =>
                  unawaited(showThreadBrowserSheet(context, ref, _parent)),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await pumpFluxerFrames(tester);
  }

  Future<void> search(WidgetTester tester, String query) async {
    await tester.enterText(find.byType(TextField), query);
    await tester.pump(forumSearchDebounce);
    await pumpFluxerFrames(tester);
  }

  setUp(() => repository = _FakeRepository());

  testWidgets('a matching query lists only the matching threads', (
    WidgetTester tester,
  ) async {
    await openBrowser(tester);
    expect(find.text('Release notes'), findsOneWidget);

    await search(tester, 'bug');

    expect(repository.queries.single.name, 'bug');
    expect(repository.queries.single.archived, isFalse);
    expect(find.text('Bug triage'), findsOneWidget);
    expect(find.text('Release notes'), findsNothing);
    expect(find.text('Old bug bash'), findsNothing);
  });

  testWidgets('the closed tab searches closed threads', (
    WidgetTester tester,
  ) async {
    await openBrowser(tester);
    await search(tester, 'bug');
    await tester.tap(find.text('Closed'));
    await pumpFluxerFrames(tester);

    expect(repository.queries.last.archived, isTrue);
    expect(find.text('Old bug bash'), findsOneWidget);
    expect(find.text('Bug triage'), findsNothing);
  });

  testWidgets('a query without matches shows the empty state', (
    WidgetTester tester,
  ) async {
    await openBrowser(tester);
    await search(tester, 'zebra');

    expect(find.text('No threads match'), findsOneWidget);
    expect(
      find.text('Try a different name or check the other tab.'),
      findsOneWidget,
    );
  });

  testWidgets('a failed search shows an error with retry', (
    WidgetTester tester,
  ) async {
    repository.fail = true;
    await openBrowser(tester);
    await search(tester, 'bug');

    expect(
      find.text("Couldn't search threads. Try again later."),
      findsOneWidget,
    );
    repository.fail = false;
    await tester.tap(find.text('Retry'));
    await pumpFluxerFrames(tester);

    expect(find.text('Bug triage'), findsOneWidget);
  });

  testWidgets('clearing the query restores the tab list', (
    WidgetTester tester,
  ) async {
    await openBrowser(tester);
    await search(tester, 'bug');
    await search(tester, '');

    expect(find.text('Release notes'), findsOneWidget);
    expect(repository.queries, hasLength(1));
  });
}
