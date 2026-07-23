import 'dart:async';
import 'dart:convert';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_permission_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/channels/providers/read_state_repository_provider.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_attachment_update.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_send_cancelled_exception.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_ack_gate.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/guild/guild_composer_access_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/channel_message_stream_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_frame_batcher.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_references_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/typing_sender.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_indicator_shake_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/chat/utils/channel_message_stream.dart';
import 'package:fluxer_app/features/chat/utils/client_nonce.dart';
import 'package:fluxer_app/features/chat/utils/client_system_message.dart';
import 'package:fluxer_app/features/chat/utils/composer_command.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/guild_composer_barrier_l10n.dart';
import 'package:fluxer_app/features/chat/utils/mention_reply_preference_utils.dart';
import 'package:fluxer_app/features/chat/utils/message_page_sync.dart';
import 'package:fluxer_app/features/chat/utils/message_send_failure_messages.dart';
import 'package:fluxer_app/features/chat/utils/uploading_attachment_utils.dart';
import 'package:fluxer_app/features/chat/utils/url_sanitization_utils.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/guild_member_prefetch.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_view_model.g.dart';

const _kPageSize = 30;
const _kInitialPageSize = 50;
const _kJumpToPresentPageSize = 50;
const Duration _kChannelNetworkRefreshTtl = Duration(seconds: 30);
const _kReadAckMinInterval = Duration(seconds: 1);
const _kDraftSaveDebounce = Duration(milliseconds: 400);
const _kJumpHighlightDuration = Duration(milliseconds: 2000);

enum _SendBlockReason {
  empty,
  noPermission,
  slowmode,
  channelNotReady,
  guildAccess,
}

class ChatViewState {
  static const _unset = Object();

  final String channelId;
  final List<Message> messages;
  final Message? replyingTo;
  final bool replyMentioning;
  final Message? editingMessage;
  final String messageText;
  final int scrollToBottomSignal;
  final (String messageId, int version)? scrollToMessageSignal;
  final String? stickyUnreadMessageId;
  final String? pendingAutoAckMessageId;
  final String? highlightedMessageId;
  final int jumpHighlightSequence;
  final String? revealedCollapsedGroupKey;
  final bool isLoading;
  final bool isSyncingMessages;
  final bool isLoadingMore;
  final bool isLoadingNewer;
  final bool hasMoreMessages;
  final bool hasMoreNewerMessages;
  final String? errorMessage;
  final bool messageLoadFailed;

  const ChatViewState({
    required this.channelId,
    required this.messages,
    required this.replyingTo,
    required this.replyMentioning,
    required this.editingMessage,
    required this.messageText,
    required this.scrollToBottomSignal,
    required this.isLoading,
    required this.isSyncingMessages,
    required this.isLoadingMore,
    required this.isLoadingNewer,
    required this.hasMoreMessages,
    required this.hasMoreNewerMessages,
    required this.errorMessage,
    this.messageLoadFailed = false,
    this.scrollToMessageSignal,
    this.stickyUnreadMessageId,
    this.pendingAutoAckMessageId,
    this.highlightedMessageId,
    this.jumpHighlightSequence = 0,
    this.revealedCollapsedGroupKey,
  });

  bool get canSend => messageText.trim().isNotEmpty;

  ChatViewState copyWith({
    String? channelId,
    List<Message>? messages,
    Object? replyingTo = _unset,
    bool? replyMentioning,
    Object? editingMessage = _unset,
    String? messageText,
    int? scrollToBottomSignal,
    Object? scrollToMessageSignal = _unset,
    Object? stickyUnreadMessageId = _unset,
    Object? pendingAutoAckMessageId = _unset,
    Object? highlightedMessageId = _unset,
    Object? revealedCollapsedGroupKey = _unset,
    int? jumpHighlightSequence,
    bool? isLoading,
    bool? isSyncingMessages,
    bool? isLoadingMore,
    bool? isLoadingNewer,
    bool? hasMoreMessages,
    bool? hasMoreNewerMessages,
    Object? errorMessage = _unset,
    bool? messageLoadFailed,
  }) {
    return ChatViewState(
      channelId: channelId ?? this.channelId,
      messages: messages ?? this.messages,
      replyingTo: replyingTo == _unset
          ? this.replyingTo
          : replyingTo as Message?,
      replyMentioning: replyMentioning ?? this.replyMentioning,
      editingMessage: editingMessage == _unset
          ? this.editingMessage
          : editingMessage as Message?,
      messageText: messageText ?? this.messageText,
      scrollToBottomSignal: scrollToBottomSignal ?? this.scrollToBottomSignal,
      scrollToMessageSignal: scrollToMessageSignal == _unset
          ? this.scrollToMessageSignal
          : scrollToMessageSignal as (String, int)?,
      stickyUnreadMessageId: stickyUnreadMessageId == _unset
          ? this.stickyUnreadMessageId
          : stickyUnreadMessageId as String?,
      pendingAutoAckMessageId: pendingAutoAckMessageId == _unset
          ? this.pendingAutoAckMessageId
          : pendingAutoAckMessageId as String?,
      highlightedMessageId: highlightedMessageId == _unset
          ? this.highlightedMessageId
          : highlightedMessageId as String?,
      revealedCollapsedGroupKey: revealedCollapsedGroupKey == _unset
          ? this.revealedCollapsedGroupKey
          : revealedCollapsedGroupKey as String?,
      jumpHighlightSequence:
          jumpHighlightSequence ?? this.jumpHighlightSequence,
      isLoading: isLoading ?? this.isLoading,
      isSyncingMessages: isSyncingMessages ?? this.isSyncingMessages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isLoadingNewer: isLoadingNewer ?? this.isLoadingNewer,
      hasMoreMessages: hasMoreMessages ?? this.hasMoreMessages,
      hasMoreNewerMessages: hasMoreNewerMessages ?? this.hasMoreNewerMessages,
      errorMessage: errorMessage == _unset
          ? this.errorMessage
          : errorMessage as String?,
      messageLoadFailed: messageLoadFailed ?? this.messageLoadFailed,
    );
  }
}

class _WindowContiguity {
  String? channelId;
  String? oldestId;
  String? newestId;
  bool verified = false;

  void setVerified(String channel, List<Message> page) {
    channelId = channel;
    if (page.isEmpty) {
      oldestId = null;
      newestId = null;
    } else {
      oldestId = page.first.id;
      newestId = page.last.id;
    }
    verified = true;
  }

  void extendOlder(String currentChannelId, String id) {
    if (channelId != currentChannelId) {
      return;
    }
    if (oldestId == null || compareSnowflakeIds(id, oldestId) < 0) {
      oldestId = id;
    }
  }

  void extendNewer(String currentChannelId, String id) {
    if (channelId != currentChannelId) {
      return;
    }
    if (newestId == null || compareSnowflakeIds(id, newestId) > 0) {
      newestId = id;
    }
  }

  void invalidate() {
    verified = false;
  }
}

@Riverpod(keepAlive: true)
class ChatViewModel extends _$ChatViewModel {
  StreamSubscription<MessageRealtimeEvent>? _eventsSub;
  final ChatReadAckGate _readAckGate = ChatReadAckGate(
    minInterval: _kReadAckMinInterval,
  );
  Timer? _readAckRetryTimer;
  bool _stickySnapshotArmed = false;
  Timer? _draftSaveTimer;
  Timer? _jumpHighlightTimer;
  final Set<String> _loadedUnreadBoundaryKeys = <String>{};
  final _WindowContiguity _contiguity = _WindowContiguity();
  bool _contiguityTrusted = false;
  void Function()? _removeReadAckStateListener;
  bool _autoAckEligible = false;
  int _foregroundResyncGeneration = 0;
  int _connectivityGapGeneration = 0;
  final Map<String, int> _lastReconciledGatewayGenerationByChannel =
      <String, int>{};
  final Map<String, int> _lastReconciledForegroundGenerationByChannel =
      <String, int>{};
  final Map<String, int> _lastReconciledConnectivityGapGenerationByChannel =
      <String, int>{};
  // Guards against duplicate sends when send is triggered repeatedly before an
  // in-flight send finishes its async preparation (e.g. while the app lags).
  bool _isPreparingSend = false;
  // Monotonically increasing token identifying the most recent switchChannel
  // call.
  int _channelSwitchGeneration = 0;
  final Map<String, Future<void>> _pendingDeleteFutures =
      <String, Future<void>>{};
  final Map<String, DateTime> _lastNetworkRefreshByChannel =
      <String, DateTime>{};
  MessageRealtimeFrameBatcher? _frameBatcher;

  @override
  ChatViewState build() {
    final bus = ref.watch(messageRealtimeBusProvider);
    unawaited(_eventsSub?.cancel());
    _frameBatcher?.dispose();
    _frameBatcher = MessageRealtimeFrameBatcher(
      onFlush: _onRealtimeEventsBatch,
    );
    _eventsSub = bus.stream.listen((MessageRealtimeEvent event) {
      _frameBatcher?.onEvent(event);
    });
    _removeReadAckStateListener?.call();
    _removeReadAckStateListener = listenSelf((_, _) {
      _syncReadAckEligibility(ref.read(chatReadViewportProvider));
    });
    ref
      ..listen<ChatReadViewportState>(
        chatReadViewportProvider,
        (_, next) => _syncReadAckEligibility(next),
      )
      ..listen<bool>(gatewayReadyProvider, (bool? previous, bool next) {
        if ((previous ?? false) && !next) {
          _connectivityGapGeneration++;
          _invalidateMessageCacheTrust();
        }
      })
      ..listen<int>(gatewaySessionRecoveryProvider, (int? previous, int next) {
        if (next <= 0 || previous == next) {
          return;
        }
        _invalidateMessageCacheTrust();
        _onSessionNeedsMessageResync();
      })
      ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
        if (previous == false && next) {
          _foregroundResyncGeneration++;
          _invalidateMessageCacheTrust();
          _onSessionNeedsMessageResync();
        }
      })
      ..onDispose(() {
        _readAckRetryTimer?.cancel();
        _draftSaveTimer?.cancel();
        _jumpHighlightTimer?.cancel();
        _frameBatcher?.dispose();
        unawaited(_eventsSub?.cancel());
      });
    return const ChatViewState(
      channelId: '',
      messages: [],
      replyingTo: null,
      replyMentioning: false,
      editingMessage: null,
      messageText: '',
      scrollToBottomSignal: 0,
      isLoading: false,
      isSyncingMessages: false,
      isLoadingMore: false,
      isLoadingNewer: false,
      hasMoreMessages: true,
      hasMoreNewerMessages: false,
      errorMessage: null,
    );
  }

  void _syncReadAckEligibility(ChatReadViewportState viewport) {
    final bool nextEligible =
        !state.isLoading &&
        !state.isSyncingMessages &&
        isAutoAckEligible(
          viewport: viewport,
          channelId: state.channelId,
          hasMoreNewerMessages: state.hasMoreNewerMessages,
        );
    final bool becameEligible = nextEligible && !_autoAckEligible;
    _autoAckEligible = nextEligible;
    if (becameEligible) {
      unawaited(ackCurrentChannel());
    } else if (!nextEligible) {
      _readAckRetryTimer?.cancel();
    }
  }

  void _onRealtimeEventsBatch(List<MessageRealtimeEvent> events) {
    if (events.length == 1) {
      unawaited(_onRealtimeEvent(events.first));
      return;
    }
    for (final MessageRealtimeEvent event in events) {
      _forwardRealtimeToMessageReferences(event);
    }
    unawaited(_applyRealtimeBatch(events));
  }

  Future<void> _applyRealtimeBatch(List<MessageRealtimeEvent> events) async {
    List<Message>? workingMessages = state.messages;
    var droppedOlder = false;
    var shouldAck = false;
    var clearSticky = false;
    String? ackWatermark;
    for (final MessageRealtimeEvent event in events) {
      if (event is! MessageCreated) {
        continue;
      }
      final List<Message>? next = await _nextMessagesFor(
        event,
        baseMessages: workingMessages,
      );
      if (next == null) {
        continue;
      }
      workingMessages = next;
      if (!state.hasMoreNewerMessages &&
          ref.read(chatReadViewportProvider).nearLoadedTail) {
        final MessageWindowTrim trim = trimMessageWindow(
          next,
          keepNewest: true,
        );
        workingMessages = trim.messages;
        droppedOlder = droppedOlder || trim.droppedOlder;
      }
      if (event.snapshot.acknowledgedByGateway) {
        final String messageId = event.event.message.id;
        if (compareSnowflakeIds(messageId, ackWatermark) > 0) {
          ackWatermark = messageId;
        }
      } else {
        shouldAck = true;
      }
      if (event.event.message.author.id == ref.read(currentUserIdProvider)) {
        clearSticky = true;
      }
    }
    if (workingMessages == null || identical(workingMessages, state.messages)) {
      if (clearSticky) {
        clearStickyUnread();
      }
      if (shouldAck) {
        unawaited(ackCurrentChannel());
      }
      return;
    }
    var pendingAutoAckMessageId = state.pendingAutoAckMessageId;
    if (compareSnowflakeIds(ackWatermark, pendingAutoAckMessageId) > 0) {
      pendingAutoAckMessageId = ackWatermark;
    }
    state = state.copyWith(
      messages: workingMessages,
      hasMoreMessages: droppedOlder || state.hasMoreMessages,
      pendingAutoAckMessageId: pendingAutoAckMessageId,
    );
    if (clearSticky) {
      clearStickyUnread();
    }
    if (shouldAck) {
      unawaited(ackCurrentChannel());
    }
  }

  Future<void> _onRealtimeEvent(MessageRealtimeEvent ev) async {
    _forwardRealtimeToMessageReferences(ev);
    final next = await _nextMessagesFor(ev);
    final Set<String> deletedIds = _deletedMessageIdsFor(ev);
    final bool clearEditing =
        ev is MessageUpdated && state.editingMessage?.id == ev.event.message.id;
    final bool clearComposerForDelete =
        deletedIds.isNotEmpty &&
        ((state.replyingTo != null &&
                deletedIds.contains(state.replyingTo!.id)) ||
            (state.editingMessage != null &&
                deletedIds.contains(state.editingMessage!.id)));
    if (next != null) {
      var nextMessages = next;
      var droppedOlder = false;
      if (ev is MessageCreated &&
          !state.hasMoreNewerMessages &&
          ref.read(chatReadViewportProvider).nearLoadedTail) {
        final trim = trimMessageWindow(next, keepNewest: true);
        nextMessages = trim.messages;
        droppedOlder = trim.droppedOlder;
      }
      var pendingAutoAckMessageId = state.pendingAutoAckMessageId;
      if (ev is MessageCreated &&
          ev.snapshot.acknowledgedByGateway &&
          compareSnowflakeIds(ev.event.message.id, pendingAutoAckMessageId) >
              0) {
        pendingAutoAckMessageId = ev.event.message.id;
      }
      state = state.copyWith(
        messages: nextMessages,
        editingMessage: clearEditing || clearComposerForDelete
            ? null
            : state.editingMessage,
        messageText: clearEditing || clearComposerForDelete
            ? ''
            : state.messageText,
        replyingTo: clearComposerForDelete ? null : state.replyingTo,
        replyMentioning: !clearComposerForDelete && state.replyMentioning,
        hasMoreMessages: droppedOlder || state.hasMoreMessages,
        pendingAutoAckMessageId: pendingAutoAckMessageId,
      );
      if (clearComposerForDelete) {
        unawaited(_flushComposerDraftSave());
      }
      if (ev is MessageCreated) {
        if (ev.event.message.author.id == ref.read(currentUserIdProvider)) {
          clearStickyUnread();
        }
        if (!ev.snapshot.acknowledgedByGateway) {
          unawaited(ackCurrentChannel());
        }
      }
    } else if (clearEditing || clearComposerForDelete) {
      state = state.copyWith(
        editingMessage: null,
        messageText: '',
        replyingTo: clearComposerForDelete ? null : state.replyingTo,
        replyMentioning: !clearComposerForDelete && state.replyMentioning,
      );
      if (clearComposerForDelete) {
        unawaited(_flushComposerDraftSave());
      }
    }
  }

  void _forwardRealtimeToMessageReferences(MessageRealtimeEvent ev) {
    final notifier = ref.read(messageReferencesProvider.notifier);
    switch (ev) {
      case MessageCreated(:final event):
        notifier.onMessageCreated(event.message);
      case MessageUpdated(:final event):
        notifier.onMessageUpdated(event.message);
      case MessageDeleted(:final event):
        notifier.onMessageDeleted(
          channelId: event.channelId,
          messageId: event.messageId,
        );
      case MessagesDeletedBulk(:final event):
        notifier.onMessagesDeletedBulk(
          channelId: event.channelId,
          messageIds: event.ids,
        );
      case MessageReactionsChanged():
        break;
    }
  }

  void _notifyMessageReferencesLoaded({
    required String channelId,
    required List<Message> messages,
    List<Message> embeddedReplyParents = const [],
  }) {
    ref
        .read(messageReferencesProvider.notifier)
        .onMessagesLoaded(
          channelId: channelId,
          messages: messages,
          embeddedReplyParents: embeddedReplyParents,
        );
  }

  Future<void> _hydrateGuildMembersForMessages(
    String channelId,
    List<Message> messages, {
    List<Message> embeddedReplyParents = const <Message>[],
  }) async {
    if (messages.isEmpty) {
      return;
    }
    final db.Channel? channel = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(channelId);
    final String? guildId = channel?.guildId;
    if (guildId == null || guildId.isEmpty) {
      return;
    }
    await hydrateGuildMembersForMessages(
      ref: ref,
      guildId: guildId,
      messages: messages,
      embeddedReplyParents: embeddedReplyParents,
    );
  }

  Future<void> _onMessageBatchLoaded({
    required String channelId,
    required List<Message> messages,
    List<Message> embeddedReplyParents = const <Message>[],
  }) async {
    await _hydrateGuildMembersForMessages(
      channelId,
      messages,
      embeddedReplyParents: embeddedReplyParents,
    );
    _notifyMessageReferencesLoaded(
      channelId: channelId,
      messages: messages,
      embeddedReplyParents: embeddedReplyParents,
    );
  }

  Set<String> _deletedMessageIdsFor(MessageRealtimeEvent ev) {
    return switch (ev) {
      MessageDeleted(:final event) => {event.messageId},
      MessagesDeletedBulk(:final event) => event.ids.toSet(),
      _ => const {},
    };
  }

  Future<List<Message>?> _nextMessagesFor(
    MessageRealtimeEvent ev, {
    List<Message>? baseMessages,
  }) async {
    final List<Message> messages = baseMessages ?? state.messages;
    switch (ev) {
      case MessageCreated(:final event, :final snapshot):
        if (event.message.channelId != state.channelId) {
          return null;
        }
        final Message msg = _toDomain(
          event.message,
        ).copyWith(isMentioned: snapshot.mentionsCurrentUser);
        int matchedIndex = messages.indexWhere(
          (m) =>
              m.clientNonce != null &&
              msg.clientNonce != null &&
              m.clientNonce == msg.clientNonce,
        );
        if (matchedIndex == -1) {
          matchedIndex = _findOptimisticMatchForDelivered(msg);
        }
        if (matchedIndex != -1) {
          final Message existing = messages[matchedIndex];
          if (existing.id == msg.id &&
              existing.deliveryState == MessageDeliveryState.sent) {
            return null;
          }
          final List<Message> updated = List<Message>.from(messages);
          updated[matchedIndex] = msg.copyWith(
            deliveryState: MessageDeliveryState.sent,
            sendError: null,
          );
          return updated;
        }
        if (messages.any((Message m) => m.id == msg.id)) {
          return null;
        }
        if (state.hasMoreNewerMessages) {
          return null;
        }
        _contiguity.extendNewer(state.channelId, msg.id);
        return <Message>[...messages, msg];
      case MessageUpdated(:final event):
        if (event.message.channelId != state.channelId) {
          return null;
        }
        final String messageId = event.message.id;
        final int idx = state.messages.indexWhere((m) => m.id == messageId);
        final String? currentUserId = ref.read(currentUserIdProvider);
        if (idx != -1) {
          final Message merged = state.messages[idx].applyGatewayUpdate(
            event.message,
            currentUserId: currentUserId,
          );
          return _replaceById(state.messages, merged);
        }
        if (!_isMessageInLoadedWindow(messageId)) {
          return null;
        }
        final row = await ref
            .read(fluxerDatabaseProvider)
            .messageDao
            .getMessage(messageId);
        if (row == null) {
          return null;
        }
        return _replaceById(state.messages, Message.fromRow(row));
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

  bool _isMessageInLoadedWindow(String messageId) {
    if (state.messages.isEmpty) {
      return false;
    }
    final String oldestId = state.messages.first.id;
    final String newestId = state.messages.last.id;
    return compareSnowflakeIds(messageId, oldestId) >= 0 &&
        compareSnowflakeIds(messageId, newestId) <= 0;
  }

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

  Future<void> _flushComposerDraftSave() async {
    _draftSaveTimer?.cancel();
    _draftSaveTimer = null;
    await _persistComposerDraft();
  }

  void _scheduleComposerDraftSave() {
    if (state.editingMessage != null || state.channelId.isEmpty) {
      return;
    }
    _draftSaveTimer?.cancel();
    _draftSaveTimer = Timer(_kDraftSaveDebounce, () {
      unawaited(_persistComposerDraft());
    });
  }

  Future<void> _persistComposerDraft() async {
    if (state.editingMessage != null || state.channelId.isEmpty) {
      return;
    }
    await _persistComposerDraftForChannel(
      channelId: state.channelId,
      content: state.messageText,
      reply: state.replyingTo,
    );
  }

  Future<void> _persistComposerDraftForChannel({
    required String channelId,
    required String content,
    Message? reply,
  }) async {
    if (channelId.isEmpty) {
      return;
    }
    final String sanitizedContent = stripPrivateUseCharacters(content);
    final String? replyId = reply?.id;
    final bool hasDraft = sanitizedContent.isNotEmpty || replyId != null;
    final dao = ref.read(fluxerDatabaseProvider).composerDraftDao;
    if (!hasDraft) {
      await dao.deleteDraft(channelId);
      return;
    }
    await dao.upsertDraft(
      channelId: channelId,
      content: sanitizedContent,
      replyToMessageId: replyId,
    );
  }

  Future<({String text, Message? reply})> _loadComposerDraft(
    String channelId,
  ) async {
    final row = await ref
        .read(fluxerDatabaseProvider)
        .composerDraftDao
        .getDraft(channelId);
    if (row == null) {
      return (text: '', reply: null);
    }
    final messageDao = ref.read(fluxerDatabaseProvider).messageDao;
    Message? reply;
    if (row.replyToMessageId != null) {
      final db.Message? dbMsg = await messageDao.getMessage(
        row.replyToMessageId!,
      );
      reply = dbMsg == null ? null : Message.fromRow(dbMsg);
    }
    return (text: stripPrivateUseCharacters(row.content), reply: reply);
  }

  Future<void> _restoreComposerDraftFromDb() async {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    final draft = await _loadComposerDraft(channelId);
    final bool replyMentioning =
        !(draft.reply == null) &&
        await _defaultReplyMentionFor(
          message: draft.reply!,
          channelId: channelId,
        );
    state = state.copyWith(
      messageText: draft.text,
      replyingTo: draft.reply,
      replyMentioning: replyMentioning,
    );
  }

  ChatViewState _switchedChannelState({
    required String channelId,
    required List<Message> messages,
    required ({String text, Message? reply}) draft,
    required bool replyMentioning,
    required int scrollToBottomSignal,
    required bool isLoading,
    required bool isSyncingMessages,
    required bool isLoadingMore,
    required bool isLoadingNewer,
    required bool hasMoreMessages,
    required bool hasMoreNewerMessages,
    String? errorMessage,
  }) {
    _jumpHighlightTimer?.cancel();
    _jumpHighlightTimer = null;
    return ChatViewState(
      channelId: channelId,
      messages: messages,
      replyingTo: draft.reply,
      replyMentioning: replyMentioning,
      editingMessage: null,
      messageText: draft.text,
      scrollToBottomSignal: scrollToBottomSignal,
      isLoading: isLoading,
      isSyncingMessages: isSyncingMessages,
      isLoadingMore: isLoadingMore,
      isLoadingNewer: isLoadingNewer,
      hasMoreMessages: hasMoreMessages,
      hasMoreNewerMessages: hasMoreNewerMessages,
      errorMessage: errorMessage,
      jumpHighlightSequence: state.jumpHighlightSequence,
    );
  }

  void setCollapsedGroupRevealed(String? groupKey) {
    final String? current = state.revealedCollapsedGroupKey;
    if (groupKey != null && groupKey == current) {
      state = state.copyWith(revealedCollapsedGroupKey: null);
      return;
    }
    state = state.copyWith(revealedCollapsedGroupKey: groupKey);
  }

  void _revealCollapsedGroupForMessageIfNeeded(String messageId) {
    final String? groupKey = getCollapsedMessageGroupKey(
      messages: state.messages,
      messageId: messageId,
      context: ref.read(channelCollapseContextProvider),
    );
    if (groupKey == null) {
      return;
    }
    state = state.copyWith(revealedCollapsedGroupKey: groupKey);
  }

  void highlightJumpMessage(String messageId) {
    talker.debug('[ChatViewModel] highlightJumpMessage $messageId');
    _jumpHighlightTimer?.cancel();
    _jumpHighlightTimer = null;
    final int sequence = state.jumpHighlightSequence + 1;
    state = state.copyWith(
      highlightedMessageId: messageId,
      jumpHighlightSequence: sequence,
    );
  }

  void extendJumpHighlight(String messageId) {
    if (state.highlightedMessageId != messageId) {
      return;
    }
    _scheduleJumpHighlightClear(
      messageId: messageId,
      sequence: state.jumpHighlightSequence,
    );
  }

  void _scheduleJumpHighlightClear({
    required String messageId,
    required int sequence,
  }) {
    _jumpHighlightTimer?.cancel();
    _jumpHighlightTimer = Timer(_kJumpHighlightDuration, () {
      if (state.highlightedMessageId == messageId &&
          state.jumpHighlightSequence == sequence) {
        state = state.copyWith(highlightedMessageId: null);
      }
      _jumpHighlightTimer = null;
    });
  }

  Future<void> switchChannel(
    String channelId, {
    String? targetMessageId,
    bool loadMessages = true,
  }) async {
    talker.debug(
      '[ChatViewModel] switchChannel channel=$channelId '
      'target=$targetMessageId load=$loadMessages',
    );
    final Stopwatch switchStopwatch = Stopwatch()..start();
    if (state.channelId == channelId &&
        targetMessageId != null &&
        state.isLoading) {
      return;
    }
    if (state.channelId == channelId &&
        targetMessageId == null &&
        loadMessages &&
        (state.isLoading || state.isSyncingMessages)) {
      return;
    }
    final int switchGeneration = ++_channelSwitchGeneration;
    bool isCurrentSwitch() => switchGeneration == _channelSwitchGeneration;
    try {
      final String? currentUserId = ref.read(currentUserIdProvider);
      if (isPersonalNotesChannelRoute(
        channelId: channelId,
        currentUserId: currentUserId,
      )) {
        await ref
            .read(dmRepositoryProvider)
            .ensurePersonalNotesChannel(channelId);
        if (!isCurrentSwitch()) {
          return;
        }
      }
      ref.read(chatReadViewportProvider.notifier).setActiveChannel(channelId);
      if (loadMessages) {
        _stickySnapshotArmed = true;
      }
      final String previousChannelId = state.channelId;
      final bool isChannelChange =
          previousChannelId.isNotEmpty && previousChannelId != channelId;
      if (isChannelChange) {
        _contiguity.invalidate();
        final String previousText = state.messageText;
        final Message? previousReply = state.replyingTo;
        _draftSaveTimer?.cancel();
        _draftSaveTimer = null;
        _readAckRetryTimer?.cancel();
        _clearManualUnread(previousChannelId);
        _clearLoadedUnreadBoundaryKeys(previousChannelId);
        ref
            .read(messageReferencesProvider.notifier)
            .clearChannel(previousChannelId);
        unawaited(
          _persistComposerDraftForChannel(
            channelId: previousChannelId,
            content: previousText,
            reply: previousReply,
          ),
        );
      }
      final draft = await _loadComposerDraft(channelId);
      if (!isCurrentSwitch()) {
        return;
      }
      final bool replyMentioning;
      if (draft.reply == null) {
        replyMentioning = false;
      } else {
        replyMentioning = await _defaultReplyMentionFor(
          message: draft.reply!,
          channelId: channelId,
        );
        if (!isCurrentSwitch()) {
          return;
        }
      }
      if (!loadMessages) {
        state = _switchedChannelState(
          channelId: channelId,
          messages: isChannelChange ? const [] : state.messages,
          draft: draft,
          replyMentioning: replyMentioning,
          scrollToBottomSignal: state.scrollToBottomSignal,
          isLoading: false,
          isSyncingMessages: false,
          isLoadingMore: false,
          isLoadingNewer: false,
          hasMoreMessages: isChannelChange || state.hasMoreMessages,
          hasMoreNewerMessages: !isChannelChange && state.hasMoreNewerMessages,
        );
        return;
      }
      if (targetMessageId != null) {
        if (state.channelId == channelId &&
            state.isLoading &&
            !isChannelChange) {
          talker.debug(
            '[ChatViewModel] target load already in progress channel=$channelId',
          );
          return;
        }
        if (state.channelId == channelId &&
            !isChannelChange &&
            !state.isLoading &&
            !state.isSyncingMessages &&
            state.messages.any((Message m) => m.id == targetMessageId)) {
          talker.debug(
            '[ChatViewModel] target already in memory channel=$channelId '
            'target=$targetMessageId',
          );
          highlightJumpMessage(targetMessageId);
          scrollToMessage(targetMessageId);
          return;
        }
        state = _switchedChannelState(
          channelId: channelId,
          messages: const [],
          draft: draft,
          replyMentioning: replyMentioning,
          scrollToBottomSignal: state.scrollToBottomSignal,
          isLoading: true,
          isSyncingMessages: false,
          isLoadingMore: false,
          isLoadingNewer: false,
          hasMoreMessages: true,
          hasMoreNewerMessages: false,
        );
        highlightJumpMessage(targetMessageId);
        await _loadMessages(
          channelId,
          targetMessageId: targetMessageId,
          shouldApplyResult: isCurrentSwitch,
        );
        if (isCurrentSwitch() && state.channelId == channelId) {
          talker.debug(
            '[ChatViewModel] target loaded; scrollToMessage '
            'channel=$channelId target=$targetMessageId',
          );
          scrollToMessage(targetMessageId);
        } else {
          talker.debug(
            '[ChatViewModel] target load superseded; skip scroll '
            'channel=$channelId target=$targetMessageId',
          );
        }
        return;
      }
      if (state.channelId == channelId &&
          (state.isLoading || state.isSyncingMessages) &&
          !isChannelChange) {
        return;
      }
      // A reveal round-trip or same-channel resync must not rebuild an
      // already-loaded window: keep the pagination position and let the live
      // tail machinery keep it current.
      if (!isChannelChange &&
          state.messages.isNotEmpty &&
          !state.messageLoadFailed) {
        if (!_messagesNeedResync(channelId)) {
          return;
        }
        state = state.copyWith(isSyncingMessages: true);
        unawaited(
          _refreshMessagesFromNetwork(
            channelId,
            limit: _kInitialPageSize,
            shouldApplyResult: isCurrentSwitch,
            isDirectLatestLoad: false,
            preserveLoadedWindow: true,
          ).whenComplete(() {
            if (!ref.mounted) {
              return;
            }
            if (isCurrentSwitch() && state.channelId == channelId) {
              _markMessagesReconciled(channelId);
            }
          }),
        );
        return;
      }
      final repo = ref.read(messageRepositoryProvider);
      final cached = await repo.getCachedMessages(channelId);
      if (!isCurrentSwitch()) {
        return;
      }
      final hasUnread = await _channelHasNewUnreadMessages(channelId);
      if (!isCurrentSwitch()) {
        return;
      }
      if (cached.isNotEmpty && !hasUnread) {
        final bool willRefresh = _shouldRefreshChannelFromNetwork(channelId);
        state = _switchedChannelState(
          channelId: channelId,
          messages: willRefresh ? const [] : cached,
          draft: draft,
          replyMentioning: replyMentioning,
          scrollToBottomSignal: state.scrollToBottomSignal,
          isLoading: willRefresh,
          isSyncingMessages: false,
          isLoadingMore: false,
          isLoadingNewer: false,
          hasMoreMessages: cached.length >= _kPageSize,
          hasMoreNewerMessages: false,
        );
        _invalidateMessageCacheTrust();
        if (!willRefresh) {
          _deferMessageReferencesLoaded(channelId: channelId, messages: cached);
        }
        if (willRefresh) {
          unawaited(
            _refreshMessagesFromNetwork(
              channelId,
              limit: _kInitialPageSize,
              isDirectLatestLoad: true,
              shouldApplyResult: isCurrentSwitch,
            ).whenComplete(() {
              if (!ref.mounted) {
                return;
              }
              if (isCurrentSwitch() && state.channelId == channelId) {
                _markMessagesReconciled(channelId);
              }
            }),
          );
        }
        return;
      }
      state = _switchedChannelState(
        channelId: channelId,
        messages: const [],
        draft: draft,
        replyMentioning: replyMentioning,
        scrollToBottomSignal: state.scrollToBottomSignal,
        isLoading: true,
        isSyncingMessages: false,
        isLoadingMore: false,
        isLoadingNewer: false,
        hasMoreMessages: true,
        hasMoreNewerMessages: false,
      );
      String? aroundUnreadId;
      if (hasUnread) {
        final db.ReadState? unreadReadState = await ref
            .read(fluxerDatabaseProvider)
            .readStateDao
            .getReadState(channelId);
        if (!isCurrentSwitch()) {
          return;
        }
        final String? ack = unreadReadState?.lastMessageId;
        if (ack != null && ack.isNotEmpty) {
          aroundUnreadId = ack;
        }
      }
      await _refreshMessagesFromNetwork(
        channelId,
        showLoadingSpinner: true,
        limit: _kInitialPageSize,
        aroundMessageId: aroundUnreadId,
        isDirectLatestLoad: aroundUnreadId == null,
        shouldApplyResult: isCurrentSwitch,
      );
    } finally {
      debugPrint(
        '[ChatViewModel] switchChannel($channelId) completed in '
        '${switchStopwatch.elapsedMilliseconds}ms',
      );
    }
  }

  void _deferMessageReferencesLoaded({
    required String channelId,
    required List<Message> messages,
    List<Message>? embeddedReplyParents,
  }) {
    scheduleMicrotask(() async {
      if (state.channelId != channelId) {
        return;
      }
      await _onMessageBatchLoaded(
        channelId: channelId,
        messages: messages,
        embeddedReplyParents: embeddedReplyParents ?? const <Message>[],
      );
    });
  }

  /// Refreshes the open channel after gateway READY/RESUMED without navigation
  Future<void> refreshAfterSessionRecovery() async {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    if (state.isLoading || state.isSyncingMessages) {
      return;
    }
    await _reconcileCurrentChannelFromNetwork();
  }

  Future<void> _reconcileCurrentChannelFromNetwork() async {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    if (state.isLoading || state.isSyncingMessages) {
      return;
    }
    _lastNetworkRefreshByChannel.remove(channelId);
    state = state.copyWith(isSyncingMessages: true);
    try {
      await _refreshMessagesFromNetwork(
        channelId,
        limit: _kInitialPageSize,
        isDirectLatestLoad: false,
        preserveLoadedWindow: state.messages.isNotEmpty,
      );
      if (state.channelId == channelId) {
        _markMessagesReconciled(channelId);
      }
    } finally {
      if (state.channelId == channelId && state.isSyncingMessages) {
        state = state.copyWith(isSyncingMessages: false);
      }
    }
  }

  void _onSessionNeedsMessageResync() {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    _lastNetworkRefreshByChannel.remove(channelId);
    unawaited(_reconcileCurrentChannelFromNetwork());
  }

  Future<void> _loadMessages(
    String channelId, {
    String? targetMessageId,
    bool Function()? shouldApplyResult,
  }) async {
    await _refreshMessagesFromNetwork(
      channelId,
      targetMessageId: targetMessageId,
      isDirectLatestLoad: false,
      showLoadingSpinner: true,
      shouldApplyResult: shouldApplyResult,
    );
  }

  Future<void> _refreshMessagesFromNetwork(
    String channelId, {
    required bool isDirectLatestLoad,
    String? targetMessageId,
    String? aroundMessageId,
    bool showLoadingSpinner = false,
    int limit = _kPageSize,
    bool Function()? shouldApplyResult,
    bool preserveLoadedWindow = false,
  }) async {
    bool shouldApply() => shouldApplyResult?.call() ?? true;
    if (showLoadingSpinner) {
      if (!shouldApply()) {
        return;
      }
      state = state.copyWith(
        isLoading: true,
        isSyncingMessages: false,
        errorMessage: null,
        messageLoadFailed: false,
      );
    }
    try {
      final String? effectiveAroundMessageId =
          targetMessageId ?? aroundMessageId;
      final int effectiveLimit = limit;
      final repo = ref.read(messageRepositoryProvider);
      MessageListLoadResult page;
      if (preserveLoadedWindow &&
          state.messages.isNotEmpty &&
          effectiveAroundMessageId == null) {
        final List<VisibleWindowReconcileParams> windowParamsList =
            reconcileParamsListForVisibleWindow(window: state.messages);
        if (windowParamsList.isNotEmpty) {
          page = await _loadReconcilePages(
            repo: repo,
            channelId: channelId,
            paramsList: windowParamsList,
          );
        } else {
          page = await repo.loadMessagePage(
            channelId: channelId,
            limit: effectiveLimit,
          );
        }
      } else {
        page = await repo.loadMessagePage(
          channelId: channelId,
          around: effectiveAroundMessageId,
          limit: effectiveLimit,
        );
      }
      if (state.channelId != channelId || !shouldApply()) {
        return;
      }
      if (preserveLoadedWindow &&
          !networkPageOverlapsWindow(
            window: state.messages,
            networkPage: page.messages,
          )) {
        // Keep a detached window intact. Pagination or jump-to-present reaches
        // the gap without presenting disjoint ranges as contiguous.
        state = state.copyWith(
          isLoading: false,
          isSyncingMessages: false,
          hasMoreNewerMessages: true,
          errorMessage: null,
          messageLoadFailed: false,
        );
        return;
      }
      final String? syncBaselineOldestId = state.messages.isEmpty
          ? null
          : state.messages.first.id;
      final List<Message> merged = preserveLoadedWindow
          ? reconcileStaleDeletionsInLoadedWindow(
              current: state.messages,
              networkPage: page.messages,
            )
          : reconcileMessagesWithNetworkPage(
              current: state.messages,
              networkPage: page.messages,
              syncBaselineOldestId: syncBaselineOldestId,
            );
      final String? mergedServerTailId = newestServerBackedMessageId(merged);
      // Only direct latest-page loads can prove that a short page reaches the
      // live tail. Reconcile and around-window pages must still consult the
      // channel pointer so detached windows remain detached.
      final bool shouldConsultPointer =
          !isDirectLatestLoad || page.messages.length >= limit;
      final bool isSealedLatestTail =
          isDirectLatestLoad && page.messages.length < effectiveLimit;
      final bool hasMoreNewer =
          shouldConsultPointer &&
          mergedServerTailId != null &&
          await _hasNewerMessagesThanChannel(
            mergedServerTailId,
            sealedTail: isSealedLatestTail,
            knownLoadedMessageIds: merged
                .map((Message message) => message.id)
                .toSet(),
          );
      if (state.channelId != channelId || !shouldApply()) {
        return;
      }
      await _hydrateGuildMembersForMessages(
        channelId,
        merged,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      if (state.channelId != channelId || !shouldApply()) {
        return;
      }
      // Around pages are split before/after the anchor; near the live tail they
      // can be shorter than [limit] while older history still exists.
      final bool hasMoreOlder = preserveLoadedWindow
          ? state.hasMoreMessages
          : page.messages.length >= effectiveLimit ||
                (effectiveAroundMessageId != null && page.messages.isNotEmpty);
      state = state.copyWith(
        messages: merged,
        isLoading: false,
        isSyncingMessages: false,
        hasMoreMessages: hasMoreOlder,
        hasMoreNewerMessages: hasMoreNewer,
        errorMessage: null,
        messageLoadFailed: false,
      );
      if (!preserveLoadedWindow) {
        _contiguity.setVerified(channelId, page.messages);
      }
      _contiguityTrusted = true;
      _notifyMessageReferencesLoaded(
        channelId: channelId,
        messages: merged,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      if (targetMessageId == null) {
        _markChannelNetworkRefresh(channelId);
        _markMessagesReconciled(channelId);
        await _onMessagesLoaded(channelId);
        if (isDirectLatestLoad && page.messages.length < effectiveLimit) {
          await _reconcileReadStateAfterLatestLoad(channelId);
        }
      }
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to load messages: $e');
      if (state.channelId != channelId || !shouldApply()) {
        return;
      }
      final bool hasCachedMessages = state.messages.isNotEmpty;
      state = state.copyWith(
        isLoading: false,
        isSyncingMessages: false,
        messageLoadFailed: !hasCachedMessages,
        errorMessage: hasCachedMessages ? 'Failed to sync messages' : null,
      );
    }
  }

  Future<MessageListLoadResult> _loadReconcilePages({
    required MessageRepository repo,
    required String channelId,
    required List<VisibleWindowReconcileParams> paramsList,
  }) async {
    List<Message> networkMessages = const <Message>[];
    List<Message> embeddedReplyParents = const <Message>[];
    for (final VisibleWindowReconcileParams params in paramsList) {
      final MessageListLoadResult result = await repo.loadMessagePage(
        channelId: channelId,
        around: params.aroundId,
        limit: params.limit,
      );
      networkMessages = mergeMessagesSorted(networkMessages, result.messages);
      embeddedReplyParents = mergeMessagesSorted(
        embeddedReplyParents,
        result.embeddedReplyParents,
      );
    }
    return MessageListLoadResult(
      messages: networkMessages,
      embeddedReplyParents: embeddedReplyParents,
    );
  }

  Future<bool> _channelHasNewUnreadMessages(String channelId) async {
    final database = ref.read(fluxerDatabaseProvider);
    final currentUserId = ref.read(currentUserIdProvider);
    final channel = await database.channelDao.getChannelById(channelId);
    final readState = await database.readStateDao.getReadState(channelId);
    if (readState?.manual ?? false) {
      return true;
    }
    final stickyUnreadId = readState?.stickyUnreadMessageId;
    if (stickyUnreadId != null && stickyUnreadId.isNotEmpty) {
      return true;
    }
    final latestMessageId = await resolveLatestMessageIdForUnreadDisplay(
      database,
      channelId,
      channelLastMessageId: channel?.lastMessageId,
      ackLastMessageId: readState?.lastMessageId,
      mentionCount: readState?.mentionCount ?? 0,
    );
    final rawMentionCount = readState?.mentionCount ?? 0;
    if (rawMentionCount > 0) {
      return true;
    }
    final fallbackAckMs = channel == null
        ? snowflakeTimestampMs(channelId)
        : await guildChannelFallbackAckMs(
            database: database,
            channel: channel,
            currentUserId: currentUserId,
          );
    final hasUnreadMessage = hasUnreadByReadState(
      channelLastMessageId: latestMessageId,
      ackLastMessageId: readState?.lastMessageId,
      fallbackAckMs: fallbackAckMs,
      mentionCount: 0,
      isGuildChannel: channel != null,
    );
    if (!hasUnreadMessage) {
      return false;
    }
    if (channel == null) {
      return true;
    }
    final guildSettings = await database.userGuildSettingsDao.getByGuildId(
      channel.guildId,
    );
    final unreadSettings = resolveUnreadSettings(
      channel: channel,
      guildSettings: guildSettings == null
          ? null
          : decodeUserGuildSettings(guildSettings.data),
      now: DateTime.now(),
    );
    return unreadSettings.allowsMessageUnread;
  }

  Future<void> _onMessagesLoaded(String channelId) async {
    if (state.channelId != channelId) {
      return;
    }
    final readState = await ref
        .read(fluxerDatabaseProvider)
        .readStateDao
        .getReadState(channelId);
    final unreadId = _firstUnreadForCurrentMessages(readState: readState);
    // Record the sticky divider anchor only. MessageList scrolls the divider
    // to the viewport top on first render of an unread channel (web parity).
    if (unreadId != null) {
      if (state.channelId == channelId) {
        state = state.copyWith(stickyUnreadMessageId: unreadId);
      }
      return;
    }
  }

  Future<void> _reconcileReadStateAfterLatestLoad(String channelId) async {
    if (state.channelId != channelId || !ref.mounted) {
      return;
    }
    final repository = ref.read(readStateRepositoryProvider);
    await repository.recomputeMentionsAfterBackfill(
      channelId: channelId,
      currentUserId: ref.read(currentUserIdProvider),
      allowDecrease: true,
    );
    if (state.channelId != channelId || !ref.mounted) {
      return;
    }
    final database = ref.read(fluxerDatabaseProvider);
    final readState = await database.readStateDao.getReadState(channelId);
    if ((readState?.mentionCount ?? 0) > 0 || (readState?.manual ?? false)) {
      return;
    }
    final ackMessageId = readState?.lastMessageId;
    if (ackMessageId == null || ackMessageId.isEmpty) {
      return;
    }
    final messagesAfterAck = await database.messageDao.getMessagesAfter(
      channelId,
      ackMessageId,
      limit: 1,
    );
    if (messagesAfterAck.isNotEmpty) {
      return;
    }
    await repository.applyLocalAckLatest(channelId);
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore ||
        !state.hasMoreMessages ||
        state.messages.isEmpty) {
      return;
    }

    final String channelId = state.channelId;
    final String requestedBeforeId = state.messages.first.id;
    state = state.copyWith(isLoadingMore: true);
    try {
      final repo = ref.read(messageRepositoryProvider);
      talker.debug('[ChatPagination] older request oldest=$requestedBeforeId');
      if (_contiguityTrusted &&
          !_messagesNeedResync(channelId) &&
          _contiguity.verified &&
          _contiguity.channelId == channelId &&
          canServeOlderFromCache(
            windowOldestId: requestedBeforeId,
            contigOldestId: _contiguity.oldestId,
          )) {
        final cachedPage = await repo.getCachedMessagesBefore(
          channelId,
          requestedBeforeId,
        );
        if (state.channelId != channelId) {
          return;
        }
        final olderInRange = cachedPage
            .where((m) => compareSnowflakeIds(m.id, _contiguity.oldestId) >= 0)
            .toList();
        if (olderInRange.isNotEmpty) {
          final WindowPageResult result = applyOlderPage(
            window: MessageWindowSnapshot(
              messages: state.messages,
              hasMoreOlder: state.hasMoreMessages,
              hasMoreNewer: state.hasMoreNewerMessages,
            ),
            page: olderInRange,
            requestedBeforeId: requestedBeforeId,
            pageIndicatesMoreOlder: true,
          );
          switch (result) {
            case WindowPageSuperseded():
              talker.debug('[ChatPagination] older page superseded');
              state = state.copyWith(isLoadingMore: false);
              return;
            case WindowPageApplied(:final window):
              state = state.copyWith(
                messages: window.messages,
                isLoadingMore: false,
                hasMoreMessages: window.hasMoreOlder,
                hasMoreNewerMessages: window.hasMoreNewer,
              );
              unawaited(
                _onMessageBatchLoaded(
                  channelId: channelId,
                  messages: olderInRange,
                ),
              );
              return;
          }
        }
      }
      final page = await repo.loadMessagePage(
        channelId: channelId,
        before: requestedBeforeId,
      );
      if (state.channelId != channelId) {
        return;
      }
      final WindowPageResult result = applyOlderPage(
        window: MessageWindowSnapshot(
          messages: state.messages,
          hasMoreOlder: state.hasMoreMessages,
          hasMoreNewer: state.hasMoreNewerMessages,
        ),
        page: page.messages,
        requestedBeforeId: requestedBeforeId,
        pageIndicatesMoreOlder: page.messages.length >= _kPageSize,
      );
      switch (result) {
        case WindowPageSuperseded():
          talker.debug('[ChatPagination] older page superseded');
          state = state.copyWith(isLoadingMore: false);
          return;
        case WindowPageApplied(:final window):
          if (page.messages.isNotEmpty) {
            _contiguity.extendOlder(channelId, page.messages.first.id);
          }
          _contiguityTrusted = true;
          state = state.copyWith(
            messages: window.messages,
            isLoadingMore: false,
            hasMoreMessages: window.hasMoreOlder,
            hasMoreNewerMessages: window.hasMoreNewer,
          );
          talker.debug(
            '[ChatPagination] older loaded count=${page.messages.length} '
            'hasMore=${window.hasMoreOlder}',
          );
          unawaited(
            _onMessageBatchLoaded(
              channelId: channelId,
              messages: page.messages,
              embeddedReplyParents: page.embeddedReplyParents,
            ),
          );
      }
    } on Exception catch (e) {
      talker.warning('[ChatPagination] older load failed', e);
      if (state.channelId == channelId) {
        state = state.copyWith(isLoadingMore: false);
      }
    } finally {
      if (state.channelId == channelId && state.isLoadingMore) {
        state = state.copyWith(isLoadingMore: false);
      }
    }
  }

  Future<void> loadNewer() async {
    if (state.isLoadingNewer ||
        !state.hasMoreNewerMessages ||
        state.messages.isEmpty) {
      return;
    }
    final String channelId = state.channelId;
    final String? requestedAfterId = newestServerBackedMessageId(
      state.messages,
    );
    if (requestedAfterId == null) {
      return;
    }
    state = state.copyWith(isLoadingNewer: true);
    try {
      final repo = ref.read(messageRepositoryProvider);
      talker.debug('[ChatPagination] newer request newest=$requestedAfterId');
      if (_contiguityTrusted &&
          !_messagesNeedResync(channelId) &&
          _contiguity.verified &&
          _contiguity.channelId == channelId &&
          canServeNewerFromCache(
            windowNewestId: requestedAfterId,
            contigNewestId: _contiguity.newestId,
          )) {
        final cachedPage = await repo.getCachedMessagesAfter(
          channelId,
          requestedAfterId,
        );
        if (state.channelId != channelId) {
          return;
        }
        final newerInRange = cachedPage
            .where((m) => compareSnowflakeIds(m.id, _contiguity.newestId) <= 0)
            .toList();
        if (newerInRange.isNotEmpty &&
            newerInRange.length == cachedPage.length) {
          // A partial cache page means the contiguity filter clipped verified-
          // local rows; fall through to network instead of sealing the tail.
          final bool pageIndicatesMoreNewer =
              await _hasNewerMessagesThanChannel(newerInRange.last.id);
          if (state.channelId != channelId) {
            return;
          }
          final WindowPageResult result = applyNewerPage(
            window: MessageWindowSnapshot(
              messages: state.messages,
              hasMoreOlder: state.hasMoreMessages,
              hasMoreNewer: state.hasMoreNewerMessages,
            ),
            page: newerInRange,
            requestedAfterId: requestedAfterId,
            pageIndicatesMoreNewer: pageIndicatesMoreNewer,
          );
          switch (result) {
            case WindowPageSuperseded():
              talker.debug('[ChatPagination] newer page superseded');
              state = state.copyWith(isLoadingNewer: false);
              return;
            case WindowPageApplied(:final window):
              state = state.copyWith(
                messages: window.messages,
                isLoadingNewer: false,
                hasMoreMessages: window.hasMoreOlder,
                hasMoreNewerMessages: window.hasMoreNewer,
              );
              unawaited(
                _onMessageBatchLoaded(
                  channelId: channelId,
                  messages: window.messages,
                ),
              );
              return;
          }
        }
      }
      final page = await repo.loadMessagePage(
        channelId: channelId,
        after: requestedAfterId,
      );
      if (state.channelId != channelId) {
        return;
      }
      // Short network page seals the server tail; full pages re-check the
      // channel pointer (orphaned high pointers must not keep hasMoreNewer).
      final bool pageIndicatesMoreNewer =
          page.messages.length >= _kPageSize &&
          await _hasNewerMessagesThanChannel(page.messages.last.id);
      if (state.channelId != channelId) {
        return;
      }
      final WindowPageResult result = applyNewerPage(
        window: MessageWindowSnapshot(
          messages: state.messages,
          hasMoreOlder: state.hasMoreMessages,
          hasMoreNewer: state.hasMoreNewerMessages,
        ),
        page: page.messages,
        requestedAfterId: requestedAfterId,
        pageIndicatesMoreNewer: pageIndicatesMoreNewer,
      );
      switch (result) {
        case WindowPageSuperseded():
          talker.debug('[ChatPagination] newer page superseded');
          state = state.copyWith(isLoadingNewer: false);
          return;
        case WindowPageApplied(:final window):
          if (page.messages.isNotEmpty) {
            _contiguity.extendNewer(channelId, page.messages.last.id);
          }
          _contiguityTrusted = true;
          state = state.copyWith(
            messages: window.messages,
            isLoadingNewer: false,
            hasMoreMessages: window.hasMoreOlder,
            hasMoreNewerMessages: window.hasMoreNewer,
          );
          talker.debug(
            '[ChatPagination] newer loaded count=${page.messages.length} '
            'hasMore=${window.hasMoreNewer}',
          );
          unawaited(
            _onMessageBatchLoaded(
              channelId: channelId,
              messages: window.messages,
              embeddedReplyParents: page.embeddedReplyParents,
            ),
          );
      }
    } on Exception catch (e) {
      talker.warning('[ChatPagination] newer load failed', e);
      if (state.channelId == channelId) {
        state = state.copyWith(isLoadingNewer: false);
      }
    } finally {
      if (state.channelId == channelId && state.isLoadingNewer) {
        state = state.copyWith(isLoadingNewer: false);
      }
    }
  }

  /// Trims the loaded window back to the newest [kMaxLoadedMessages] once the
  /// viewport is at the live tail, reclaiming memory after a deep scroll-up.
  /// No-op while newer history is unloaded or the window is within the cap.
  void trimToNewestWindow() {
    if (state.hasMoreNewerMessages ||
        state.messages.length <= kMaxLoadedMessages) {
      return;
    }
    final trim = trimMessageWindow(state.messages, keepNewest: true);
    state = state.copyWith(
      messages: trim.messages,
      hasMoreMessages: trim.droppedOlder || state.hasMoreMessages,
    );
  }

  Future<bool> jumpToLatestMessages() async {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      return false;
    }
    if (!state.hasMoreNewerMessages) {
      scrollToBottom();
      return true;
    }
    if (state.isSyncingMessages ||
        state.isLoading ||
        state.isLoadingMore ||
        state.isLoadingNewer) {
      return false;
    }
    state = state.copyWith(isSyncingMessages: true);
    try {
      final page = await ref
          .read(messageRepositoryProvider)
          .loadMessagePage(
            channelId: channelId,
            limit: _kJumpToPresentPageSize,
          );
      if (state.channelId != channelId) {
        return false;
      }
      final List<Message> pendingLocal = state.messages
          .where(isLocalOnlyMessage)
          .toList();
      final List<Message> merged = mergeMessagesSorted(
        pendingLocal,
        page.messages,
      );
      _contiguity.setVerified(channelId, page.messages);
      _contiguityTrusted = true;
      await _hydrateGuildMembersForMessages(
        channelId,
        merged,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      if (state.channelId != channelId) {
        return false;
      }
      state = state.copyWith(
        messages: merged,
        hasMoreMessages: page.messages.length >= _kJumpToPresentPageSize,
        hasMoreNewerMessages: false,
      );
      _notifyMessageReferencesLoaded(
        channelId: channelId,
        messages: merged,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      scrollToBottom();
      return true;
    } on Exception catch (e) {
      talker.warning('[ChatPagination] jump to latest failed', e);
      return false;
    } finally {
      if (state.channelId == channelId && state.isSyncingMessages) {
        state = state.copyWith(isSyncingMessages: false);
      }
    }
  }

  Future<bool> _hasNewerMessagesThanChannel(
    String messageId, {
    bool sealedTail = false,
    Set<String>? knownLoadedMessageIds,
  }) async {
    final db.Channel? channel = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(state.channelId);
    final String? lastMessageId = channel?.lastMessageId;
    if (lastMessageId == null || lastMessageId.isEmpty) {
      return false;
    }
    if (compareSnowflakeIds(lastMessageId, messageId) <= 0) {
      return false;
    }
    if (knownLoadedMessageIds?.contains(lastMessageId) ?? false) {
      return true;
    }
    final database = ref.read(fluxerDatabaseProvider);
    final pointerExists =
        await database.messageDao.getMessage(lastMessageId) != null;
    if (pointerExists) {
      return true;
    }
    if (sealedTail) {
      return false;
    }
    final readState = await database.readStateDao.getReadState(state.channelId);
    final String? ackMessageId = readState?.lastMessageId;
    if (ackMessageId != null &&
        ackMessageId.isNotEmpty &&
        compareSnowflakeIds(ackMessageId, messageId) >= 0) {
      return false;
    }
    return true;
  }

  /// Live-tail ack target: max(visibleTail, channel.lastMessageId) for web parity.
  Future<String> _liveTailAckTargetId({
    required String channelId,
    required String visibleTailId,
  }) async {
    final database = ref.read(fluxerDatabaseProvider);
    final db.Channel? channel = await database.channelDao.getChannelById(
      channelId,
    );
    final db.DmChannel? dm = channel == null
        ? await database.dmChannelDao.getDmChannelById(channelId)
        : null;
    final String? pointer = channel?.lastMessageId ?? dm?.lastMessageId;
    if (pointer == null || pointer.isEmpty) {
      return visibleTailId;
    }
    if (compareSnowflakeIds(pointer, visibleTailId) <= 0) {
      return visibleTailId;
    }
    if (channelId == state.channelId &&
        state.messages.any((Message message) => message.id == pointer)) {
      return pointer;
    }
    final pointerExists = await database.messageDao.getMessage(pointer) != null;
    return pointerExists ? pointer : visibleTailId;
  }

  Future<void> ackCurrentChannel({bool force = false}) async {
    final channelId = state.channelId;
    if (!force && (state.isLoading || state.isSyncingMessages)) {
      return;
    }
    if (!force && state.hasMoreNewerMessages) {
      return;
    }
    final String? visibleTailId = newestServerBackedMessageId(state.messages);
    if (!force && visibleTailId == null) {
      if (!state.hasMoreNewerMessages) {
        final database = ref.read(fluxerDatabaseProvider);
        final readState = await database.readStateDao.getReadState(channelId);
        if (readState != null &&
            !readState.manual &&
            (readState.lastMessageId?.isNotEmpty ?? false)) {
          await ref
              .read(readStateRepositoryProvider)
              .applyLocalAckLatest(channelId);
        }
      }
      return;
    }
    final now = DateTime.now();
    final ChatReadViewportState viewport = ref.read(chatReadViewportProvider);
    final bool isReadViewportEligible = viewport.canAutoAck;
    final bool isAtLiveTail =
        viewport.nearLoadedTail && !state.hasMoreNewerMessages;
    if (force) {
      _readAckGate.clearManualUnread(channelId);
    }
    if (!_readAckGate.canAttemptAck(
      channelId: channelId,
      isActive: isReadViewportEligible,
      isNearBottom: isAtLiveTail,
      now: now,
      force: force,
    )) {
      final retryDelay = _readAckGate.retryDelay(
        channelId: channelId,
        isActive: isReadViewportEligible,
        isNearBottom: isAtLiveTail,
        now: now,
      );
      if (retryDelay != null && retryDelay > Duration.zero) {
        _scheduleReadAckRetry(retryDelay);
      }
      return;
    }

    _readAckRetryTimer?.cancel();
    _readAckGate.markAttemptStarted(channelId, now: now);
    try {
      final database = ref.read(fluxerDatabaseProvider);
      final readState = await database.readStateDao.getReadState(channelId);
      if (!force && (readState?.manual ?? false)) {
        _readAckGate.markManualUnread(channelId);
        return;
      }
      if (!(readState?.manual ?? false)) {
        _readAckGate.clearManualUnread(channelId);
      }
      final hadMentions = (readState?.mentionCount ?? 0) > 0;
      if (!force) {
        await _ensureUnreadBoundaryLoaded(channelId, readState: readState);
      }
      // Web parity (ackWithStickyUnread): once per channel open, snapshot the
      // first unread as the sticky divider before the ack erases the boundary.
      if (_stickySnapshotArmed && state.channelId == channelId) {
        _stickySnapshotArmed = false;
        if (!force && state.stickyUnreadMessageId == null) {
          final String? unreadId = _firstUnreadForCurrentMessages(
            readState: readState,
          );
          if (unreadId != null) {
            state = state.copyWith(stickyUnreadMessageId: unreadId);
          }
        }
      }
      final repository = ref.read(readStateRepositoryProvider);
      // Web acks the channel last_message_id pointer at live tail. Equal to the
      // visible id normally; when the pointer is an orphaned high id, acking it
      // clears stuck unread the way desktop does.
      final String? ackTargetId = force
          ? null
          : await _liveTailAckTargetId(
              channelId: channelId,
              visibleTailId: visibleTailId!,
            );
      final String? ackedMessageId = force
          ? await repository.applyLocalAckLatest(channelId)
          : await repository.applyLocalAckUpTo(channelId, ackTargetId!);
      if (ackedMessageId != null) {
        ref
            .read(ackBatcherProvider)
            .queue(
              channelId: channelId,
              messageId: ackedMessageId,
              immediate: force,
              hadMentions: hadMentions,
            );
      }
      _readAckGate.clearManualUnread(channelId);
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to ack channel: $e');
    } finally {
      _readAckGate.markAttemptFinished(channelId);
      if (!force &&
          ref.mounted &&
          state.channelId == channelId &&
          _autoAckEligible &&
          newestServerBackedMessageId(state.messages) != visibleTailId) {
        // The tail advanced while this attempt was pending and the gate
        // swallowed any concurrent trigger. Re-run against the new tail.
        unawaited(ackCurrentChannel());
      }
    }
  }

  void _scheduleReadAckRetry(Duration delay) {
    _readAckRetryTimer?.cancel();
    _readAckRetryTimer = Timer(delay, () {
      _readAckRetryTimer = null;
      unawaited(ackCurrentChannel());
    });
  }

  Future<void> _ensureUnreadBoundaryLoaded(
    String channelId, {
    required db.ReadState? readState,
  }) async {
    if (state.channelId != channelId || state.messages.isEmpty) {
      return;
    }

    final ackMessageId = readState?.lastMessageId;
    if (ackMessageId == null || ackMessageId.isEmpty) {
      return;
    }

    final oldestLoadedId = state.messages.first.id;
    if (compareSnowflakeIds(ackMessageId, oldestLoadedId) <= 0) {
      return;
    }

    final latestLoadedId = state.messages.last.id;
    if (compareSnowflakeIds(ackMessageId, latestLoadedId) >= 0) {
      return;
    }

    final key = _unreadBoundaryKey(channelId, ackMessageId);
    if (_loadedUnreadBoundaryKeys.contains(key)) {
      return;
    }
    _loadedUnreadBoundaryKeys.add(key);

    try {
      final messages = await ref
          .read(messageRepositoryProvider)
          .getMessages(channelId: channelId, after: ackMessageId);
      if (messages.isEmpty || state.channelId != channelId) {
        return;
      }
      state = state.copyWith(
        messages: mergeMessagesSorted(state.messages, messages),
      );
      _contiguity.extendNewer(channelId, messages.last.id);
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to load unread boundary: $e');
    }
  }

  bool _isOwnMessage(Message message, String? currentUserId) {
    return currentUserId != null &&
        currentUserId.isNotEmpty &&
        message.authorId == currentUserId;
  }

  String? _firstUnreadForCurrentMessages({required db.ReadState? readState}) {
    if (state.messages.isEmpty) {
      return null;
    }
    final String? ack = readState?.lastMessageId;
    if (ack == null || ack.isEmpty) {
      return null;
    }
    // Web parity: without the ack boundary in the window (or the channel
    // start), the first loaded message is not the true first unread.
    final bool boundaryLoaded =
        !state.hasMoreMessages ||
        state.messages.any((Message m) => compareSnowflakeIds(m.id, ack) <= 0);
    if (!boundaryLoaded) {
      return null;
    }
    final currentUserId = ref.read(currentUserIdProvider);
    return oldestUnreadMessageId(
      messageIds: state.messages
          .where((message) => !_isOwnMessage(message, currentUserId))
          .map((message) => message.id),
      ackLastMessageId: ack,
    );
  }

  String _unreadBoundaryKey(String channelId, String ackMessageId) =>
      '$channelId:$ackMessageId';

  void _clearLoadedUnreadBoundaryKeys(String channelId) {
    _loadedUnreadBoundaryKeys.removeWhere(
      (key) => key.startsWith('$channelId:'),
    );
  }

  void _clearManualUnread(String channelId) =>
      _setChannelManual(channelId, manual: false);

  void _setChannelManual(String channelId, {required bool manual}) {
    if (channelId.isEmpty) {
      return;
    }
    if (manual) {
      _readAckGate.markManualUnread(channelId);
    } else {
      _readAckGate.clearManualUnread(channelId);
    }
    unawaited(
      ref
          .read(fluxerDatabaseProvider)
          .readStateDao
          .setManual(channelId, manual: manual),
    );
  }

  void clearStickyUnread() {
    if (state.stickyUnreadMessageId != null) {
      state = state.copyWith(stickyUnreadMessageId: null);
    }
  }

  void clearStickyUnreadFor(String channelId) {
    if (state.channelId != channelId) {
      return;
    }
    clearStickyUnread();
  }

  void cancelPendingOutgoingAck(String channelId) =>
      ref.read(ackBatcherProvider).cancel(channelId);

  void applyExternalAck(String channelId, {required bool manual}) {
    if (channelId.isEmpty) {
      return;
    }
    ref.read(ackBatcherProvider).cancel(channelId);
    if (manual) {
      _readAckGate.markManualUnread(channelId);
    } else {
      _readAckGate.clearManualUnread(channelId);
    }
    // Only a manual mark-read clears the divider; a non-manual ack (our own
    // auto-ack echoed by the server, or another session's) keeps the sticky.
    if (manual && state.channelId == channelId) {
      clearStickyUnread();
    }
  }

  void clearStickyUnreadAfterBuildForCurrentChannel() {
    final channelId = state.channelId;
    unawaited(
      Future<void>(() {
        if (state.channelId != channelId) {
          return;
        }
        clearStickyUnread();
      }),
    );
  }

  void clearCurrentManualUnread() => _clearManualUnread(state.channelId);

  Future<void> markCurrentChannelRead() async {
    final channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    _readAckRetryTimer?.cancel();
    ref.read(ackBatcherProvider).cancel(channelId);
    _readAckGate.clearManualUnread(channelId);
    clearStickyUnread();
    _stickySnapshotArmed = false;
    try {
      await ref.read(readStateRepositoryProvider).ackLatest(channelId);
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to mark channel read: $e');
    }
  }

  Future<void> markMessageUnread(String messageId) async {
    final channelId = state.channelId;
    if (channelId.isEmpty || messageId.isEmpty) {
      return;
    }
    try {
      ref.read(ackBatcherProvider).cancel(channelId);
      await ReadStateRepository(
        ref.read(fluxerClientProvider),
        ref.read(fluxerDatabaseProvider),
      ).markMessageUnread(
        channelId: channelId,
        messageId: messageId,
        currentUserId: ref.read(currentUserIdProvider),
      );
      _readAckRetryTimer?.cancel();
      _readAckGate.markManualUnread(channelId);
      clearStickyUnread();
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to mark unread: $e');
    }
  }

  Future<void> sendMessage({String? text, bool tts = false}) async {
    await _sendContent(
      text ?? state.messageText.trim(),
      clearMessageText: true,
      tts: tts,
    );
  }

  Future<void> sendStickerMessage(StickerEntry sticker) => _sendContent(
    state.messageText.trim(),
    clearMessageText: true,
    stickerIds: [sticker.id],
  );

  Future<void> sendFavoriteMemeMessage(FavoriteMeme meme) =>
      _sendContent('', clearMessageText: true, favoriteMemeId: meme.id);

  Future<void> sendStandaloneMessage(String content) =>
      _sendContent(content.trim(), clearMessageText: false);

  Future<void> sendVoiceMessage({
    required String filePath,
    required int duration,
    required String waveform,
  }) async {
    try {
      await _sendVoiceMessageInner(
        filePath: filePath,
        duration: duration,
        waveform: waveform,
      );
    } on Object catch (error, st) {
      talker.error('[ChatViewModel] voice send failed unexpectedly', error, st);
      _showUnexpectedSendError();
    }
  }

  String _maybeSanitizeOutgoing(String text) {
    if (text.isEmpty) {
      return text;
    }
    if (!ref.read(chatPreferencesProvider).sanitizeUrls) {
      return text;
    }
    return sanitizeUrlsInContent(text);
  }

  ({String content, int flags}) _normalizeOutgoing(String text) {
    final ({String content, int flags}) silent = stripSilentPrefix(text);
    return (
      content: _maybeSanitizeOutgoing(silent.content),
      flags: silent.flags,
    );
  }

  Future<void> _sendContent(
    String text, {
    required bool clearMessageText,
    List<String> stickerIds = const [],
    String? favoriteMemeId,
    bool tts = false,
  }) async {
    if (_isPreparingSend) {
      return;
    }
    _isPreparingSend = true;
    try {
      await _sendContentInner(
        text,
        clearMessageText: clearMessageText,
        stickerIds: stickerIds,
        favoriteMemeId: favoriteMemeId,
        tts: tts,
      );
    } on Object catch (error, st) {
      talker.error('[ChatViewModel] send failed unexpectedly', error, st);
      _showUnexpectedSendError();
    } finally {
      _isPreparingSend = false;
    }
  }

  Future<void> _sendVoiceMessageInner({
    required String filePath,
    required int duration,
    required String waveform,
  }) async {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      _notifySendBlocked(_SendBlockReason.channelNotReady);
      return;
    }
    if (state.editingMessage != null) {
      return;
    }
    final GuildComposerAccess? guildBlock = await _resolveGuildComposerBlock(
      channelId,
    );
    if (guildBlock != null) {
      _notifySendBlocked(_SendBlockReason.guildAccess, guildBlock: guildBlock);
      return;
    }
    final String? currentUserId = ref.read(currentUserIdProvider);
    final db.User? currentUser = currentUserId == null
        ? null
        : await ref
              .read(fluxerDatabaseProvider)
              .userDao
              .getUserById(currentUserId);
    final bool hasGlobalName =
        currentUser?.globalName?.trim().isNotEmpty ?? false;
    final String authorName = hasGlobalName
        ? currentUser!.globalName!
        : currentUser?.username ?? 'You';
    final CloudUploadController uploadNotifier = ref.read(
      cloudUploadControllerProvider(channelId).notifier,
    );
    final FileUploadValidationResult validation = await uploadNotifier
        .addVoiceMessage(
          file: XFile(filePath, name: kVoiceMessageFilename),
          duration: duration,
          waveform: waveform,
        );
    if (!validation.isValid) {
      uploadNotifier.clearComposerAttachments();
      _showUnexpectedSendError();
      return;
    }
    final String? replyToId = state.replyingTo?.id;
    final bool replyMention = state.replyMentioning;
    final String clientNonce = clientNonceGenerator.next();
    final List<PendingAttachment> claimed = uploadNotifier.claimForMessage(
      clientNonce,
    );
    if (claimed.isEmpty) {
      return;
    }
    final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
    final List<Attachment> optimisticAttachments =
        buildUploadingPlaceholderAttachments(
          claimed: claimed,
          labelForMultiple: l10n.chatUploadingAttachmentsSummary,
        );
    final Message optimisticMessage = _buildOptimisticMessage(
      channelId: channelId,
      content: '',
      replyToId: replyToId,
      stickerIds: const <String>[],
      currentUserId: currentUserId,
      authorName: authorName,
      authorAvatar: currentUser?.avatar,
      authorAvatarColor: currentUser?.avatarColor,
      authorIsBot: currentUser?.bot ?? false,
      authorIsSystem: currentUser?.system ?? false,
      clientNonce: clientNonce,
      attachments: optimisticAttachments,
      mentionedUserIds: replyMention && state.replyingTo != null
          ? <String>[state.replyingTo!.authorId]
          : const <String>[],
      flags: kMessageFlagVoiceMessage,
    );
    state = state.copyWith(
      replyingTo: null,
      replyMentioning: false,
      messages: [...state.messages, optimisticMessage],
      errorMessage: null,
      scrollToBottomSignal: state.scrollToBottomSignal + 1,
    );
    clearStickyUnread();
    unawaited(ref.read(readStateRepositoryProvider).clearSticky(channelId));
    ref.read(slowmodeTrackerProvider.notifier).recordSend(channelId);
    unawaited(
      _completeSendWithAttachments(
        channelId: channelId,
        outgoingText: '',
        replyToId: replyToId,
        replyMention: replyMention,
        clientNonce: clientNonce,
        stickerIds: const <String>[],
        favoriteMemeId: null,
        optimisticMessageId: optimisticMessage.id,
        uploadNotifier: uploadNotifier,
        messageFlags: kMessageFlagVoiceMessage,
      ),
    );
  }

  Future<void> _sendContentInner(
    String text, {
    required bool clearMessageText,
    List<String> stickerIds = const [],
    String? favoriteMemeId,
    bool tts = false,
  }) async {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      talker.debug('[ChatViewModel] send blocked: channel_not_ready');
      _notifySendBlocked(_SendBlockReason.channelNotReady);
      return;
    }
    if (state.editingMessage != null) {
      await saveEditedMessage(text: text);
      return;
    }
    final GuildComposerAccess? guildBlock = await _resolveGuildComposerBlock(
      channelId,
    );
    if (guildBlock != null) {
      talker.debug(
        '[ChatViewModel] send blocked: guild_access channelId=$channelId',
      );
      _notifySendBlocked(_SendBlockReason.guildAccess, guildBlock: guildBlock);
      return;
    }
    final String? currentUserId = ref.read(currentUserIdProvider);
    final List<PendingAttachment> pendingAttachments = ref
        .read(cloudUploadControllerProvider(channelId))
        .items;
    if (text.isEmpty &&
        stickerIds.isEmpty &&
        favoriteMemeId == null &&
        pendingAttachments.isEmpty) {
      talker.debug('[ChatViewModel] send blocked: empty channelId=$channelId');
      _notifySendBlocked(_SendBlockReason.empty);
      return;
    }
    final ({String content, int flags}) normalized = _normalizeOutgoing(text);
    final String outgoingText = normalized.content;
    final int messageFlags = normalized.flags;
    final channelRow = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(channelId);
    final guildId = channelRow?.guildId ?? '';
    ChannelPermissionBitsOutcome? permissionOutcome;
    if (guildId.isNotEmpty) {
      permissionOutcome =
          await computeEffectiveGuildChannelPermissionBitsOutcome(
            ref: ref,
            channelId: channelId,
          );
      if (permissionOutcome.shouldCache) {
        final bool canSendMessages = hasPermission(
          permissionOutcome.value,
          Permission.sendMessages,
        );
        if (!canSendMessages) {
          talker.debug(
            '[ChatViewModel] send blocked: no_permission channelId=$channelId',
          );
          _notifySendBlocked(_SendBlockReason.noPermission);
          return;
        }
      }
    }
    final rateLimit = channelRow?.rateLimitPerUser ?? 0;
    if (rateLimit > 0) {
      final bool isImmune =
          permissionOutcome != null &&
          hasPermission(permissionOutcome.value, Permission.bypassSlowmode);
      if (!isImmune) {
        final remaining = ref
            .read(slowmodeTrackerProvider.notifier)
            .remainingFor(channelId, rateLimit);
        if (remaining > Duration.zero) {
          talker.debug(
            '[ChatViewModel] send blocked: slowmode channelId=$channelId',
          );
          _notifySendBlocked(_SendBlockReason.slowmode);
          return;
        }
      }
    }

    final replyToId = state.replyingTo?.id;
    final bool replyMention = state.replyMentioning;
    final db.User? currentUser = currentUserId == null
        ? null
        : await ref
              .read(fluxerDatabaseProvider)
              .userDao
              .getUserById(currentUserId);
    final bool hasGlobalName =
        currentUser?.globalName?.trim().isNotEmpty ?? false;
    final String authorName = hasGlobalName
        ? currentUser!.globalName!
        : currentUser?.username ?? 'You';
    final String clientNonce = clientNonceGenerator.next();
    final CloudUploadController uploadNotifier = ref.read(
      cloudUploadControllerProvider(channelId).notifier,
    );
    final bool hasPendingAttachments = pendingAttachments.isNotEmpty;
    if (hasPendingAttachments) {
      uploadNotifier.claimForMessage(clientNonce);
    }
    final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
    final List<Attachment> optimisticAttachments = hasPendingAttachments
        ? buildUploadingPlaceholderAttachments(
            claimed: pendingAttachments,
            labelForMultiple: l10n.chatUploadingAttachmentsSummary,
          )
        : const <Attachment>[];
    final Message optimisticMessage = _buildOptimisticMessage(
      channelId: channelId,
      content: outgoingText,
      replyToId: replyToId,
      stickerIds: stickerIds,
      currentUserId: currentUserId,
      authorName: authorName,
      authorAvatar: currentUser?.avatar,
      authorAvatarColor: currentUser?.avatarColor,
      authorIsBot: currentUser?.bot ?? false,
      authorIsSystem: currentUser?.system ?? false,
      clientNonce: clientNonce,
      attachments: optimisticAttachments,
      mentionedUserIds: replyMention && state.replyingTo != null
          ? <String>[state.replyingTo!.authorId]
          : const <String>[],
      flags: messageFlags,
    );

    talker.debug('[ChatViewModel] send optimistic channelId=$channelId');
    state = state.copyWith(
      replyingTo: null,
      replyMentioning: false,
      messageText: clearMessageText ? '' : state.messageText,
      messages: [...state.messages, optimisticMessage],
      errorMessage: null,
      scrollToBottomSignal: state.scrollToBottomSignal + 1,
    );
    if (clearMessageText) {
      unawaited(
        ref
            .read(fluxerDatabaseProvider)
            .composerDraftDao
            .deleteDraft(channelId),
      );
    }
    clearStickyUnread();
    unawaited(ref.read(readStateRepositoryProvider).clearSticky(channelId));
    ref.read(slowmodeTrackerProvider.notifier).recordSend(channelId);

    if (!hasPendingAttachments) {
      unawaited(
        _completeSendWithoutAttachments(
          channelId: channelId,
          outgoingText: outgoingText,
          replyToId: replyToId,
          replyMention: replyMention,
          clientNonce: clientNonce,
          stickerIds: stickerIds,
          favoriteMemeId: favoriteMemeId,
          optimisticMessageId: optimisticMessage.id,
          messageFlags: messageFlags,
          tts: tts,
        ),
      );
      return;
    }

    unawaited(
      _completeSendWithAttachments(
        channelId: channelId,
        outgoingText: outgoingText,
        replyToId: replyToId,
        replyMention: replyMention,
        clientNonce: clientNonce,
        stickerIds: stickerIds,
        favoriteMemeId: favoriteMemeId,
        optimisticMessageId: optimisticMessage.id,
        uploadNotifier: uploadNotifier,
        messageFlags: messageFlags,
        tts: tts,
      ),
    );
  }

  Future<void> _completeSendWithoutAttachments({
    required String channelId,
    required String outgoingText,
    required String? replyToId,
    required bool replyMention,
    required String clientNonce,
    required List<String> stickerIds,
    required String? favoriteMemeId,
    required String optimisticMessageId,
    int? messageFlags,
    bool tts = false,
  }) async {
    try {
      final Message sent = await ref
          .read(messageRepositoryProvider)
          .sendMessage(
            channelId: channelId,
            content: outgoingText,
            replyToId: replyToId,
            replyMention: replyMention,
            clientNonce: clientNonce,
            stickerIds: stickerIds,
            favoriteMemeId: favoriteMemeId,
            messageFlags: messageFlags,
            tts: tts,
          );
      if (state.channelId != channelId) {
        return;
      }
      final int optimisticIndex = state.messages.indexWhere(
        (Message m) => m.id == optimisticMessageId,
      );
      final List<Message> nextMessages = _replaceOptimisticWithDelivered(
        messages: state.messages,
        optimisticId: optimisticIndex == -1 ? null : optimisticMessageId,
        delivered: sent.copyWith(
          deliveryState: MessageDeliveryState.sent,
          sendError: null,
        ),
      );
      state = state.copyWith(messages: nextMessages);
    } on Object catch (error, st) {
      talker.error(
        '[ChatViewModel] send api_error channelId=$channelId',
        error,
        st,
      );
      _handleSendFailure(optimisticMessageId, error);
    }
  }

  Future<void> _completeSendWithAttachments({
    required String channelId,
    required String outgoingText,
    required String? replyToId,
    required bool replyMention,
    required String clientNonce,
    required List<String> stickerIds,
    required String? favoriteMemeId,
    required String optimisticMessageId,
    required CloudUploadController uploadNotifier,
    int? messageFlags,
    bool tts = false,
  }) async {
    try {
      final prepared = await uploadNotifier.prepareSessionForSend(
        nonce: clientNonce,
        favoriteMemePayload: favoriteMemeId != null,
      );
      if (!_isOptimisticSendStillActive(optimisticMessageId)) {
        return;
      }
      if (prepared.isEmpty &&
          outgoingText.isEmpty &&
          stickerIds.isEmpty &&
          favoriteMemeId == null) {
        return;
      }
      final Message sent = await ref
          .read(messageRepositoryProvider)
          .sendMessage(
            channelId: channelId,
            content: outgoingText,
            replyToId: replyToId,
            replyMention: replyMention,
            clientNonce: clientNonce,
            stickerIds: stickerIds,
            favoriteMemeId: favoriteMemeId,
            attachmentMetadata: prepared.attachmentMetadata,
            attachmentFiles: prepared.attachmentFiles,
            messageFlags: messageFlags,
            tts: tts,
          );
      uploadNotifier.removeMessageUpload(clientNonce);
      if (state.channelId != channelId) {
        return;
      }
      if (!_isOptimisticSendStillActive(optimisticMessageId)) {
        return;
      }
      final int optimisticIndex = state.messages.indexWhere(
        (Message m) => m.id == optimisticMessageId,
      );
      final List<Message> nextMessages = _replaceOptimisticWithDelivered(
        messages: state.messages,
        optimisticId: optimisticIndex == -1 ? null : optimisticMessageId,
        delivered: sent.copyWith(
          deliveryState: MessageDeliveryState.sent,
          sendError: null,
        ),
      );
      state = state.copyWith(messages: nextMessages);
    } on MessageUploadSendCancelledException {
      return;
    } on Object catch (error, st) {
      talker.error(
        '[ChatViewModel] send api_error channelId=$channelId',
        error,
        st,
      );
      uploadNotifier
        ..restoreToComposer(clientNonce)
        ..removeMessageUpload(clientNonce);
      _handleSendFailure(optimisticMessageId, error);
    }
  }

  bool _isOptimisticSendStillActive(String optimisticMessageId) {
    return state.messages.any((Message m) => m.id == optimisticMessageId);
  }

  void _notifySendBlocked(
    _SendBlockReason reason, {
    GuildComposerAccess? guildBlock,
  }) {
    switch (reason) {
      case _SendBlockReason.empty:
        return;
      case _SendBlockReason.noPermission:
        final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.channelNoSendPermissionHint,
                variant: FluxerToastVariant.warning,
              ),
            );
      case _SendBlockReason.guildAccess:
        final GuildComposerBlockReason? blockReason = guildBlock?.reason;
        if (blockReason == null) {
          return;
        }
        final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: guildComposerBarrierMessage(l10n, blockReason),
                variant: FluxerToastVariant.warning,
              ),
            );
      case _SendBlockReason.slowmode:
        ref.read(slowmodeIndicatorShakeProvider.notifier).requestShake();
      case _SendBlockReason.channelNotReady:
        final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.chatChannelNotReady,
                variant: FluxerToastVariant.warning,
              ),
            );
    }
  }

  void _showUnexpectedSendError() {
    final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.chatMessageFailedToSend,
            variant: FluxerToastVariant.danger,
          ),
        );
  }

  void _handleSendFailure(String optimisticMessageId, Object error) {
    final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
    final String failedMessage = l10n.chatMessageFailedToSend;
    final int optimisticIndex = state.messages.indexWhere(
      (Message m) => m.id == optimisticMessageId,
    );
    List<Message> nextMessages;
    if (optimisticIndex == -1) {
      nextMessages = List<Message>.from(state.messages);
    } else {
      nextMessages = List<Message>.from(state.messages);
      nextMessages[optimisticIndex] = nextMessages[optimisticIndex].copyWith(
        deliveryState: MessageDeliveryState.failed,
        sendError: failedMessage,
      );
    }
    final String? apiErrorCode = error is DioException
        ? apiErrorCodeFromDioException(error)
        : null;
    final String? systemMessageContent = clientSystemMessageForSendError(
      apiErrorCode: apiErrorCode,
      l10n: l10n,
    );
    if (systemMessageContent != null) {
      nextMessages.add(
        createClientSystemMessage(
          channelId: state.channelId,
          content: systemMessageContent,
        ),
      );
      state = state.copyWith(messages: nextMessages);
      return;
    }
    if (optimisticIndex == -1) {
      state = state.copyWith(errorMessage: failedMessage);
      return;
    }
    state = state.copyWith(messages: nextMessages, errorMessage: failedMessage);
  }

  void dismissClientSystemMessage(String messageId) {
    final int messageIndex = state.messages.indexWhere(
      (Message m) => m.id == messageId,
    );
    if (messageIndex == -1 ||
        !state.messages[messageIndex].isClientSystemMessage) {
      return;
    }
    final List<Message>? next = _removeIds(state.messages, {messageId});
    if (next == null) {
      return;
    }
    state = state.copyWith(messages: next);
  }

  void cancelSendingMessage(String messageId) {
    final int messageIndex = state.messages.indexWhere(
      (Message m) => m.id == messageId,
    );
    if (messageIndex == -1) {
      return;
    }
    final Message message = state.messages[messageIndex];
    if (!message.isSending) {
      return;
    }
    final String? nonce = message.clientNonce;
    if (nonce != null) {
      ref
          .read(cloudUploadControllerProvider(message.channelId).notifier)
          .cancelMessageUpload(nonce);
    }
    final List<Message>? next = _removeIds(state.messages, {messageId});
    if (next == null) {
      return;
    }
    state = state.copyWith(messages: next);
  }

  Future<void> retryMessageSend(String messageId) async {
    final int messageIndex = state.messages.indexWhere(
      (m) => m.id == messageId,
    );
    if (messageIndex == -1) {
      return;
    }
    final Message message = state.messages[messageIndex];
    if (!message.hasFailed) {
      return;
    }
    final List<Message> pendingMessages = List<Message>.from(state.messages);
    pendingMessages[messageIndex] = message.copyWith(
      deliveryState: MessageDeliveryState.sending,
      sendError: null,
    );
    state = state.copyWith(messages: pendingMessages, errorMessage: null);
    try {
      final Message sent = await ref
          .read(messageRepositoryProvider)
          .sendMessage(
            channelId: message.channelId,
            content: message.content,
            replyToId: message.replyToId,
            clientNonce: message.clientNonce ?? clientNonceGenerator.next(),
            stickerIds: message.stickers
                .map((MessageSticker s) => s.id)
                .toList(),
          );
      final List<Message> nextMessages = _replaceOptimisticWithDelivered(
        messages: state.messages,
        optimisticId: message.id,
        delivered: sent.copyWith(
          deliveryState: MessageDeliveryState.sent,
          sendError: null,
        ),
      );
      state = state.copyWith(messages: nextMessages);
    } on Object catch (e) {
      debugPrint('[ChatViewModel] Retry failed: $e');
      final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
      final String failedMessage = l10n.chatMessageFailedToSend;
      final List<Message> nextMessages = List<Message>.from(state.messages);
      final int latestIndex = nextMessages.indexWhere(
        (m) => m.id == message.id,
      );
      if (latestIndex == -1) {
        return;
      }
      nextMessages[latestIndex] = nextMessages[latestIndex].copyWith(
        deliveryState: MessageDeliveryState.failed,
        sendError: failedMessage,
      );
      final String? apiErrorCode = e is DioException
          ? apiErrorCodeFromDioException(e)
          : null;
      final String? systemMessageContent = clientSystemMessageForSendError(
        apiErrorCode: apiErrorCode,
        l10n: l10n,
      );
      if (systemMessageContent != null) {
        nextMessages.add(
          createClientSystemMessage(
            channelId: message.channelId,
            content: systemMessageContent,
          ),
        );
        state = state.copyWith(messages: nextMessages);
        return;
      }
      state = state.copyWith(
        messages: nextMessages,
        errorMessage: failedMessage,
      );
    }
  }

  void deleteFailedMessage(String messageId) {
    final int messageIndex = state.messages.indexWhere(
      (m) => m.id == messageId,
    );
    if (messageIndex == -1 || !state.messages[messageIndex].hasFailed) {
      return;
    }
    final List<Message>? next = _removeIds(state.messages, {messageId});
    if (next == null) {
      return;
    }
    state = state.copyWith(messages: next);
  }

  Future<void> deleteMessage(String messageId) async {
    if (state.channelId.isEmpty) {
      return;
    }
    final pending = _pendingDeleteFutures[messageId];
    if (pending != null) {
      return pending;
    }
    final int messageIndex = state.messages.indexWhere(
      (Message message) => message.id == messageId,
    );
    final Message? deletedSnapshot = messageIndex == -1
        ? null
        : state.messages[messageIndex];
    final List<Message>? optimisticallyRemoved = _removeIds(state.messages, {
      messageId,
    });
    if (optimisticallyRemoved != null) {
      state = state.copyWith(messages: optimisticallyRemoved);
    }
    final Future<void> deleteFuture = () async {
      try {
        await ref
            .read(messageRepositoryProvider)
            .deleteMessage(channelId: state.channelId, messageId: messageId);
      } on Exception catch (e) {
        debugPrint('[ChatViewModel] Failed to delete message: $e');
        if (deletedSnapshot != null) {
          state = state.copyWith(
            messages: mergeMessagesSorted(state.messages, [deletedSnapshot]),
            errorMessage: 'Failed to delete message',
          );
        } else {
          state = state.copyWith(errorMessage: 'Failed to delete message');
        }
      } finally {
        unawaited(_pendingDeleteFutures.remove(messageId));
      }
    }();
    _pendingDeleteFutures[messageId] = deleteFuture;
    return deleteFuture;
  }

  Future<void> deleteMessageAttachment({
    required String messageId,
    required String attachmentId,
  }) async {
    if (state.channelId.isEmpty) {
      return;
    }
    final int messageIndex = state.messages.indexWhere(
      (Message message) => message.id == messageId,
    );
    if (messageIndex == -1) {
      return;
    }
    final Message message = state.messages[messageIndex];
    Attachment? attachment;
    for (final Attachment candidate in message.attachments) {
      if (candidate.id == attachmentId) {
        attachment = candidate;
        break;
      }
    }
    if (attachment == null) {
      return;
    }
    final Message updatedMessage = message.copyWith(
      attachments: message.attachments
          .where((Attachment a) => a.id != attachmentId)
          .toList(),
    );
    final List<Message> optimisticMessages = List<Message>.from(state.messages);
    optimisticMessages[messageIndex] = updatedMessage;
    state = state.copyWith(messages: optimisticMessages);
    try {
      await ref
          .read(messageRepositoryProvider)
          .deleteAttachment(
            channelId: state.channelId,
            messageId: messageId,
            attachmentId: attachmentId,
          );
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to delete attachment: $e');
      final List<Message> rollback = List<Message>.from(state.messages);
      rollback[messageIndex] = message;
      state = state.copyWith(
        messages: rollback,
        errorMessage: 'Failed to delete attachment',
      );
    }
  }

  Future<void> editAttachmentAltText({
    required String messageId,
    required String attachmentId,
    required String? description,
  }) async {
    if (state.channelId.isEmpty) {
      return;
    }
    final int messageIndex = state.messages.indexWhere(
      (Message message) => message.id == messageId,
    );
    if (messageIndex == -1) {
      return;
    }
    final Message message = state.messages[messageIndex];
    final List<MessageAttachmentUpdate> updates = message.attachments.map((
      Attachment attachment,
    ) {
      if (attachment.id == attachmentId) {
        return MessageAttachmentUpdate.withDescription(
          id: attachment.id,
          description: description,
        );
      }
      return MessageAttachmentUpdate(id: attachment.id);
    }).toList();
    final List<Attachment> updatedAttachments = message.attachments.map((
      Attachment attachment,
    ) {
      if (attachment.id == attachmentId) {
        return attachment.copyWithDescription(description);
      }
      return attachment;
    }).toList();
    final Message updatedMessage = message.copyWith(
      attachments: updatedAttachments,
    );
    final List<Message> optimisticMessages = List<Message>.from(state.messages);
    optimisticMessages[messageIndex] = updatedMessage;
    state = state.copyWith(messages: optimisticMessages);
    try {
      await ref
          .read(messageRepositoryProvider)
          .editMessageAttachments(
            channelId: state.channelId,
            messageId: messageId,
            content: message.content,
            attachmentUpdates: updates,
          );
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to edit attachment alt text: $e');
      final List<Message> rollback = List<Message>.from(state.messages);
      rollback[messageIndex] = message;
      state = state.copyWith(
        messages: rollback,
        errorMessage: 'Failed to edit attachment alt text',
      );
    }
  }

  void startReply(Message message) {
    unawaited(_startReply(message));
  }

  Future<void> _startReply(Message message) async {
    if (state.editingMessage != null) {
      // Abandon the in-progress edit and restore the prior draft first.
      state = state.copyWith(editingMessage: null, messageText: '');
      await _restoreComposerDraftFromDb();
    }
    final String channelId = state.channelId;
    final bool replyMentioning = await _defaultReplyMentionFor(
      message: message,
      channelId: channelId,
    );
    state = state.copyWith(
      replyingTo: message,
      replyMentioning: replyMentioning,
      editingMessage: null,
    );
    unawaited(_flushComposerDraftSave());
  }

  void setReplyMentioning({required bool mentioning}) {
    if (state.replyMentioning == mentioning) {
      return;
    }
    state = state.copyWith(replyMentioning: mentioning);
    unawaited(_flushComposerDraftSave());
  }

  void cancelReply() {
    state = state.copyWith(replyingTo: null, replyMentioning: false);
    unawaited(_flushComposerDraftSave());
  }

  Future<bool> _defaultReplyMentionFor({
    required Message message,
    required String channelId,
  }) async {
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final String? guildId = await _guildIdForChannel(channelId);
    final String? currentUserId = ref.read(currentUserIdProvider);
    final bool isOwnMessage =
        currentUserId != null && message.authorId == currentUserId;
    final MentionReplyPreferences preference =
        await resolveMentionReplyPreferenceFromDb(
          database: database,
          authorId: message.authorId,
          guildId: guildId,
        );
    return getDefaultReplyMention(
      isOwnMessage: isOwnMessage,
      guildId: guildId,
      preference: preference,
    );
  }

  Future<String?> _guildIdForChannel(String channelId) async {
    if (channelId.isEmpty) {
      return null;
    }
    final db.Channel? channel = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(channelId);
    final String guildId = channel?.guildId ?? '';
    if (guildId.isEmpty) {
      return null;
    }
    return guildId;
  }

  void scrollToMessage(String messageId) {
    talker.debug('[ChatViewModel] scrollToMessage $messageId');
    _revealCollapsedGroupForMessageIfNeeded(messageId);
    final version = (state.scrollToMessageSignal?.$2 ?? 0) + 1;
    state = state.copyWith(scrollToMessageSignal: (messageId, version));
  }

  void scrollToBottom() {
    state = state.copyWith(
      scrollToBottomSignal: state.scrollToBottomSignal + 1,
    );
  }

  Future<void> goToRepliedMessage({
    required String channelId,
    required String messageId,
  }) async {
    if (channelId != state.channelId) {
      await _navigateToChannelMessage(
        channelId: channelId,
        messageId: messageId,
      );
      return;
    }
    highlightJumpMessage(messageId);
    if (state.messages.any((Message m) => m.id == messageId)) {
      scrollToMessage(messageId);
      return;
    }
    if (state.isSyncingMessages || state.isLoading) {
      return;
    }
    state = state.copyWith(isSyncingMessages: true);
    try {
      final page = await ref
          .read(messageRepositoryProvider)
          .loadMessagePage(channelId: channelId, around: messageId);
      if (state.channelId != channelId) {
        return;
      }
      if (page.messages.isEmpty) {
        return;
      }
      // Around jumps consult the pointer: a short around page is not server tail.
      final bool hasMoreNewer = await _hasNewerMessagesThanChannel(
        page.messages.last.id,
      );
      if (state.channelId != channelId) {
        return;
      }
      await _hydrateGuildMembersForMessages(
        channelId,
        page.messages,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      if (state.channelId != channelId) {
        return;
      }
      state = state.copyWith(
        messages: page.messages,
        hasMoreMessages: page.messages.length >= _kPageSize,
        hasMoreNewerMessages: hasMoreNewer,
      );
      _contiguity.setVerified(channelId, page.messages);
      _contiguityTrusted = true;
      _notifyMessageReferencesLoaded(
        channelId: channelId,
        messages: page.messages,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      scrollToMessage(messageId);
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to jump to replied message: $e');
    } finally {
      if (state.channelId == channelId && state.isSyncingMessages) {
        state = state.copyWith(isSyncingMessages: false);
      }
    }
  }

  /// Web-parity "jump to first unread": target the first unread in the loaded
  /// window, else fetch a page around the ack id and land on the first unread
  /// there (nearest newer loaded message when the ack message is missing).
  Future<void> jumpToFirstUnread() async {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    final readState = await ref
        .read(fluxerDatabaseProvider)
        .readStateDao
        .getReadState(channelId);
    final String? inWindow = _firstUnreadForCurrentMessages(
      readState: readState,
    );
    if (inWindow != null) {
      highlightJumpMessage(inWindow);
      scrollToMessage(inWindow);
      return;
    }
    final String? ack = readState?.lastMessageId;
    if (ack == null || ack.isEmpty) {
      return;
    }
    await goToRepliedMessage(channelId: channelId, messageId: ack);
    if (state.channelId != channelId ||
        state.messages.any((Message m) => m.id == ack)) {
      return;
    }
    final String? nearestNewer = oldestUnreadMessageId(
      messageIds: state.messages.map((Message m) => m.id),
      ackLastMessageId: ack,
    );
    if (nearestNewer != null) {
      highlightJumpMessage(nearestNewer);
      scrollToMessage(nearestNewer);
    }
  }

  Future<void> _navigateToChannelMessage({
    required String channelId,
    required String messageId,
  }) async {
    await navigateToChannelMessage(
      ref: ref,
      channelId: channelId,
      messageId: messageId,
    );
  }

  void clearErrorMessage() {
    if (state.errorMessage == null) {
      return;
    }
    state = state.copyWith(errorMessage: null);
  }

  Future<void> retryLoadMessages() async {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    await _refreshMessagesFromNetwork(
      channelId,
      showLoadingSpinner: true,
      isDirectLatestLoad: true,
    );
  }

  Future<void> reloadCurrentChannel() async {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    await _refreshMessagesFromNetwork(
      channelId,
      showLoadingSpinner: true,
      limit: _kInitialPageSize,
      isDirectLatestLoad: true,
    );
  }

  void updateMessageText(String text) {
    final previous = state.messageText;
    state = state.copyWith(messageText: text);
    if (state.editingMessage == null && state.channelId.isNotEmpty) {
      if (text != previous) {
        _scheduleComposerDraftSave();
      }
    }
    if (text.isEmpty || text == previous) {
      return;
    }
    final channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    final GuildComposerAccess? access = ref
        .read(guildComposerAccessProvider(channelId))
        .value;
    if (access != null && !access.canAccess) {
      return;
    }
    final ChannelMessagePermissions? perms = ref
        .read(channelMessagePermissionsProvider(channelId))
        .value;
    if (perms != null && perms.isResolved && !perms.canSendMessages) {
      return;
    }
    unawaited(
      ref.read(typingSenderProvider.notifier).notifyUserTyping(channelId),
    );
  }

  Future<GuildComposerAccess?> _resolveGuildComposerBlock(
    String channelId,
  ) async {
    final GuildComposerAccess access = await ref.read(
      guildComposerAccessProvider(channelId).future,
    );
    if (!access.canAccess) {
      return access;
    }
    return null;
  }

  void startEdit(Message message) {
    state = state.copyWith(
      editingMessage: message,
      replyingTo: null,
      replyMentioning: false,
      messageText: message.content,
    );
  }

  void cancelEdit() {
    state = state.copyWith(editingMessage: null, messageText: '');
    unawaited(_restoreComposerDraftFromDb());
  }

  Future<void> saveEditedMessage({String? text}) async {
    final Message? editingMessage = state.editingMessage;
    if (editingMessage == null) {
      return;
    }
    final String editedContent = _maybeSanitizeOutgoing(
      (text ?? state.messageText).trim(),
    );
    if (editedContent.isEmpty || editedContent == editingMessage.content) {
      talker.debug(
        '[ChatViewModel] edit save noop messageId=${editingMessage.id}',
      );
      state = state.copyWith(editingMessage: null);
      final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.chatEditNoChanges,
              variant: FluxerToastVariant.warning,
            ),
          );
      await _restoreComposerDraftFromDb();
      return;
    }
    final int maxMessageLength = ref.read(maxMessageLengthProvider);
    if (editedContent.length > maxMessageLength) {
      return;
    }
    try {
      final Message updatedMessage = await ref
          .read(messageRepositoryProvider)
          .editMessage(
            channelId: editingMessage.channelId,
            messageId: editingMessage.id,
            content: editedContent,
          );
      final List<Message>? nextMessages = _replaceById(
        state.messages,
        updatedMessage,
      );
      state = state.copyWith(
        messages: nextMessages ?? state.messages,
        editingMessage: null,
        errorMessage: null,
      );
      await _restoreComposerDraftFromDb();
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to edit message: $e');
      state = state.copyWith(errorMessage: 'Failed to edit message');
    }
  }

  Future<void> applyComposerReplace({
    required String source,
    required String replacement,
    required bool global,
  }) async {
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (currentUserId == null || currentUserId.isEmpty) {
      return;
    }
    Message? target;
    for (int i = state.messages.length - 1; i >= 0; i--) {
      final Message candidate = state.messages[i];
      if (candidate.authorId != currentUserId) {
        continue;
      }
      if (candidate.deliveryState != MessageDeliveryState.sent) {
        continue;
      }
      if (candidate.type != messageTypeDefault &&
          candidate.type != messageTypeReply) {
        continue;
      }
      target = candidate;
      break;
    }
    if (target == null) {
      return;
    }
    final String newContent = executeReplace(
      target.content,
      ComposerReplaceCommand(
        source: source,
        replacement: replacement,
        global: global,
      ),
    );
    if (newContent == target.content) {
      return;
    }
    try {
      final Message updatedMessage = await ref
          .read(messageRepositoryProvider)
          .editMessage(
            channelId: target.channelId,
            messageId: target.id,
            content: newContent,
          );
      final List<Message>? nextMessages = _replaceById(
        state.messages,
        updatedMessage,
      );
      state = state.copyWith(
        messages: nextMessages ?? state.messages,
        errorMessage: null,
      );
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to apply replace command: $e');
      state = state.copyWith(errorMessage: 'Failed to edit message');
    }
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

    final updatedMessages = List<Message>.from(state.messages);
    updatedMessages[msgIndex] = msg.copyWith(reactions: updatedReactions);
    state = state.copyWith(messages: updatedMessages);
    unawaited(
      ref
          .read(fluxerDatabaseProvider)
          .messageDao
          .updateReactions(
            messageId,
            jsonEncode(updatedReactions.map((r) => r.toJson()).toList()),
          ),
    );

    if (!hasReacted) {
      unawaited(_trackReactionFrecency(emoji, emojiId));
    }

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
      }
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Reaction failed: $e');
    }
  }

  /// Moderator/author action: drop every reaction from this message.
  /// Optimistically clears local state; gateway will reconcile on success
  /// and rehydrate on failure.
  Future<void> removeAllReactionsOnMessage(String messageId) async {
    final msgIndex = state.messages.indexWhere((m) => m.id == messageId);
    if (msgIndex == -1) {
      return;
    }
    final msg = state.messages[msgIndex];
    if (msg.reactions.isEmpty) {
      return;
    }
    final previousReactions = msg.reactions;
    final updatedMessages = List<Message>.from(state.messages);
    updatedMessages[msgIndex] = msg.copyWith(reactions: const <Reaction>[]);
    state = state.copyWith(messages: updatedMessages);
    try {
      await ref
          .read(messageRepositoryProvider)
          .removeAllReactions(channelId: state.channelId, messageId: messageId);
    } on Exception catch (e, st) {
      talker.error('[ChatViewModel] removeAllReactions failed', e, st);
      final rollbackIndex = state.messages.indexWhere((m) => m.id == messageId);
      if (rollbackIndex != -1) {
        final rollback = List<Message>.from(state.messages);
        rollback[rollbackIndex] = rollback[rollbackIndex].copyWith(
          reactions: previousReactions,
        );
        state = state.copyWith(messages: rollback);
      }
    }
  }

  Future<void> _trackReactionFrecency(String emoji, String? emojiId) async {
    final database = ref.read(fluxerDatabaseProvider);
    final String key;
    if (emojiId != null) {
      final row = await database.guildEmojiDao.getById(emojiId);
      final guildId = row?.guildId ?? '';
      key = 'custom:$guildId:$emojiId';
    } else {
      final name = EmojiRegistry.entryBySurrogates(emoji)?.primaryName;
      key = name != null ? 'unicode:$name' : 'unicode:$emoji';
    }
    await database.emojiUsageDao.trackUsage(key);
  }

  Message _buildOptimisticMessage({
    required String channelId,
    required String content,
    required String? replyToId,
    required List<String> stickerIds,
    required String? currentUserId,
    required String authorName,
    required String? authorAvatar,
    required int? authorAvatarColor,
    required String clientNonce,
    bool authorIsBot = false,
    bool authorIsSystem = false,
    List<Attachment> attachments = const <Attachment>[],
    List<String> mentionedUserIds = const <String>[],
    int flags = 0,
  }) {
    final DateTime now = DateTime.now();
    return Message(
      id: clientNonce,
      channelId: channelId,
      authorId: currentUserId ?? '',
      authorName: authorName,
      authorAvatar: authorAvatar,
      authorAvatarColor: authorAvatarColor,
      authorIsBot: authorIsBot,
      authorIsSystem: authorIsSystem,
      content: content,
      timestamp: now,
      replyToId: replyToId,
      mentionedUserIds: mentionedUserIds,
      attachments: attachments,
      stickers: stickerIds
          .map(
            (String stickerId) =>
                MessageSticker(id: stickerId, name: '', animated: false),
          )
          .toList(),
      deliveryState: MessageDeliveryState.sending,
      clientNonce: clientNonce,
      flags: flags,
    );
  }

  List<Message> _replaceOptimisticWithDelivered({
    required List<Message> messages,
    required String? optimisticId,
    required Message delivered,
  }) {
    final List<Message> updated = List<Message>.from(messages);
    int optimisticIndex = optimisticId == null
        ? -1
        : updated.indexWhere((Message m) => m.id == optimisticId);
    int deliveredIndex = updated.indexWhere(
      (Message m) => m.id == delivered.id,
    );
    if (optimisticIndex != -1 &&
        deliveredIndex != -1 &&
        deliveredIndex != optimisticIndex) {
      updated.removeAt(deliveredIndex);
      if (deliveredIndex < optimisticIndex) {
        optimisticIndex -= 1;
      }
      deliveredIndex = -1;
    }
    if (optimisticIndex != -1) {
      updated[optimisticIndex] = delivered;
      return updated;
    }
    if (deliveredIndex != -1) {
      updated[deliveredIndex] = delivered;
      return updated;
    }
    updated.add(delivered);
    return updated;
  }

  int _findOptimisticMatchForDelivered(Message delivered) {
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (currentUserId == null || currentUserId.isEmpty) {
      return -1;
    }
    for (int i = state.messages.length - 1; i >= 0; i--) {
      final Message candidate = state.messages[i];
      if (!candidate.isSending) {
        continue;
      }
      if (candidate.authorId != currentUserId) {
        continue;
      }
      if (candidate.channelId != delivered.channelId) {
        continue;
      }
      if (candidate.content != delivered.content) {
        continue;
      }
      if (candidate.replyToId != delivered.replyToId) {
        continue;
      }
      final Duration timestampDiff = delivered.timestamp
          .difference(candidate.timestamp)
          .abs();
      if (timestampDiff > const Duration(seconds: 30)) {
        continue;
      }
      return i;
    }
    return -1;
  }

  bool _shouldRefreshChannelFromNetwork(String channelId) {
    if (_messagesNeedResync(channelId)) {
      return true;
    }
    final DateTime? lastRefresh = _lastNetworkRefreshByChannel[channelId];
    if (lastRefresh == null) {
      return true;
    }
    return DateTime.now().difference(lastRefresh) > _kChannelNetworkRefreshTtl;
  }

  bool _messagesNeedResync(String channelId) {
    final int gatewayGeneration = ref.read(gatewaySessionRecoveryProvider);
    if ((_lastReconciledGatewayGenerationByChannel[channelId] ?? -1) <
        gatewayGeneration) {
      return true;
    }
    if ((_lastReconciledForegroundGenerationByChannel[channelId] ?? -1) <
        _foregroundResyncGeneration) {
      return true;
    }
    if ((_lastReconciledConnectivityGapGenerationByChannel[channelId] ?? -1) <
        _connectivityGapGeneration) {
      return true;
    }
    return false;
  }

  void _markMessagesReconciled(String channelId) {
    _lastReconciledGatewayGenerationByChannel[channelId] = ref.read(
      gatewaySessionRecoveryProvider,
    );
    _lastReconciledForegroundGenerationByChannel[channelId] =
        _foregroundResyncGeneration;
    _lastReconciledConnectivityGapGenerationByChannel[channelId] =
        _connectivityGapGeneration;
  }

  void _invalidateMessageCacheTrust() {
    _contiguity.invalidate();
    _contiguityTrusted = false;
  }

  void _markChannelNetworkRefresh(String channelId) {
    _lastNetworkRefreshByChannel[channelId] = DateTime.now();
  }
}
