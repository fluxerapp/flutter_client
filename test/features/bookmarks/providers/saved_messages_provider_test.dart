import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/features/bookmarks/data/saved_messages_repository.dart';
import 'package:fluxer_app/features/bookmarks/domain/saved_messages.dart';
import 'package:fluxer_app/features/bookmarks/providers/saved_messages_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/open_test_database.dart';

class _ScriptedSavedMessagesRepository extends SavedMessagesRepository {
  _ScriptedSavedMessagesRepository({
    required super.database,
    required this._pages,
  }) : super(
         client: FluxerClient(Dio()),
         currentUserId: 'me',
       );

  final List<SavedMessagesFetchPage> _pages;
  final List<Completer<SavedMessagesFetchPage>> _gates =
      <Completer<SavedMessagesFetchPage>>[];
  int calls = 0;
  Exception? error;

  @override
  Future<SavedMessagesFetchPage> fetch({String? before}) async {
    calls++;
    final Exception? failure = error;
    if (failure != null) {
      throw failure;
    }
    if (_gates.isNotEmpty) {
      return _gates.removeAt(0).future;
    }
    return _pages[calls - 1];
  }
}

SavedMessagesFetchPage _missingPage(int startId, int count) {
  return SavedMessagesFetchPage(
    messages: const <Message>[],
    missing: <SavedMessageMissingEntry>[
      for (int i = 0; i < count; i++)
        SavedMessageMissingEntry(
          id: '${startId - i}',
          channelId: '10',
          messageId: '${startId - i}',
        ),
    ],
    hasMore: count == kSavedMessagesPageSize,
    cursor: '${startId - (count - 1)}',
  );
}

Message _message({
  required String id,
  required String channelId,
  String content = 'hello',
}) {
  return Message(
    id: id,
    channelId: channelId,
    authorId: 'author-1',
    authorName: 'Author',
    content: content,
    timestamp: DateTime.utc(2026),
  );
}

MessageResponseSchema _schema({
  required String id,
  required String channelId,
  required String content,
}) {
  return MessageResponseSchema(
    id: id,
    channelId: channelId,
    author: const UserPartialResponse(
      id: 'author-1',
      username: 'author',
      discriminator: '0001',
      globalName: null,
      avatar: null,
      avatarColor: null,
      flags: 0,
    ),
    type: MessageResponseSchemaTypeType.valueDefault,
    flags: 0,
    content: content,
    timestamp: DateTime.utc(2026, 1, 2),
    pinned: false,
    mentionEveryone: false,
    tts: false,
    mentions: const [],
    mentionRoles: const [],
  );
}

void main() {
  late FluxerDatabase database;
  late _ScriptedSavedMessagesRepository repository;
  late ProviderContainer container;

  ProviderContainer openContainer({
    required List<SavedMessagesFetchPage> pages,
  }) {
    repository = _ScriptedSavedMessagesRepository(
      database: database,
      pages: pages,
    );
    final ProviderContainer next = ProviderContainer(
      overrides: <Override>[
        fluxerDatabaseProvider.overrideWithValue(database),
        savedMessagesRepositoryProvider.overrideWithValue(repository),
      ],
    );
    addTearDown(next.dispose);
    return next;
  }

  setUp(() {
    database = openTestDatabase();
  });

  test('tracks hasMore and the oldest cursor on a full first page', () async {
    container = openContainer(
      pages: <SavedMessagesFetchPage>[
        _missingPage(1000, kSavedMessagesPageSize),
      ],
    );

    await container.read(savedMessagesProvider.notifier).refresh();
    final SavedMessagesState state = container.read(savedMessagesProvider);

    expect(state.fetched, isTrue);
    expect(state.hasMore, isTrue);
    expect(state.isLoadingMore, isFalse);
    expect(state.cursor, '${1000 - (kSavedMessagesPageSize - 1)}');
    expect(state.missing, hasLength(kSavedMessagesPageSize));
  });

  test('appends the next page instead of replacing the loaded one', () async {
    container = openContainer(
      pages: <SavedMessagesFetchPage>[
        _missingPage(1000, kSavedMessagesPageSize),
        _missingPage(900, 10),
      ],
    );
    final SavedMessagesNotifier notifier = container.read(
      savedMessagesProvider.notifier,
    );

    await notifier.refresh();
    await notifier.loadMore();
    final SavedMessagesState state = container.read(savedMessagesProvider);

    expect(state.missing, hasLength(kSavedMessagesPageSize + 10));
    expect(state.hasMore, isFalse);
    expect(state.cursor, '891');
  });

  test('ignores a page superseded by a newer READY reset', () async {
    final Completer<SavedMessagesFetchPage> gate =
        Completer<SavedMessagesFetchPage>();
    container = openContainer(
      pages: <SavedMessagesFetchPage>[_missingPage(1000, 5)],
    );
    repository._gates.add(gate);

    final Future<void> pending = container
        .read(savedMessagesProvider.notifier)
        .refresh();
    container.read(gatewayFullRecoveryProvider.notifier).bump();
    gate.complete(_missingPage(1000, 5));
    await pending;

    final SavedMessagesState state = container.read(savedMessagesProvider);
    expect(state.fetched, isFalse);
    expect(state.missing, isEmpty);
  });

  test('keeps loaded pages when loading more fails', () async {
    container = openContainer(
      pages: <SavedMessagesFetchPage>[
        _missingPage(1000, kSavedMessagesPageSize),
      ],
    );
    final SavedMessagesNotifier notifier = container.read(
      savedMessagesProvider.notifier,
    );
    await notifier.refresh();
    repository.error = Exception('load more failed');

    await notifier.loadMore();
    final SavedMessagesState state = container.read(savedMessagesProvider);

    expect(state.missing, hasLength(kSavedMessagesPageSize));
    expect(state.isLoadingMore, isFalse);
    expect(state.fetched, isTrue);
  });

  test('keeps a retryable error when the first page fails', () async {
    container = openContainer(pages: <SavedMessagesFetchPage>[]);
    repository.error = Exception('first page failed');

    await container.read(savedMessagesProvider.notifier).refresh();
    final SavedMessagesState state = container.read(savedMessagesProvider);

    expect(state.fetched, isTrue);
    expect(state.isEmpty, isTrue);
    expect(state.lastError, isNotNull);
  });

  test('applies a live edit from the message bus', () async {
    container = openContainer(
      pages: <SavedMessagesFetchPage>[
        SavedMessagesFetchPage(
          messages: <Message>[_message(id: '1', channelId: 'c1')],
          missing: const <SavedMessageMissingEntry>[],
          hasMore: false,
          cursor: '1',
        ),
      ],
    );
    await container.read(savedMessagesProvider.notifier).refresh();

    container
        .read(messageRealtimeBusProvider)
        .emit(
          MessageUpdated(
            MessageUpdateEvent(
              message: _schema(
                id: '1',
                channelId: 'c1',
                content: 'edited on desktop',
              ),
            ),
          ),
        );
    await Future<void>.delayed(Duration.zero);

    expect(
      container.read(savedMessagesProvider).messages.single.content,
      'edited on desktop',
    );
  });

  test('drops bookmarks for a deleted channel', () async {
    container = openContainer(
      pages: <SavedMessagesFetchPage>[
        SavedMessagesFetchPage(
          messages: <Message>[
            _message(id: '1', channelId: 'keep'),
            _message(id: '2', channelId: 'gone'),
          ],
          missing: const <SavedMessageMissingEntry>[
            SavedMessageMissingEntry(
              id: '3',
              channelId: 'gone',
              messageId: '3',
            ),
          ],
          hasMore: false,
        ),
      ],
    );
    final SavedMessagesNotifier notifier = container.read(
      savedMessagesProvider.notifier,
    );
    await notifier.refresh();
    notifier.handleChannelDelete('gone');

    final SavedMessagesState state = container.read(savedMessagesProvider);
    expect(state.messages.single.id, '1');
    expect(state.missing, isEmpty);
  });

  test('prepends a newly saved message and removes it on delete', () async {
    container = openContainer(
      pages: <SavedMessagesFetchPage>[
        SavedMessagesFetchPage(
          messages: <Message>[_message(id: '1', channelId: 'c1')],
          missing: const <SavedMessageMissingEntry>[],
          hasMore: false,
          cursor: '1',
        ),
      ],
    );
    final SavedMessagesNotifier notifier = container.read(
      savedMessagesProvider.notifier,
    );
    await notifier.refresh();
    notifier.handleSavedCreate(
      _message(id: '2', channelId: 'c1', content: 'from desktop'),
    );

    expect(
      container.read(savedMessagesProvider).messages.map((Message m) => m.id),
      <String>['2', '1'],
    );

    notifier.handleMessageDelete('2');
    expect(container.read(savedMessagesProvider).messages.single.id, '1');
  });
}
