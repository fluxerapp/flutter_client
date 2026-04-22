import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/providers/typing_sender.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_view_model.g.dart';

const _kPageSize = 30;

class ChatViewState {
  static const _unset = Object();

  final String channelId;
  final List<Message> messages;
  final Message? replyingTo;
  final Message? forwardingFrom;
  final String messageText;
  final int scrollToBottomSignal;
  final (String messageId, int version)? scrollToMessageSignal;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMoreMessages;
  final String? errorMessage;

  const ChatViewState({
    required this.channelId,
    required this.messages,
    required this.replyingTo,
    required this.forwardingFrom,
    required this.messageText,
    required this.scrollToBottomSignal,
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasMoreMessages,
    required this.errorMessage,
    this.scrollToMessageSignal,
  });

  bool get canSend => messageText.trim().isNotEmpty;

  ChatViewState copyWith({
    String? channelId,
    List<Message>? messages,
    Object? replyingTo = _unset,
    Object? forwardingFrom = _unset,
    String? messageText,
    int? scrollToBottomSignal,
    Object? scrollToMessageSignal = _unset,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMoreMessages,
    Object? errorMessage = _unset,
  }) {
    return ChatViewState(
      channelId: channelId ?? this.channelId,
      messages: messages ?? this.messages,
      replyingTo: replyingTo == _unset
          ? this.replyingTo
          : replyingTo as Message?,
      forwardingFrom: forwardingFrom == _unset
          ? this.forwardingFrom
          : forwardingFrom as Message?,
      messageText: messageText ?? this.messageText,
      scrollToBottomSignal: scrollToBottomSignal ?? this.scrollToBottomSignal,
      scrollToMessageSignal: scrollToMessageSignal == _unset
          ? this.scrollToMessageSignal
          : scrollToMessageSignal as (String, int)?,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMoreMessages: hasMoreMessages ?? this.hasMoreMessages,
      errorMessage: errorMessage == _unset
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}

@Riverpod(keepAlive: true)
class ChatViewModel extends _$ChatViewModel {
  StreamSubscription<MessageRealtimeEvent>? _eventsSub;

  @override
  ChatViewState build() {
    final bus = ref.watch(messageRealtimeBusProvider);
    unawaited(_eventsSub?.cancel());
    _eventsSub = bus.stream.listen(_onRealtimeEvent);
    ref.onDispose(() => unawaited(_eventsSub?.cancel()));
    return const ChatViewState(
      channelId: '',
      messages: [],
      replyingTo: null,
      forwardingFrom: null,
      messageText: '',
      scrollToBottomSignal: 0,
      isLoading: false,
      isLoadingMore: false,
      hasMoreMessages: true,
      errorMessage: null,
    );
  }

  Future<void> _onRealtimeEvent(MessageRealtimeEvent ev) async {
    final next = await _nextMessagesFor(ev);
    if (next != null) {
      state = state.copyWith(messages: next);
    }
  }

  Future<List<Message>?> _nextMessagesFor(MessageRealtimeEvent ev) async {
    switch (ev) {
      case MessageCreated(:final event):
        if (event.message.channelId != state.channelId) {
          return null;
        }
        final msg = _toDomain(event.message);
        if (state.messages.any((m) => m.id == msg.id)) {
          return null;
        }
        return [...state.messages, msg];
      case MessageUpdated(:final event):
        if (event.message.channelId != state.channelId) {
          return null;
        }
        return _replaceById(state.messages, _toDomain(event.message));
      case MessageDeleted(:final event):
        if (event.channelId != state.channelId) {
          return null;
        }
        return _removeIds(state.messages, {event.messageId});
      case MessagesDeletedBulk(:final event):
        if (event.channelId != state.channelId) {
          return null;
        }
        return _removeIds(state.messages, event.ids.toSet());
      case MessageReactionsChanged(:final channelId, :final messageId):
        if (channelId != state.channelId) {
          return null;
        }
        final row = await ref
            .read(fluxerDatabaseProvider)
            .messageDao
            .getMessage(messageId);
        if (row == null || state.channelId != channelId) {
          return null;
        }
        return _replaceById(state.messages, Message.fromRow(row));
    }
  }

  Message _toDomain(MessageResponseSchema schema) =>
      Message.fromSdk(schema, currentUserId: ref.read(currentUserIdProvider));

  List<Message>? _replaceById(List<Message> list, Message msg) {
    final idx = list.indexWhere((m) => m.id == msg.id);
    if (idx == -1) {
      return null;
    }
    final updated = List<Message>.from(list);
    updated[idx] = msg;
    return updated;
  }

  List<Message>? _removeIds(List<Message> list, Set<String> ids) {
    if (ids.isEmpty) {
      return null;
    }
    final filtered = list.where((m) => !ids.contains(m.id)).toList();
    return filtered.length == list.length ? null : filtered;
  }

  Future<void> switchChannel(
    String channelId, {
    String? targetMessageId,
  }) async {
    if (state.channelId == channelId &&
        state.isLoading &&
        targetMessageId == null) {
      return;
    }
    state = ChatViewState(
      channelId: channelId,
      messages: const [],
      replyingTo: null,
      forwardingFrom: null,
      messageText: '',
      scrollToBottomSignal: state.scrollToBottomSignal,
      isLoading: true,
      isLoadingMore: false,
      hasMoreMessages: true,
      errorMessage: null,
    );
    await _loadMessages(channelId, targetMessageId: targetMessageId);
  }

  Future<void> _loadMessages(
    String channelId, {
    String? targetMessageId,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final repo = ref.read(messageRepositoryProvider);
      final messages = await repo.getMessages(
        channelId: channelId,
        around: targetMessageId,
      );
      state = state.copyWith(
        messages: messages,
        isLoading: false,
        hasMoreMessages: messages.length >= _kPageSize,
      );
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to load messages: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load messages',
      );
    }
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore ||
        !state.hasMoreMessages ||
        state.messages.isEmpty) {
      return;
    }

    state = state.copyWith(isLoadingMore: true);
    try {
      final repo = ref.read(messageRepositoryProvider);
      final oldestId = state.messages.first.id;
      final older = await repo.getMessages(
        channelId: state.channelId,
        before: oldestId,
      );
      state = state.copyWith(
        messages: [...older, ...state.messages],
        isLoadingMore: false,
        hasMoreMessages: older.length >= _kPageSize,
      );
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to load more: $e');
      state = state.copyWith(isLoadingMore: false);
    }
  }

  Future<void> sendMessage() async {
    final text = state.messageText.trim();
    if (text.isEmpty) {
      return;
    }

    final replyToId = state.replyingTo?.id;

    state = state.copyWith(
      replyingTo: null,
      forwardingFrom: null,
      messageText: '',
    );

    try {
      final repo = ref.read(messageRepositoryProvider);
      final sent = await repo.sendMessage(
        channelId: state.channelId,
        content: text,
        replyToId: replyToId,
      );
      // TODO: Handle sending message states (pending/sent/failed) so the
      // UI can show an optimistic echo before the server/realtime round-trip.
      ref.read(slowmodeTrackerProvider.notifier).recordSend(state.channelId);
      final alreadyPresent = state.messages.any((m) => m.id == sent.id);
      final nextMessages = alreadyPresent
          ? _replaceById(state.messages, sent) ?? state.messages
          : [...state.messages, sent];
      state = state.copyWith(
        messages: nextMessages,
        scrollToBottomSignal: state.scrollToBottomSignal + 1,
      );
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to send: $e');
      state = state.copyWith(errorMessage: 'Failed to send message');
    }
  }

  void startReply(Message message) {
    state = state.copyWith(replyingTo: message);
  }

  void cancelReply() {
    state = state.copyWith(replyingTo: null);
  }

  void startForward(Message message) {
    state = state.copyWith(forwardingFrom: message);
  }

  void cancelForward() {
    state = state.copyWith(forwardingFrom: null);
  }

  void scrollToMessage(String messageId) {
    final version = (state.scrollToMessageSignal?.$2 ?? 0) + 1;
    state = state.copyWith(scrollToMessageSignal: (messageId, version));
  }

  void updateMessageText(String text) {
    final previous = state.messageText;
    state = state.copyWith(messageText: text);
    if (text.isEmpty || text == previous) {
      return;
    }
    final channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    unawaited(
      ref.read(typingSenderProvider.notifier).notifyUserTyping(channelId),
    );
  }

  Future<void> toggleReaction(
    String messageId,
    String emoji, {
    String? emojiId,
    bool animated = false,
  }) async {
    final msgIndex = state.messages.indexWhere((m) => m.id == messageId);
    if (msgIndex == -1) {
      return;
    }

    final msg = state.messages[msgIndex];
    final existingIdx = msg.reactions.indexWhere(
      (r) => r.emoji == emoji && r.emojiId == emojiId,
    );
    final hasReacted =
        existingIdx != -1 && msg.reactions[existingIdx].hasReacted;

    final updatedReactions = List<Reaction>.from(msg.reactions);
    if (hasReacted) {
      final old = updatedReactions[existingIdx];
      if (old.count <= 1) {
        updatedReactions.removeAt(existingIdx);
      } else {
        updatedReactions[existingIdx] = Reaction(
          emoji: emoji,
          emojiId: emojiId,
          animated: animated,
          count: old.count - 1,
        );
      }
    } else if (existingIdx != -1) {
      final old = updatedReactions[existingIdx];
      updatedReactions[existingIdx] = Reaction(
        emoji: emoji,
        emojiId: emojiId,
        animated: animated,
        count: old.count + 1,
        hasReacted: true,
      );
    } else {
      updatedReactions.add(
        Reaction(
          emoji: emoji,
          emojiId: emojiId,
          animated: animated,
          count: 1,
          hasReacted: true,
        ),
      );
    }

    // Optimistic update.
    final updatedMessages = List<Message>.from(state.messages);
    updatedMessages[msgIndex] = Message(
      id: msg.id,
      channelId: msg.channelId,
      authorId: msg.authorId,
      authorName: msg.authorName,
      authorAvatar: msg.authorAvatar,
      authorAvatarColor: msg.authorAvatarColor,
      authorIsBot: msg.authorIsBot,
      content: msg.content,
      timestamp: msg.timestamp,
      editedTimestamp: msg.editedTimestamp,
      embeds: msg.embeds,
      attachments: msg.attachments,
      reactions: updatedReactions,
      replyToId: msg.replyToId,
      forwardedFrom: msg.forwardedFrom,
      isPinned: msg.isPinned,
      isMentioned: msg.isMentioned,
      type: msg.type,
    );
    state = state.copyWith(messages: updatedMessages);

    final reaction = Reaction(
      emoji: emoji,
      emojiId: emojiId,
      animated: animated,
      count: 0,
    );

    try {
      final repo = ref.read(messageRepositoryProvider);
      if (hasReacted) {
        await repo.removeReaction(
          channelId: state.channelId,
          messageId: messageId,
          emoji: reaction.apiParam,
        );
      } else {
        await repo.addReaction(
          channelId: state.channelId,
          messageId: messageId,
          emoji: reaction.apiParam,
        );
        // Track frecency on successful add.
        final db = ref.read(fluxerDatabaseProvider);
        unawaited(db.emojiUsageDao.trackUsage(reaction.frecencyKey));
      }
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Reaction failed: $e');
    }
  }
}
