import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart'
    show currentUserIdProvider;
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/bookmarks/data/saved_messages_repository.dart';
import 'package:fluxer_app/features/bookmarks/domain/saved_messages.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_dart/export.dart';

final savedMessagesRepositoryProvider = Provider<SavedMessagesRepository>((
  Ref ref,
) {
  return SavedMessagesRepository(
    database: ref.watch(fluxerDatabaseProvider),
    client: ref.watch(fluxerClientProvider),
    currentUserId: ref.watch(currentUserIdProvider),
  );
});

final savedMessagesProvider =
    NotifierProvider<SavedMessagesNotifier, SavedMessagesState>(
      SavedMessagesNotifier.new,
    );

class SavedMessagesNotifier extends Notifier<SavedMessagesState> {
  int _fetchGeneration = 0;
  StreamSubscription<MessageRealtimeEvent>? _realtimeSub;

  @override
  SavedMessagesState build() {
    final MessageRealtimeBus bus = ref.watch(messageRealtimeBusProvider);
    unawaited(_realtimeSub?.cancel());
    _realtimeSub = bus.stream.listen(_onRealtimeEvent);
    ref
      ..onDispose(() => unawaited(_realtimeSub?.cancel()))
      ..listen<int>(gatewayFullRecoveryProvider, (int? previous, int next) {
        if (previous == null) {
          return;
        }
        _reset();
      });
    return const SavedMessagesState();
  }

  Future<void> refresh() => _fetch(append: false);

  Future<void> loadMore() async {
    final String? cursor = state.cursor;
    if (cursor == null || !state.hasMore || state.isLoadingMore) {
      return;
    }
    await _fetch(append: true, before: cursor);
  }

  void handleChannelDelete(String channelId) {
    final List<Message> messages = state.messages
        .where((Message message) => message.channelId != channelId)
        .toList();
    final List<SavedMessageMissingEntry> missing = state.missing
        .where((SavedMessageMissingEntry entry) => entry.channelId != channelId)
        .toList();
    if (messages.length == state.messages.length &&
        missing.length == state.missing.length) {
      return;
    }
    state = state.copyWith(messages: messages, missing: missing);
  }

  void handleSavedCreate(Message message) {
    state = state.copyWith(
      messages: <Message>[
        message,
        ...state.messages.where((Message item) => item.id != message.id),
      ],
      missing: state.missing
          .where(
            (SavedMessageMissingEntry entry) =>
                entry.messageId != message.id && entry.id != message.id,
          )
          .toList(),
    );
  }

  void handleMessageDelete(String messageId) {
    final List<Message> messages = state.messages
        .where((Message message) => message.id != messageId)
        .toList();
    final List<SavedMessageMissingEntry> missing = state.missing
        .where(
          (SavedMessageMissingEntry entry) =>
              entry.messageId != messageId && entry.id != messageId,
        )
        .toList();
    if (messages.length == state.messages.length &&
        missing.length == state.missing.length) {
      return;
    }
    state = state.copyWith(messages: messages, missing: missing);
  }

  void handleMessageUpdate(MessageResponseSchema schema) {
    final int index = state.messages.indexWhere(
      (Message message) => message.id == schema.id,
    );
    if (index == -1) {
      return;
    }
    final List<Message> messages = List<Message>.from(state.messages);
    messages[index] = messages[index].applyGatewayUpdate(
      schema,
      currentUserId: ref.read(currentUserIdProvider),
    );
    state = state.copyWith(messages: messages);
  }

  Future<void> _fetch({required bool append, String? before}) async {
    if (append && (state.isLoadingMore || !state.hasMore)) {
      return;
    }
    final int requestId = ++_fetchGeneration;
    state = state.copyWith(isLoadingMore: true, resetError: true);
    try {
      final SavedMessagesFetchPage page = await ref
          .read(savedMessagesRepositoryProvider)
          .fetch(before: before);
      if (requestId != _fetchGeneration) {
        return;
      }
      _applyPage(page, append: append);
    } on Object catch (error, stackTrace) {
      if (requestId != _fetchGeneration) {
        return;
      }
      talker.error('[SavedMessages] Fetch failed', error, stackTrace);
      if (append) {
        state = state.copyWith(isLoadingMore: false);
        return;
      }
      state = SavedMessagesState(fetched: true, lastError: error);
    }
  }

  void _applyPage(SavedMessagesFetchPage page, {required bool append}) {
    if (append) {
      final Set<String> knownMessageIds = <String>{
        for (final Message message in state.messages) message.id,
      };
      final Set<String> knownMissingIds = <String>{
        for (final SavedMessageMissingEntry entry in state.missing) entry.id,
      };
      final List<Message> messages = <Message>[
        ...state.messages,
        ...page.messages.where(
          (Message message) => !knownMessageIds.contains(message.id),
        ),
      ]..sort((Message a, Message b) => compareSnowflakeIds(b.id, a.id));
      state = state.copyWith(
        messages: messages,
        missing: <SavedMessageMissingEntry>[
          ...state.missing,
          ...page.missing.where(
            (SavedMessageMissingEntry entry) =>
                !knownMissingIds.contains(entry.id),
          ),
        ],
        hasMore: page.hasMore,
        isLoadingMore: false,
        fetched: true,
        cursor: page.cursor ?? state.cursor,
        resetError: true,
      );
      return;
    }
    state = SavedMessagesState(
      messages: page.messages,
      missing: page.missing,
      fetched: true,
      hasMore: page.hasMore,
      cursor: page.cursor,
    );
  }

  void _reset() {
    _fetchGeneration++;
    state = const SavedMessagesState();
  }

  void _onRealtimeEvent(MessageRealtimeEvent event) {
    switch (event) {
      case MessageUpdated(event: final update):
        handleMessageUpdate(update.message);
      case MessageDeleted(event: final deleted):
        handleMessageDelete(deleted.messageId);
      case MessagesDeletedBulk(event: final deleted):
        for (final String id in deleted.ids) {
          handleMessageDelete(id);
        }
      case MessageReactionsChanged(:final messageId):
        unawaited(_reloadMessage(messageId));
      case MessageCreated():
        break;
    }
  }

  Future<void> _reloadMessage(String messageId) async {
    final int index = state.messages.indexWhere(
      (Message message) => message.id == messageId,
    );
    if (index == -1) {
      return;
    }
    final row = await ref
        .read(fluxerDatabaseProvider)
        .messageDao
        .getMessage(messageId);
    if (row == null) {
      return;
    }
    final int latest = state.messages.indexWhere(
      (Message message) => message.id == messageId,
    );
    if (latest == -1) {
      return;
    }
    final List<Message> messages = List<Message>.from(state.messages);
    messages[latest] = Message.fromRow(row);
    state = state.copyWith(messages: messages);
  }
}
