import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';

class ForumFirstMessages extends Notifier<Map<String, Message?>> {
  final Set<String> _requested = <String>{};
  final Map<String, ({String guildId, Set<String> ids})> _pending =
      <String, ({String guildId, Set<String> ids})>{};
  Timer? _flushTimer;

  @override
  Map<String, Message?> build() {
    final StreamSubscription<MessageRealtimeEvent> subscription = ref
        .watch(messageRealtimeBusProvider)
        .stream
        .listen(_onRealtimeEvent);
    ref.onDispose(() {
      _flushTimer?.cancel();
      unawaited(subscription.cancel());
    });
    return const <String, Message?>{};
  }

  void _onRealtimeEvent(MessageRealtimeEvent event) {
    switch (event) {
      case MessageUpdated(:final event):
        final Message? current = state[event.message.id];
        if (current != null && event.message.id == event.message.channelId) {
          put(
            current.applyGatewayUpdate(
              event.message,
              currentUserId: ref.read(currentUserIdProvider),
            ),
          );
        }
      case MessageDeleted(:final event):
        markDeleted(channelId: event.channelId, messageId: event.messageId);
      case MessageReactionsChanged(:final channelId, :final messageId):
        if (channelId == messageId && state[messageId] != null) {
          unawaited(_reloadStored(messageId));
        }
      case MessageCreated() || MessagesDeletedBulk():
        break;
    }
  }

  Future<void> _reloadStored(String messageId) async {
    final db.Message? row = await ref
        .read(fluxerDatabaseProvider)
        .messageDao
        .getMessage(messageId);
    if (row != null && ref.mounted && state[messageId] != null) {
      put(Message.fromRow(row));
    }
  }

  void request({
    required String guildId,
    required String forumId,
    required Iterable<String> postIds,
  }) {
    final Set<String> ids = <String>{
      for (final String id in postIds)
        if (!state.containsKey(id) && _requested.add(id)) id,
    };
    if (ids.isEmpty) {
      return;
    }
    final ({String guildId, Set<String> ids})? existing = _pending[forumId];
    _pending[forumId] = (
      guildId: guildId,
      ids: <String>{...?existing?.ids, ...ids},
    );
    _flushTimer ??= Timer(forumPostDataDebounce, _flush);
  }

  void _flush() {
    _flushTimer = null;
    final Map<String, ({String guildId, Set<String> ids})> batches =
        Map<String, ({String guildId, Set<String> ids})>.of(_pending);
    _pending.clear();
    for (final MapEntry<String, ({String guildId, Set<String> ids})> entry
        in batches.entries) {
      final List<String> ids = entry.value.ids.toList();
      for (int i = 0; i < ids.length; i += forumPostDataMaxIds) {
        unawaited(
          _fetch(
            guildId: entry.value.guildId,
            forumId: entry.key,
            postIds: ids.sublist(
              i,
              i + forumPostDataMaxIds > ids.length
                  ? ids.length
                  : i + forumPostDataMaxIds,
            ),
          ),
        );
      }
    }
  }

  Future<void> _fetch({
    required String guildId,
    required String forumId,
    required List<String> postIds,
  }) async {
    try {
      final Map<String, Message?> messages = await ref
          .read(forumRepositoryProvider)
          .fetchPostData(guildId: guildId, forumId: forumId, postIds: postIds);
      if (ref.mounted) {
        state = <String, Message?>{...state, ...messages};
      }
    } on Object catch (error) {
      _requested.removeAll(postIds);
      talker.warning('[Forum] Failed to load post data for $forumId: $error');
    }
  }

  void putAll(Map<String, Message> messages) {
    if (messages.isEmpty) {
      return;
    }
    state = <String, Message?>{...state, ...messages};
  }

  void put(Message message) {
    state = <String, Message?>{...state, message.channelId: message};
  }

  void applyUpdate(Message message) {
    if (message.id != message.channelId || !state.containsKey(message.id)) {
      return;
    }
    put(message);
  }

  void markDeleted({required String channelId, required String messageId}) {
    if (channelId != messageId || state[messageId] == null) {
      return;
    }
    state = <String, Message?>{...state, messageId: null};
  }

  void applyOwnReaction({
    required String postId,
    required String? emojiId,
    required String emojiName,
    required bool add,
  }) {
    final Message? message = state[postId];
    if (message == null) {
      return;
    }
    final List<Reaction> reactions = <Reaction>[];
    bool found = false;
    for (final Reaction reaction in message.reactions) {
      final bool same = emojiId != null
          ? reaction.emojiId == emojiId
          : reaction.emojiId == null && reaction.emoji == emojiName;
      if (!same) {
        reactions.add(reaction);
        continue;
      }
      found = true;
      if (add == reaction.hasReacted) {
        reactions.add(reaction);
        continue;
      }
      final int count = reaction.count + (add ? 1 : -1);
      if (count > 0) {
        reactions.add(
          Reaction(
            emoji: reaction.emoji,
            emojiId: reaction.emojiId,
            animated: reaction.animated,
            count: count,
            hasReacted: add,
          ),
        );
      }
    }
    if (!found && add) {
      reactions.add(
        Reaction(
          emoji: emojiName,
          emojiId: emojiId,
          count: 1,
          hasReacted: true,
        ),
      );
    }
    state = <String, Message?>{
      ...state,
      postId: message.copyWith(reactions: reactions),
    };
  }

  void clear() {
    _flushTimer?.cancel();
    _flushTimer = null;
    _pending.clear();
    _requested.clear();
    state = const <String, Message?>{};
  }
}

final NotifierProvider<ForumFirstMessages, Map<String, Message?>>
forumFirstMessagesProvider =
    NotifierProvider<ForumFirstMessages, Map<String, Message?>>(
      ForumFirstMessages.new,
    );
