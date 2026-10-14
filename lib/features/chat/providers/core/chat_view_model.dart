import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/retry_after.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/channels/domain/announcement_follow.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadChannelType;
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/channels/providers/read_state_repository_provider.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:fluxer_app/features/chat/domain/api_attachment_metadata.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_attachment_update.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_send_cancelled_exception.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_session.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/publish_message_sheets.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_ack_gate.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/guild/guild_composer_access_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/abandoned_message_sends_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/channel_message_stream_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_frame_batcher.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_references_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_upload_sessions_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/typing_sender.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_immunity_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_indicator_shake_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_rate_limited_alert_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/services/upload_keep_alive.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/attachments/uploading_attachment_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachments/voice_message_constants.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_command.dart';
import 'package:fluxer_app/features/chat/utils/composer/guild_composer_barrier_l10n.dart';
import 'package:fluxer_app/features/chat/utils/composer/mention_reply_preference_utils.dart';
import 'package:fluxer_app/features/chat/utils/composer/slowmode_utils.dart';
import 'package:fluxer_app/features/chat/utils/messages/channel_message_stream.dart';
import 'package:fluxer_app/features/chat/utils/messages/client_nonce.dart';
import 'package:fluxer_app/features/chat/utils/messages/client_system_message.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_page_sync.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_screen_reader_announce.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_send_failure_messages.dart';
import 'package:fluxer_app/features/chat/utils/messages/url_sanitization_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_member_prefetch.dart';
import 'package:fluxer_app/shared/utils/message_member_load_utils.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_view_model.g.dart';

const _kPageSize = 50;
const _kInitialPageSize = 50;
const _kMaxParkedWindows = 4;
const _kJumpToPresentPageSize = 50;
const Duration _kChannelNetworkRefreshTtl = Duration(seconds: 30);
const Duration _kSyncRetryBaseDelay = Duration(seconds: 1);
const Duration _kSyncRetryMaxDelay = Duration(seconds: 30);
const _kReadAckMinInterval = Duration(seconds: 1);
const _kDraftSaveDebounce = Duration(milliseconds: 400);
const _kJumpHighlightDuration = Duration(milliseconds: 2000);
const int _kMaxAutomaticSendRetries = 2;
const int _kMaxAutomaticSendRetryDelayMs = 30000;

Future<Message> _sendWithRateLimitRetry(
  Future<Message> Function() send, {
  bool Function()? isStillSending,
}) async {
  int retries = 0;
  while (true) {
    try {
      return await send();
    } on DioException catch (error) {
      final Response<dynamic>? response = error.response;
      if (response?.statusCode != 429 ||
          isSlowmodeRateLimitedError(error) ||
          retryAfterMsFromDioException(error) == null) {
        rethrow;
      }
      final int delayMs = transportRateLimitDelayMs(
        headers: response?.headers,
        data: response?.data,
      );
      if (delayMs > _kMaxAutomaticSendRetryDelayMs ||
          retries >= _kMaxAutomaticSendRetries) {
        rethrow;
      }
      retries++;
      await Future<void>.delayed(Duration(milliseconds: delayMs));
      if (isStillSending != null && !isStillSending()) {
        throw const MessageUploadSendCancelledException();
      }
    }
  }
}

enum _SendBlockReason {
  empty,
  noPermission,
  slowmode,
  channelNotReady,
  guildAccess,
}

enum MessagesOrigin {
  liveCreate,

  realtimeEvent,

  olderPage,

  newerPage,

  windowSwap,

  boundaryFill,

  ownSend,

  localMutation,

  trim,
}

class _MessagesWriteAuthorization {
  const _MessagesWriteAuthorization({
    required this.origin,
    required this.before,
    required this.after,
  });

  final MessagesOrigin origin;
  final List<Message> before;
  final List<Message> after;
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

  final int windowEpoch;
  final String? errorMessage;
  final bool messageLoadFailed;
  final _MessagesWriteAuthorization? _writeAuthorization;

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
    this.windowEpoch = 0,
    this.messageLoadFailed = false,
    this.scrollToMessageSignal,
    this.stickyUnreadMessageId,
    this.pendingAutoAckMessageId,
    this.highlightedMessageId,
    this.jumpHighlightSequence = 0,
    this.revealedCollapsedGroupKey,
  }) : _writeAuthorization = null;

  static const ChatViewState empty = ChatViewState(
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

  const ChatViewState._(
    this._writeAuthorization, {
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
    required this.windowEpoch,
    required this.errorMessage,
    required this.messageLoadFailed,
    required this.scrollToMessageSignal,
    required this.stickyUnreadMessageId,
    required this.pendingAutoAckMessageId,
    required this.highlightedMessageId,
    required this.jumpHighlightSequence,
    required this.revealedCollapsedGroupKey,
  });

  MessagesOrigin? writeOriginFor({
    required List<Message>? previous,
    required List<Message> next,
  }) {
    final _MessagesWriteAuthorization? auth = _writeAuthorization;
    if (auth == null ||
        previous == null ||
        !identical(auth.before, previous) ||
        !identical(auth.after, next)) {
      return null;
    }
    return auth.origin;
  }

  ChatViewState copyWith({
    String? channelId,
    ({List<Message> messages, MessagesOrigin origin})? write,
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
    int? windowEpoch,
    Object? errorMessage = _unset,
    bool? messageLoadFailed,
  }) {
    return ChatViewState._(
      write == null
          ? _writeAuthorization
          : _MessagesWriteAuthorization(
              origin: write.origin,
              before: messages,
              after: write.messages,
            ),
      channelId: channelId ?? this.channelId,
      messages: write == null ? messages : write.messages,
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
      windowEpoch: windowEpoch ?? this.windowEpoch,
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

class _RealtimeWrite {
  _RealtimeWrite(this.ordinal, this.events);

  final int ordinal;
  final List<MessageRealtimeEvent> events;
}

class _ArmedWindowSwap {
  _ArmedWindowSwap({required this.token, required this.channelId});

  final int token;
  final String channelId;
}

const int _kUnacknowledgedOrdinal = 1 << 62;

class _RetrySendOptions {
  const _RetrySendOptions({
    required this.replyMention,
    this.favoriteMemeId,
    this.tts = false,
    this.forward,
  });

  final bool replyMention;
  final String? favoriteMemeId;
  final bool tts;
  final _ForwardSource? forward;
}

class _ForwardSource {
  const _ForwardSource({
    required this.channelId,
    required this.messageId,
    this.guildId,
    this.attachmentIds,
    this.embedIndices,
  });

  final String channelId;
  final String messageId;
  final String? guildId;
  final List<String>? attachmentIds;
  final List<int>? embedIndices;
}

const List<Duration> _kMaybeCreatedLookupBackoff = <Duration>[
  Duration(seconds: 2),
  Duration(seconds: 5),
  Duration(seconds: 15),
  Duration(seconds: 30),
  Duration(minutes: 1),
];

const Duration _kSendNonceDedupeWindow = Duration(minutes: 4);

typedef _MaybeCreatedLookup = ({bool adopted, Object? error});

typedef _StoredLocalSend = ({
  Message message,
  _RetrySendOptions? options,
  bool maybeCreated,
});

String _encodeLocalSend(
  Message local,
  _RetrySendOptions? options, {
  required bool maybeCreated,
}) {
  final _ForwardSource? forward = options?.forward;
  return jsonEncode(<String, Object?>{
    'author_name': local.authorName,
    'author_avatar': local.authorAvatar,
    'author_avatar_color': local.authorAvatarColor,
    'author_bot': local.authorIsBot,
    'author_system': local.authorIsSystem,
    'content': local.content,
    'timestamp': local.timestamp.millisecondsSinceEpoch,
    'reply_to_id': local.replyToId,
    'mentions': local.mentionedUserIds,
    'stickers': <Map<String, dynamic>>[
      for (final MessageSticker sticker in local.stickers) sticker.toJson(),
    ],
    'flags': local.flags,
    'message_reference': local.messageReference?.toJson(),
    'message_snapshots': <Map<String, dynamic>>[
      for (final MessageSnapshot snapshot in local.messageSnapshots)
        snapshot.toJson(),
    ],
    'maybe_created': maybeCreated,
    if (options != null) ...<String, Object?>{
      'reply_mention': options.replyMention,
      'favorite_meme_id': options.favoriteMemeId,
      'tts': options.tts,
    },
    if (forward != null)
      'forward': <String, Object?>{
        'channel_id': forward.channelId,
        'message_id': forward.messageId,
        'guild_id': forward.guildId,
        'attachment_ids': forward.attachmentIds,
        'embed_indices': forward.embedIndices,
      },
  });
}

_StoredLocalSend? _decodeLocalSend(
  db.LocalMessageSend row, {
  required String sendError,
}) {
  try {
    final Map<String, dynamic> json =
        jsonDecode(row.payloadJson) as Map<String, dynamic>;
    final Map<String, dynamic>? reference =
        json['message_reference'] as Map<String, dynamic>?;
    final Map<String, dynamic>? forward =
        json['forward'] as Map<String, dynamic>?;
    final Message message = Message(
      id: row.clientNonce,
      channelId: row.channelId,
      authorId: row.authorId,
      authorName: json['author_name'] as String? ?? '',
      authorAvatar: json['author_avatar'] as String?,
      authorAvatarColor: json['author_avatar_color'] as int?,
      authorIsBot: json['author_bot'] as bool? ?? false,
      authorIsSystem: json['author_system'] as bool? ?? false,
      content: json['content'] as String? ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp'] as int),
      replyToId: json['reply_to_id'] as String?,
      mentionedUserIds: <String>[
        for (final Object? id in json['mentions'] as List<dynamic>? ?? const [])
          id! as String,
      ],
      stickers: <MessageSticker>[
        for (final Object? sticker
            in json['stickers'] as List<dynamic>? ?? const [])
          MessageSticker.fromJson(sticker! as Map<String, dynamic>),
      ],
      flags: json['flags'] as int? ?? 0,
      messageReference: reference == null
          ? null
          : MessageReference.fromJson(reference),
      messageSnapshots: <MessageSnapshot>[
        for (final Object? snapshot
            in json['message_snapshots'] as List<dynamic>? ?? const [])
          MessageSnapshot.fromJson(snapshot! as Map<String, dynamic>),
      ],
      deliveryState: MessageDeliveryState.failed,
      sendError: sendError,
      clientNonce: row.clientNonce,
    );
    final _RetrySendOptions? options =
        json.containsKey('reply_mention') || forward != null
        ? _RetrySendOptions(
            replyMention: json['reply_mention'] as bool? ?? true,
            favoriteMemeId: json['favorite_meme_id'] as String?,
            tts: json['tts'] as bool? ?? false,
            forward: forward == null
                ? null
                : _ForwardSource(
                    channelId: forward['channel_id'] as String,
                    messageId: forward['message_id'] as String,
                    guildId: forward['guild_id'] as String?,
                    attachmentIds: (forward['attachment_ids'] as List<dynamic>?)
                        ?.cast<String>(),
                    embedIndices: (forward['embed_indices'] as List<dynamic>?)
                        ?.cast<int>(),
                  ),
          )
        : null;
    return (
      message: message,
      options: options,
      maybeCreated: json['maybe_created'] as bool? ?? true,
    );
  } on Object catch (error) {
    talker.warning('[ChatViewModel] unreadable local send: $error');
    return null;
  }
}

enum _LocalMutationKind {
  deleteMessage,
  removeAttachment,
  setAttachmentAlt,
  editContent,
}

class _LocalMutation {
  _LocalMutation({
    required this.kind,
    required this.startOrdinal,
    this.attachmentId,
    this.description,
    this.content,
    this.editedTimestamp,
  });

  final _LocalMutationKind kind;
  final int startOrdinal;
  final String? attachmentId;
  final String? description;
  final String? content;
  final DateTime? editedTimestamp;

  int ackOrdinal = _kUnacknowledgedOrdinal;
}

class _AttachmentOp {
  _AttachmentOp({
    required this.kind,
    required this.attachmentId,
    this.description,
  });

  final _LocalMutationKind kind;
  final String attachmentId;
  final String? description;
  final Completer<void> done = Completer<void>();

  int overlayOrdinal = 0;
}

class _WindowSwapCommit {
  _WindowSwapCommit({
    required this.token,
    required this.channelId,
    required this.fetchOrdinal,
    required this.stillValid,
    required this.write,
  });

  final int token;
  final String channelId;

  final int fetchOrdinal;

  final bool Function() stillValid;

  final void Function() write;

  final Completer<bool> done = Completer<bool>();
}

class _ParkedChannelWindow {
  const _ParkedChannelWindow({
    required this.messages,
    required this.hasMoreMessages,
    required this.hasMoreNewerMessages,
  });

  final List<Message> messages;
  final bool hasMoreMessages;
  final bool hasMoreNewerMessages;
}

@Riverpod(keepAlive: true)
class ChatViewModel extends _$ChatViewModel {
  StreamSubscription<MessageRealtimeEvent>? _eventsSub;
  final ChatReadAckGate _readAckGate = ChatReadAckGate(
    minInterval: _kReadAckMinInterval,
  );
  Timer? _readAckRetryTimer;
  Timer? _syncRetryTimer;
  int _syncRetryAttempt = 0;
  final Random _syncRetryRandom = Random();
  bool _stickySnapshotArmed = false;
  bool _viewportWasAtTail = false;
  Timer? _draftSaveTimer;
  final Map<String, Future<void>> _pendingDraftWrites =
      <String, Future<void>>{};
  Timer? _jumpHighlightTimer;
  final Set<String> _loadedUnreadBoundaryKeys = <String>{};
  final _WindowContiguity _contiguity = _WindowContiguity();
  bool _contiguityTrusted = false;
  bool _userScrollActive = false;
  bool _pendingSessionResync = false;
  void Function()? _removeReadAckStateListener;
  bool _autoAckEligible = false;
  bool _followingLiveTail = false;
  int _foregroundResyncGeneration = 0;
  int _connectivityGapGeneration = 0;
  final Map<String, int> _lastReconciledGatewayGenerationByChannel =
      <String, int>{};
  final Map<String, int> _lastReconciledForegroundGenerationByChannel =
      <String, int>{};
  final Map<String, int> _lastReconciledConnectivityGapGenerationByChannel =
      <String, int>{};
  Future<void> _sendPreparation = Future<void>.value();
  final UploadKeepAlive _uploadKeepAlive = UploadKeepAlive();
  final Set<String> _preparingSendKeys = <String>{};
  int _channelSwitchGeneration = 0;
  ({String channelId, String? targetMessageId, bool loadMessages})?
  _switchInFlightRequest;
  Future<void>? _switchInFlightFuture;
  final LinkedHashMap<String, _ParkedChannelWindow> _parkedWindows =
      LinkedHashMap<String, _ParkedChannelWindow>();
  String? _forgottenLiveChannelId;
  ({String channelId, String messageId})? _pendingTrimAround;
  int _windowGeneration = 0;
  bool _jumpToLatestActive = false;
  int _ingressOrdinal = 0;
  final List<_RealtimeWrite> _realtimeQueue = <_RealtimeWrite>[];
  final List<_WindowSwapCommit> _swapCommits = <_WindowSwapCommit>[];
  _ArmedWindowSwap? _armedSwap;
  int _windowSwapToken = 0;
  bool _realtimeWorkerActive = false;
  Future<void> _realtimeWorkerIdle = Future<void>.value();
  int _windowWrites = 0;
  int _pageFetchOrdinal = 0;
  Message? _endingEdit;
  final Set<int> _outstandingFetchOrdinals = <int>{};
  final Map<String, List<_LocalMutation>> _localMutations =
      <String, List<_LocalMutation>>{};
  final Map<String, Message> _inFlightOptimisticMessages = <String, Message>{};
  final Map<String, int> _sendsAwaitingReconnect = <String, int>{};
  final Map<String, List<String>> _maybeCreatedSends = <String, List<String>>{};
  final Map<String, Future<_MaybeCreatedLookup>> _maybeCreatedLookups =
      <String, Future<_MaybeCreatedLookup>>{};
  final Set<String> _maybeCreatedResolvers = <String>{};
  final Map<String, Message> _localSends = <String, Message>{};
  final Map<String, _RetrySendOptions> _retrySendOptions =
      <String, _RetrySendOptions>{};
  final Map<String, Future<void>> _pendingDeleteFutures =
      <String, Future<void>>{};
  final Map<String, DateTime> _lastNetworkRefreshByChannel =
      <String, DateTime>{};
  MessageRealtimeFrameBatcher? _frameBatcher;
  final GuildUserDisplayWarmer _displayWarmer = GuildUserDisplayWarmer();

  void _resetAccountLocalState() {
    _channelSwitchGeneration++;
    _windowGeneration++;
    _parkedWindows.clear();
    _forgottenLiveChannelId = null;
    _displayWarmer.releaseAll();
    _pendingTrimAround = null;
    _lastReconciledGatewayGenerationByChannel.clear();
    _lastReconciledForegroundGenerationByChannel.clear();
    _lastReconciledConnectivityGapGenerationByChannel.clear();
    _lastNetworkRefreshByChannel.clear();
    _localMutations.clear();
    _inFlightOptimisticMessages.clear();
    _localSends.clear();
    _retrySendOptions.clear();
    _sendsAwaitingReconnect.clear();
    _maybeCreatedSends.clear();
    _maybeCreatedLookups.clear();
    _maybeCreatedResolvers.clear();
    _pendingDeleteFutures.clear();
    _loadedUnreadBoundaryKeys.clear();
    _realtimeQueue.clear();
    _swapCommits.clear();
    _armedSwap = null;
    _switchInFlightRequest = null;
    _switchInFlightFuture = null;
    _pendingSessionResync = false;
    _contiguityTrusted = false;
    _clearSyncRetry();
  }

  @override
  ChatViewState build() {
    ref.listen<String?>(currentUserIdProvider, (
      String? previous,
      String? next,
    ) {
      if (previous == next) {
        return;
      }
      _resetAccountLocalState();
      state = ChatViewState.empty;
      if (next != null) {
        unawaited(_restoreLocalSends(next));
      }
    });
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
        if (previous != next) {
          _resendSendsAwaitingReconnect();
          _resumePendingSyncRetry();
        }
      })
      ..listen<int>(gatewayFullRecoveryProvider, (int? previous, int next) {
        if (next <= 0 || previous == next) {
          return;
        }
        _invalidateMessageCacheTrust();
        _onSessionNeedsMessageResync();
      })
      ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
        if (previous == false && next) {
          if (!_shouldResyncAfterForegroundReturn()) {
            _resumePendingSyncRetry();
            return;
          }
          _foregroundResyncGeneration++;
          _invalidateMessageCacheTrust();
          _onSessionNeedsMessageResync();
        }
      })
      ..onDispose(() {
        _readAckRetryTimer?.cancel();
        _syncRetryTimer?.cancel();
        _draftSaveTimer?.cancel();
        _jumpHighlightTimer?.cancel();
        _frameBatcher?.dispose();
        unawaited(_eventsSub?.cancel());
      });
    final String? userId = ref.read(currentUserIdProvider);
    if (userId != null) {
      unawaited(_restoreLocalSends(userId));
    }
    return ChatViewState.empty;
  }

  void _syncReadAckEligibility(ChatReadViewportState viewport) {
    if (_followingLiveTail) {
      return;
    }
    final bool viewportAtTail =
        viewport.channelId == state.channelId &&
        viewport.nearLoadedTail &&
        !state.hasMoreNewerMessages;
    if (_viewportWasAtTail && !viewportAtTail) {
      _stickySnapshotArmed = true;
    }
    _viewportWasAtTail = viewportAtTail;
    final bool nextEligible =
        !state.isLoading &&
        !state.isSyncingMessages &&
        isAutoAckEligible(
          viewport: viewport,
          channelId: state.channelId,
          hasMoreNewerMessages: state.hasMoreNewerMessages,
          currentTailId: newestServerBackedMessageId(state.messages),
        );
    final bool becameEligible = nextEligible && !_autoAckEligible;
    _autoAckEligible = nextEligible;
    if (becameEligible) {
      unawaited(ackCurrentChannel());
    } else if (!nextEligible) {
      _readAckRetryTimer?.cancel();
    }
  }

  void _followLiveTailAppend(List<Message> nextMessages) {
    if (state.hasMoreNewerMessages) {
      return;
    }
    final String? previousTailId = newestServerBackedMessageId(state.messages);
    final String? nextTailId = newestServerBackedMessageId(nextMessages);
    if (nextTailId == null ||
        compareSnowflakeIds(nextTailId, previousTailId) <= 0) {
      return;
    }
    _followingLiveTail = true;
    try {
      ref
          .read(chatReadViewportProvider.notifier)
          .followLiveTail(
            channelId: state.channelId,
            previousTailId: previousTailId,
            nextTailId: nextTailId,
          );
    } finally {
      _followingLiveTail = false;
    }
  }

  void _onRealtimeEventsBatch(List<MessageRealtimeEvent> events) {
    if (events.isEmpty) {
      return;
    }
    for (final MessageRealtimeEvent event in events) {
      _forwardRealtimeToMessageReferences(event);
    }
    _realtimeQueue.add(_RealtimeWrite(++_ingressOrdinal, events));
    _pumpRealtimeQueue();
  }

  bool get _swapOwnsChannel {
    final _ArmedWindowSwap? swap = _armedSwap;
    return swap != null && swap.channelId == state.channelId;
  }

  bool get _realtimeQueueEligible =>
      ref.mounted &&
      (_swapCommits.isNotEmpty ||
          (!_swapOwnsChannel && _realtimeQueue.isNotEmpty));

  void _pumpRealtimeQueue() {
    if (_realtimeWorkerActive) {
      return;
    }
    _realtimeWorkerActive = true;
    _realtimeWorkerIdle = _runRealtimeQueue().whenComplete(() {
      _realtimeWorkerActive = false;
      if (_realtimeQueueEligible) {
        _pumpRealtimeQueue();
      }
    });
  }

  Future<void> _runRealtimeQueue() async {
    while (true) {
      if (_swapCommits.isNotEmpty) {
        await _runSwapCommit(_swapCommits.removeAt(0));
        continue;
      }
      if (!ref.mounted || _swapOwnsChannel || _realtimeQueue.isEmpty) {
        return;
      }
      await _applyRealtimeWriteSafely(_realtimeQueue.removeAt(0));
    }
  }

  Future<void> _applyRealtimeWriteSafely(_RealtimeWrite write) async {
    try {
      if (write.events.length == 1) {
        await _applyRealtimeEvent(write, write.events.first);
      } else {
        _commitRealtimeCreateBatch(write);
      }
    } on Object catch (error, stack) {
      talker.warning('[ChatViewModel] realtime apply failed', error, stack);
    }
  }

  int _armWindowSwap(String channelId) {
    final int token = ++_windowSwapToken;
    _armedSwap = _ArmedWindowSwap(token: token, channelId: channelId);
    return token;
  }

  Future<bool> _commitWindowSwap(
    int token,
    String channelId,
    int fetchOrdinal,
    bool Function() stillValid,
    void Function() write,
  ) {
    final _WindowSwapCommit commit = _WindowSwapCommit(
      token: token,
      channelId: channelId,
      fetchOrdinal: fetchOrdinal,
      stillValid: stillValid,
      write: write,
    );
    _swapCommits.add(commit);
    _pumpRealtimeQueue();
    return commit.done.future;
  }

  Future<void> _runSwapCommit(_WindowSwapCommit commit) async {
    final bool applied =
        _armedSwap?.token == commit.token &&
        commit.channelId == state.channelId &&
        commit.stillValid();
    Object? failure;
    StackTrace? failureStack;
    try {
      if (applied) {
        commit.write();
        _windowWrites++;
        _armedSwap = null;
      }
      _retireLocalMutations();
      while (ref.mounted &&
          _swapCommits.isEmpty &&
          !_swapOwnsChannel &&
          _realtimeQueue.isNotEmpty) {
        await _applyRealtimeWriteSafely(_realtimeQueue.removeAt(0));
      }
    } on Object catch (error, stack) {
      failure = error;
      failureStack = stack;
    }
    if (failure != null) {
      commit.done.completeError(failure, failureStack);
    } else {
      commit.done.complete(applied);
    }
  }

  final Map<String, List<_AttachmentOp>> _attachmentOpQueues =
      <String, List<_AttachmentOp>>{};

  final Map<String, Message> _confirmedAttachmentRows = <String, Message>{};

  int? _loadingMoreOwner;
  int? _loadingNewerOwner;

  void _releaseLoadingMore(int ordinal) {
    if (_loadingMoreOwner != ordinal) {
      return;
    }
    _loadingMoreOwner = null;
    if (state.isLoadingMore) {
      state = state.copyWith(isLoadingMore: false);
    }
  }

  void _releaseLoadingNewer(int ordinal) {
    if (_loadingNewerOwner != ordinal) {
      return;
    }
    _loadingNewerOwner = null;
    if (state.isLoadingNewer) {
      state = state.copyWith(isLoadingNewer: false);
    }
  }

  ({String channelId, String tailId, int windowGeneration, bool confirmed})?
  _tailProbeLedger;

  bool _isTailConfirmed(String channelId, String tailId) {
    final probed = _tailProbeLedger;
    return probed != null &&
        probed.confirmed &&
        probed.channelId == channelId &&
        probed.tailId == tailId &&
        probed.windowGeneration == _windowGeneration;
  }

  @visibleForTesting
  int get loadedUnreadBoundaryKeyCount => _loadedUnreadBoundaryKeys.length;

  @visibleForTesting
  int get pendingLocalMutationCount => _localMutations.values.fold<int>(
    0,
    (int sum, List<_LocalMutation> ops) => sum + ops.length,
  );

  int _beginPageFetch() {
    final int ordinal = ++_pageFetchOrdinal;
    _outstandingFetchOrdinals.add(ordinal);
    return ordinal;
  }

  void _endPageFetch(int ordinal) {
    _outstandingFetchOrdinals.remove(ordinal);
    _retireLocalMutations();
  }

  int _recordLocalMutation(
    String messageId,
    _LocalMutationKind kind, {
    String? attachmentId,
    String? description,
    String? content,
    DateTime? editedTimestamp,
  }) {
    final int ordinal = ++_pageFetchOrdinal;
    _localMutations
        .putIfAbsent(messageId, () => <_LocalMutation>[])
        .add(
          _LocalMutation(
            kind: kind,
            startOrdinal: ordinal,
            attachmentId: attachmentId,
            description: description,
            content: content,
            editedTimestamp: editedTimestamp,
          ),
        );
    return ordinal;
  }

  _LocalMutation? _findLocalMutation(String messageId, int startOrdinal) {
    for (final _LocalMutation op in _localMutations[messageId] ?? const []) {
      if (op.startOrdinal == startOrdinal) {
        return op;
      }
    }
    return null;
  }

  void _acknowledgeLocalMutation(String messageId, int startOrdinal) {
    _findLocalMutation(messageId, startOrdinal)?.ackOrdinal =
        ++_pageFetchOrdinal;
    _retireLocalMutations();
  }

  void _withdrawLocalMutation(String messageId, int startOrdinal) {
    final List<_LocalMutation>? ops = _localMutations[messageId];
    if (ops == null) {
      return;
    }
    ops.removeWhere((_LocalMutation op) => op.startOrdinal == startOrdinal);
    if (ops.isEmpty) {
      _localMutations.remove(messageId);
    }
  }

  void _retireLocalMutations() {
    if (_localMutations.isEmpty) {
      return;
    }
    int? oldestOutstanding;
    for (final int ordinal in _outstandingFetchOrdinals) {
      if (oldestOutstanding == null || ordinal < oldestOutstanding) {
        oldestOutstanding = ordinal;
      }
    }
    for (final _WindowSwapCommit commit in _swapCommits) {
      if (oldestOutstanding == null ||
          commit.fetchOrdinal < oldestOutstanding) {
        oldestOutstanding = commit.fetchOrdinal;
      }
    }
    final int? boundary = oldestOutstanding;
    _localMutations.removeWhere((_, List<_LocalMutation> ops) {
      ops.removeWhere((_LocalMutation op) {
        if (op.ackOrdinal == _kUnacknowledgedOrdinal) {
          return false;
        }
        return boundary == null || boundary >= op.ackOrdinal;
      });
      return ops.isEmpty;
    });
  }

  List<Message> _applyPendingLocalMutations(
    List<Message> messages,
    int fetchOrdinal,
  ) {
    if (_localMutations.isEmpty) {
      return messages;
    }
    final List<Message> result = <Message>[];
    for (final Message message in messages) {
      final List<_LocalMutation>? ops = _localMutations[message.id];
      if (ops == null || ops.isEmpty) {
        result.add(message);
        continue;
      }
      Message current = message;
      var deleted = false;
      for (final _LocalMutation op in ops) {
        if (fetchOrdinal >= op.ackOrdinal) {
          continue;
        }
        switch (op.kind) {
          case _LocalMutationKind.deleteMessage:
            deleted = true;
          case _LocalMutationKind.removeAttachment:
            current = current.copyWith(
              attachments: current.attachments
                  .where((Attachment a) => a.id != op.attachmentId)
                  .toList(),
            );
          case _LocalMutationKind.setAttachmentAlt:
            current = current.copyWith(
              attachments: <Attachment>[
                for (final Attachment a in current.attachments)
                  if (a.id == op.attachmentId)
                    a.copyWithDescription(op.description)
                  else
                    a,
              ],
            );
          case _LocalMutationKind.editContent:
            current = current.copyWith(
              content: op.content,
              editedTimestamp: op.editedTimestamp,
            );
        }
      }
      if (!deleted) {
        result.add(current);
      }
    }
    return result;
  }

  List<Message> _finalizeLoadedMessages(
    String channelId,
    List<Message> messages,
    int fetchOrdinal,
  ) {
    return collapseDeliveredLocalSends(
      _mergeInFlightSends(
        channelId,
        _applyPendingLocalMutations(
          _retainMessagesForChannel(channelId, messages),
          fetchOrdinal,
        ),
      ),
    );
  }

  List<Message> _retainMessagesForChannel(
    String channelId,
    List<Message> messages,
  ) {
    if (!chatMessagesFromOtherChannel(
      channelId: channelId,
      messages: messages,
    )) {
      return messages;
    }
    return <Message>[
      for (final Message message in messages)
        if (message.channelId.isEmpty || message.channelId == channelId)
          message,
    ];
  }

  void _trackLocalSend(Message local) {
    final String? nonce = local.clientNonce;
    if (nonce == null) {
      return;
    }
    _localSends[nonce] = local;
    _persistLocalSend(nonce);
  }

  void _persistLocalSend(String nonce) {
    final Message? local = _localSends[nonce];
    if (local == null) {
      return;
    }
    final String payload = _encodeLocalSend(
      local,
      _retrySendOptions[local.id],
      maybeCreated: local.isSending || _maybeCreatedSends.containsKey(local.id),
    );
    unawaited(
      ref
          .read(fluxerDatabaseProvider)
          .localMessageSendsDao
          .upsert(
            clientNonce: nonce,
            channelId: local.channelId,
            authorId: local.authorId,
            payloadJson: payload,
          )
          .catchError((Object error) {
            talker.warning('[ChatViewModel] local send save failed: $error');
          }),
    );
  }

  void _untrackLocalSend(String? nonce) {
    if (nonce == null) {
      return;
    }
    _localSends.remove(nonce);
    _maybeCreatedSends.remove(nonce);
    unawaited(
      ref
          .read(fluxerDatabaseProvider)
          .localMessageSendsDao
          .remove(nonce)
          .catchError((Object error) {
            talker.warning('[ChatViewModel] local send forget failed: $error');
          }),
    );
  }

  Future<void> _restoreLocalSends(String userId) async {
    final List<db.LocalMessageSend> rows;
    try {
      rows = await ref
          .read(fluxerDatabaseProvider)
          .localMessageSendsDao
          .getForAuthor(userId);
    } on Object catch (error) {
      talker.warning('[ChatViewModel] local send restore failed: $error');
      return;
    }
    if (!ref.mounted || ref.read(currentUserIdProvider) != userId) {
      return;
    }
    final String sendError = ref
        .read(appLocalizationsProvider)
        .chatMessageFailedToSend;
    final List<String> maybeCreated = <String>[];
    var restoredHere = false;
    for (final db.LocalMessageSend row in rows) {
      if (_localSends.containsKey(row.clientNonce)) {
        continue;
      }
      final _StoredLocalSend? stored = _decodeLocalSend(
        row,
        sendError: sendError,
      );
      if (stored == null) {
        unawaited(
          ref
              .read(fluxerDatabaseProvider)
              .localMessageSendsDao
              .remove(row.clientNonce),
        );
        continue;
      }
      final Message message = stored.message;
      _localSends[row.clientNonce] = message;
      final _RetrySendOptions? options = stored.options;
      if (options != null) {
        _retrySendOptions[message.id] = options;
      }
      if (stored.maybeCreated) {
        _maybeCreatedSends[message.id] = const <String>[];
        maybeCreated.add(message.id);
      }
      restoredHere = restoredHere || message.channelId == state.channelId;
    }
    if (restoredHere) {
      state = state.copyWith(
        write: (
          messages: _mergeInFlightSends(state.channelId, state.messages),
          origin: MessagesOrigin.localMutation,
        ),
      );
    }
    for (final String id in maybeCreated) {
      unawaited(_resolveMaybeCreatedSend(id));
    }
  }

  void _registerInFlightOptimisticSend(Message message) {
    final String? nonce = message.clientNonce;
    if (nonce == null) {
      return;
    }
    _inFlightOptimisticMessages[nonce] = message;
  }

  void _clearInFlightOptimisticSend(String clientNonce) {
    _inFlightOptimisticMessages.remove(clientNonce);
  }

  void _finishAttachmentUploadSession(
    String clientNonce,
    CloudUploadController uploadNotifier,
  ) {
    uploadNotifier.removeMessageUpload(clientNonce);
    _clearInFlightOptimisticSend(clientNonce);
  }

  bool _isMessageUploadSessionActive(String clientNonce) {
    return ref.read(messageUploadSessionsProvider).containsKey(clientNonce);
  }

  void _commitDeliveredOptimisticSend({
    required String channelId,
    required String optimisticMessageId,
    required Message sent,
  }) {
    _untrackLocalSend(optimisticMessageId);
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
    state = state.copyWith(
      write: (messages: nextMessages, origin: MessagesOrigin.localMutation),
      pendingAutoAckMessageId: _pendingAutoAckCovering(sent.id),
    );
  }

  List<Message> _mergeInFlightSends(String channelId, List<Message> messages) {
    if (_inFlightOptimisticMessages.isEmpty && _localSends.isEmpty) {
      return messages;
    }
    final Set<String> existingIds = messages.map((Message m) => m.id).toSet();
    final sessions = ref.read(messageUploadSessionsProvider);
    final List<Message> inFlight = <Message>[];
    final List<String> staleNonces = <String>[];
    for (final MapEntry<String, Message> entry
        in _inFlightOptimisticMessages.entries) {
      if (!sessions.containsKey(entry.key)) {
        staleNonces.add(entry.key);
        continue;
      }
      final Message message = entry.value;
      if (message.channelId != channelId) {
        continue;
      }
      if (existingIds.contains(message.id)) {
        continue;
      }
      if (deliveredMatchForLocalSend(messages, message) != null) {
        continue;
      }
      inFlight.add(message);
    }
    for (final String nonce in staleNonces) {
      _inFlightOptimisticMessages.remove(nonce);
    }
    final List<String> delivered = <String>[];
    for (final MapEntry<String, Message> entry in _localSends.entries) {
      final Message message = entry.value;
      if (message.channelId != channelId || existingIds.contains(message.id)) {
        continue;
      }
      if (deliveredMatchForLocalSend(messages, message) != null) {
        delivered.add(entry.key);
        continue;
      }
      inFlight.add(message);
    }
    delivered.forEach(_untrackLocalSend);
    if (inFlight.isEmpty) {
      return messages;
    }
    return mergeMessagesSorted(messages, inFlight);
  }

  Future<void> _disarmWindowSwap(int token) async {
    if (_armedSwap?.token != token) {
      return;
    }
    _armedSwap = null;
    while (_realtimeQueueEligible || _realtimeWorkerActive) {
      _pumpRealtimeQueue();
      await _realtimeWorkerIdle;
    }
  }

  bool _deferForArmedSwap(_RealtimeWrite write) {
    if (!_swapOwnsChannel) {
      return false;
    }
    int index = 0;
    while (index < _realtimeQueue.length &&
        _realtimeQueue[index].ordinal < write.ordinal) {
      index++;
    }
    _realtimeQueue.insert(index, write);
    return true;
  }

  void _commitRealtimeCreateBatch(_RealtimeWrite write) {
    List<Message>? workingMessages = state.messages;
    var droppedOlder = false;
    var shouldAck = false;
    var clearSticky = false;
    String? ackWatermark;
    for (final MessageRealtimeEvent event in write.events) {
      if (event is! MessageCreated) {
        continue;
      }
      _settleDeliveredLocalSend(event);
      final List<Message>? next = _nextMessagesForSync(
        event,
        messages: workingMessages!,
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
    _followLiveTailAppend(workingMessages);
    state = state.copyWith(
      write: (messages: workingMessages, origin: MessagesOrigin.liveCreate),
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

  Future<void> _applyRealtimeEvent(
    _RealtimeWrite write,
    MessageRealtimeEvent ev,
  ) async {
    final db.Message? prefetchedRow = await _prefetchRowFor(ev);
    if (_deferForArmedSwap(write)) {
      return;
    }
    _commitRealtimeEvent(ev, prefetchedRow);
  }

  void _commitRealtimeEvent(
    MessageRealtimeEvent ev,
    db.Message? prefetchedRow,
  ) {
    _dropDeletedFromParkedWindow(ev);
    _settleDeliveredLocalSend(ev);
    final List<Message>? next = _nextMessagesForSync(
      ev,
      messages: state.messages,
      prefetchedRow: prefetchedRow,
    );
    final Set<String> deletedIds = _deletedMessageIdsFor(ev);
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
      if (ev is MessageCreated) {
        _followLiveTailAppend(nextMessages);
      }
      state = state.copyWith(
        write: (
          messages: nextMessages,
          origin: ev is MessageCreated
              ? MessagesOrigin.liveCreate
              : MessagesOrigin.realtimeEvent,
        ),
        editingMessage: clearComposerForDelete ? null : state.editingMessage,
        messageText: clearComposerForDelete ? '' : state.messageText,
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
        } else {
          announceIncomingMessageIfEnabled(
            ref,
            Message.fromSdk(
              ev.event.message,
              currentUserId: ref.read(currentUserIdProvider),
            ),
          );
        }
        if (!ev.snapshot.acknowledgedByGateway) {
          unawaited(ackCurrentChannel());
        }
      }
    } else if (clearComposerForDelete) {
      state = state.copyWith(
        editingMessage: null,
        messageText: '',
        replyingTo: null,
        replyMentioning: false,
      );
      unawaited(_flushComposerDraftSave());
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

  Future<void> _warmWindowDisplay(
    String channelId,
    List<Message> messages, {
    List<Message> embeddedReplyParents = const <Message>[],
  }) async {
    if (messages.isEmpty) {
      return;
    }
    try {
      final (db.Channel? channel, _) = await (
        ref.read(fluxerDatabaseProvider).channelDao.getChannelById(channelId),
        ref
            .read(messageReferencesProvider.notifier)
            .preload(
              channelId: channelId,
              messages: messages,
              embeddedReplyParents: embeddedReplyParents,
            ),
      ).wait;
      if (!ref.mounted) {
        return;
      }
      final Map<String, Message> cachedReferences = ref
          .read(messageReferencesProvider)
          .cachedMessages;
      final List<Message> replyParents = <Message>[
        for (final Message message in messages)
          if (message.replyParentMessageId case final String parentId)
            if (cachedReferences[MessageReferencesState.key(
                  message.replyParentChannelId,
                  parentId,
                )]
                case final Message parent)
              parent,
      ];
      await _displayWarmer.warm(
        ref,
        channelId: channelId,
        guildId: channel?.guildId,
        userIds: collectMessageMemberUserIds(
          messages,
          embeddedReplyParents: replyParents,
        ),
      );
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to warm message display: $e');
    }
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

  void _dropDeletedFromParkedWindow(MessageRealtimeEvent ev) {
    final String channelId = switch (ev) {
      MessageDeleted(:final event) => event.channelId,
      MessagesDeletedBulk(:final event) => event.channelId,
      _ => '',
    };
    if (channelId.isEmpty) {
      return;
    }
    final Set<String> deletedIds = _deletedMessageIdsFor(ev);
    if (deletedIds.isEmpty) {
      return;
    }
    final _ParkedChannelWindow? parked = _parkedWindows[channelId];
    if (parked == null || parked.messages.isEmpty) {
      return;
    }
    final List<Message> remaining = <Message>[
      for (final Message message in parked.messages)
        if (!deletedIds.contains(message.id)) message,
    ];
    if (remaining.length == parked.messages.length) {
      return;
    }
    if (remaining.isEmpty) {
      _dropParkedWindow(channelId);
      return;
    }
    _parkedWindows[channelId] = _ParkedChannelWindow(
      messages: List<Message>.unmodifiable(remaining),
      hasMoreMessages: parked.hasMoreMessages,
      hasMoreNewerMessages: parked.hasMoreNewerMessages,
    );
  }

  Future<db.Message?> _prefetchRowFor(MessageRealtimeEvent ev) async {
    final dao = ref.read(fluxerDatabaseProvider).messageDao;
    switch (ev) {
      case MessageUpdated(:final event):
        final String messageId = event.message.id;
        if (event.message.channelId != state.channelId ||
            state.messages.any((Message m) => m.id == messageId) ||
            !_isMessageInLoadedWindow(messageId)) {
          return null;
        }
        return dao.getMessage(event.message.channelId, messageId);
      case MessageReactionsChanged(:final channelId, :final messageId):
        if (channelId != state.channelId) {
          return null;
        }
        return dao.getMessage(channelId, messageId);
      case MessageCreated():
      case MessageDeleted():
      case MessagesDeletedBulk():
        return null;
    }
  }

  List<Message>? _nextMessagesForSync(
    MessageRealtimeEvent ev, {
    required List<Message> messages,
    db.Message? prefetchedRow,
  }) {
    switch (ev) {
      case MessageCreated(:final event, :final snapshot):
        if (event.message.channelId != state.channelId) {
          return null;
        }
        final Message msg = _toDomain(
          event.message,
        ).copyWith(isMentioned: snapshot.mentionsCurrentUser);
        final int matchedIndex = indexOfLocalSendForDelivered(messages, msg);
        if (matchedIndex != -1) {
          final Message existing = messages[matchedIndex];
          if (existing.id == msg.id &&
              existing.deliveryState == MessageDeliveryState.sent) {
            if (!existing.isMentioned && msg.isMentioned) {
              final List<Message> updated = List<Message>.from(messages);
              updated[matchedIndex] = existing.copyWith(isMentioned: true);
              return updated;
            }
            return null;
          }
          return _replaceOptimisticWithDelivered(
            messages: messages,
            optimisticId: existing.id,
            delivered: msg.copyWith(
              deliveryState: MessageDeliveryState.sent,
              sendError: null,
            ),
          );
        }
        final int existingIndex = messages.indexWhere((m) => m.id == msg.id);
        if (existingIndex != -1) {
          final Message existing = messages[existingIndex];
          if (!existing.isMentioned && msg.isMentioned) {
            return _replaceById(messages, existing.copyWith(isMentioned: true));
          }
          return null;
        }
        if (state.hasMoreNewerMessages) {
          return null;
        }
        _contiguity.extendNewer(state.channelId, msg.id);
        return <Message>[...messages, msg];
      case MessageUpdated(:final event, :final mentionsCurrentUser):
        if (event.message.channelId != state.channelId) {
          return null;
        }
        final String messageId = event.message.id;
        final int idx = messages.indexWhere((m) => m.id == messageId);
        if (idx != -1) {
          final Message merged = messages[idx].applyGatewayUpdate(
            event.message,
            isMentioned: mentionsCurrentUser,
          );
          return _replaceById(messages, merged);
        }
        if (prefetchedRow == null) {
          return null;
        }
        return _replaceById(messages, Message.fromRow(prefetchedRow));
      case MessageDeleted(:final event):
        if (event.channelId != state.channelId) {
          return null;
        }
        return _removeIds(messages, {event.messageId});
      case MessagesDeletedBulk(:final event):
        if (event.channelId != state.channelId) {
          return null;
        }
        return _removeIds(messages, event.ids.toSet());
      case MessageReactionsChanged(:final channelId):
        if (channelId != state.channelId || prefetchedRow == null) {
          return null;
        }
        return _replaceById(messages, Message.fromRow(prefetchedRow));
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

  void applyMessageTranslation({
    required String messageId,
    required MessageTranslation? translation,
  }) {
    final int idx = state.messages.indexWhere(
      (Message message) => message.id == messageId,
    );
    if (idx == -1) {
      return;
    }
    final Message existing = state.messages[idx];
    final List<Message> next = List<Message>.from(state.messages);
    next[idx] = existing.copyWith(translation: translation);
    state = state.copyWith(
      write: (messages: next, origin: MessagesOrigin.localMutation),
    );
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
      replyMentioning: state.replyingTo == null ? null : state.replyMentioning,
    );
  }

  Future<void> _persistComposerDraftForChannel({
    required String channelId,
    required String content,
    Message? reply,
    bool? replyMentioning,
  }) async {
    if (channelId.isEmpty) {
      return;
    }
    final Future<void> write = _writeComposerDraft(
      channelId: channelId,
      content: content,
      reply: reply,
      replyMentioning: replyMentioning,
    );
    _pendingDraftWrites[channelId] = write;
    try {
      await write;
    } finally {
      _pendingDraftWrites.removeWhere(
        (_, Future<void> pending) => identical(pending, write),
      );
    }
  }

  Future<void> _writeComposerDraft({
    required String channelId,
    required String content,
    required Message? reply,
    required bool? replyMentioning,
  }) async {
    final String sanitizedContent = stripPrivateUseCharacters(content);
    final String? replyId = reply?.id;
    final bool hasDraft =
        hasVisibleContent(sanitizedContent) || replyId != null;
    final dao = ref.read(fluxerDatabaseProvider).composerDraftDao;
    if (!hasDraft) {
      await dao.deleteDraft(channelId);
      return;
    }
    await dao.upsertDraft(
      channelId: channelId,
      content: sanitizedContent,
      replyToMessageId: replyId,
      replyMentioning: replyId == null ? null : replyMentioning,
    );
  }

  void forgetChannel(String channelId) {
    if (channelId == state.channelId) {
      _forgottenLiveChannelId = channelId;
    }
    _dropParkedWindow(channelId);
  }

  void _parkLoadedWindow(String channelId) {
    final ({String channelId, String messageId})? pendingTrim =
        _pendingTrimAround;
    _pendingTrimAround = null;
    if (_forgottenLiveChannelId == channelId) {
      _forgottenLiveChannelId = null;
      return;
    }
    if (channelId.isEmpty || state.messages.isEmpty) {
      return;
    }
    final MessageWindowTrim trim = pendingTrim?.channelId == channelId
        ? trimMessageWindowAround(
            state.messages,
            aroundId: pendingTrim!.messageId,
          )
        : MessageWindowTrim(
            messages: state.messages,
            droppedOlder: false,
            droppedNewer: false,
          );
    final List<Message> parkedMessages = <Message>[];
    for (final Message message in trim.messages) {
      final String? nonce = message.clientNonce;
      if (nonce != null &&
          isLocalSendPlaceholder(message) &&
          _localSends.containsKey(nonce)) {
        _localSends[nonce] = message;
        continue;
      }
      parkedMessages.add(message);
    }
    _parkedWindows.remove(channelId);
    _parkedWindows[channelId] = _ParkedChannelWindow(
      messages: List<Message>.unmodifiable(parkedMessages),
      hasMoreMessages: state.hasMoreMessages || trim.droppedOlder,
      hasMoreNewerMessages: state.hasMoreNewerMessages || trim.droppedNewer,
    );
    while (_parkedWindows.length > _kMaxParkedWindows) {
      _dropParkedWindow(_parkedWindows.keys.first);
    }
  }

  void _dropParkedWindow(String channelId) {
    _parkedWindows.remove(channelId);
    if (channelId == state.channelId) {
      return;
    }
    _displayWarmer.release(channelId);
    ref.read(messageReferencesProvider.notifier).clearChannel(channelId);
  }

  Future<void> _applyReadComposerDraft({
    required String channelId,
    required Future<({String text, Message? reply, bool replyMentioning})>
    draftFuture,
    required bool Function() isCurrentSwitch,
    required void Function(String name) mark,
  }) async {
    final ({String text, Message? reply, bool replyMentioning}) loaded =
        await draftFuture;
    if (!isCurrentSwitch()) {
      return;
    }
    mark('draft');
    _applyComposerDraftIfCurrent(
      channelId: channelId,
      draft: (text: loaded.text, reply: loaded.reply),
      replyMentioning: loaded.replyMentioning,
    );
  }

  void _applyComposerDraftIfCurrent({
    required String channelId,
    required ({String text, Message? reply}) draft,
    required bool replyMentioning,
  }) {
    if (!ref.mounted || state.channelId != channelId) {
      return;
    }
    state = state.copyWith(
      messageText: draft.text,
      replyingTo: draft.reply,
      replyMentioning: replyMentioning,
    );
  }

  Future<({String text, Message? reply, bool replyMentioning})>
  _readComposerDraft(String channelId) async {
    final ({String text, Message? reply, bool? replyMentioning}) draft =
        await _loadComposerDraft(channelId);
    return (
      text: draft.text,
      reply: draft.reply,
      replyMentioning: await _resolvedReplyMentioning(
        reply: draft.reply,
        storedMentioning: draft.replyMentioning,
        channelId: channelId,
      ),
    );
  }

  Future<({String text, Message? reply, bool? replyMentioning})>
  _loadComposerDraft(String channelId) async {
    await _pendingDraftWrites[channelId];
    final row = await ref
        .read(fluxerDatabaseProvider)
        .composerDraftDao
        .getDraft(channelId);
    if (row == null) {
      return (text: '', reply: null, replyMentioning: null);
    }
    final messageDao = ref.read(fluxerDatabaseProvider).messageDao;
    Message? reply;
    if (row.replyToMessageId != null) {
      final db.Message? dbMsg = await messageDao.getMessage(
        channelId,
        row.replyToMessageId!,
      );
      reply = dbMsg == null ? null : Message.fromRow(dbMsg);
    }
    return (
      text: stripPrivateUseCharacters(row.content),
      reply: reply,
      replyMentioning: row.replyMentioning,
    );
  }

  Future<bool> _resolvedReplyMentioning({
    required Message? reply,
    required bool? storedMentioning,
    required String channelId,
  }) async {
    if (reply == null) {
      return false;
    }
    if (storedMentioning != null) {
      return storedMentioning;
    }
    return _defaultReplyMentionFor(message: reply, channelId: channelId);
  }

  Future<bool> _endEditRestoringDraft(Message editing) async {
    _endingEdit = editing;
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      state = state.copyWith(editingMessage: null, messageText: '');
      return true;
    }
    final draft = await _loadComposerDraft(channelId);
    final bool replyMentioning = await _resolvedReplyMentioning(
      reply: draft.reply,
      storedMentioning: draft.replyMentioning,
      channelId: channelId,
    );
    if (state.channelId != channelId ||
        !identical(state.editingMessage, editing)) {
      return false;
    }
    state = state.copyWith(
      editingMessage: null,
      messageText: draft.text,
      replyingTo: draft.reply,
      replyMentioning: replyMentioning,
    );
    return true;
  }

  void _bindIncomingChannelWindow({
    required String channelId,
    required bool loadMessages,
    required String? targetMessageId,
  }) {
    final _ParkedChannelWindow? parked = _parkedWindows[channelId];
    final bool restoreParked =
        loadMessages &&
        (targetMessageId == null || targetMessageId.isEmpty) &&
        parked != null &&
        parked.messages.isNotEmpty &&
        _canRestoreParkedWindow(parked, channelId);
    if (restoreParked) {
      _replaceLiveWindow(
        channelId: channelId,
        messages: _mergeInFlightSends(channelId, parked.messages),
        isLoading: false,
        isSyncingMessages: false,
        hasMoreMessages: parked.hasMoreMessages,
        hasMoreNewerMessages: parked.hasMoreNewerMessages,
      );
      _invalidateMessageCacheTrust();
      _deferMessageReferencesLoaded(
        channelId: channelId,
        messages: parked.messages,
      );
      return;
    }
    _replaceLiveWindow(
      channelId: channelId,
      messages: const <Message>[],
      isLoading: loadMessages,
      isSyncingMessages: false,
      hasMoreMessages: true,
      hasMoreNewerMessages: false,
    );
  }

  void _replaceLiveWindow({
    required String channelId,
    required List<Message> messages,
    required bool isLoading,
    required bool isSyncingMessages,
    required bool hasMoreMessages,
    required bool hasMoreNewerMessages,
  }) {
    state = _switchedChannelState(
      channelId: channelId,
      messages: messages,
      draft: (text: '', reply: null),
      replyMentioning: false,
      scrollToBottomSignal: state.scrollToBottomSignal,
      isLoading: isLoading,
      isSyncingMessages: isSyncingMessages,
      isLoadingMore: false,
      isLoadingNewer: false,
      hasMoreMessages: hasMoreMessages,
      hasMoreNewerMessages: hasMoreNewerMessages,
      replaceWindow: true,
    );
  }

  bool _isBlankLoadingFor(String channelId) {
    return state.channelId == channelId &&
        state.messages.isEmpty &&
        state.isLoading;
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
    required bool replaceWindow,
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
      windowEpoch: replaceWindow ? state.windowEpoch + 1 : state.windowEpoch,
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
  }) {
    final request = (
      channelId: channelId,
      targetMessageId: targetMessageId,
      loadMessages: loadMessages,
    );
    final Future<void>? inFlight = _switchInFlightRequest == request
        ? _switchInFlightFuture
        : null;
    if (inFlight != null) {
      talker.debug(
        '[ChatViewModel] switchChannel joins in-flight channel=$channelId '
        'target=$targetMessageId',
      );
      return inFlight;
    }
    final Future<void> pending = _switchChannel(
      channelId,
      targetMessageId: targetMessageId,
      loadMessages: loadMessages,
    );
    _switchInFlightRequest = request;
    _switchInFlightFuture = pending;
    return pending.whenComplete(() {
      if (_switchInFlightFuture == pending) {
        _switchInFlightRequest = null;
        _switchInFlightFuture = null;
      }
    });
  }

  Future<void> _switchChannel(
    String channelId, {
    String? targetMessageId,
    bool loadMessages = true,
  }) async {
    talker.debug(
      '[ChatViewModel] switchChannel channel=$channelId '
      'target=$targetMessageId load=$loadMessages',
    );
    final Stopwatch switchStopwatch = Stopwatch()..start();
    final List<String> phaseMarks = <String>[];
    void mark(String name) {
      phaseMarks.add('$name@${switchStopwatch.elapsedMilliseconds}');
    }

    if (state.channelId == channelId &&
        targetMessageId != null &&
        state.isLoading &&
        state.highlightedMessageId == targetMessageId) {
      return;
    }
    if (state.channelId == channelId &&
        targetMessageId == null &&
        loadMessages &&
        (state.isLoading || state.isSyncingMessages) &&
        (state.messages.isNotEmpty || state.highlightedMessageId != null)) {
      return;
    }
    _userScrollActive = false;
    _pendingSessionResync = false;
    final int switchGeneration = ++_channelSwitchGeneration;
    bool isCurrentSwitch() => switchGeneration == _channelSwitchGeneration;
    int? cacheFetchOrdinal;
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
      final bool isChannelChange = previousChannelId != channelId;
      if (isChannelChange) {
        if (previousChannelId.isNotEmpty) {
          _parkLoadedWindow(previousChannelId);
          _contiguity.invalidate();
          final String previousText = state.messageText;
          final Message? previousReply = state.replyingTo;
          final bool? previousReplyMentioning = previousReply == null
              ? null
              : state.replyMentioning;
          _draftSaveTimer?.cancel();
          _draftSaveTimer = null;
          _readAckRetryTimer?.cancel();
          _clearSyncRetry();
          _clearManualUnread(previousChannelId);
          _clearLoadedUnreadBoundaryKeys(previousChannelId);
          if (state.editingMessage == null) {
            unawaited(
              _persistComposerDraftForChannel(
                channelId: previousChannelId,
                content: previousText,
                reply: previousReply,
                replyMentioning: previousReplyMentioning,
              ),
            );
          }
        } else if (state.messages.isNotEmpty) {
          _contiguity.invalidate();
        }
        _windowGeneration++;
        if (_armedSwap != null) {
          _armedSwap = null;
          _pumpRealtimeQueue();
        }
        _bindIncomingChannelWindow(
          channelId: channelId,
          loadMessages: loadMessages,
          targetMessageId: targetMessageId,
        );
      }
      final Future<({String text, Message? reply, bool replyMentioning})>
      draftFuture = _readComposerDraft(channelId);
      if (!loadMessages) {
        final loadedDraft = await draftFuture;
        if (!isCurrentSwitch()) {
          return;
        }
        mark('draft');
        if (isChannelChange) {
          _applyComposerDraftIfCurrent(
            channelId: channelId,
            draft: (text: loadedDraft.text, reply: loadedDraft.reply),
            replyMentioning: loadedDraft.replyMentioning,
          );
          return;
        }
        state = _switchedChannelState(
          channelId: channelId,
          messages: state.messages,
          draft: (text: loadedDraft.text, reply: loadedDraft.reply),
          replyMentioning: loadedDraft.replyMentioning,
          scrollToBottomSignal: state.scrollToBottomSignal,
          isLoading: false,
          isSyncingMessages: false,
          isLoadingMore: false,
          isLoadingNewer: false,
          hasMoreMessages: state.hasMoreMessages,
          hasMoreNewerMessages: state.hasMoreNewerMessages,
          replaceWindow: false,
        );
        return;
      }
      if (targetMessageId != null) {
        if (state.channelId == channelId &&
            state.isLoading &&
            !isChannelChange &&
            state.highlightedMessageId == targetMessageId) {
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
        if (!_isBlankLoadingFor(channelId)) {
          _replaceLiveWindow(
            channelId: channelId,
            messages: const <Message>[],
            isLoading: true,
            isSyncingMessages: false,
            hasMoreMessages: true,
            hasMoreNewerMessages: false,
          );
        }
        highlightJumpMessage(targetMessageId);
        await _loadMessages(
          channelId,
          targetMessageId: targetMessageId,
          shouldApplyResult: isCurrentSwitch,
        );
        await _applyReadComposerDraft(
          channelId: channelId,
          draftFuture: draftFuture,
          isCurrentSwitch: isCurrentSwitch,
          mark: mark,
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
          !isChannelChange &&
          state.messages.isNotEmpty) {
        return;
      }
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
            shouldApplyResult: isCurrentSwitch,
            isDirectLatestLoad: false,
            preserveLoadedWindow: true,
          ),
        );
        return;
      }
      final repo = ref.read(messageRepositoryProvider);
      final int cacheOrdinal = _beginPageFetch();
      cacheFetchOrdinal = cacheOrdinal;
      final Future<bool> unreadFuture = _channelHasNewUnreadMessages(channelId);
      final Future<List<Message>> cacheFuture = repo.getCachedMessages(
        channelId,
        limit: _kInitialPageSize,
      );
      final Future<db.Channel?> channelRowFuture = ref
          .read(fluxerDatabaseProvider)
          .channelDao
          .getChannelById(channelId);
      final _ParkedChannelWindow? parked = _parkedWindows[channelId];
      if (parked != null && parked.messages.isNotEmpty) {
        final bool hasUnread = await unreadFuture;
        if (!isCurrentSwitch()) {
          return;
        }
        if (!hasUnread) {
          mark('reads');
          final bool restoreParked =
              _canRestoreParkedWindow(parked, channelId) ||
              await _loadedWindowIsPresent(parked.messages);
          if (!isCurrentSwitch()) {
            return;
          }
          if (restoreParked) {
            await _warmWindowDisplay(channelId, parked.messages);
            if (!isCurrentSwitch()) {
              return;
            }
            final bool willRefresh = _shouldRefreshChannelFromNetwork(
              channelId,
            );
            if (state.messages.isEmpty ||
                chatWindowMismatchesChannel(
                  expectedChannelId: channelId,
                  channelId: state.channelId,
                  messages: state.messages,
                )) {
              _replaceLiveWindow(
                channelId: channelId,
                messages: _finalizeLoadedMessages(
                  channelId,
                  parked.messages,
                  cacheOrdinal,
                ),
                isLoading: false,
                isSyncingMessages: willRefresh,
                hasMoreMessages: parked.hasMoreMessages,
                hasMoreNewerMessages: parked.hasMoreNewerMessages,
              );
              _invalidateMessageCacheTrust();
              _deferMessageReferencesLoaded(
                channelId: channelId,
                messages: parked.messages,
              );
            } else if (willRefresh && !state.isSyncingMessages) {
              state = state.copyWith(isSyncingMessages: true);
            }
            if (willRefresh) {
              unawaited(
                _refreshMessagesFromNetwork(
                  channelId,
                  isDirectLatestLoad: false,
                  preserveLoadedWindow: true,
                  shouldApplyResult: isCurrentSwitch,
                ),
              );
            }
            await _applyReadComposerDraft(
              channelId: channelId,
              draftFuture: draftFuture,
              isCurrentSwitch: isCurrentSwitch,
              mark: mark,
            );
            return;
          }
        }
      }
      final (List<Message> cachedRows, bool hasUnread) = await (
        cacheFuture,
        unreadFuture,
      ).wait;
      if (!isCurrentSwitch()) {
        return;
      }
      mark('reads');
      final cached = mergeMentionHighlightFlags(
        cachedRows,
        currentUserId: currentUserId,
      );
      if (cached.isNotEmpty && !hasUnread) {
        final bool cachePresent = await _loadedWindowIsPresent(cached);
        if (!isCurrentSwitch() || state.channelId != channelId) {
          return;
        }
        if (cachePresent) {
          await _warmWindowDisplay(channelId, cached);
          if (!isCurrentSwitch() || state.channelId != channelId) {
            return;
          }
          final bool incompleteCache = cached.length < _kPageSize;
          // Only a latest page can refute a tail deleted while offline: https://feedback.fluxer.com/p/1863
          final bool proveTailFromLatestPage = _messagesNeedResync(channelId);
          final bool willRefresh =
              incompleteCache ||
              proveTailFromLatestPage ||
              _shouldRefreshChannelFromNetwork(channelId);
          _replaceLiveWindow(
            channelId: channelId,
            messages: _finalizeLoadedMessages(channelId, cached, cacheOrdinal),
            isLoading: false,
            isSyncingMessages: willRefresh,
            hasMoreMessages:
                cached.first.type != messageTypeThreadStarterMessage,
            hasMoreNewerMessages: false,
          );
          _invalidateMessageCacheTrust();
          _deferMessageReferencesLoaded(channelId: channelId, messages: cached);
          if (willRefresh) {
            unawaited(
              _refreshMessagesFromNetwork(
                channelId,
                isDirectLatestLoad: incompleteCache || proveTailFromLatestPage,
                preserveLoadedWindow:
                    !incompleteCache && !proveTailFromLatestPage,
                shouldApplyResult: isCurrentSwitch,
              ),
            );
          }
          await _applyReadComposerDraft(
            channelId: channelId,
            draftFuture: draftFuture,
            isCurrentSwitch: isCurrentSwitch,
            mark: mark,
          );
          return;
        }
      }
      if (state.channelId != channelId) {
        return;
      }
      final db.Channel? channelRow = await channelRowFuture;
      if (!isCurrentSwitch() || state.channelId != channelId) {
        return;
      }
      if (cached.isEmpty &&
          !hasUnread &&
          channelRow != null &&
          channelRow.lastMessageId == null) {
        _replaceLiveWindow(
          channelId: channelId,
          messages: _finalizeLoadedMessages(
            channelId,
            const <Message>[],
            cacheOrdinal,
          ),
          isLoading: false,
          isSyncingMessages: false,
          hasMoreMessages: false,
          hasMoreNewerMessages: false,
        );
        unawaited(
          _refreshMessagesFromNetwork(
            channelId,
            isDirectLatestLoad: true,
            shouldApplyResult: isCurrentSwitch,
          ),
        );
        await _applyReadComposerDraft(
          channelId: channelId,
          draftFuture: draftFuture,
          isCurrentSwitch: isCurrentSwitch,
          mark: mark,
        );
        return;
      }
      if (!_isBlankLoadingFor(channelId)) {
        _replaceLiveWindow(
          channelId: channelId,
          messages: const <Message>[],
          isLoading: true,
          isSyncingMessages: false,
          hasMoreMessages: true,
          hasMoreNewerMessages: false,
        );
      }
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
      mark('ack');
      await _refreshMessagesFromNetwork(
        channelId,
        showLoadingSpinner: true,
        aroundMessageId: aroundUnreadId,
        isDirectLatestLoad: aroundUnreadId == null,
        shouldApplyResult: isCurrentSwitch,
      );
      mark('net');
      await _applyReadComposerDraft(
        channelId: channelId,
        draftFuture: draftFuture,
        isCurrentSwitch: isCurrentSwitch,
        mark: mark,
      );
    } finally {
      if (cacheFetchOrdinal != null) {
        _endPageFetch(cacheFetchOrdinal);
      }
      if (isCurrentSwitch()) {
        _resendSendsAwaitingReconnect();
      }
      debugPrint(
        '[ChatViewModel] switchChannel($channelId) completed in '
        '${switchStopwatch.elapsedMilliseconds}ms'
        '${phaseMarks.isEmpty ? '' : ' [${phaseMarks.join(' ')}]'}',
      );
    }
  }

  void _deferMessageReferencesLoaded({
    required String channelId,
    required List<Message> messages,
    List<Message>? embeddedReplyParents,
  }) {
    scheduleMicrotask(() async {
      if (!ref.mounted || state.channelId != channelId) {
        return;
      }
      await _onMessageBatchLoaded(
        channelId: channelId,
        messages: messages,
        embeddedReplyParents: embeddedReplyParents ?? const <Message>[],
      );
    });
  }

  Future<void> refreshAfterSessionRecovery() async {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    if (state.isLoading || state.isSyncingMessages) {
      _pendingSessionResync = true;
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
      _pendingSessionResync = true;
      return;
    }
    if (_userScrollActive) {
      _pendingSessionResync = true;
      return;
    }
    final int windowGeneration = _windowGeneration;
    final int switchGeneration = _channelSwitchGeneration;
    bool stillOurs() =>
        windowGeneration == _windowGeneration &&
        switchGeneration == _channelSwitchGeneration &&
        state.channelId == channelId;
    _lastNetworkRefreshByChannel.remove(channelId);
    state = state.copyWith(isSyncingMessages: true);
    final bool loadLatestTail =
        ref.read(chatReadViewportProvider).nearLoadedTail &&
        !state.hasMoreNewerMessages;
    try {
      if (loadLatestTail) {
        await _refreshMessagesFromNetwork(
          channelId,
          isDirectLatestLoad: true,
          onApplied: scrollToBottom,
        );
      } else {
        await _refreshMessagesFromNetwork(
          channelId,
          isDirectLatestLoad: false,
          preserveLoadedWindow: state.messages.isNotEmpty,
        );
      }
    } finally {
      if (stillOurs() && state.isSyncingMessages) {
        state = state.copyWith(isSyncingMessages: false);
      }
      if (_pendingSessionResync) {
        _pendingSessionResync = false;
        unawaited(_reconcileCurrentChannelFromNetwork());
      }
    }
  }

  void _onSessionNeedsMessageResync() {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      return;
    }
    _lastNetworkRefreshByChannel.remove(channelId);
    if (state.isLoading || state.isSyncingMessages) {
      _pendingSessionResync = true;
      return;
    }
    unawaited(_reconcileCurrentChannelFromNetwork());
  }

  void _scheduleSyncRetry(String channelId) {
    _syncRetryTimer?.cancel();
    _syncRetryAttempt += 1;
    _syncRetryTimer = Timer(
      jitteredBackoff(
        attempt: _syncRetryAttempt,
        base: _kSyncRetryBaseDelay,
        cap: _kSyncRetryMaxDelay,
        random: _syncRetryRandom,
      ),
      () {
        _syncRetryTimer = null;
        if (ref.mounted && state.channelId == channelId) {
          _onSessionNeedsMessageResync();
        }
      },
    );
  }

  void _resumePendingSyncRetry() {
    final Timer? timer = _syncRetryTimer;
    if (timer == null) {
      return;
    }
    timer.cancel();
    _syncRetryTimer = null;
    _onSessionNeedsMessageResync();
  }

  void _clearSyncRetry() {
    _syncRetryTimer?.cancel();
    _syncRetryTimer = null;
    _syncRetryAttempt = 0;
  }

  bool _shouldResyncAfterForegroundReturn() {
    try {
      final GatewayConnection connection = ref.read(gatewayConnectionProvider);
      if (connection.isReconnectSuspended) {
        return true;
      }
      if (connection.state == GatewayState.connected &&
          !connection.isLikelyStale) {
        return false;
      }
    } on Object {
      return true;
    }
    return true;
  }

  List<Message> _withMentionHighlightFlags(List<Message> messages) {
    final String? currentUserId = ref.read(currentUserIdProvider);
    List<Message>? out;
    for (int i = 0; i < messages.length; i += 1) {
      final Message merged = mergeMentionHighlightFlag(
        incoming: messages[i],
        currentUserId: currentUserId,
      );
      if (!identical(merged, messages[i])) {
        out ??= List<Message>.from(messages);
        out[i] = merged;
      }
    }
    return out ?? messages;
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
    VoidCallback? onApplied,
  }) async {
    final int windowGeneration = _windowGeneration;
    final int switchGeneration = _channelSwitchGeneration;
    bool shouldApply() =>
        windowGeneration == _windowGeneration &&
        (shouldApplyResult?.call() ?? true);
    bool stillCurrent() =>
        shouldApply() &&
        switchGeneration == _channelSwitchGeneration &&
        state.channelId == channelId;
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
    final int swapToken = _armWindowSwap(channelId);
    bool ownsSwap() => _armedSwap?.token == swapToken;
    final int fetchOrdinal = _beginPageFetch();
    try {
      final String? effectiveAroundMessageId =
          targetMessageId ?? aroundMessageId;
      final int effectiveLimit = limit;
      final repo = ref.read(messageRepositoryProvider);
      MessageListLoadResult page;
      bool isLatestPage = false;
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
          isLatestPage = true;
        }
      } else {
        page = await repo.loadMessagePage(
          channelId: channelId,
          around: effectiveAroundMessageId,
          limit: effectiveLimit,
        );
        isLatestPage = effectiveAroundMessageId == null;
      }
      if (!stillCurrent() || !ownsSwap()) {
        return;
      }
      bool emptyLatestRescued = false;
      int effectiveFetchOrdinal = fetchOrdinal;
      if (isDirectLatestLoad && page.messages.isEmpty) {
        final String? pointer = await _channelLastMessagePointer(channelId);
        if (pointer != null && pointer.isNotEmpty) {
          final int rescueOrdinal = _beginPageFetch();
          try {
            final MessageListLoadResult rescuePage = await repo.loadMessagePage(
              channelId: channelId,
              before: pointer,
              limit: effectiveLimit,
            );
            if (!stillCurrent() || !ownsSwap()) {
              return;
            }
            if (rescuePage.messages.isNotEmpty) {
              page = rescuePage;
              emptyLatestRescued = true;
              effectiveFetchOrdinal = rescueOrdinal;
              isLatestPage = false;
            }
          } finally {
            _endPageFetch(rescueOrdinal);
          }
        }
      }
      if (preserveLoadedWindow &&
          !networkPageOverlapsWindow(
            window: state.messages,
            networkPage: page.messages,
          )) {
        state = state.copyWith(
          isLoading: false,
          isSyncingMessages: false,
          hasMoreNewerMessages: true,
          errorMessage: null,
          messageLoadFailed: false,
        );
        return;
      }
      List<Message> reduceAgainst(List<Message> current) {
        final List<Message> reconciled =
            preserveLoadedWindow && current.isNotEmpty
            ? reconcileStaleDeletionsInLoadedWindow(
                current: current,
                networkPage: page.messages,
                isLatestPage: isLatestPage,
              )
            : reconcileMessagesWithNetworkPage(
                current: current,
                networkPage: page.messages,
                syncBaselineOldestId: current.isEmpty ? null : current.first.id,
                isLatestPage: isLatestPage,
              );
        return _finalizeLoadedMessages(
          channelId,
          reconciled,
          effectiveFetchOrdinal,
        );
      }

      final List<Message> merged = reduceAgainst(state.messages);
      await _warmWindowDisplay(
        channelId,
        merged,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      final String? mergedServerTailId = newestServerBackedMessageId(merged);
      final ({bool hasMoreNewer, bool needsTailProbe}) newerConsult =
          (isDirectLatestLoad && !emptyLatestRescued) ||
              mergedServerTailId == null
          ? const (hasMoreNewer: false, needsTailProbe: false)
          : await _hasNewerMessagesThanChannel(
              mergedServerTailId,
              detachedWindow:
                  effectiveAroundMessageId != null &&
                  !aroundPageReachesLiveTail(
                    anchorId: effectiveAroundMessageId,
                    page: page.messages,
                    limit: effectiveLimit,
                  ),
              knownLoadedMessageIds: merged
                  .map((Message message) => message.id)
                  .toSet(),
            );
      final bool hasMoreNewer = newerConsult.hasMoreNewer;
      if (!stillCurrent() || !ownsSwap()) {
        return;
      }

      final bool aroundTargetMissing =
          effectiveAroundMessageId != null &&
          !page.messages.any(
            (Message message) => message.id == effectiveAroundMessageId,
          );
      if (aroundTargetMissing) {
        talker.warning(
          '[ChatViewModel] around target $effectiveAroundMessageId '
          'not found in response channel=$channelId '
          'pageSize=${page.messages.length}',
        );
      }

      final bool hasMoreOlder =
          aroundTargetMissing ||
          (preserveLoadedWindow
              ? state.hasMoreMessages
              : emptyLatestRescued ||
                    page.messages.length >= effectiveLimit ||
                    (effectiveAroundMessageId != null &&
                        page.messages.isNotEmpty));
      final bool applied = await _commitWindowSwap(
        swapToken,
        channelId,
        effectiveFetchOrdinal,
        stillCurrent,
        () {
          state = state.copyWith(
            write: (
              messages: _withMentionHighlightFlags(
                reduceAgainst(state.messages),
              ),
              origin: MessagesOrigin.windowSwap,
            ),
            isLoading: false,
            isSyncingMessages: false,
            hasMoreMessages: hasMoreOlder,
            hasMoreNewerMessages: hasMoreNewer,
            errorMessage: null,
            messageLoadFailed: false,
            windowEpoch: state.windowEpoch + 1,
          );
          if (!preserveLoadedWindow) {
            _contiguity.setVerified(channelId, page.messages);
          }
          _contiguityTrusted = true;
        },
      );
      if (!applied || !stillCurrent()) {
        return;
      }
      _clearSyncRetry();
      onApplied?.call();
      unawaited(
        _onMessageBatchLoaded(
          channelId: channelId,
          messages: state.messages,
          embeddedReplyParents: page.embeddedReplyParents,
        ),
      );
      if (newerConsult.needsTailProbe) {
        _confirmProvisionalTail(channelId);
      }
      if (targetMessageId == null) {
        _markChannelNetworkRefresh(channelId);
        _markMessagesReconciled(channelId);
        await _onMessagesLoaded(channelId);
        if (isDirectLatestLoad &&
            !emptyLatestRescued &&
            page.messages.length < effectiveLimit) {
          await _reconcileReadStateAfterLatestLoad(channelId);
        }
      }
    } on Exception catch (e) {
      final bool retryQuietly =
          targetMessageId == null && isTransientNetworkError(e);
      if (retryQuietly) {
        talker.warning('[ChatViewModel] Message sync failed, will retry: $e');
      } else {
        debugPrint('[ChatViewModel] Failed to load messages: $e');
      }
      if (!stillCurrent() || !ownsSwap()) {
        return;
      }
      final bool hasCachedMessages = state.messages.isNotEmpty;
      if (retryQuietly) {
        _scheduleSyncRetry(channelId);
      }
      state = state.copyWith(
        isLoading: false,
        isSyncingMessages: false,
        messageLoadFailed: !hasCachedMessages,
        errorMessage: hasCachedMessages && !retryQuietly
            ? 'Failed to sync messages'
            : null,
      );
    } finally {
      _endPageFetch(fetchOrdinal);
      await _disarmWindowSwap(swapToken);
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
    final (db.Channel? channel, db.ReadState? readState) = await (
      database.channelDao.getChannelById(channelId),
      database.readStateDao.getReadState(channelId),
    ).wait;
    if (readState?.manual ?? false) {
      return true;
    }
    final stickyUnreadId = readState?.stickyUnreadMessageId;
    if (stickyUnreadId != null && stickyUnreadId.isNotEmpty) {
      return true;
    }
    if ((readState?.mentionCount ?? 0) > 0) {
      return true;
    }
    final latestMessageId = await resolveLatestMessageIdForUnreadDisplay(
      database,
      channelId,
      channelLastMessageId: channel?.lastMessageId,
      ackLastMessageId: readState?.lastMessageId,
    );
    final int fallbackAckMs = channel == null
        ? snowflakeTimestampMs(channelId)
        : 0;
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
    final unreadId = _stickyUnreadIdForCurrentMessages(readState: readState);
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
  }

  Future<PageLoadResult> loadMore() async {
    final String channelId = state.channelId;
    final int entryEpoch = state.windowEpoch;
    PageLoadResult older({
      required PageLoadStatus status,
      required bool hasMoreAtEdge,
      String? requestCursor,
      String? installedBoundary,
    }) => PageLoadResult(
      channelId: channelId,
      windowEpoch: entryEpoch,
      requestCursor: requestCursor,
      installedBoundary: installedBoundary,
      status: status,
      hasMoreAtEdge: hasMoreAtEdge,
    );
    if (state.isLoadingMore ||
        !state.hasMoreMessages ||
        state.messages.isEmpty) {
      return older(
        status: PageLoadStatus.skipped,
        hasMoreAtEdge: state.hasMoreMessages,
      );
    }
    if (state.messages.length >= kMaxLoadedMessagesHard) {
      return older(
        status: PageLoadStatus.skipped,
        hasMoreAtEdge: state.hasMoreMessages,
      );
    }
    final String requestedBeforeId = state.messages.first.id;
    bool isStale() =>
        state.channelId != channelId || state.windowEpoch != entryEpoch;
    state = state.copyWith(isLoadingMore: true, messageLoadFailed: false);
    final int fetchOrdinal = _beginPageFetch();
    _loadingMoreOwner = fetchOrdinal;
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
          limit: _kPageSize,
        );
        if (isStale()) {
          return older(
            status: PageLoadStatus.superseded,
            requestCursor: requestedBeforeId,
            hasMoreAtEdge: state.hasMoreMessages,
          );
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
              _releaseLoadingMore(fetchOrdinal);
              return older(
                status: PageLoadStatus.superseded,
                requestCursor: requestedBeforeId,
                hasMoreAtEdge: state.hasMoreMessages,
              );
            case WindowPageApplied(:final window):
              if (isStale()) {
                return older(
                  status: PageLoadStatus.superseded,
                  requestCursor: requestedBeforeId,
                  hasMoreAtEdge: state.hasMoreMessages,
                );
              }
              state = state.copyWith(
                write: (
                  messages: _finalizeLoadedMessages(
                    channelId,
                    window.messages,
                    fetchOrdinal,
                  ),
                  origin: MessagesOrigin.olderPage,
                ),
                hasMoreMessages: window.hasMoreOlder,
                hasMoreNewerMessages: window.hasMoreNewer,
                messageLoadFailed: false,
              );
              _releaseLoadingMore(fetchOrdinal);
              unawaited(
                _onMessageBatchLoaded(
                  channelId: channelId,
                  messages: olderInRange,
                ),
              );
              return older(
                status: PageLoadStatus.applied,
                requestCursor: requestedBeforeId,
                installedBoundary: window.messages.first.id,
                hasMoreAtEdge: window.hasMoreOlder,
              );
          }
        }
      }
      final page = await repo.loadMessagePage(
        channelId: channelId,
        before: requestedBeforeId,
        limit: _kPageSize,
      );
      if (isStale()) {
        return older(
          status: PageLoadStatus.superseded,
          requestCursor: requestedBeforeId,
          hasMoreAtEdge: state.hasMoreMessages,
        );
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
          _releaseLoadingMore(fetchOrdinal);
          return older(
            status: PageLoadStatus.superseded,
            requestCursor: requestedBeforeId,
            hasMoreAtEdge: state.hasMoreMessages,
          );
        case WindowPageApplied(:final window):
          if (isStale()) {
            return older(
              status: PageLoadStatus.superseded,
              requestCursor: requestedBeforeId,
              hasMoreAtEdge: state.hasMoreMessages,
            );
          }
          if (page.messages.isNotEmpty) {
            _contiguity.extendOlder(channelId, page.messages.first.id);
          }
          _contiguityTrusted = true;
          state = state.copyWith(
            write: (
              messages: _finalizeLoadedMessages(
                channelId,
                window.messages,
                fetchOrdinal,
              ),
              origin: MessagesOrigin.olderPage,
            ),
            hasMoreMessages: window.hasMoreOlder,
            hasMoreNewerMessages: window.hasMoreNewer,
            messageLoadFailed: false,
          );
          _releaseLoadingMore(fetchOrdinal);
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
          return older(
            status: page.messages.isEmpty
                ? PageLoadStatus.empty
                : PageLoadStatus.applied,
            requestCursor: requestedBeforeId,
            installedBoundary: page.messages.isEmpty
                ? null
                : window.messages.first.id,
            hasMoreAtEdge: window.hasMoreOlder,
          );
      }
    } on Exception catch (e) {
      talker.warning('[ChatPagination] older load failed', e);
      _releaseLoadingMore(fetchOrdinal);
      if (!isStale()) {
        state = state.copyWith(messageLoadFailed: true);
      }
      return older(
        status: PageLoadStatus.failed,
        requestCursor: requestedBeforeId,
        hasMoreAtEdge: state.hasMoreMessages,
      );
    } finally {
      _endPageFetch(fetchOrdinal);
      _releaseLoadingMore(fetchOrdinal);
    }
  }

  Future<PageLoadResult> loadNewer() async {
    final String channelId = state.channelId;
    final int entryEpoch = state.windowEpoch;
    PageLoadResult newer({
      required PageLoadStatus status,
      required bool hasMoreAtEdge,
      String? requestCursor,
      String? installedBoundary,
    }) => PageLoadResult(
      channelId: channelId,
      windowEpoch: entryEpoch,
      requestCursor: requestCursor,
      installedBoundary: installedBoundary,
      status: status,
      hasMoreAtEdge: hasMoreAtEdge,
    );
    if (state.isLoadingNewer ||
        !state.hasMoreNewerMessages ||
        state.messages.isEmpty) {
      return newer(
        status: PageLoadStatus.skipped,
        hasMoreAtEdge: state.hasMoreNewerMessages,
      );
    }
    if (state.messages.length >= kMaxLoadedMessagesHard) {
      return newer(
        status: PageLoadStatus.skipped,
        hasMoreAtEdge: state.hasMoreNewerMessages,
      );
    }
    final String? requestedAfterId = newestServerBackedMessageId(
      state.messages,
    );
    if (requestedAfterId == null) {
      return newer(
        status: PageLoadStatus.skipped,
        hasMoreAtEdge: state.hasMoreNewerMessages,
      );
    }
    bool isStale() =>
        state.channelId != channelId || state.windowEpoch != entryEpoch;
    state = state.copyWith(isLoadingNewer: true, messageLoadFailed: false);
    final int fetchOrdinal = _beginPageFetch();
    _loadingNewerOwner = fetchOrdinal;
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
          limit: _kPageSize,
        );
        if (isStale()) {
          return newer(
            status: PageLoadStatus.superseded,
            requestCursor: requestedAfterId,
            hasMoreAtEdge: state.hasMoreNewerMessages,
          );
        }
        final newerInRange = cachedPage
            .where((m) => compareSnowflakeIds(m.id, _contiguity.newestId) <= 0)
            .toList();
        if (newerInRange.isNotEmpty &&
            newerInRange.length == cachedPage.length) {
          final bool pageIndicatesMoreNewer =
              (await _hasNewerMessagesThanChannel(
                newerInRange.last.id,
                detachedWindow: true,
              )).hasMoreNewer;
          if (isStale()) {
            return newer(
              status: PageLoadStatus.superseded,
              requestCursor: requestedAfterId,
              hasMoreAtEdge: state.hasMoreNewerMessages,
            );
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
              _releaseLoadingNewer(fetchOrdinal);
              return newer(
                status: PageLoadStatus.superseded,
                requestCursor: requestedAfterId,
                hasMoreAtEdge: state.hasMoreNewerMessages,
              );
            case WindowPageApplied(:final window):
              if (isStale()) {
                return newer(
                  status: PageLoadStatus.superseded,
                  requestCursor: requestedAfterId,
                  hasMoreAtEdge: state.hasMoreNewerMessages,
                );
              }
              state = state.copyWith(
                write: (
                  messages: _finalizeLoadedMessages(
                    channelId,
                    window.messages,
                    fetchOrdinal,
                  ),
                  origin: MessagesOrigin.newerPage,
                ),
                hasMoreMessages: window.hasMoreOlder,
                hasMoreNewerMessages: window.hasMoreNewer,
                messageLoadFailed: false,
              );
              _releaseLoadingNewer(fetchOrdinal);
              unawaited(
                _onMessageBatchLoaded(
                  channelId: channelId,
                  messages: window.messages,
                ),
              );
              return newer(
                status: PageLoadStatus.applied,
                requestCursor: requestedAfterId,
                installedBoundary: newestServerBackedMessageId(window.messages),
                hasMoreAtEdge: window.hasMoreNewer,
              );
          }
        }
      }
      final page = await repo.loadMessagePage(
        channelId: channelId,
        after: requestedAfterId,
        limit: _kPageSize,
      );
      if (isStale()) {
        return newer(
          status: PageLoadStatus.superseded,
          requestCursor: requestedAfterId,
          hasMoreAtEdge: state.hasMoreNewerMessages,
        );
      }
      final ({bool hasMoreNewer, bool needsTailProbe}) newerConsult =
          await _hasNewerMessagesThanChannel(
            page.messages.isEmpty ? requestedAfterId : page.messages.last.id,
            detachedWindow: page.messages.length >= _kPageSize,
          );
      final bool tailConfirmed =
          page.messages.isEmpty &&
          _isTailConfirmed(channelId, requestedAfterId);
      final bool pageIndicatesMoreNewer =
          newerConsult.hasMoreNewer && !tailConfirmed;
      if (isStale()) {
        return newer(
          status: PageLoadStatus.superseded,
          requestCursor: requestedAfterId,
          hasMoreAtEdge: state.hasMoreNewerMessages,
        );
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
          _releaseLoadingNewer(fetchOrdinal);
          return newer(
            status: PageLoadStatus.superseded,
            requestCursor: requestedAfterId,
            hasMoreAtEdge: state.hasMoreNewerMessages,
          );
        case WindowPageApplied(:final window):
          if (isStale()) {
            return newer(
              status: PageLoadStatus.superseded,
              requestCursor: requestedAfterId,
              hasMoreAtEdge: state.hasMoreNewerMessages,
            );
          }
          if (page.messages.isNotEmpty) {
            _contiguity.extendNewer(channelId, page.messages.last.id);
          }
          _contiguityTrusted = true;
          state = state.copyWith(
            write: (
              messages: _finalizeLoadedMessages(
                channelId,
                window.messages,
                fetchOrdinal,
              ),
              origin: MessagesOrigin.newerPage,
            ),
            hasMoreMessages: window.hasMoreOlder,
            hasMoreNewerMessages: window.hasMoreNewer,
            messageLoadFailed: false,
          );
          _releaseLoadingNewer(fetchOrdinal);
          if (newerConsult.needsTailProbe && !tailConfirmed) {
            _confirmProvisionalTail(channelId);
          }
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
          return newer(
            status: page.messages.isEmpty
                ? PageLoadStatus.empty
                : PageLoadStatus.applied,
            requestCursor: requestedAfterId,
            installedBoundary: page.messages.isEmpty
                ? null
                : newestServerBackedMessageId(window.messages),
            hasMoreAtEdge: window.hasMoreNewer,
          );
      }
    } on Exception catch (e) {
      talker.warning('[ChatPagination] newer load failed', e);
      _releaseLoadingNewer(fetchOrdinal);
      if (!isStale()) {
        state = state.copyWith(messageLoadFailed: true);
      }
      return newer(
        status: PageLoadStatus.failed,
        requestCursor: requestedAfterId,
        hasMoreAtEdge: state.hasMoreNewerMessages,
      );
    } finally {
      _endPageFetch(fetchOrdinal);
      _releaseLoadingNewer(fetchOrdinal);
    }
  }

  void trimToNewestWindow() {
    if (state.hasMoreNewerMessages ||
        state.messages.length <= kMaxLoadedMessages) {
      return;
    }
    final trim = trimMessageWindow(state.messages, keepNewest: true);
    state = state.copyWith(
      write: (messages: trim.messages, origin: MessagesOrigin.trim),
      hasMoreMessages: trim.droppedOlder || state.hasMoreMessages,
    );
  }

  void trimToSpan({required String firstId, required String lastId}) {
    _pendingTrimAround = null;
    if (state.messages.length <= kMaxLoadedMessages) {
      return;
    }
    _writeTrim(
      trimMessageWindowBetween(
        state.messages,
        firstId: firstId,
        lastId: lastId,
      ),
    );
  }

  void _writeTrim(MessageWindowTrim trim) {
    if (identical(trim.messages, state.messages)) {
      return;
    }
    state = state.copyWith(
      write: (messages: trim.messages, origin: MessagesOrigin.trim),
      hasMoreMessages: state.hasMoreMessages || trim.droppedOlder,
      hasMoreNewerMessages: state.hasMoreNewerMessages || trim.droppedNewer,
    );
  }

  void setPendingTrimAround({
    required String channelId,
    required String? messageId,
  }) {
    if (messageId == null) {
      if (_pendingTrimAround?.channelId == channelId) {
        _pendingTrimAround = null;
      }
      return;
    }
    if (state.channelId != channelId) {
      return;
    }
    _pendingTrimAround = (channelId: channelId, messageId: messageId);
  }

  void setUserScrollActive({required String channelId, required bool active}) {
    if (state.channelId != channelId || _userScrollActive == active) {
      return;
    }
    _userScrollActive = active;
    if (!active && _pendingSessionResync) {
      _pendingSessionResync = false;
      unawaited(_reconcileCurrentChannelFromNetwork());
    }
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
    if (_jumpToLatestActive || state.isLoading) {
      return false;
    }
    final int windowGeneration = ++_windowGeneration;
    final int switchGeneration = _channelSwitchGeneration;
    bool stillCurrent() =>
        windowGeneration == _windowGeneration &&
        switchGeneration == _channelSwitchGeneration;
    _jumpToLatestActive = true;
    final int swapToken = _armWindowSwap(channelId);
    final int fetchOrdinal = _beginPageFetch();
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
      await _hydrateGuildMembersForMessages(
        channelId,
        page.messages,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      if (state.channelId != channelId) {
        return false;
      }
      final bool applied = await _commitWindowSwap(
        swapToken,
        channelId,
        fetchOrdinal,
        stillCurrent,
        () {
          _contiguity.setVerified(channelId, page.messages);
          _contiguityTrusted = true;
          final List<Message> pendingLocal = state.messages
              .where(isLocalOnlyMessage)
              .toList();
          state = state.copyWith(
            write: (
              messages: _finalizeLoadedMessages(
                channelId,
                mergeMessagesSorted(pendingLocal, page.messages),
                fetchOrdinal,
              ),
              origin: MessagesOrigin.windowSwap,
            ),
            hasMoreMessages: page.messages.length >= _kJumpToPresentPageSize,
            hasMoreNewerMessages: false,
            windowEpoch: state.windowEpoch + 1,
          );
        },
      );
      if (!applied || !stillCurrent()) {
        return false;
      }
      _notifyMessageReferencesLoaded(
        channelId: channelId,
        messages: state.messages,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      scrollToBottom();
      return true;
    } on Exception catch (e) {
      talker.warning('[ChatPagination] jump to latest failed', e);
      return false;
    } finally {
      _jumpToLatestActive = false;
      _endPageFetch(fetchOrdinal);
      await _disarmWindowSwap(swapToken);
      if (stillCurrent() &&
          state.channelId == channelId &&
          state.isSyncingMessages) {
        state = state.copyWith(isSyncingMessages: false);
      }
    }
  }

  Future<String?> _channelLastMessagePointer(String channelId) async {
    final db.Channel? channel = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(channelId);
    if (channel != null) {
      return channel.lastMessageId;
    }
    final db.DmChannel? dmChannel = await ref
        .read(fluxerDatabaseProvider)
        .dmChannelDao
        .getDmChannelById(channelId);
    return dmChannel?.lastMessageId;
  }

  bool _canRestoreParkedWindow(_ParkedChannelWindow parked, String channelId) {
    return parked.hasMoreNewerMessages || !_messagesNeedResync(channelId);
  }

  Future<bool> _loadedWindowIsPresent(List<Message> messages) async {
    if (messages.isEmpty) {
      return false;
    }
    final ({bool hasMoreNewer, bool needsTailProbe}) consult =
        await _hasNewerMessagesThanChannel(messages.last.id);
    return !consult.hasMoreNewer;
  }

  Future<({bool hasMoreNewer, bool needsTailProbe})>
  _hasNewerMessagesThanChannel(
    String messageId, {
    bool detachedWindow = false,
    Set<String>? knownLoadedMessageIds,
  }) async {
    final String? lastMessageId = await _channelLastMessagePointer(
      state.channelId,
    );
    if (lastMessageId == null || lastMessageId.isEmpty) {
      if (detachedWindow) {
        return const (hasMoreNewer: true, needsTailProbe: false);
      }
      return const (hasMoreNewer: true, needsTailProbe: true);
    }
    final int pointerVsFetchedTail = compareSnowflakeIds(
      lastMessageId,
      messageId,
    );
    if (pointerVsFetchedTail < 0) {
      if (detachedWindow) {
        return const (hasMoreNewer: true, needsTailProbe: false);
      }
      return const (hasMoreNewer: true, needsTailProbe: true);
    }
    if (pointerVsFetchedTail == 0) {
      return const (hasMoreNewer: false, needsTailProbe: false);
    }
    if (detachedWindow) {
      return const (hasMoreNewer: true, needsTailProbe: false);
    }
    if (knownLoadedMessageIds?.contains(lastMessageId) ?? false) {
      return const (hasMoreNewer: true, needsTailProbe: false);
    }
    return const (hasMoreNewer: true, needsTailProbe: true);
  }

  void _confirmProvisionalTail(String channelId) {
    final String? windowTailId = newestServerBackedMessageId(state.messages);
    if (windowTailId == null) {
      return;
    }
    final probed = _tailProbeLedger;
    if (probed != null &&
        probed.channelId == channelId &&
        probed.tailId == windowTailId &&
        probed.windowGeneration == _windowGeneration) {
      talker.debug('[ChatPagination] tail probe deduped tail=$windowTailId');
      return;
    }
    _tailProbeLedger = (
      channelId: channelId,
      tailId: windowTailId,
      windowGeneration: _windowGeneration,
      confirmed: false,
    );
    final int windowGeneration = _windowGeneration;
    final int switchGeneration = _channelSwitchGeneration;
    final int swapToken = _armWindowSwap(channelId);
    final int fetchOrdinal = _beginPageFetch();
    unawaited(
      _runTailConfirmation(
        channelId: channelId,
        windowTailId: windowTailId,
        swapToken: swapToken,
        fetchOrdinal: fetchOrdinal,
        windowGeneration: windowGeneration,
        switchGeneration: switchGeneration,
      ),
    );
  }

  Future<void> _runTailConfirmation({
    required String channelId,
    required String windowTailId,
    required int swapToken,
    required int fetchOrdinal,
    required int windowGeneration,
    required int switchGeneration,
  }) async {
    bool stillValid() =>
        windowGeneration == _windowGeneration &&
        switchGeneration == _channelSwitchGeneration &&
        state.channelId == channelId &&
        newestServerBackedMessageId(state.messages) == windowTailId;
    try {
      final MessageListLoadResult page = await ref
          .read(messageRepositoryProvider)
          .loadMessagePage(channelId: channelId, limit: _kPageSize);
      if (!stillValid()) {
        return;
      }
      final String? channelNewestId = newestServerBackedMessageId(
        page.messages,
      );
      if (channelNewestId == null || channelNewestId != windowTailId) {
        talker.debug(
          '[ChatPagination] tail unconfirmed window=$windowTailId '
          'channel=${channelNewestId ?? '<none>'}',
        );
        return;
      }
      final bool applied = await _commitWindowSwap(
        swapToken,
        channelId,
        fetchOrdinal,
        stillValid,
        () {
          state = state.copyWith(hasMoreNewerMessages: false);
          _tailProbeLedger = (
            channelId: channelId,
            tailId: windowTailId,
            windowGeneration: windowGeneration,
            confirmed: true,
          );
        },
      );
      if (!applied || !stillValid()) {
        talker.debug('[ChatPagination] tail confirmation superseded');
        return;
      }
      talker.debug('[ChatPagination] tail confirmed at $windowTailId');
    } on Exception catch (e) {
      talker.warning('[ChatPagination] tail confirmation failed', e);
      final probed = _tailProbeLedger;
      if (probed != null &&
          probed.channelId == channelId &&
          probed.tailId == windowTailId) {
        _tailProbeLedger = null;
      }
    } finally {
      _endPageFetch(fetchOrdinal);
      await _disarmWindowSwap(swapToken);
    }
  }

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
    return pointer;
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
      final ChatReadViewportState viewport = ref.read(chatReadViewportProvider);
      if (isAutoAckEligible(
        viewport: viewport,
        channelId: channelId,
        hasMoreNewerMessages: state.hasMoreNewerMessages,
        currentTailId: null,
      )) {
        final database = ref.read(fluxerDatabaseProvider);
        final readState = await database.readStateDao.getReadState(channelId);
        if (!(readState?.manual ?? false)) {
          await ref.read(readStateRepositoryProvider).ackLatest(channelId);
        }
      }
      return;
    }
    final now = DateTime.now();
    final ChatReadViewportState viewport = ref.read(chatReadViewportProvider);
    final bool isReadViewportEligible = viewport.canAutoAck;
    final bool isAtLiveTail = isAutoAckEligible(
      viewport: viewport,
      channelId: channelId,
      hasMoreNewerMessages: state.hasMoreNewerMessages,
      currentTailId: visibleTailId,
    );
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
      final String? ackTargetId = force
          ? null
          : await _liveTailAckTargetId(
              channelId: channelId,
              visibleTailId: visibleTailId!,
            );
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
      if (_stickySnapshotArmed &&
          _viewportWasAtTail &&
          state.channelId == channelId) {
        _stickySnapshotArmed = false;
        if (!force && state.stickyUnreadMessageId == null) {
          final String? unreadId = _stickyUnreadIdForCurrentMessages(
            readState: readState,
          );
          if (unreadId != null) {
            state = state.copyWith(stickyUnreadMessageId: unreadId);
          }
        }
      }
      if (!force &&
          (state.channelId != channelId ||
              state.hasMoreNewerMessages ||
              newestServerBackedMessageId(state.messages) != visibleTailId)) {
        return;
      }
      final repository = ref.read(readStateRepositoryProvider);
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
      if (!force) {
        unawaited(_ensureUnreadBoundaryLoaded(channelId, readState: readState));
      }
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to ack channel: $e');
    } finally {
      _readAckGate.markAttemptFinished(channelId);
      if (!force &&
          ref.mounted &&
          state.channelId == channelId &&
          _autoAckEligible &&
          newestServerBackedMessageId(state.messages) != visibleTailId) {
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

  @visibleForTesting
  Future<void> flushScheduledReadAckRetryForTest() async {
    _readAckRetryTimer?.cancel();
    _readAckRetryTimer = null;
    _readAckGate.advanceThrottleClockForTest(_kReadAckMinInterval);
    await ackCurrentChannel();
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

    final int switchGeneration = _channelSwitchGeneration;
    final int windowGeneration = _windowGeneration;
    final int windowWrites = _windowWrites;
    final int fetchOrdinal = _beginPageFetch();
    try {
      final messages = await ref
          .read(messageRepositoryProvider)
          .getMessages(channelId: channelId, after: ackMessageId);
      if (messages.isEmpty ||
          state.channelId != channelId ||
          switchGeneration != _channelSwitchGeneration ||
          windowGeneration != _windowGeneration ||
          windowWrites != _windowWrites) {
        return;
      }
      state = state.copyWith(
        write: (
          messages: mergeMessagesSorted(
            state.messages,
            _finalizeLoadedMessages(channelId, messages, fetchOrdinal),
          ),
          origin: MessagesOrigin.boundaryFill,
        ),
      );
      _contiguity.extendNewer(channelId, messages.last.id);
      _loadedUnreadBoundaryKeys.add(key);
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to load unread boundary: $e');
    } finally {
      _endPageFetch(fetchOrdinal);
    }
  }

  String? _firstUnreadForCurrentMessages({required db.ReadState? readState}) {
    if (state.messages.isEmpty) {
      return null;
    }
    final String? ack = readState?.lastMessageId;
    if (ack == null || ack.isEmpty) {
      return null;
    }
    final bool boundaryLoaded =
        !state.hasMoreMessages ||
        state.messages.any((Message m) => compareSnowflakeIds(m.id, ack) <= 0);
    if (!boundaryLoaded) {
      return null;
    }
    return oldestUnreadMessageId(
      messageIds: _serverBackedMessageIds(),
      ackLastMessageId: ack,
    );
  }

  Iterable<String> _serverBackedMessageIds() => state.messages
      .where((Message message) => !isLocalOnlyMessage(message))
      .map((Message message) => message.id);

  String? _stickyUnreadIdForCurrentMessages({
    required db.ReadState? readState,
  }) {
    final String? unreadId = _firstUnreadForCurrentMessages(
      readState: readState,
    );
    if (unreadId == null) {
      return null;
    }
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (currentUserId == null || currentUserId.isEmpty) {
      return unreadId;
    }
    for (final Message message in state.messages) {
      if (message.id == unreadId) {
        return message.authorId == currentUserId ? null : unreadId;
      }
    }
    return unreadId;
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

  String? _pendingAutoAckCovering(String messageId) {
    return compareSnowflakeIds(messageId, state.pendingAutoAckMessageId) > 0
        ? messageId
        : state.pendingAutoAckMessageId;
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
    if (manual && state.channelId == channelId) {
      clearStickyUnread();
    }
  }

  Future<void> recomputeMentionsAfterRelationshipChange() async {
    final String channelId = state.channelId;
    if (channelId.isEmpty || !_isLoadedWindowContiguousToTail(channelId)) {
      return;
    }
    final String? windowOldestId = _contiguity.oldestId;
    final bool reachesChannelStart = !state.hasMoreMessages;
    final readState = await ref
        .read(fluxerDatabaseProvider)
        .readStateDao
        .getReadState(channelId);
    final String? ackMessageId = readState?.lastMessageId;
    if (ackMessageId == null || ackMessageId.isEmpty) {
      return;
    }
    final bool windowCoversAck =
        reachesChannelStart ||
        (windowOldestId != null &&
            compareSnowflakeIds(ackMessageId, windowOldestId) >= 0);
    if (!windowCoversAck ||
        !ref.mounted ||
        !_isLoadedWindowContiguousToTail(channelId)) {
      return;
    }
    await ref
        .read(readStateRepositoryProvider)
        .recomputeMentionsAfterBackfill(
          channelId: channelId,
          currentUserId: ref.read(currentUserIdProvider),
          allowDecrease: true,
        );
  }

  bool _isLoadedWindowContiguousToTail(String channelId) =>
      state.channelId == channelId &&
      !state.isLoading &&
      !state.hasMoreNewerMessages &&
      _contiguityTrusted &&
      _contiguity.verified &&
      _contiguity.channelId == channelId &&
      !_messagesNeedResync(channelId);

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

  Future<void> forwardMessage({
    required String sourceChannelId,
    required String sourceMessageId,
    required List<String> destinationChannelIds,
    String? sourceGuildId,
    List<String>? attachmentIds,
    List<int>? embedIndices,
    String? comment,
  }) async {
    final _ForwardSource source = _ForwardSource(
      channelId: sourceChannelId,
      messageId: sourceMessageId,
      guildId: sourceGuildId,
      attachmentIds: attachmentIds,
      embedIndices: embedIndices,
    );
    final ({String content, int flags})? normalizedComment = comment == null
        ? null
        : _normalizeOutgoing(comment);
    final int flags = normalizedComment?.flags ?? 0;
    final Message? sourceMessage = await _loadForwardSource(
      sourceChannelId,
      sourceMessageId,
    );
    final MessageSnapshot? snapshot = sourceMessage?.toForwardSnapshot(
      attachmentIds: attachmentIds,
      embedIndices: embedIndices,
    );
    final String? currentUserId = ref.read(currentUserIdProvider);
    final db.User? currentUser = currentUserId == null
        ? null
        : await ref
              .read(fluxerDatabaseProvider)
              .userDao
              .getUserById(currentUserId);
    if (!ref.mounted) {
      return;
    }
    final bool hasGlobalName =
        currentUser?.globalName?.trim().isNotEmpty ?? false;
    final String authorName = hasGlobalName
        ? currentUser!.globalName!
        : currentUser?.username ?? 'You';
    Message optimistic(String channelId, String content) =>
        _buildOptimisticMessage(
          channelId: channelId,
          content: content,
          replyToId: null,
          stickerIds: const <String>[],
          currentUserId: currentUserId,
          authorName: authorName,
          authorAvatar: currentUser?.avatar,
          authorAvatarColor: currentUser?.avatarColor,
          authorIsBot: currentUser?.bot ?? false,
          authorIsSystem: currentUser?.system ?? false,
          clientNonce: clientNonceGenerator.next(),
          flags: flags,
        );
    final List<Message> shownHere = <Message>[];
    for (final String channelId in destinationChannelIds) {
      final Message forward = optimistic(channelId, '').copyWith(
        messageReference: MessageReference(
          channelId: sourceChannelId,
          messageId: sourceMessageId,
          guildId: sourceGuildId,
          type: MessageReferenceType.forward,
        ),
        messageSnapshots: snapshot == null
            ? const <MessageSnapshot>[]
            : <MessageSnapshot>[snapshot],
      );
      final String commentText = normalizedComment?.content ?? '';
      final Message? commentMessage = commentText.isEmpty
          ? null
          : optimistic(channelId, commentText);
      _retrySendOptions[forward.id] = _RetrySendOptions(
        replyMention: false,
        forward: source,
      );
      for (final Message local in <Message>[forward, ?commentMessage]) {
        _trackLocalSend(local);
        if (state.channelId == channelId) {
          shownHere.add(local);
        }
      }
      unawaited(
        _deliverForward(
          forward: forward,
          comment: commentMessage,
          source: source,
        ),
      );
    }
    if (shownHere.isEmpty) {
      return;
    }
    state = state.copyWith(
      write: (
        messages: [...state.messages, ...shownHere],
        origin: MessagesOrigin.ownSend,
      ),
      errorMessage: null,
      scrollToBottomSignal: _scrollToBottomSignalAfterSend(),
      stickyUnreadMessageId: null,
      pendingAutoAckMessageId: _pendingAutoAckCovering(shownHere.last.id),
    );
  }

  Future<Message?> _loadForwardSource(
    String channelId,
    String messageId,
  ) async {
    for (final Message message in state.messages) {
      if (message.channelId == channelId && message.id == messageId) {
        return message;
      }
    }
    final db.Message? row = await ref
        .read(fluxerDatabaseProvider)
        .messageDao
        .getMessage(channelId, messageId);
    return row == null ? null : Message.fromRow(row);
  }

  Future<Message> _sendForward(Message forward, _ForwardSource source) {
    return _sendWithRateLimitRetry(
      () => ref
          .read(messageRepositoryProvider)
          .sendForward(
            channelId: forward.channelId,
            sourceChannelId: source.channelId,
            sourceMessageId: source.messageId,
            sourceGuildId: source.guildId,
            attachmentIds: source.attachmentIds,
            embedIndices: source.embedIndices,
            clientNonce: forward.clientNonce!,
            messageFlags: forward.flags,
          ),
    );
  }

  Future<void> _deliverForward({
    required Message forward,
    required Message? comment,
    required _ForwardSource source,
  }) async {
    final String channelId = forward.channelId;
    final DateTime sendStartedAt = DateTime.now();
    try {
      final Message sent = await _sendForward(forward, source);
      if (!ref.mounted) {
        return;
      }
      _settleLocalSend(forward, sent);
      unawaited(
        _recordSlowmodeSendOnSuccess(channelId, sent.timestamp, sendStartedAt),
      );
    } on Object catch (error, st) {
      talker.error(
        '[ChatViewModel] forward api_error channelId=$channelId',
        error,
        st,
      );
      if (!ref.mounted) {
        return;
      }
      _failLocalSend(forward, error);
      if (comment != null) {
        _markLocalSendFailed(comment);
      }
      return;
    }
    if (comment == null || !_localSends.containsKey(comment.clientNonce)) {
      return;
    }
    try {
      final Message sent = await _sendWithRateLimitRetry(
        () => ref
            .read(messageRepositoryProvider)
            .sendMessage(
              channelId: channelId,
              content: comment.content,
              clientNonce: comment.clientNonce,
              messageFlags: comment.flags,
            ),
      );
      if (!ref.mounted) {
        return;
      }
      _settleLocalSend(comment, sent);
    } on Object catch (error, st) {
      talker.error(
        '[ChatViewModel] forward comment api_error channelId=$channelId',
        error,
        st,
      );
      if (!ref.mounted) {
        return;
      }
      _failLocalSend(comment, error);
    }
  }

  void _settleLocalSend(Message local, Message sent) {
    _retrySendOptions.remove(local.id);
    _commitDeliveredOptimisticSend(
      channelId: local.channelId,
      optimisticMessageId: local.id,
      sent: sent,
    );
  }

  void _failLocalSend(Message local, Object error) {
    if (!_localSends.containsKey(local.clientNonce)) {
      return;
    }
    if (state.channelId != local.channelId) {
      _markLocalSendFailed(local);
      _syncSlowmodeFromSendError(error, local.channelId);
      _showUnexpectedSendError();
      return;
    }
    _handleSendFailure(local.id, error);
    _recordLocalSendFailure(local);
  }

  void _recordLocalSendFailure(Message local) {
    final String? nonce = local.clientNonce;
    if (nonce == null || !_localSends.containsKey(nonce)) {
      return;
    }
    final int index = state.messages.indexWhere(
      (Message m) => m.id == local.id,
    );
    _localSends[nonce] = index == -1
        ? _failedLocalSend(local)
        : state.messages[index];
    _persistLocalSend(nonce);
  }

  void _markLocalSendFailed(Message local) {
    final String? nonce = local.clientNonce;
    if (nonce == null || !_localSends.containsKey(nonce)) {
      return;
    }
    final Message failed = _failedLocalSend(local);
    _localSends[nonce] = failed;
    _persistLocalSend(nonce);
    if (state.channelId != local.channelId) {
      return;
    }
    final int index = state.messages.indexWhere(
      (Message m) => m.id == local.id,
    );
    if (index == -1) {
      return;
    }
    final List<Message> nextMessages = List<Message>.from(state.messages);
    nextMessages[index] = failed;
    state = state.copyWith(
      write: (messages: nextMessages, origin: MessagesOrigin.localMutation),
    );
  }

  Message _failedLocalSend(Message local) => local.copyWith(
    deliveryState: MessageDeliveryState.failed,
    sendError: ref.read(appLocalizationsProvider).chatMessageFailedToSend,
  );

  Future<void> sendVoiceMessage({
    required String filePath,
    required int duration,
    required String waveform,
  }) => _afterPreparingSends(
    () => _sendVoiceMessageInner(
      filePath: filePath,
      duration: duration,
      waveform: waveform,
    ),
  );

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
    final String sanitized = _maybeSanitizeOutgoing(silent.content);
    return (
      content: hasVisibleContent(sanitized) ? sanitized : '',
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
    if (state.editingMessage != null) {
      try {
        await saveEditedMessage(text: text);
      } on Object catch (error, st) {
        talker.error('[ChatViewModel] edit failed unexpectedly', error, st);
        _showUnexpectedSendError();
      }
      return;
    }
    final String? claimNonce = _claimComposerFiles();
    final String key = <String?>[
      text,
      favoriteMemeId,
      ...stickerIds,
    ].join('\u0000');
    if (claimNonce == null && _preparingSendKeys.contains(key)) {
      return;
    }
    _preparingSendKeys.add(key);
    try {
      await _afterPreparingSends(() async {
        bool consumed = false;
        try {
          consumed = await _sendContentInner(
            text,
            claimNonce: claimNonce,
            clearMessageText: clearMessageText,
            stickerIds: stickerIds,
            favoriteMemeId: favoriteMemeId,
            tts: tts,
          );
        } finally {
          if (!consumed && claimNonce != null) {
            _returnClaim(claimNonce);
          }
        }
      });
    } finally {
      _preparingSendKeys.remove(key);
    }
  }

  Future<void> _afterPreparingSends(Future<void> Function() prepare) {
    final Future<void> previous = _sendPreparation;
    final Future<void> next = previous.then((_) async {
      try {
        await prepare();
      } on Object catch (error, st) {
        talker.error('[ChatViewModel] send failed unexpectedly', error, st);
        _showUnexpectedSendError();
      }
    });
    _sendPreparation = next;
    return next;
  }

  String? _claimComposerFiles() {
    final String channelId = state.channelId;
    if (channelId.isEmpty || state.editingMessage != null) {
      return null;
    }
    final CloudUploadController uploads = ref.read(
      cloudUploadControllerProvider(channelId).notifier,
    );
    final String nonce = clientNonceGenerator.next();
    return uploads.claimForMessage(nonce).isEmpty ? null : nonce;
  }

  void _returnClaim(String nonce) {
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      return;
    }
    ref
        .read(cloudUploadControllerProvider(session.channelId).notifier)
        .returnClaim(nonce);
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
    final db.Channel? channelRow = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(channelId);
    final String guildId = channelRow?.guildId ?? '';
    ChannelPermissionBitsOutcome? permissionOutcome;
    if (guildId.isNotEmpty) {
      permissionOutcome =
          await computeEffectiveGuildChannelPermissionBitsOutcome(
            ref: ref,
            channelId: channelId,
          );
    }
    final int rateLimit = channelRow?.rateLimitPerUser ?? 0;
    final Duration? slowmodeRemaining = _activeSlowmodeRemaining(
      channelId: channelId,
      rateLimit: rateLimit,
      permissionOutcome: permissionOutcome,
    );
    if (slowmodeRemaining != null) {
      _notifySendBlocked(
        _SendBlockReason.slowmode,
        remaining: slowmodeRemaining,
      );
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
    final String clientNonce = clientNonceGenerator.next();
    final FileUploadValidationResult validation = await uploadNotifier
        .claimVoiceMessage(
          nonce: clientNonce,
          file: XFile(filePath, name: kVoiceMessageFilename),
          duration: duration,
          waveform: waveform,
        );
    if (!validation.isValid) {
      _showUnexpectedSendError();
      return;
    }
    final String? replyToId = state.replyingTo?.id;
    final bool replyMention = state.replyMentioning;
    final List<PendingAttachment> claimed =
        ref.read(messageUploadSessionsProvider)[clientNonce]?.attachments ??
        const <PendingAttachment>[];
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
    _retrySendOptions[optimisticMessage.id] = _RetrySendOptions(
      replyMention: replyMention,
    );
    state = state.copyWith(
      replyingTo: null,
      replyMentioning: false,
      write: (
        messages: [...state.messages, optimisticMessage],
        origin: MessagesOrigin.ownSend,
      ),
      errorMessage: null,
      scrollToBottomSignal: _scrollToBottomSignalAfterSend(),
      stickyUnreadMessageId: null,
      pendingAutoAckMessageId: _pendingAutoAckCovering(optimisticMessage.id),
    );
    unawaited(ref.read(readStateRepositoryProvider).clearSticky(channelId));
    _registerInFlightOptimisticSend(optimisticMessage);
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

  Future<bool> _sendContentInner(
    String text, {
    required String? claimNonce,
    required bool clearMessageText,
    List<String> stickerIds = const [],
    String? favoriteMemeId,
    bool tts = false,
  }) async {
    final String channelId = state.channelId;
    if (channelId.isEmpty) {
      talker.debug('[ChatViewModel] send blocked: channel_not_ready');
      _notifySendBlocked(_SendBlockReason.channelNotReady);
      return false;
    }
    if (claimNonce != null &&
        ref.read(messageUploadSessionsProvider)[claimNonce]?.channelId !=
            channelId) {
      return false;
    }
    final GuildComposerAccess? guildBlock = await _resolveGuildComposerBlock(
      channelId,
    );
    if (guildBlock != null) {
      talker.debug(
        '[ChatViewModel] send blocked: guild_access channelId=$channelId',
      );
      _notifySendBlocked(_SendBlockReason.guildAccess, guildBlock: guildBlock);
      return false;
    }
    final String? currentUserId = ref.read(currentUserIdProvider);
    final List<PendingAttachment> pendingAttachments = claimNonce == null
        ? const <PendingAttachment>[]
        : ref.read(messageUploadSessionsProvider)[claimNonce]?.attachments ??
              const <PendingAttachment>[];
    if (!hasVisibleContent(text) &&
        stickerIds.isEmpty &&
        favoriteMemeId == null &&
        pendingAttachments.isEmpty) {
      talker.debug('[ChatViewModel] send blocked: empty channelId=$channelId');
      _notifySendBlocked(_SendBlockReason.empty);
      return false;
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
        ref
            .read(channelPermissionCacheProvider.notifier)
            .cacheEffectiveBits(
              channelId: channelId,
              outcome: permissionOutcome,
            );
        final bool canSendMessages = hasPermission(
          permissionOutcome.value,
          Permission.sendMessages,
        );
        final bool lockedThread =
            channelRow != null &&
            isThreadChannelType(channelRow.type) &&
            (channelRow.threadLocked ?? false) &&
            !isThreadModerator(
              withImplicitThreadBits(permissionOutcome.value),
              isOwner: false,
              timedOut: false,
            );
        if (!canSendMessages || lockedThread) {
          talker.debug(
            '[ChatViewModel] send blocked: no_permission channelId=$channelId',
          );
          _notifySendBlocked(_SendBlockReason.noPermission);
          return false;
        }
      } else {
        talker.debug(
          '[ChatViewModel] send permissions unresolved channelId=$channelId',
        );
      }
    }
    final rateLimit = channelRow?.rateLimitPerUser ?? 0;
    final Duration? slowmodeRemaining = _activeSlowmodeRemaining(
      channelId: channelId,
      rateLimit: rateLimit,
      permissionOutcome: permissionOutcome,
    );
    if (slowmodeRemaining != null) {
      talker.debug(
        '[ChatViewModel] send blocked: slowmode channelId=$channelId',
      );
      _notifySendBlocked(
        _SendBlockReason.slowmode,
        remaining: slowmodeRemaining,
      );
      return false;
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
    final String clientNonce = claimNonce ?? clientNonceGenerator.next();
    final CloudUploadController uploadNotifier = ref.read(
      cloudUploadControllerProvider(channelId).notifier,
    );
    final bool hasPendingAttachments = pendingAttachments.isNotEmpty;
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
    _retrySendOptions[optimisticMessage.id] = _RetrySendOptions(
      replyMention: replyMention,
      favoriteMemeId: favoriteMemeId,
      tts: tts,
    );

    talker.debug('[ChatViewModel] send optimistic channelId=$channelId');
    if (state.channelId == channelId) {
      state = state.copyWith(
        replyingTo: null,
        replyMentioning: false,
        messageText: clearMessageText ? '' : state.messageText,
        write: (
          messages: [...state.messages, optimisticMessage],
          origin: MessagesOrigin.ownSend,
        ),
        errorMessage: null,
        scrollToBottomSignal: _scrollToBottomSignalAfterSend(),
        stickyUnreadMessageId: null,
        pendingAutoAckMessageId: _pendingAutoAckCovering(optimisticMessage.id),
      );
    }
    if (clearMessageText) {
      unawaited(
        ref
            .read(fluxerDatabaseProvider)
            .composerDraftDao
            .deleteDraft(channelId),
      );
    }
    unawaited(ref.read(readStateRepositoryProvider).clearSticky(channelId));

    if (!hasPendingAttachments) {
      _trackLocalSend(optimisticMessage);
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
      return true;
    }

    _registerInFlightOptimisticSend(optimisticMessage);
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
    return true;
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
    final DateTime sendStartedAt = DateTime.now();
    try {
      final Message sent = await _sendWithRateLimitRetry(
        () => ref
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
            ),
      );
      _retrySendOptions.remove(optimisticMessageId);
      unawaited(
        _recordSlowmodeSendOnSuccess(channelId, sent.timestamp, sendStartedAt),
      );
      _commitDeliveredOptimisticSend(
        channelId: channelId,
        optimisticMessageId: optimisticMessageId,
        sent: sent,
      );
    } on Object catch (error, st) {
      talker.error(
        '[ChatViewModel] send api_error channelId=$channelId',
        error,
        st,
      );
      final Message? local = _localSends[clientNonce];
      if (local == null) {
        return;
      }
      if (await _adoptMaybeCreatedSend(
            optimisticMessageId,
            error,
            const <String>[],
          ) ||
          !ref.mounted) {
        return;
      }
      _failLocalSend(local, error);
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
    final int fileCount =
        ref
            .read(messageUploadSessionsProvider)[clientNonce]
            ?.attachments
            .length ??
        1;
    List<String> attachmentFilenames = const <String>[];
    _uploadKeepAlive.begin(
      notificationTitle: ref
          .read(appLocalizationsProvider)
          .chatUploadingAttachmentsSummary(fileCount),
    );
    try {
      final prepared = await uploadNotifier.prepareSessionForSend(
        nonce: clientNonce,
        favoriteMemePayload: favoriteMemeId != null,
      );
      if (!_isMessageUploadSessionActive(clientNonce)) {
        _dropLocalSend(optimisticMessageId, clientNonce);
        return;
      }
      if (prepared.isEmpty &&
          outgoingText.isEmpty &&
          stickerIds.isEmpty &&
          favoriteMemeId == null) {
        _finishAttachmentUploadSession(clientNonce, uploadNotifier);
        return;
      }
      attachmentFilenames = <String>[
        for (final ApiAttachmentMetadata attachment
            in prepared.attachmentMetadata ?? const <ApiAttachmentMetadata>[])
          attachment.filename,
      ];
      final DateTime sendStartedAt = DateTime.now();
      final Message sent = await _sendWithRateLimitRetry(
        () => ref
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
              cancelToken: uploadNotifier.sendCancelToken(clientNonce),
              onSendProgress: (int sent, int total) =>
                  uploadNotifier.reportSendProgress(
                    clientNonce,
                    sent,
                    total,
                    showProgress: prepared.attachmentFiles != null,
                  ),
            ),
        isStillSending: () => _isMessageUploadSessionActive(clientNonce),
      );
      final AbandonedMessageSends abandoned = ref.read(
        abandonedMessageSendsProvider.notifier,
      );
      if (abandoned.isAbandoned(clientNonce)) {
        await abandoned.reclaim(
          nonce: clientNonce,
          channelId: channelId,
          messageId: sent.id,
        );
        return;
      }
      _retrySendOptions.remove(optimisticMessageId);
      _finishAttachmentUploadSession(clientNonce, uploadNotifier);
      unawaited(
        _recordSlowmodeSendOnSuccess(channelId, sent.timestamp, sendStartedAt),
      );
      _commitDeliveredOptimisticSend(
        channelId: channelId,
        optimisticMessageId: optimisticMessageId,
        sent: sent,
      );
    } on MessageUploadSendCancelledException {
      _dropLocalSend(optimisticMessageId, clientNonce);
    } on Object catch (error, st) {
      talker.error(
        '[ChatViewModel] send api_error channelId=$channelId',
        error,
        st,
      );
      final AbandonedMessageSends abandoned = ref.read(
        abandonedMessageSendsProvider.notifier,
      );
      if (abandoned.isAbandoned(clientNonce)) {
        if (sendMaybeCreated(error)) {
          unawaited(
            abandoned.reclaimUnseen(
              nonce: clientNonce,
              channelId: channelId,
              content: outgoingText,
              attachmentFilenames: attachmentFilenames,
            ),
          );
        }
        return;
      }
      if (await _adoptMaybeCreatedSend(
            optimisticMessageId,
            error,
            attachmentFilenames,
          ) ||
          !ref.mounted) {
        return;
      }
      _handleSendFailure(optimisticMessageId, error);
      _parkFailedLocalSend(optimisticMessageId, clientNonce);
    } finally {
      _uploadKeepAlive.end();
    }
  }

  void _dropLocalSend(String optimisticMessageId, String clientNonce) {
    _clearInFlightOptimisticSend(clientNonce);
    _retrySendOptions.remove(optimisticMessageId);
    final List<Message>? next = _removeIds(state.messages, {
      optimisticMessageId,
    });
    if (next == null) {
      return;
    }
    state = state.copyWith(
      write: (messages: next, origin: MessagesOrigin.localMutation),
    );
  }

  void _parkFailedLocalSend(String optimisticMessageId, String clientNonce) {
    final Message? inFlight = _inFlightOptimisticMessages[clientNonce];
    if (inFlight == null) {
      return;
    }
    _inFlightOptimisticMessages[clientNonce] = inFlight.copyWith(
      deliveryState: MessageDeliveryState.failed,
      sendError: ref.read(appLocalizationsProvider).chatMessageFailedToSend,
    );
  }

  void _settleDeliveredLocalSend(MessageRealtimeEvent ev) {
    if (ev is! MessageCreated) {
      return;
    }
    final String? nonce = ev.event.message.nonce;
    if (nonce == null ||
        ev.event.message.author.id != ref.read(currentUserIdProvider)) {
      return;
    }
    _untrackLocalSend(nonce);
    final Message? local = _inFlightOptimisticMessages.remove(nonce);
    if (local == null) {
      return;
    }
    _retrySendOptions.remove(local.id);
    ref
        .read(cloudUploadControllerProvider(local.channelId).notifier)
        .removeMessageUpload(nonce);
  }

  void _syncSlowmodeFromSendError(Object error, String channelId) {
    final SlowmodeTracker tracker = ref.read(slowmodeTrackerProvider.notifier);
    applySlowmodeRateLimitError(
      tracker: tracker,
      channelId: channelId,
      error: error,
    );
    if (!isSlowmodeRateLimitedError(error)) {
      return;
    }
    final int? retryAfterMs = slowmodeRetryAfterMsFromError(error);
    if (retryAfterMs != null) {
      ref
          .read(slowmodeRateLimitedAlertProvider.notifier)
          .show(Duration(milliseconds: retryAfterMs));
    }
    ref.read(slowmodeIndicatorShakeProvider.notifier).requestShake();
  }

  Duration? _activeSlowmodeRemaining({
    required String channelId,
    required int rateLimit,
    ChannelPermissionBitsOutcome? permissionOutcome,
  }) {
    if (rateLimit <= 0 || bypassesChannelSlowmode(permissionOutcome)) {
      return null;
    }
    final Duration remaining = ref
        .read(slowmodeTrackerProvider.notifier)
        .remainingFor(channelId, rateLimit);
    return remaining > Duration.zero ? remaining : null;
  }

  Future<void> _recordSlowmodeSendOnSuccess(
    String channelId,
    DateTime serverSentAt,
    DateTime sendStartedAt,
  ) async {
    // One-off snapshot; read does not retain the autoDispose family.
    // ignore: riverpod_lint/only_use_keep_alive_inside_keep_alive
    if (await ref.read(isSlowmodeImmuneProvider(channelId).future)) {
      return;
    }
    ref
        .read(slowmodeTrackerProvider.notifier)
        .updateSendTimestamp(
          channelId,
          serverSentAt.isAfter(sendStartedAt) ? serverSentAt : sendStartedAt,
        );
  }

  void _notifySendBlocked(
    _SendBlockReason reason, {
    GuildComposerAccess? guildBlock,
    Duration? remaining,
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
        if (remaining != null && remaining > Duration.zero) {
          ref.read(slowmodeRateLimitedAlertProvider.notifier).show(remaining);
        }
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
    final int optimisticIndex = state.messages.indexWhere(
      (Message m) => m.id == optimisticMessageId,
    );
    if (optimisticIndex == -1) {
      return;
    }
    final Message local = state.messages[optimisticIndex];
    if (deliveredMatchForLocalSend(state.messages, local) != null) {
      return;
    }
    if (local.attachments.isEmpty && _shouldAwaitReconnect(error)) {
      _sendsAwaitingReconnect[optimisticMessageId] = ref.read(
        gatewaySessionRecoveryProvider,
      );
      return;
    }
    final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
    final String failedMessage = l10n.chatMessageFailedToSend;
    final List<Message> nextMessages = List<Message>.from(state.messages);
    nextMessages[optimisticIndex] = nextMessages[optimisticIndex].copyWith(
      deliveryState: MessageDeliveryState.failed,
      sendError: failedMessage,
    );
    final String? apiErrorCode = error is DioException
        ? apiErrorCodeFromDioException(error)
        : null;
    _syncSlowmodeFromSendError(error, state.channelId);
    final String? systemMessageContent = clientSystemMessageForSendError(
      apiErrorCode: apiErrorCode,
      apiMessage: error is DioException
          ? apiMessageFromDioException(error)
          : null,
      l10n: l10n,
      selfHosted: ref.read(instanceRuntimeConfigProvider).selfHosted,
    );
    if (systemMessageContent != null) {
      nextMessages.add(
        createClientSystemMessage(
          channelId: state.channelId,
          content: systemMessageContent,
          productName: ref.read(instanceRuntimeConfigProvider).productName,
        ),
      );
      state = state.copyWith(
        write: (messages: nextMessages, origin: MessagesOrigin.localMutation),
      );
      return;
    }
    state = state.copyWith(
      write: (messages: nextMessages, origin: MessagesOrigin.localMutation),
      errorMessage: failedMessage,
    );
  }

  bool _shouldAwaitReconnect(Object error) {
    if (error is! DioException || !isTransientConnectionError(error)) {
      return false;
    }
    if (!ref.read(gatewayHasAuthTokenProvider)) {
      return false;
    }
    final GatewayConnection connection = ref.read(gatewayConnectionProvider);
    return connection.state != GatewayState.connected ||
        connection.isLikelyStale;
  }

  void _resendSendsAwaitingReconnect() {
    if (_sendsAwaitingReconnect.isEmpty) {
      return;
    }
    final int generation = ref.read(gatewaySessionRecoveryProvider);
    final List<Message> due = <Message>[
      for (final Message message in state.messages)
        if ((_sendsAwaitingReconnect[message.id] ?? generation) < generation)
          message,
    ];
    for (final Message message in due) {
      _sendsAwaitingReconnect.remove(message.id);
      if (!message.isSending || _adoptDeliveredMatch(message)) {
        continue;
      }
      unawaited(_resendLocalMessage(message));
    }
  }

  void insertClientSystemMessage(String content) {
    if (state.channelId.isEmpty) {
      return;
    }
    final List<Message> nextMessages = List<Message>.from(state.messages)
      ..add(
        createClientSystemMessage(
          channelId: state.channelId,
          content: content,
          productName: ref.read(instanceRuntimeConfigProvider).productName,
        ),
      );
    state = state.copyWith(
      write: (messages: nextMessages, origin: MessagesOrigin.localMutation),
    );
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
    state = state.copyWith(
      write: (messages: next, origin: MessagesOrigin.localMutation),
    );
  }

  void cancelSendingMessage(String messageId) {
    final int messageIndex = state.messages.indexWhere(
      (Message m) => m.id == messageId,
    );
    if (messageIndex == -1) {
      return;
    }
    final Message message = state.messages[messageIndex];
    if (!message.isSending && !message.hasFailed) {
      return;
    }
    _discardLocalSend(message);
  }

  void _discardLocalSend(Message message) {
    final String? nonce = message.clientNonce;
    final List<String>? maybeCreatedFilenames = _maybeCreatedSends.remove(
      message.id,
    );
    if (nonce != null && maybeCreatedFilenames != null) {
      unawaited(
        ref
            .read(abandonedMessageSendsProvider.notifier)
            .reclaimUnseen(
              nonce: nonce,
              channelId: message.channelId,
              content: message.content,
              attachmentFilenames: maybeCreatedFilenames,
            ),
      );
    }
    if (nonce != null) {
      _clearInFlightOptimisticSend(nonce);
      _untrackLocalSend(nonce);
      ref
          .read(cloudUploadControllerProvider(message.channelId).notifier)
          .cancelMessageUpload(nonce);
    }
    _retrySendOptions.remove(message.id);
    _sendsAwaitingReconnect.remove(message.id);
    final List<Message>? next = _removeIds(state.messages, {message.id});
    if (next == null) {
      return;
    }
    state = state.copyWith(
      write: (messages: next, origin: MessagesOrigin.localMutation),
    );
  }

  Future<void> retryMessageSend(String messageId) async {
    final int messageIndex = state.messages.indexWhere(
      (m) => m.id == messageId,
    );
    if (messageIndex == -1) {
      return;
    }
    final Message message = state.messages[messageIndex];
    if (!message.hasFailed || _adoptDeliveredMatch(message)) {
      return;
    }
    final Message pending = message.copyWith(
      deliveryState: MessageDeliveryState.sending,
      sendError: null,
    );
    final List<Message> pendingMessages = List<Message>.from(state.messages);
    pendingMessages[messageIndex] = pending;
    state = state.copyWith(
      write: (messages: pendingMessages, origin: MessagesOrigin.localMutation),
      errorMessage: null,
    );
    await _resendLocalMessage(message);
  }

  bool _adoptDeliveredMatch(Message message) {
    final Message? alreadyDelivered = deliveredMatchForLocalSend(
      state.messages,
      message,
    );
    if (alreadyDelivered == null) {
      return false;
    }
    _retrySendOptions.remove(message.id);
    _untrackLocalSend(message.clientNonce);
    state = state.copyWith(
      write: (
        messages: _replaceOptimisticWithDelivered(
          messages: state.messages,
          optimisticId: message.id,
          delivered: alreadyDelivered,
        ),
        origin: MessagesOrigin.localMutation,
      ),
      errorMessage: null,
    );
    return true;
  }

  Future<bool> _adoptMaybeCreatedSend(
    String optimisticMessageId,
    Object error,
    List<String> attachmentFilenames,
  ) async {
    if (!sendMaybeCreated(error)) {
      return false;
    }
    _maybeCreatedSends[optimisticMessageId] = attachmentFilenames;
    return _resolveMaybeCreatedSend(optimisticMessageId);
  }

  Future<bool> _resolveMaybeCreatedSend(String optimisticMessageId) async {
    final _MaybeCreatedLookup lookup = await _lookupMaybeCreatedSend(
      optimisticMessageId,
    );
    if (lookup.error != null) {
      unawaited(_retryMaybeCreatedLookup(optimisticMessageId));
    }
    return lookup.adopted;
  }

  Future<void> _retryMaybeCreatedLookup(String optimisticMessageId) async {
    if (!_maybeCreatedResolvers.add(optimisticMessageId)) {
      return;
    }
    try {
      for (final Duration delay in _kMaybeCreatedLookupBackoff) {
        await Future<void>.delayed(delay);
        if (!ref.mounted ||
            !_maybeCreatedSends.containsKey(optimisticMessageId)) {
          return;
        }
        final _MaybeCreatedLookup lookup = await _lookupMaybeCreatedSend(
          optimisticMessageId,
        );
        if (lookup.error == null) {
          return;
        }
      }
    } finally {
      _maybeCreatedResolvers.remove(optimisticMessageId);
    }
  }

  Future<_MaybeCreatedLookup> _lookupMaybeCreatedSend(
    String optimisticMessageId,
  ) {
    final Future<_MaybeCreatedLookup>? running =
        _maybeCreatedLookups[optimisticMessageId];
    if (running != null) {
      return running;
    }
    final Future<_MaybeCreatedLookup> lookup = _runMaybeCreatedLookup(
      optimisticMessageId,
    );
    _maybeCreatedLookups[optimisticMessageId] = lookup;
    unawaited(
      lookup.whenComplete(() {
        if (identical(_maybeCreatedLookups[optimisticMessageId], lookup)) {
          unawaited(_maybeCreatedLookups.remove(optimisticMessageId));
        }
      }),
    );
    return lookup;
  }

  Message? _unsentLocalMessage(String optimisticMessageId) {
    for (final Message message in state.messages) {
      if (message.id == optimisticMessageId) {
        return message;
      }
    }
    return _localSends[optimisticMessageId] ??
        _inFlightOptimisticMessages[optimisticMessageId];
  }

  Future<_MaybeCreatedLookup> _runMaybeCreatedLookup(
    String optimisticMessageId,
  ) async {
    const _MaybeCreatedLookup absent = (adopted: false, error: null);
    final List<String>? attachmentFilenames =
        _maybeCreatedSends[optimisticMessageId];
    final Message? local = _unsentLocalMessage(optimisticMessageId);
    final String? nonce = local?.clientNonce;
    if (attachmentFilenames == null || local == null || nonce == null) {
      return absent;
    }
    final MessageRepository repository = ref.read(messageRepositoryProvider);
    try {
      final String? messageId = await repository.findUnseenOwnSend(
        channelId: local.channelId,
        clientNonce: nonce,
        content: local.content,
        attachmentFilenames: attachmentFilenames,
      );
      if (messageId == null) {
        return absent;
      }
      final Message sent = await repository.fetchMessage(
        channelId: local.channelId,
        messageId: messageId,
      );
      if (!ref.mounted ||
          _maybeCreatedSends.remove(optimisticMessageId) == null) {
        return absent;
      }
      _retrySendOptions.remove(optimisticMessageId);
      _sendsAwaitingReconnect.remove(optimisticMessageId);
      ref
          .read(cloudUploadControllerProvider(local.channelId).notifier)
          .removeMessageUpload(nonce);
      _clearInFlightOptimisticSend(nonce);
      _commitDeliveredOptimisticSend(
        channelId: local.channelId,
        optimisticMessageId: optimisticMessageId,
        sent: sent,
      );
      return (adopted: true, error: null);
    } on Object catch (error) {
      talker.warning('[ChatViewModel] maybe-created lookup failed: $error');
      return (adopted: false, error: error);
    }
  }

  bool _insideSendNonceDedupeWindow(Message message) {
    final int? sentAtMs = snowflakeTimestampMsOrNull(message.clientNonce);
    return sentAtMs != null &&
        DateTime.now().millisecondsSinceEpoch - sentAtMs <
            _kSendNonceDedupeWindow.inMilliseconds;
  }

  Future<void> _resendLocalMessage(Message message) async {
    if (_maybeCreatedSends.containsKey(message.id) &&
        !_insideSendNonceDedupeWindow(message)) {
      final _MaybeCreatedLookup lookup = await _lookupMaybeCreatedSend(
        message.id,
      );
      if (!ref.mounted ||
          lookup.adopted ||
          !_maybeCreatedSends.containsKey(message.id)) {
        return;
      }
      final Object? error = lookup.error;
      if (error != null) {
        _handleSendFailure(message.id, error);
        _recordLocalSendFailure(message);
        return;
      }
    }
    final _RetrySendOptions? options = _retrySendOptions[message.id];
    final String? uploadNonce = message.clientNonce;
    if (uploadNonce != null && _isMessageUploadSessionActive(uploadNonce)) {
      _registerInFlightOptimisticSend(
        message.copyWith(
          deliveryState: MessageDeliveryState.sending,
          sendError: null,
        ),
      );
      await _completeSendWithAttachments(
        channelId: message.channelId,
        outgoingText: message.content,
        replyToId: message.replyToId,
        replyMention: options?.replyMention ?? true,
        clientNonce: uploadNonce,
        stickerIds: message.stickers.map((MessageSticker s) => s.id).toList(),
        favoriteMemeId: options?.favoriteMemeId,
        optimisticMessageId: message.id,
        uploadNotifier: ref.read(
          cloudUploadControllerProvider(message.channelId).notifier,
        ),
        messageFlags: message.flags,
        tts: options?.tts ?? false,
      );
      return;
    }
    final String? trackedNonce = _localSends.containsKey(message.clientNonce)
        ? message.clientNonce
        : null;
    if (trackedNonce != null) {
      _localSends[trackedNonce] = message.copyWith(
        deliveryState: MessageDeliveryState.sending,
        sendError: null,
      );
      _persistLocalSend(trackedNonce);
    }
    final _ForwardSource? forward = options?.forward;
    try {
      final String clientNonce =
          message.clientNonce ?? clientNonceGenerator.next();
      final DateTime sendStartedAt = DateTime.now();
      final Message sent = forward != null
          ? await _sendForward(message, forward)
          : await _sendWithRateLimitRetry(
              () => ref
                  .read(messageRepositoryProvider)
                  .sendMessage(
                    channelId: message.channelId,
                    content: message.content,
                    replyToId: message.replyToId,
                    replyMention: options?.replyMention ?? true,
                    clientNonce: clientNonce,
                    stickerIds: message.stickers
                        .map((MessageSticker s) => s.id)
                        .toList(),
                    favoriteMemeId: options?.favoriteMemeId,
                    messageFlags: message.flags,
                    tts: options?.tts ?? false,
                  ),
            );
      if (!ref.mounted) {
        return;
      }
      _retrySendOptions.remove(message.id);
      _commitDeliveredOptimisticSend(
        channelId: message.channelId,
        optimisticMessageId: message.id,
        sent: sent,
      );
      unawaited(
        _recordSlowmodeSendOnSuccess(
          message.channelId,
          sent.timestamp,
          sendStartedAt,
        ),
      );
    } on Object catch (e) {
      debugPrint('[ChatViewModel] Retry failed: $e');
      if (!ref.mounted) {
        return;
      }
      if (forward == null &&
          await _adoptMaybeCreatedSend(message.id, e, const <String>[])) {
        return;
      }
      if (!ref.mounted) {
        return;
      }
      _handleSendFailure(message.id, e);
      _recordLocalSendFailure(message);
    }
  }

  void deleteFailedMessage(String messageId) {
    final int messageIndex = state.messages.indexWhere(
      (m) => m.id == messageId,
    );
    if (messageIndex == -1 || !state.messages[messageIndex].hasFailed) {
      return;
    }
    _discardLocalSend(state.messages[messageIndex]);
  }

  Future<void> deleteMessage(String messageId) async {
    if (state.channelId.isEmpty) {
      return;
    }
    final pending = _pendingDeleteFutures[messageId];
    if (pending != null) {
      return pending;
    }
    final String channelId = state.channelId;
    final int messageIndex = state.messages.indexWhere(
      (Message message) => message.id == messageId,
    );
    final Message? deletedSnapshot = messageIndex == -1
        ? null
        : state.messages[messageIndex];
    final bool clearReply = state.replyingTo?.id == messageId;
    final bool clearEdit = state.editingMessage?.id == messageId;
    final List<Message>? optimisticallyRemoved = _removeIds(state.messages, {
      messageId,
    });
    if (optimisticallyRemoved != null) {
      state = state.copyWith(
        write: (
          messages: optimisticallyRemoved,
          origin: MessagesOrigin.localMutation,
        ),
        replyingTo: clearReply ? null : state.replyingTo,
        replyMentioning: !clearReply && state.replyMentioning,
        editingMessage: clearEdit ? null : state.editingMessage,
        messageText: clearEdit ? '' : state.messageText,
      );
      if (clearReply || clearEdit) {
        unawaited(_flushComposerDraftSave());
      }
    }
    final int mutationOrdinal = _recordLocalMutation(
      messageId,
      _LocalMutationKind.deleteMessage,
    );
    final Future<void> deleteFuture = () async {
      try {
        await ref
            .read(messageRepositoryProvider)
            .deleteMessage(channelId: channelId, messageId: messageId);
        _acknowledgeLocalMutation(messageId, mutationOrdinal);
      } on Exception catch (e) {
        debugPrint('[ChatViewModel] Failed to delete message: $e');
        _withdrawLocalMutation(messageId, mutationOrdinal);
        if (state.channelId != channelId) {
          return;
        }
        if (deletedSnapshot != null) {
          state = state.copyWith(
            write: (
              messages: mergeMessagesSorted(state.messages, [deletedSnapshot]),
              origin: MessagesOrigin.localMutation,
            ),
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
  }) => _enqueueAttachmentOp(
    messageId,
    _AttachmentOp(
      kind: _LocalMutationKind.removeAttachment,
      attachmentId: attachmentId,
    ),
  );

  Future<void> editAttachmentAltText({
    required String messageId,
    required String attachmentId,
    required String? description,
  }) => _enqueueAttachmentOp(
    messageId,
    _AttachmentOp(
      kind: _LocalMutationKind.setAttachmentAlt,
      attachmentId: attachmentId,
      description: description,
    ),
  );

  Future<void> _enqueueAttachmentOp(String messageId, _AttachmentOp op) {
    if (state.channelId.isEmpty) {
      return Future<void>.value();
    }
    final int messageIndex = state.messages.indexWhere(
      (Message message) => message.id == messageId,
    );
    if (messageIndex == -1) {
      return Future<void>.value();
    }
    final Message message = state.messages[messageIndex];
    if (!message.attachments.any((Attachment a) => a.id == op.attachmentId)) {
      return Future<void>.value();
    }
    final String channelId = state.channelId;
    op.overlayOrdinal = _recordLocalMutation(
      messageId,
      op.kind,
      attachmentId: op.attachmentId,
      description: op.description,
    );
    final List<_AttachmentOp> queue = _attachmentOpQueues.putIfAbsent(
      messageId,
      () {
        _confirmedAttachmentRows[messageId] = message;
        return <_AttachmentOp>[];
      },
    )..add(op);
    _rederiveAttachmentRow(messageId);
    if (queue.length == 1) {
      unawaited(_runAttachmentOpQueue(messageId, channelId));
    }
    return op.done.future;
  }

  Future<void> _runAttachmentOpQueue(String messageId, String channelId) async {
    while (true) {
      final List<_AttachmentOp>? queue = _attachmentOpQueues[messageId];
      final Message? confirmed = _confirmedAttachmentRows[messageId];
      if (queue == null || queue.isEmpty || confirmed == null) {
        break;
      }
      final _AttachmentOp op = queue.first;
      try {
        switch (op.kind) {
          case _LocalMutationKind.removeAttachment:
            await ref
                .read(messageRepositoryProvider)
                .deleteAttachment(
                  channelId: channelId,
                  messageId: messageId,
                  attachmentId: op.attachmentId,
                );
            _confirmedAttachmentRows[messageId] = _applyAttachmentOp(
              confirmed,
              op,
            );
          case _LocalMutationKind.setAttachmentAlt:
            final Message intended = _applyAttachmentOp(confirmed, op);
            final Message acked = await ref
                .read(messageRepositoryProvider)
                .editMessageAttachments(
                  channelId: channelId,
                  messageId: messageId,
                  attachmentUpdates: <MessageAttachmentUpdate>[
                    for (final Attachment a in intended.attachments)
                      if (a.id == op.attachmentId)
                        MessageAttachmentUpdate.withDescription(
                          id: a.id,
                          description: a.description,
                        )
                      else
                        MessageAttachmentUpdate(id: a.id),
                  ],
                );
            _confirmedAttachmentRows[messageId] = acked;
          case _LocalMutationKind.deleteMessage:
          case _LocalMutationKind.editContent:
            break;
        }
        _acknowledgeLocalMutation(messageId, op.overlayOrdinal);
      } on Exception catch (e) {
        debugPrint('[ChatViewModel] Attachment mutation failed: $e');
        _withdrawLocalMutation(messageId, op.overlayOrdinal);
        if (state.channelId == channelId) {
          state = state.copyWith(
            errorMessage: op.kind == _LocalMutationKind.removeAttachment
                ? 'Failed to delete attachment'
                : 'Failed to edit attachment alt text',
          );
        }
      }
      queue.removeAt(0);
      _rederiveAttachmentRow(messageId);
      if (queue.isEmpty) {
        _attachmentOpQueues.remove(messageId);
        _confirmedAttachmentRows.remove(messageId);
      }
      op.done.complete();
    }
  }

  Message _applyAttachmentOp(Message row, _AttachmentOp op) {
    switch (op.kind) {
      case _LocalMutationKind.removeAttachment:
        return row.copyWith(
          attachments: row.attachments
              .where((Attachment a) => a.id != op.attachmentId)
              .toList(),
        );
      case _LocalMutationKind.setAttachmentAlt:
        return row.copyWith(
          attachments: <Attachment>[
            for (final Attachment a in row.attachments)
              if (a.id == op.attachmentId)
                a.copyWithDescription(op.description)
              else
                a,
          ],
        );
      case _LocalMutationKind.deleteMessage:
      case _LocalMutationKind.editContent:
        return row;
    }
  }

  void _rederiveAttachmentRow(String messageId) {
    final Message? confirmed = _confirmedAttachmentRows[messageId];
    if (confirmed == null) {
      return;
    }
    final int index = state.messages.indexWhere(
      (Message m) => m.id == messageId,
    );
    if (index == -1) {
      return;
    }
    Message derived = confirmed;
    for (final _AttachmentOp op
        in _attachmentOpQueues[messageId] ?? const <_AttachmentOp>[]) {
      derived = _applyAttachmentOp(derived, op);
    }
    final List<Message> next = List<Message>.from(state.messages);
    next[index] = next[index].copyWith(attachments: derived.attachments);
    state = state.copyWith(
      write: (messages: next, origin: MessagesOrigin.localMutation),
    );
  }

  void startReply(Message message) {
    unawaited(_startReply(message));
  }

  Future<void> _startReply(Message message) async {
    final Message? editing = state.editingMessage;
    if (editing != null && !await _endEditRestoringDraft(editing)) {
      return;
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

  Future<void> prepareReplyInChannel(Message message) async {
    final String channelId = message.channelId;
    if (state.channelId == channelId) {
      await _startReply(message);
      return;
    }
    final ({String text, Message? reply, bool? replyMentioning}) draft =
        await _loadComposerDraft(channelId);
    await _persistComposerDraftForChannel(
      channelId: channelId,
      content: draft.text,
      reply: message,
      replyMentioning: await _defaultReplyMentionFor(
        message: message,
        channelId: channelId,
      ),
    );
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

  int _scrollToBottomSignalAfterSend() {
    final bool scrollOnSend = ref
        .read(advancedPreferencesProvider)
        .scrollToBottomOnMessageSend;
    if (!scrollOnSend) {
      return state.scrollToBottomSignal;
    }
    return state.scrollToBottomSignal + 1;
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
    final int jumpGeneration = ++_channelSwitchGeneration;
    _windowGeneration++;
    bool isCurrentJump() =>
        jumpGeneration == _channelSwitchGeneration &&
        state.channelId == channelId;
    final int swapToken = _armWindowSwap(channelId);
    final int fetchOrdinal = _beginPageFetch();
    state = state.copyWith(isSyncingMessages: true);
    try {
      const int aroundLimit = _kPageSize;
      final page = await ref
          .read(messageRepositoryProvider)
          .loadMessagePage(
            channelId: channelId,
            around: messageId,
            limit: aroundLimit,
          );
      if (!isCurrentJump()) {
        return;
      }
      if (page.messages.isEmpty) {
        return;
      }
      final bool aroundTargetMissing = !page.messages.any(
        (Message message) => message.id == messageId,
      );
      if (aroundTargetMissing) {
        talker.warning(
          '[ChatViewModel] around target $messageId '
          'not found in response channel=$channelId '
          'pageSize=${page.messages.length}',
        );
      }
      final ({bool hasMoreNewer, bool needsTailProbe}) newerConsult =
          await _hasNewerMessagesThanChannel(
            page.messages.last.id,
            detachedWindow: !aroundPageReachesLiveTail(
              anchorId: messageId,
              page: page.messages,
              limit: aroundLimit,
            ),
          );
      final bool hasMoreNewer = newerConsult.hasMoreNewer;
      if (!isCurrentJump()) {
        return;
      }
      await _hydrateGuildMembersForMessages(
        channelId,
        page.messages,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      if (!isCurrentJump()) {
        return;
      }
      final bool applied = await _commitWindowSwap(
        swapToken,
        channelId,
        fetchOrdinal,
        isCurrentJump,
        () {
          state = state.copyWith(
            write: (
              messages: _finalizeLoadedMessages(
                channelId,
                page.messages,
                fetchOrdinal,
              ),
              origin: MessagesOrigin.windowSwap,
            ),
            hasMoreMessages:
                aroundTargetMissing || page.messages.length >= _kPageSize,
            hasMoreNewerMessages: hasMoreNewer,
            windowEpoch: state.windowEpoch + 1,
            isLoading: false,
          );
          _contiguity.setVerified(channelId, page.messages);
          _contiguityTrusted = true;
        },
      );
      if (!applied || !isCurrentJump()) {
        return;
      }
      _notifyMessageReferencesLoaded(
        channelId: channelId,
        messages: state.messages,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      if (newerConsult.needsTailProbe) {
        _confirmProvisionalTail(channelId);
      }
      scrollToMessage(messageId);
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to jump to replied message: $e');
    } finally {
      _endPageFetch(fetchOrdinal);
      await _disarmWindowSwap(swapToken);
      if (isCurrentJump() && (state.isSyncingMessages || state.isLoading)) {
        state = state.copyWith(isSyncingMessages: false, isLoading: false);
      }
    }
  }

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
      messageIds: _serverBackedMessageIds(),
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
    state = state.copyWith(messageLoadFailed: false);
    await _refreshMessagesFromNetwork(
      channelId,
      showLoadingSpinner: true,
      isDirectLatestLoad: true,
    );
  }

  Future<void> retryFailedMessages() async {
    if (state.channelId.isEmpty) {
      return;
    }
    if (state.messages.isEmpty) {
      await retryLoadMessages();
      return;
    }
    if (state.hasMoreMessages) {
      await loadMore();
      return;
    }
    if (state.hasMoreNewerMessages) {
      await loadNewer();
      return;
    }
    await retryLoadMessages();
  }

  Future<void> reloadCurrentChannel() async {
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
    // One-off snapshot; read does not retain the autoDispose family.
    // ignore: riverpod_lint/only_use_keep_alive_inside_keep_alive
    final GuildComposerAccess? access = ref
        .read(guildComposerAccessProvider(channelId))
        .value;
    if (access != null && !access.canAccess) {
      return;
    }
    // One-off snapshot; read does not retain the autoDispose family.
    // ignore: riverpod_lint/only_use_keep_alive_inside_keep_alive
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
    final String? guildId = await _guildIdForChannel(channelId);
    if (guildId == null) {
      return null;
    }
    // One-off snapshot; read does not retain the autoDispose family.
    // ignore: riverpod_lint/only_use_keep_alive_inside_keep_alive
    final GuildComposerAccess access = await ref.read(
      guildMemberComposerAccessProvider(guildId).future,
    );
    if (!access.canAccess) {
      return access;
    }
    return null;
  }

  void startEdit(Message message) {
    _endingEdit = null;
    unawaited(_flushComposerDraftSave());
    state = state.copyWith(
      editingMessage: message,
      replyingTo: null,
      replyMentioning: false,
      messageText: message.content,
    );
  }

  void cancelEdit() {
    final Message? editing = state.editingMessage;
    if (editing != null) {
      unawaited(_endEditRestoringDraft(editing));
    }
  }

  Future<void> saveEditedMessage({String? text}) async {
    final Message? editingMessage = state.editingMessage;
    if (editingMessage == null || identical(editingMessage, _endingEdit)) {
      return;
    }
    final String sanitized = _maybeSanitizeOutgoing(
      (text ?? state.messageText).trim(),
    );
    final String editedContent = hasVisibleContent(sanitized) ? sanitized : '';
    if (editedContent.isEmpty || editedContent == editingMessage.content) {
      talker.debug(
        '[ChatViewModel] edit save noop messageId=${editingMessage.id}',
      );
      final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.chatEditNoChanges,
              variant: FluxerToastVariant.warning,
            ),
          );
      await _endEditRestoringDraft(editingMessage);
      return;
    }
    final int maxMessageLength = ref.read(maxMessageLengthProvider);
    if (editedContent.length > maxMessageLength) {
      return;
    }
    if (editingMessage.isCrossposted) {
      final BuildContext? sheetContext = rootNavigatorKey.currentContext;
      if (sheetContext == null || !sheetContext.mounted) {
        return;
      }
      final bool confirmed = await confirmPublishedMessageEdit(sheetContext);
      if (!confirmed) {
        return;
      }
    }
    final String channelId = editingMessage.channelId;
    final String messageId = editingMessage.id;
    final Message? original = state.messages
        .where((Message m) => m.id == messageId)
        .firstOrNull;
    final DateTime optimisticEditedAt = DateTime.now().toUtc();
    final int mutationOrdinal = _recordLocalMutation(
      messageId,
      _LocalMutationKind.editContent,
      content: editedContent,
      editedTimestamp: optimisticEditedAt,
    );
    if (original != null) {
      state = state.copyWith(
        write: (
          messages: _replaceById(
            state.messages,
            original.copyWith(
              content: editedContent,
              editedTimestamp: optimisticEditedAt,
            ),
          )!,
          origin: MessagesOrigin.localMutation,
        ),
      );
    }
    final Future<bool> editEnded = _endEditRestoringDraft(editingMessage);
    try {
      final Message updatedMessage = await ref
          .read(messageRepositoryProvider)
          .editMessage(
            channelId: channelId,
            messageId: messageId,
            content: editedContent,
          );
      _acknowledgeLocalMutation(messageId, mutationOrdinal);
      if (state.channelId != channelId ||
          _hasNewerContentEdit(messageId, mutationOrdinal)) {
        return;
      }
      final List<Message>? nextMessages = _replaceById(
        state.messages,
        updatedMessage,
      );
      state = state.copyWith(
        write: (
          messages: nextMessages ?? state.messages,
          origin: MessagesOrigin.localMutation,
        ),
        errorMessage: null,
      );
    } on DioException catch (error) {
      _revertOptimisticEdit(
        messageId: messageId,
        original: original,
        mutationOrdinal: mutationOrdinal,
        editedContent: editedContent,
      );
      debugPrint('[ChatViewModel] Failed to edit message: $error');
      if (apiErrorCodeFromDioException(error) ==
          kPublishedMessageEditRateLimited) {
        final BuildContext? sheetContext = rootNavigatorKey.currentContext;
        if (sheetContext != null && sheetContext.mounted) {
          unawaited(
            showPublishedEditLimitSheet(
              sheetContext,
              retryAfterMs: retryAfterMsFromDioException(error),
            ),
          );
        }
      }
      await editEnded;
      _recoverFailedEdit(
        channelId: channelId,
        messageId: messageId,
        editedContent: editedContent,
      );
    } on Exception catch (e) {
      _revertOptimisticEdit(
        messageId: messageId,
        original: original,
        mutationOrdinal: mutationOrdinal,
        editedContent: editedContent,
      );
      debugPrint('[ChatViewModel] Failed to edit message: $e');
      await editEnded;
      _recoverFailedEdit(
        channelId: channelId,
        messageId: messageId,
        editedContent: editedContent,
      );
    }
  }

  void _recoverFailedEdit({
    required String channelId,
    required String messageId,
    required String editedContent,
  }) {
    final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
    final bool inChannel =
        state.channelId == channelId &&
        state.messages.any((Message m) => m.id == messageId);
    final bool composerEmpty =
        state.editingMessage == null &&
        state.replyingTo == null &&
        state.messageText.trim().isEmpty;
    final FluxerToastAction? action;
    if (!inChannel) {
      action = FluxerToastAction(
        label: l10n.chatMessageCopyText,
        onPressed: () => unawaited(_copyFailedEdit(editedContent)),
      );
    } else if (composerEmpty) {
      _resumeFailedEdit(channelId, messageId, editedContent);
      action = null;
    } else {
      action = FluxerToastAction(
        label: l10n.chatEditFailedEditAgain,
        onPressed: () => _resumeFailedEdit(channelId, messageId, editedContent),
      );
    }
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.chatEditFailed,
            variant: FluxerToastVariant.danger,
            action: action,
          ),
        );
  }

  void _resumeFailedEdit(
    String channelId,
    String messageId,
    String editedContent,
  ) {
    if (state.channelId != channelId) {
      return;
    }
    final Message? message = state.messages
        .where((Message m) => m.id == messageId)
        .firstOrNull;
    if (message == null) {
      return;
    }
    startEdit(message);
    state = state.copyWith(messageText: editedContent);
  }

  Future<void> _copyFailedEdit(String editedContent) async {
    await Clipboard.setData(ClipboardData(text: editedContent));
    final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.copiedToClipboard,
            variant: FluxerToastVariant.success,
          ),
        );
  }

  bool _hasNewerContentEdit(String messageId, int startOrdinal) =>
      (_localMutations[messageId] ?? const <_LocalMutation>[]).any(
        (_LocalMutation op) =>
            op.kind == _LocalMutationKind.editContent &&
            op.startOrdinal > startOrdinal,
      );

  void _revertOptimisticEdit({
    required String messageId,
    required Message? original,
    required int mutationOrdinal,
    required String editedContent,
  }) {
    _withdrawLocalMutation(messageId, mutationOrdinal);
    if (original == null ||
        state.channelId != original.channelId ||
        _hasNewerContentEdit(messageId, mutationOrdinal)) {
      return;
    }
    final Message? current = state.messages
        .where((Message m) => m.id == messageId)
        .firstOrNull;
    if (current == null || current.content != editedContent) {
      return;
    }
    state = state.copyWith(
      write: (
        messages: _replaceById(
          state.messages,
          current.copyWith(
            content: original.content,
            editedTimestamp: original.editedTimestamp,
          ),
        )!,
        origin: MessagesOrigin.localMutation,
      ),
    );
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
        write: (
          messages: nextMessages ?? state.messages,
          origin: MessagesOrigin.localMutation,
        ),
        errorMessage: null,
      );
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to apply replace command: $e');
      state = state.copyWith(errorMessage: 'Failed to edit message');
    }
  }

  Future<bool> reactWithShorthand(ReactionShorthandEmoji reaction) async {
    Message? target = state.replyingTo;
    if (target == null) {
      for (final Message message in state.messages.reversed) {
        if (message.deliveryState == MessageDeliveryState.sent &&
            !message.isClientSystemMessage) {
          target = message;
          break;
        }
      }
    }
    if (target == null) {
      return false;
    }
    if (state.replyingTo != null) {
      cancelReply();
    }
    final bool alreadyReacted = target.reactions.any(
      (Reaction r) =>
          r.hasReacted &&
          r.emoji == reaction.emoji &&
          r.emojiId == reaction.emojiId,
    );
    if (!alreadyReacted) {
      await toggleReaction(
        target.id,
        reaction.emoji,
        emojiId: reaction.emojiId,
        animated: reaction.animated,
      );
    }
    return true;
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
    final previousReactions = msg.reactions;
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
    state = state.copyWith(
      write: (messages: updatedMessages, origin: MessagesOrigin.localMutation),
    );
    unawaited(
      ref
          .read(fluxerDatabaseProvider)
          .messageDao
          .updateReactions(
            msg.channelId,
            messageId,
            jsonEncode(updatedReactions.map((r) => r.toJson()).toList()),
          ),
    );

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
      talker.error('[ChatViewModel] Reaction failed', e);
      final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
      final String fallback = hasReacted
          ? l10n.chatReactionRemoveFailed
          : l10n.chatReactionAddFailed;
      _restoreMessageReactions(
        messageId,
        previousReactions,
        errorMessage: e is DioException
            ? userFacingErrorMessage(e, fallback)
            : fallback,
      );
    }
  }

  void _restoreMessageReactions(
    String messageId,
    List<Reaction> reactions, {
    String? errorMessage,
  }) {
    final int rollbackIndex = state.messages.indexWhere(
      (Message m) => m.id == messageId,
    );
    if (rollbackIndex == -1) {
      return;
    }
    final List<Message> rollback = List<Message>.from(state.messages);
    final String channelId = rollback[rollbackIndex].channelId;
    rollback[rollbackIndex] = rollback[rollbackIndex].copyWith(
      reactions: reactions,
    );
    state = state.copyWith(
      write: (messages: rollback, origin: MessagesOrigin.localMutation),
      errorMessage: errorMessage,
    );
    unawaited(
      ref
          .read(fluxerDatabaseProvider)
          .messageDao
          .updateReactions(
            channelId,
            messageId,
            jsonEncode(reactions.map((Reaction r) => r.toJson()).toList()),
          ),
    );
  }

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
    state = state.copyWith(
      write: (messages: updatedMessages, origin: MessagesOrigin.localMutation),
    );
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
        state = state.copyWith(
          write: (messages: rollback, origin: MessagesOrigin.localMutation),
        );
      }
    }
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
    final int optimisticIndex = optimisticId == null
        ? -1
        : updated.indexWhere((Message m) => m.id == optimisticId);
    final int deliveredIndex = updated.indexWhere(
      (Message m) => m.id == delivered.id,
    );
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (deliveredIndex != -1 &&
        (optimisticIndex == -1 || optimisticIndex == deliveredIndex)) {
      updated[deliveredIndex] = mergeMentionHighlightFlag(
        incoming: delivered,
        previous: updated[deliveredIndex],
        currentUserId: currentUserId,
      );
      return updated;
    }
    final Message? previous = optimisticIndex == -1
        ? null
        : updated[optimisticIndex];
    int slot = optimisticIndex == -1 ? updated.length : optimisticIndex;
    if (deliveredIndex != -1) {
      updated.removeAt(deliveredIndex);
      if (deliveredIndex < slot) {
        slot -= 1;
      }
    }
    if (optimisticIndex != -1) {
      updated.removeAt(slot);
    }
    updated.insert(
      _deliveredMessageSlot(updated, delivered.id, slot),
      mergeMentionHighlightFlag(
        incoming: delivered,
        previous: previous,
        currentUserId: currentUserId,
      ),
    );
    return updated;
  }

  int _deliveredMessageSlot(
    List<Message> messages,
    String deliveredId,
    int preferred,
  ) {
    bool isServerOrdered(Message m) =>
        m.deliveryState == MessageDeliveryState.sent &&
        !m.isClientSystemMessage;
    int lowest = 0;
    for (int i = 0; i < messages.length; i++) {
      if (isServerOrdered(messages[i]) &&
          compareSnowflakeIds(messages[i].id, deliveredId) < 0) {
        lowest = i + 1;
      }
    }
    int highest = messages.length;
    for (int i = lowest; i < messages.length; i++) {
      if (isServerOrdered(messages[i])) {
        highest = i;
        break;
      }
    }
    return preferred.clamp(lowest, highest);
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
    final int gatewayGeneration = ref.read(gatewayFullRecoveryProvider);
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
      gatewayFullRecoveryProvider,
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
