import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message_references_provider.g.dart';

enum MessageReferenceState { loaded, notLoaded, deleted }

class MessageReferenceResolution {
  const MessageReferenceResolution({required this.state, this.message});

  final MessageReferenceState state;
  final Message? message;
}

class MessageReferencesState {
  const MessageReferencesState({
    this.deletedKeys = const {},
    this.cachedMessages = const {},
    this.version = 0,
  });

  final Set<String> deletedKeys;
  final Map<String, Message> cachedMessages;
  final int version;

  static String key(String channelId, String messageId) =>
      '$channelId:$messageId';

  MessageReferencesState copyWith({
    Set<String>? deletedKeys,
    Map<String, Message>? cachedMessages,
    int? version,
  }) {
    return MessageReferencesState(
      deletedKeys: deletedKeys ?? this.deletedKeys,
      cachedMessages: cachedMessages ?? this.cachedMessages,
      version: version ?? this.version,
    );
  }
}

@Riverpod(keepAlive: true)
class MessageReferencesNotifier extends _$MessageReferencesNotifier {
  final Set<String> _inFlightKeys = <String>{};

  @override
  MessageReferencesState build() => const MessageReferencesState();

  void clearChannel(String channelId) {
    final prefix = '$channelId:';
    final nextDeleted = state.deletedKeys
        .where((key) => !key.startsWith(prefix))
        .toSet();
    final nextCached = Map<String, Message>.from(state.cachedMessages)
      ..removeWhere((key, _) => key.startsWith(prefix));
    if (nextDeleted.length == state.deletedKeys.length &&
        nextCached.length == state.cachedMessages.length) {
      return;
    }
    state = state.copyWith(
      deletedKeys: nextDeleted,
      cachedMessages: nextCached,
      version: state.version + 1,
    );
  }

  void onMessagesLoaded({
    required String channelId,
    required List<Message> messages,
    List<Message> embeddedReplyParents = const [],
  }) {
    var changed = false;
    final nextCached = Map<String, Message>.from(state.cachedMessages);
    for (final parent in embeddedReplyParents) {
      if (_cacheMessage(nextCached, parent.channelId, parent.id, parent)) {
        changed = true;
      }
    }
    final missing = <({String channelId, String messageId})>[];
    for (final message in messages) {
      final reference = message.messageReference;
      if (reference == null || reference.isForward) {
        continue;
      }
      final refChannelId = reference.channelId.isNotEmpty
          ? reference.channelId
          : channelId;
      final refMessageId = reference.messageId;
      if (refMessageId == null || refMessageId.isEmpty) {
        continue;
      }
      if (_hasResolvedMessage(
        refChannelId: refChannelId,
        refMessageId: refMessageId,
        channelId: channelId,
        channelMessages: messages,
        cachedMessages: nextCached,
      )) {
        continue;
      }
      missing.add((channelId: refChannelId, messageId: refMessageId));
    }
    if (changed) {
      state = state.copyWith(
        cachedMessages: nextCached,
        version: state.version + 1,
      );
    }
    if (missing.isNotEmpty) {
      _fetchMissingMessages(missing);
    }
  }

  void onMessageCreated(MessageResponseSchema schema) {
    final currentUserId = ref.read(currentUserIdProvider);
    final referenced = schema.referencedMessage;
    if (referenced != null) {
      _setCachedMessage(
        Message.fromReferencedSdk(referenced, currentUserId: currentUserId),
      );
    }
    final reference = schema.messageReference;
    if (reference != null && reference.type != MessageReferenceType.forward) {
      final refChannelId = reference.channelId;
      final refMessageId = reference.messageId;
      if (refMessageId == null || refMessageId.isEmpty) {
        return;
      }
      if (!_isDeleted(refChannelId, refMessageId) &&
          !state.cachedMessages.containsKey(
            MessageReferencesState.key(refChannelId, refMessageId),
          )) {
        _fetchMissingMessages([
          (channelId: refChannelId, messageId: refMessageId),
        ]);
      }
    }
  }

  void onMessageUpdated(MessageResponseSchema schema) {
    final referenced = schema.referencedMessage;
    if (referenced != null) {
      final key = MessageReferencesState.key(
        referenced.channelId,
        referenced.id,
      );
      if (state.cachedMessages.containsKey(key) ||
          state.deletedKeys.contains(key)) {
        _setCachedMessage(
          Message.fromReferencedSdk(
            referenced,
            currentUserId: ref.read(currentUserIdProvider),
          ),
        );
      }
    }
  }

  void onMessageDeleted({
    required String channelId,
    required String messageId,
  }) {
    final key = MessageReferencesState.key(channelId, messageId);
    if (state.deletedKeys.contains(key) &&
        !state.cachedMessages.containsKey(key)) {
      return;
    }
    final nextCached = Map<String, Message>.from(state.cachedMessages)
      ..remove(key);
    state = state.copyWith(
      deletedKeys: {...state.deletedKeys, key},
      cachedMessages: nextCached,
      version: state.version + 1,
    );
  }

  void onMessagesDeletedBulk({
    required String channelId,
    required Iterable<String> messageIds,
  }) {
    for (final messageId in messageIds) {
      onMessageDeleted(channelId: channelId, messageId: messageId);
    }
  }

  MessageReferenceResolution resolveSync({
    required String channelId,
    required String messageId,
    required List<Message> channelMessages,
  }) {
    if (_isDeleted(channelId, messageId)) {
      return const MessageReferenceResolution(
        state: MessageReferenceState.deleted,
      );
    }
    for (final message in channelMessages) {
      if (message.id == messageId) {
        return MessageReferenceResolution(
          state: MessageReferenceState.loaded,
          message: message,
        );
      }
    }
    final cached =
        state.cachedMessages[MessageReferencesState.key(channelId, messageId)];
    if (cached != null) {
      return MessageReferenceResolution(
        state: MessageReferenceState.loaded,
        message: cached,
      );
    }
    _scheduleResolve(channelId: channelId, messageId: messageId);
    return const MessageReferenceResolution(
      state: MessageReferenceState.notLoaded,
    );
  }

  void _scheduleResolve({
    required String channelId,
    required String messageId,
  }) {
    final key = MessageReferencesState.key(channelId, messageId);
    if (_isDeleted(channelId, messageId) ||
        state.cachedMessages.containsKey(key) ||
        _inFlightKeys.contains(key)) {
      return;
    }
    _inFlightKeys.add(key);
    unawaited(_resolveReference(channelId: channelId, messageId: messageId));
  }

  Future<void> _resolveReference({
    required String channelId,
    required String messageId,
  }) async {
    final key = MessageReferencesState.key(channelId, messageId);
    try {
      final row = await ref
          .read(fluxerDatabaseProvider)
          .messageDao
          .getMessage(messageId);
      if (row != null && row.channelId == channelId) {
        _setCachedMessage(Message.fromRow(row));
        return;
      }
      final message = await ref
          .read(messageRepositoryProvider)
          .fetchMessage(channelId: channelId, messageId: messageId);
      _setCachedMessage(message);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        _markDeleted(channelId, messageId);
      }
    } on Object {
      // Stays NOT_LOADED until a later retry.
    } finally {
      _inFlightKeys.remove(key);
    }
  }

  void _fetchMissingMessages(
    List<({String channelId, String messageId})> refs,
  ) {
    for (final refEntry in refs) {
      _scheduleResolve(
        channelId: refEntry.channelId,
        messageId: refEntry.messageId,
      );
    }
  }

  bool _hasResolvedMessage({
    required String refChannelId,
    required String refMessageId,
    required String channelId,
    required List<Message> channelMessages,
    required Map<String, Message> cachedMessages,
  }) {
    if (_isDeleted(refChannelId, refMessageId)) {
      return true;
    }
    if (refChannelId == channelId) {
      for (final message in channelMessages) {
        if (message.id == refMessageId) {
          return true;
        }
      }
    }
    return cachedMessages.containsKey(
      MessageReferencesState.key(refChannelId, refMessageId),
    );
  }

  bool _isDeleted(String channelId, String messageId) {
    return state.deletedKeys.contains(
      MessageReferencesState.key(channelId, messageId),
    );
  }

  void _markDeleted(String channelId, String messageId) {
    final key = MessageReferencesState.key(channelId, messageId);
    final nextCached = Map<String, Message>.from(state.cachedMessages)
      ..remove(key);
    state = state.copyWith(
      deletedKeys: {...state.deletedKeys, key},
      cachedMessages: nextCached,
      version: state.version + 1,
    );
  }

  void _setCachedMessage(Message message) {
    final nextCached = Map<String, Message>.from(state.cachedMessages);
    if (_cacheMessage(nextCached, message.channelId, message.id, message)) {
      state = state.copyWith(
        cachedMessages: nextCached,
        version: state.version + 1,
      );
    }
  }

  bool _cacheMessage(
    Map<String, Message> cache,
    String channelId,
    String messageId,
    Message message,
  ) {
    final key = MessageReferencesState.key(channelId, messageId);
    if (state.deletedKeys.contains(key)) {
      return false;
    }
    final existing = cache[key];
    if (existing != null &&
        existing.id == message.id &&
        existing.content == message.content &&
        existing.authorId == message.authorId) {
      return false;
    }
    cache[key] = message;
    return true;
  }
}
