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
  MessageReferencesState({
    required this.deletedKeys,
    required this.cachedMessages,
    this.version = 0,
  });

  final Set<String> deletedKeys;
  final Map<String, Message> cachedMessages;
  final int version;

  static String key(String channelId, String messageId) =>
      '$channelId:$messageId';

  MessageReferencesState bumped() {
    return MessageReferencesState(
      deletedKeys: deletedKeys,
      cachedMessages: cachedMessages,
      version: version + 1,
    );
  }
}

@Riverpod(keepAlive: true)
class MessageReferencesNotifier extends _$MessageReferencesNotifier {
  static const int _maxResolveAttempts = 4;

  final Set<String> _inFlightKeys = <String>{};
  final Map<String, int> _failedAttempts = <String, int>{};
  final Map<String, Timer> _retryTimers = <String, Timer>{};

  @override
  MessageReferencesState build() {
    ref
      ..watch(currentUserIdProvider)
      ..onDispose(_cancelRetries);
    return MessageReferencesState(
      deletedKeys: <String>{},
      cachedMessages: <String, Message>{},
    );
  }

  void _cancelRetries() {
    for (final Timer timer in _retryTimers.values) {
      timer.cancel();
    }
    _retryTimers.clear();
    _failedAttempts.clear();
  }

  void seed(Message message) => _setCachedMessage(message);

  void clearChannel(String channelId) {
    final prefix = '$channelId:';
    final int deletedBefore = state.deletedKeys.length;
    final int cachedBefore = state.cachedMessages.length;
    state.deletedKeys.removeWhere((key) => key.startsWith(prefix));
    state.cachedMessages.removeWhere((key, _) => key.startsWith(prefix));
    if (state.deletedKeys.length == deletedBefore &&
        state.cachedMessages.length == cachedBefore) {
      return;
    }
    state = state.bumped();
  }

  void onMessagesLoaded({
    required String channelId,
    required List<Message> messages,
    List<Message> embeddedReplyParents = const [],
  }) {
    var changed = false;
    for (final parent in embeddedReplyParents) {
      if (_cacheMessage(parent.channelId, parent.id, parent)) {
        changed = true;
      }
    }
    final missing = _missingReferences(
      channelId: channelId,
      messages: messages,
      embedded: const <String, Message>{},
    );
    if (changed) {
      state = state.bumped();
    }
    if (missing.isNotEmpty) {
      _fetchMissingMessages(missing);
    }
  }

  Future<void> preload({
    required String channelId,
    required List<Message> messages,
    List<Message> embeddedReplyParents = const [],
  }) async {
    final embedded = <String, Message>{
      for (final parent in embeddedReplyParents)
        MessageReferencesState.key(parent.channelId, parent.id): parent,
    };
    final missing = _missingReferences(
      channelId: channelId,
      messages: messages,
      embedded: embedded,
    );
    final messageDao = ref.read(fluxerDatabaseProvider).messageDao;
    final rows = await Future.wait(
      missing.map(
        (refEntry) =>
            messageDao.getMessage(refEntry.channelId, refEntry.messageId),
      ),
    );
    if (!ref.mounted) {
      return;
    }
    var changed = false;
    for (final parent in embeddedReplyParents) {
      if (_cacheMessage(parent.channelId, parent.id, parent)) {
        changed = true;
      }
    }
    for (var i = 0; i < missing.length; i++) {
      final row = rows[i];
      if (row != null &&
          _cacheMessage(row.channelId, row.id, Message.fromRow(row))) {
        changed = true;
      }
    }
    if (changed) {
      state = state.bumped();
    }
  }

  List<({String channelId, String messageId})> _missingReferences({
    required String channelId,
    required List<Message> messages,
    required Map<String, Message> embedded,
  }) {
    final missing = <({String channelId, String messageId})>[];
    for (final message in messages) {
      final reference = message.messageReference;
      if (reference == null || reference.isForward || message.isCrosspostCopy) {
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
        embedded: embedded,
      )) {
        continue;
      }
      missing.add((channelId: refChannelId, messageId: refMessageId));
    }
    return missing;
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
    if (reference != null &&
        reference.type != MessageReferenceType.forward &&
        (schema.flags & messageFlagIsCrosspost) == 0) {
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
    if (_recordDeleted(channelId, messageId)) {
      state = state.bumped();
    }
  }

  void onMessagesDeletedBulk({
    required String channelId,
    required Iterable<String> messageIds,
  }) {
    var changed = false;
    for (final messageId in messageIds) {
      if (_recordDeleted(channelId, messageId)) {
        changed = true;
      }
    }
    if (changed) {
      state = state.bumped();
    }
  }

  bool _recordDeleted(String channelId, String messageId) {
    final key = MessageReferencesState.key(channelId, messageId);
    final bool wasCached = state.cachedMessages.remove(key) != null;
    return state.deletedKeys.add(key) || wasCached;
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
        _inFlightKeys.contains(key) ||
        _retryTimers.containsKey(key)) {
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
          .getMessage(channelId, messageId);
      if (row != null) {
        _failedAttempts.remove(key);
        _setCachedMessage(Message.fromRow(row));
        return;
      }
      final message = await ref
          .read(messageRepositoryProvider)
          .fetchMessage(channelId: channelId, messageId: messageId);
      _failedAttempts.remove(key);
      _setCachedMessage(message);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        _failedAttempts.remove(key);
        _markDeleted(channelId, messageId);
      } else {
        _scheduleRetry(channelId: channelId, messageId: messageId);
      }
    } on Object {
      _scheduleRetry(channelId: channelId, messageId: messageId);
    } finally {
      _inFlightKeys.remove(key);
    }
  }

  void _scheduleRetry({required String channelId, required String messageId}) {
    if (!ref.mounted) {
      return;
    }
    final key = MessageReferencesState.key(channelId, messageId);
    final int attempt = (_failedAttempts[key] ?? 0) + 1;
    if (attempt >= _maxResolveAttempts) {
      _failedAttempts.remove(key);
      return;
    }
    _failedAttempts[key] = attempt;
    _retryTimers[key]?.cancel();
    _retryTimers[key] = Timer(Duration(seconds: 1 << (attempt - 1)), () {
      _retryTimers.remove(key);
      _scheduleResolve(channelId: channelId, messageId: messageId);
    });
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
    required Map<String, Message> embedded,
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
    final key = MessageReferencesState.key(refChannelId, refMessageId);
    return state.cachedMessages.containsKey(key) || embedded.containsKey(key);
  }

  bool _isDeleted(String channelId, String messageId) {
    return state.deletedKeys.contains(
      MessageReferencesState.key(channelId, messageId),
    );
  }

  void _markDeleted(String channelId, String messageId) {
    _recordDeleted(channelId, messageId);
    state = state.bumped();
  }

  void _setCachedMessage(Message message) {
    if (_cacheMessage(message.channelId, message.id, message)) {
      state = state.bumped();
    }
  }

  bool _cacheMessage(String channelId, String messageId, Message message) {
    final key = MessageReferencesState.key(channelId, messageId);
    if (state.deletedKeys.contains(key)) {
      return false;
    }
    final existing = state.cachedMessages[key];
    if (existing != null && _rendersSame(existing, message)) {
      return false;
    }
    state.cachedMessages[key] = message;
    return true;
  }

  bool _rendersSame(Message a, Message b) =>
      a.id == b.id &&
      a.content == b.content &&
      a.authorId == b.authorId &&
      a.editedTimestamp == b.editedTimestamp &&
      a.embeds.length == b.embeds.length &&
      a.attachments.length == b.attachments.length &&
      a.stickers.length == b.stickers.length &&
      a.messageSnapshots.length == b.messageSnapshots.length &&
      a.messageReference?.type == b.messageReference?.type;
}
