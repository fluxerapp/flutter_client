import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase, ReadState;
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_references_provider.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_app/features/threads/presentation/create_thread_sheet.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:go_router/go_router.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/test_l10n.dart';

const String _guildId = '800';
const String _parentId = '1500';
const String _sourceId = '1600';

const Channel _parent = Channel(
  id: _parentId,
  guildId: _guildId,
  name: 'fwd-test',
);

final Message _forwardSource = Message(
  id: _sourceId,
  channelId: _parentId,
  authorId: '42',
  authorName: 'Fullest',
  content: '',
  timestamp: DateTime.utc(2026, 10, 14, 12, 12),
  messageReference: const MessageReference(
    channelId: '900',
    messageId: '901',
    guildId: '700',
    type: MessageReferenceType.forward,
  ),
  messageSnapshots: <MessageSnapshot>[
    MessageSnapshot(
      timestamp: DateTime.utc(2026, 10, 14, 12),
      embeds: const <Embed>[
        Embed(type: EmbedType.rich, title: '[fluxer:main] 1 new commit'),
      ],
    ),
  ],
);

Map<String, Object?> _threadJson() => <String, Object?>{
  'id': _sourceId,
  'type': 11,
  'guild_id': _guildId,
  'parent_id': _parentId,
  'owner_id': '42',
  'name': 'test',
  'message_count': 0,
  'total_message_sent': 0,
  'member_count': 1,
  'thread_metadata': <String, Object?>{
    'archived': false,
    'auto_archive_duration': 4320,
    'archive_timestamp': '2026-10-14T12:23:00.000Z',
    'locked': false,
    'create_timestamp': '2026-10-14T12:23:00.000Z',
  },
};

class _SlowThreadsRepository extends ThreadsRepository {
  _SlowThreadsRepository(FluxerDatabase database)
    : super(FluxerClient(Dio()), database);

  final Completer<ThreadChannelResponse> response =
      Completer<ThreadChannelResponse>();
  int calls = 0;

  @override
  Future<ThreadChannelResponse> startFromMessage({
    required String guildId,
    required String channelId,
    required String messageId,
    required StartThreadFromMessageRequest body,
  }) {
    calls++;
    return response.future;
  }
}

class _Navigation {
  _Navigation({required this.location, required this.cachedStarter});

  final String location;
  final Message? cachedStarter;
}

class _RecordingRouter extends Fake implements GoRouter {
  _RecordingRouter(this.container);

  final ProviderContainer Function() container;
  final List<_Navigation> navigations = <_Navigation>[];

  @override
  void go(String location, {Object? extra}) {
    final MessageReferencesState refs = container().read(
      messageReferencesProvider,
    );
    navigations.add(
      _Navigation(
        location: location,
        cachedStarter: refs
            .cachedMessages[MessageReferencesState.key(_parentId, _sourceId)],
      ),
    );
  }
}

class _MainRevealSide extends CurrentRevealSide {
  @override
  RevealSide build() => RevealSide.main;
}

class _FakeChatViewModel extends ChatViewModel {
  final List<String> switched = <String>[];

  @override
  ChatViewState build() => const ChatViewState(
    channelId: _parentId,
    messages: <Message>[],
    replyingTo: null,
    replyMentioning: false,
    editingMessage: null,
    messageText: '',
    scrollToBottomSignal: 0,
    isLoading: false,
    isSyncingMessages: false,
    isLoadingMore: false,
    isLoadingNewer: false,
    hasMoreMessages: false,
    hasMoreNewerMessages: false,
    errorMessage: null,
  );

  @override
  Future<void> switchChannel(
    String channelId, {
    String? targetMessageId,
    bool loadMessages = true,
  }) async {
    switched.add(channelId);
  }
}

void main() {
  testWidgets(
    'a slow thread create navigates once with the forwarded starter ready',
    (WidgetTester tester) async {
      final FluxerDatabase database = openTestDatabase();
      final _SlowThreadsRepository threads = _SlowThreadsRepository(database);
      ProviderContainer? container;
      final _RecordingRouter router = _RecordingRouter(() => container!);
      final _FakeChatViewModel chat = _FakeChatViewModel();
      final colorTheme = buildDarkColorTheme();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(database),
            threadsRepositoryProvider.overrideWithValue(threads),
            fluxerRouterProvider.overrideWithValue(router),
            chatViewModelProvider.overrideWith(() => chat),
            currentRevealSideProvider.overrideWith(_MainRevealSide.new),
            parentThreadActorProvider(_guildId, _parentId).overrideWithValue(
              ThreadActor(
                permissions:
                    Permission.viewChannel.value |
                    Permission.sendMessages.value |
                    Permission.readMessageHistory.value |
                    Permission.createPublicThreads.value |
                    Permission.sendMessagesInThreads.value,
              ),
            ),
          ],
          child: MaterialApp(
            locale: kTestLocale,
            localizationsDelegates: fluxerLocalizationsDelegates,
            supportedLocales: FluxerLocalizations.supportedLocales,
            theme: buildFluxerTheme(
              colorTheme: colorTheme,
              textTheme: FluxerTextTheme.fromColors(colorTheme),
              layoutTheme: FluxerLayoutTheme.scaled(),
            ),
            home: Scaffold(
              body: Consumer(
                builder: (BuildContext context, WidgetRef ref, _) {
                  container = ProviderScope.containerOf(context);
                  return Center(
                    child: ElevatedButton(
                      onPressed: () => showCreateThreadSheet(
                        context,
                        ref,
                        parent: _parent,
                        sourceMessage: _forwardSource,
                      ),
                      child: const Text('Open'),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).first, 'test');
      await tester.pump();
      await tester.tap(find.text(testL10n.threadCreate).last);
      await tester.pump();
      expect(threads.calls, 1);

      await tester.pump(const Duration(seconds: 8));
      expect(router.navigations, isEmpty);
      expect(find.text(testL10n.threadName), findsOneWidget);

      threads.response.complete(ThreadChannelResponse.fromJson(_threadJson()));
      for (int i = 0; i < 20 && router.navigations.isEmpty; i++) {
        await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 20)),
        );
        await tester.pump();
      }
      await tester.pumpAndSettle();

      expect(router.navigations, hasLength(1));
      final _Navigation navigation = router.navigations.single;
      expect(navigation.location, RoutePaths.guildChannel(_guildId, _sourceId));
      expect(
        navigation.cachedStarter?.messageSnapshots.single.embeds.single.title,
        '[fluxer:main] 1 new commit',
      );
      expect(chat.switched, <String>[_sourceId]);
      expect(find.text(testL10n.threadName), findsNothing);

      final ReadState? readState = await tester.runAsync<ReadState?>(
        () => database.readStateDao.getReadState(_sourceId),
      );
      expect(readState?.lastMessageId, _sourceId);

      await tester.pump(const Duration(seconds: 5));
      expect(router.navigations, hasLength(1));
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.runAsync(database.close);
    },
  );
}
