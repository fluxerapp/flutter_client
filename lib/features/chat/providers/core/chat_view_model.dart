import 'dart:async';
import 'dart:convert';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
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
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_send_cancelled_exception.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
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
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_immunity_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_indicator_shake_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_rate_limited_alert_provider.dart';
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
import 'package:fluxer_app/features/chat/utils/message_screen_reader_announce.dart';
import 'package:fluxer_app/features/chat/utils/message_send_failure_messages.dart';
import 'package:fluxer_app/features/chat/utils/slowmode_utils.dart';
import 'package:fluxer_app/features/chat/utils/uploading_attachment_utils.dart';
import 'package:fluxer_app/features/chat/utils/url_sanitization_utils.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
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

const _kPageSize = 50;
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

/// WHO asked for a messages write. Post-install state cannot distinguish the
/// final page of the user's own pagination from a live arrival at the tail —
/// they are byte-identical in every observable — so the writer names itself
/// and the scroll layer keys its follow-vs-preserve decision on that name.
///
/// Only [liveCreate] may authorize the scroll layer to follow the tail, and
/// only [windowSwap] identifies a wholesale window replacement to the
/// jump-landing machinery. Every other value is a preserve-class label: the
/// enum spells them out so each write site names its writer honestly, but the
/// scroll layer treats them uniformly (preserve the reader's position).
enum MessagesOrigin {
  /// Realtime MESSAGE_CREATE commits from the ordered queue.
  liveCreate,

  /// Realtime update/delete commits from the ordered queue.
  realtimeEvent,

  /// Older-direction pagination installs.
  olderPage,

  /// Newer-direction pagination installs.
  newerPage,

  /// Wholesale window replacements committed through the swap lane
  /// (jump-to-latest, targeted jumps, network refresh).
  windowSwap,

  /// Unread-boundary backfill merged into the loaded window.
  boundaryFill,

  /// The user's own optimistic send appended locally.
  ownSend,

  /// Local row mutations: acks, retries, deletes, reactions, attachments,
  /// client-system rows, rollbacks.
  localMutation,

  /// Window trims that drop either side of the loaded window.
  trim,
}

/// The authorization a messages write mints for the scroll layer, PRIVATE to
/// this state layer by design: callers supply only `write: (messages, origin)`
/// to [ChatViewState.copyWith], which mints the record internally with
/// `before` set to the pre-assignment window. No caller ever constructs,
/// sees, or passes one, so a `before` mismatch is unrepresentable at the same
/// API boundary that makes an untagged messages write unrepresentable.
///
/// Transition binding (both ends compared by IDENTITY) is what survives the
/// interleavings this feature has fought: a coalesced notification delivers a
/// `previous` the authorization's `before` does not match, a superseded or
/// deferred write never assigns its `after`, and an untagged-adjacent write
/// mints its own record — the stale one dies with the transition it named.
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

  /// Counts wholesale window replacements. Bumped on EVERY write that
  /// replaces the message window wholesale (swap-lane installs and channel
  /// switches that blank or reinstall the window) and nowhere else - page
  /// merges, live creates, trims and flag-only commits do not move it. The
  /// pagination coordinator keys its live context on (channelId, windowEpoch).
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

  /// The origin of the transition `previous -> next` — non-null iff THIS
  /// state's messages write is exactly that transition, both ends compared by
  /// identity. The scroll layer keys follow-vs-preserve on the result; a null
  /// (fresh construction, coalesced delivery, or a list this write did not
  /// produce) fails toward preserve, which is the safe side: a missed follow
  /// self-corrects on the next arrival, a wrong follow teleports the reader.
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

  bool get canSend => messageText.trim().isNotEmpty;

  /// The `write` parameter is the ONLY way to change [messages], and it is
  /// indivisible from its [MessagesOrigin]: an untagged messages write is
  /// unrepresentable, so an authorization can never outlive the write that
  /// minted it (omitting `write` inherits both the list and the record it
  /// describes, which is harmless because the list is unchanged).
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

/// One unit of realtime work on the ordered apply queue.
///
/// [ordinal] is stamped at ingestion, synchronously and before any await, and
/// is what the queue orders by. [events] is a whole coalesced frame batch when
/// the frame batcher grouped one, and a single event otherwise; the group
/// shares one ordinal because its members arrived together.
class _RealtimeWrite {
  _RealtimeWrite(this.ordinal, this.events);

  final int ordinal;
  final List<MessageRealtimeEvent> events;
}

/// A wholesale window replacement that has started fetching but not yet
/// committed. While one owns the channel the queue worker pauses.
class _ArmedWindowSwap {
  _ArmedWindowSwap({required this.token, required this.channelId});

  final int token;
  final String channelId;
}

/// Sentinel ack ordinal for a mutation the server has not confirmed yet. An
/// unacknowledged mutation could become visible to ANY fetch, including one not
/// started yet, so it protects all of them.
const int _kUnacknowledgedOrdinal = 1 << 62;

/// What the user did, as an OPERATION rather than a snapshot of the whole row.
///
/// A stored whole-message revision would own fields the mutation never touched:
/// a page row carrying a newer remote text edit AND the pre-delete attachment
/// would be replaced wholesale, correctly dropping the attachment and wrongly
/// reverting the text. An operation only touches what it changed, and is
/// idempotent against a page that already reflects it.
///
/// Client start order cannot order server visibility: a mutation started first
/// can still reach the server AFTER a fetch started second, so the boundary is
/// the ACKNOWLEDGEMENT, not the start.
enum _LocalMutationKind { deleteMessage, removeAttachment, setAttachmentAlt }

class _LocalMutation {
  _LocalMutation({
    required this.kind,
    required this.startOrdinal,
    this.attachmentId,
    this.description,
  });

  final _LocalMutationKind kind;
  final int startOrdinal;
  final String? attachmentId;
  final String? description;

  /// Ordinal stamped when the server acknowledged. Every fetch that BEGAN
  /// before this may still be serving pre-mutation content.
  int ackOrdinal = _kUnacknowledgedOrdinal;
}

/// One user-issued attachment mutation, waiting its turn on its message.
///
/// The transport forces this: `deleteAttachment` is a targeted DELETE but
/// `editMessageAttachments` PATCHes the WHOLE attachment array and returns the
/// canonical row, so two of these in flight at once are last-writer-wins on the
/// server. An edit dispatched from a snapshot that still lists a concurrently
/// deleted attachment RE-CREATES it. No client-side rollback can undo that, so
/// they are serialised per message instead and each request is built at
/// dispatch time from the latest CONFIRMED row.
///
/// Serialisation only covers OUR requests. Against another client the only
/// defence is to transmit nothing this operation does not own, which is why the
/// request carries no content.
///
/// RESIDUAL, recorded rather than mechanised. The keep-set is a field this
/// operation genuinely owns, but the write granularity is the WHOLE array, and
/// that exceeds the operation once another client is involved: an attachment
/// added remotely between our read and our write is not in our keep-set and is
/// dropped, and one deleted remotely in that window is still listed and comes
/// back. The endpoint offers no conditional request - no ETag, no `If-Match`,
/// no version - so there is nothing to make the write fail on a changed base,
/// and no client-side queue or prefetch can close the gap: any value we read
/// can go stale before the PATCH lands. Fixing it needs the server side, as a
/// conditional PATCH or an attachment endpoint scoped to one attachment the
/// way DELETE already is. Until then the guarantee this queue provides is
/// scoped to THIS client's requests.
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

  /// Page-install overlay entry, acknowledged or withdrawn as usual. That layer
  /// is orthogonal: it protects fetched pages, this queue protects the wire.
  int overlayOrdinal = 0;
}

/// The commit half of a window replacement, run as a single queue item so no
/// reducer can be half applied around the wholesale write.
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

  /// Ordinal of the fetch that produced this commit's page. A queued commit is
  /// still outstanding for retirement purposes, so the log cannot drop entries
  /// newer than it while it waits in the lane.
  final int fetchOrdinal;

  /// The caller's own liveness check, carried to EXECUTION time.
  ///
  /// Token ownership alone is not validity. A channel switch that loads nothing
  /// bumps the switch generation, writes the new channel's state directly and
  /// returns without ever arming, so a commit queued before it still holds the
  /// armed token and would wholesale-write its page into whatever channel the
  /// user just landed on. Nor is a channel check enough: a same-channel no-load
  /// switch keeps the id while the generation moves, and that swap was
  /// superseded by user intent all the same.
  final bool Function() stillValid;

  final void Function() write;

  /// Completes with whether [write] actually ran. A commit that reached the
  /// front of the queue after a NEWER swap armed is superseded: it must not
  /// write, and its caller must not run the effects that go with a write.
  final Completer<bool> done = Completer<bool>();
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
  bool _userScrollActive = false;
  bool _pendingSessionResync = false;
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
  // The switch currently running, plus its future, for joining duplicates.
  ({String channelId, String? targetMessageId, bool loadMessages})?
  _switchInFlightRequest;
  Future<void>? _switchInFlightFuture;
  // Bumped whenever the loaded window is replaced wholesale. In-flight page
  // loads compare it before applying, so a slow response cannot resurrect
  // the window it was fetched for after a jump replaced it.
  int _windowGeneration = 0;
  bool _jumpToLatestActive = false;
  // Ordered realtime apply queue. See the block comment on
  // _onRealtimeEventsBatch for what each piece guarantees.
  int _ingressOrdinal = 0;
  final List<_RealtimeWrite> _realtimeQueue = <_RealtimeWrite>[];
  final List<_WindowSwapCommit> _swapCommits = <_WindowSwapCommit>[];
  _ArmedWindowSwap? _armedSwap;
  int _windowSwapToken = 0;
  bool _realtimeWorkerActive = false;
  Future<void> _realtimeWorkerIdle = Future<void>.value();
  // LOCAL MUTATION LOG. A wholesale window write installs a page fetched before
  // these landed, and their whole representation is the ABSENCE (delete) or the
  // REPLACEMENT (edit) of a row, which no fresh read of state.messages can
  // recover: the merge gives the page precedence, and a deleted row is simply
  // not there to preserve.
  //
  // Keyed by ORDINAL, not by liveness. Retiring an entry when its own request
  // completes reopens the hole it exists to close: the request can finish while
  // an OLDER page still sits in the commit lane, and that page then reinstates
  // a confirmed-deleted message. The hazard lasts as long as any page fetched
  // before the mutation is still outstanding, which is what _retireLocalMutations
  // measures.
  /// Counts WHOLESALE window writes. _windowGeneration counts requests, not
  /// installs, and a refresh replaces the window without touching it, so a
  /// consumer that needs to know "was the window swapped under me" needs this.
  int _windowWrites = 0;
  int _pageFetchOrdinal = 0;
  final Set<int> _outstandingFetchOrdinals = <int>{};
  final Map<String, List<_LocalMutation>> _localMutations =
      <String, List<_LocalMutation>>{};
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

  // ORDERED REALTIME APPLY QUEUE.
  //
  // Every mutation of state.messages that originates from the gateway goes
  // through here, and exactly ONE writer runs at a time.
  //
  // Before the queue, four cooperating mechanisms approximated a single ordered
  // writer from the outside: capture-on-arm, drain-before-write, a window epoch
  // and a post-await arm fence. Each was individually right and jointly
  // incomplete, because the applications themselves were launched unawaited and
  // could still overlap one another, and a coalesced frame batch could still
  // write a list it had computed from a snapshot taken before a swap.
  //
  // The queue makes the invariant structural instead of cooperative:
  //   * ingestion stamps a MONOTONIC INGRESS ORDINAL before any await, the only
  //     point at which arrival order is still known for certain;
  //   * one worker drains strictly in ordinal order, so two reducers are never
  //     in flight together and last-write-wins cannot lose anybody's work;
  //   * a wholesale window replacement COMMITS AS A QUEUE ITEM, so a reducer
  //     parked in its database read and a swap's write can no longer overlap in
  //     either direction. This is what lets the epoch go away: the only code
  //     that replaces the window wholesale now runs between queue items;
  //   * while a swap owns the channel the worker pauses. The swap's page
  //     reflects server state at FETCH time, so everything the queue is holding
  //     has to replay AFTER the wholesale write rather than be clobbered by it,
  //     and it replays in ordinal order. A reducer that was already parked when
  //     the swap armed puts itself back on the queue at its own ordinal for the
  //     same reason, which is the arm fence restated as a queue operation. The
  //     reducers are idempotent, so replaying an event the page already
  //     reflects is a no-op.
  void _onRealtimeEventsBatch(List<MessageRealtimeEvent> events) {
    if (events.isEmpty) {
      return;
    }
    // References track the whole channel, not the loaded window, so they are
    // never deferred and never queued.
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

  /// Eligible work exists when a commit is queued, or when the queue is
  /// non-empty and no swap owns the channel.
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
      // LOST WAKEUP. The worker returns, and the flag stays true until this
      // callback runs a microtask later. An enqueue landing in that gap pumps
      // while the flag is still set, no-ops, and strands its work until some
      // unrelated later traffic happens to pump again: on a quiet channel that
      // is an event applied minutes late, or never. Re-pump here instead.
      // Terminating: each pump either consumes a queue item or returns, so a
      // re-pump that finds nothing eligible simply falls straight back out.
      if (_realtimeQueueEligible) {
        _pumpRealtimeQueue();
      }
    });
  }

  Future<void> _runRealtimeQueue() async {
    while (true) {
      // A commit is the transaction boundary and jumps the held events by
      // design: they are what has to replay ON TOP of the window it installs.
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

  /// One bad event must never wedge the queue behind it.
  Future<void> _applyRealtimeWriteSafely(_RealtimeWrite write) async {
    try {
      if (write.events.length == 1) {
        await _applyRealtimeEvent(write, write.events.first);
      } else {
        // Creates need nothing from the database, so a whole frame batch is one
        // synchronous commit and there is no window to lose a write in. If a
        // batched event type ever needs IO, prefetch it HERE, in the await
        // phase, and hand it to the commit.
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

  /// Runs [write] as a single queue transaction, then replays everything the
  /// swap held onto the window it just installed.
  ///
  /// The network fetch deliberately stays OUTSIDE the queue: serialising fetch
  /// latency behind event application would stall the live channel for the
  /// whole round trip. Only the commit is a queue item.
  ///
  /// Returns whether the write ran. Callers own effects that only make sense
  /// alongside it (publishing the window, scrolling, acking) and MUST skip them
  /// when it did not.
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
    // VALIDITY IS CHECKED HERE, AT EXECUTION TIME, not where the caller
    // enqueued. A commit waits in the lane behind whatever reducer was mid
    // application, and the world can move in that gap. The caller's own checks
    // all ran before the enqueue and cannot see it.
    //
    // Three conditions, and each catches something the others miss:
    //   * the armed token still ours -- a NEWER swap arming replaces it, and a
    //     disarm nulls it. Neither is visible to a generation counter.
    //   * the channel still ours -- a switch that loads nothing never arms, so
    //     the token check alone would let this page land in another channel.
    //   * the caller's own predicate -- a same-channel no-load switch keeps the
    //     id and never arms, yet still supersedes by user intent.
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
      // This commit has left the lane, so it no longer holds the retirement
      // boundary down.
      _retireLocalMutations();
      // A superseded commit still has to leave the queue moving. When a newer
      // swap owns the channel this loop correctly does nothing, because that
      // owner's barrier is the one now in force.
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

  /// THE WINNER OWNS THE FLAG. A pagination request that clears the busy flag
  /// after a same-channel switch reset it takes down its SUCCESSOR's flag while
  /// that successor is still running, and a third load then starts on top of
  /// it: the exact overlap these flags exist to prevent. Ownership is the
  /// request's own fetch ordinal, which is already unique per invocation.
  /// Per message: the operations still to run, oldest first, the running one at
  /// index 0. Present iff that message has unfinished attachment work.
  final Map<String, List<_AttachmentOp>> _attachmentOpQueues =
      <String, List<_AttachmentOp>>{};

  /// Per message: the newest row the SERVER has confirmed. Requests derive from
  /// this, never from the optimistic row, and the optimistic row is always
  /// re-derived as confirmed + the queue. A failure therefore needs no inverse
  /// at all: dropping the op from the queue re-derives the right UI.
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

  /// One latest-page confirmation per (channel, tail, window generation):
  /// repeated empty results on one cursor re-use the standing verdict instead
  /// of paying a full latest fetch each (the device log priced one at 1.9s).
  /// A confirmation that ends WITHOUT a verdict (network failure) clears its
  /// entry so the next install may re-owe. m17d pins the dedupe.
  ({String channelId, String tailId, int windowGeneration})? _tailProbeLedger;

  /// Visible for testing: the unread-boundary key must record SUCCESSFUL loads
  /// only, so a discarded attempt leaves it empty and a later attempt proceeds.
  @visibleForTesting
  int get loadedUnreadBoundaryKeyCount => _loadedUnreadBoundaryKeys.length;

  @visibleForTesting
  int get pendingLocalMutationCount => _localMutations.values.fold<int>(
    0,
    (int sum, List<_LocalMutation> ops) => sum + ops.length,
  );

  /// Opens a page fetch and returns its FETCH ORDINAL, taken before the await
  /// so it names a point the page's content is at or before.
  int _beginPageFetch() {
    final int ordinal = ++_pageFetchOrdinal;
    _outstandingFetchOrdinals.add(ordinal);
    return ordinal;
  }

  void _endPageFetch(int ordinal) {
    _outstandingFetchOrdinals.remove(ordinal);
    _retireLocalMutations();
  }

  /// Records a local mutation the server has not confirmed yet. Returns the
  /// start ordinal, which the caller keeps so it can acknowledge or withdraw
  /// exactly its own operation.
  int _recordLocalMutation(
    String messageId,
    _LocalMutationKind kind, {
    String? attachmentId,
    String? description,
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

  /// The server took it. From here on, only fetches that BEGAN before this
  /// point still need protecting; anything started later is guaranteed to see
  /// the mutation, and its page must win.
  ///
  /// HTTP success is the boundary. If the read path lags the write path
  /// server-side this is optimistic, but it is the only acknowledgement a
  /// client has.
  void _acknowledgeLocalMutation(String messageId, int startOrdinal) {
    _findLocalMutation(messageId, startOrdinal)?.ackOrdinal =
        ++_pageFetchOrdinal;
    _retireLocalMutations();
  }

  /// Failure path. The caller restores the row separately, and this runs
  /// whether or not that restore applied, so a withdrawn operation never
  /// depends on the rollback having happened.
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

  /// Drops every ACKNOWLEDGED operation that no outstanding page operation
  /// began before. An unacknowledged one never retires: a fetch that has not
  /// even started yet can still be served pre-mutation content.
  ///
  /// Called whenever a fetch closes, whenever one acknowledges, and after every
  /// commit, so the log holds only operations still owed protection and empties
  /// completely once the lanes drain.
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

  /// Re-applies local operations the page being installed is older than.
  ///
  /// A fresh read of state.messages is not enough on its own. It rescues an
  /// optimistic SEND, whose row is present locally and survives the merge, but
  /// not the other two: a DELETE removed the row entirely, so there is nothing
  /// left to preserve and the page, fetched before it, puts it straight back;
  /// and an attachment edit loses because mergeMessagesSorted gives the page
  /// precedence.
  ///
  /// The comparison is against the ACKNOWLEDGEMENT and is load-bearing in BOTH
  /// directions. A fetch that began after the server confirmed the operation is
  /// guaranteed to reflect it, so its page must win, or a delete-then-recreate
  /// and every later server-side edit would be masked forever. A fetch that
  /// began before the ack may still be serving pre-operation content no matter
  /// which of the two the client started first, so it is overlaid.
  ///
  /// Attachment operations are applied to the PAGE's own row, so a newer remote
  /// edit to any field they do not touch survives untouched, and an operation
  /// the page already reflects is a no-op. Deletes are whole-row tombstones and
  /// need no content clock: absence carries no timestamp, and a recreate gets a
  /// new snowflake id, so a tombstone can never mask genuinely newer content.
  /// That asymmetry is deliberate; do not make it symmetric.
  ///
  /// RESIDUAL: a newer REMOTE change to the SAME attachment's description,
  /// racing our acknowledged alt-text set, has no per-attachment clock to
  /// arbitrate. The operation shape confines that to the one field instead of
  /// the whole message.
  ///
  /// Only the two attachment paths are optimistic. The content edit paths
  /// (saveEditedMessage, applyComposerReplace) await the server and write the
  /// confirmed row, so they have nothing local to protect.
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
        }
      }
      if (!deleted) {
        result.add(current);
      }
    }
    return result;
  }

  /// Releases the barrier of a swap that will never commit: it failed, it was
  /// superseded, or it short-circuited before reaching its write. Whatever the
  /// queue held for it then drains in ordinal order against the window that is
  /// actually loaded.
  Future<void> _disarmWindowSwap(int token) async {
    if (_armedSwap?.token != token) {
      return;
    }
    _armedSwap = null;
    // Clearing the barrier is an eligibility transition, so it MUST wake the
    // worker: the worker returned the moment the swap armed, and without this
    // everything enqueued during a swap that never commits sits in the queue
    // until unrelated later traffic happens to pump. Wait for genuine idle
    // rather than for one particular worker future, because a worker caught
    // mid-return hands off to the re-pump in its own completion callback.
    while (_realtimeQueueEligible || _realtimeWorkerActive) {
      _pumpRealtimeQueue();
      await _realtimeWorkerIdle;
    }
  }

  /// True when a swap armed while [write] was awaiting. The swap's page
  /// predates this event, so writing now would either be erased by the
  /// wholesale write moments later or erase it. [write] goes back on the queue
  /// AT ITS OWN ORDINAL, ahead of everything that arrived after it, and replays
  /// once the swap has committed.
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

  /// Commits a coalesced frame of creates.
  ///
  /// SYNCHRONOUS BY SIGNATURE, and that is the whole point. The window is read
  /// at the top and assigned at the bottom with NO suspension point in between,
  /// so nothing can land in the gap and be erased.
  ///
  /// Carrying a base across awaits is not safe even when every await looks
  /// microtask-only: microtasks already queued when the batch starts run at its
  /// first yield, and one of them can be the continuation of an optimistic send
  /// whose IO completed in the same macrotask slot. It writes the user's own
  /// message into state.messages, the batch resumes holding a base from before
  /// it, and the commit erases it. A void method cannot have that gap.
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

  /// AWAIT PHASE. Everything a reducer needs from the database is fetched here,
  /// up front, so the reduction that follows can be synchronous. Nothing may be
  /// awaited after this point: the commit reads the window and assigns it in
  /// one uninterrupted block, which is what stops a writer the queue does not
  /// own (an optimistic send, a page load, an edit) from being erased by a
  /// reducer that entered before it.
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

  /// COMMIT PHASE. Synchronous by signature, from the read below to the last
  /// assignment.
  void _commitRealtimeEvent(
    MessageRealtimeEvent ev,
    db.Message? prefetchedRow,
  ) {
    final List<Message>? next = _nextMessagesForSync(
      ev,
      messages: state.messages,
      prefetchedRow: prefetchedRow,
    );
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
        write: (
          messages: nextMessages,
          origin: ev is MessageCreated
              ? MessagesOrigin.liveCreate
              : MessagesOrigin.realtimeEvent,
        ),
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

  /// The one and only database read a reducer performs, hoisted out of the
  /// reduction so the reduction can be synchronous. The guards here decide
  /// whether a read is worth doing; the reduction re-checks everything against
  /// the window as it stands when it commits.
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
        return dao.getMessage(messageId);
      case MessageReactionsChanged(:final channelId, :final messageId):
        if (channelId != state.channelId) {
          return null;
        }
        return dao.getMessage(messageId);
      case MessageCreated():
      case MessageDeleted():
      case MessagesDeletedBulk():
        return null;
    }
  }

  /// The reduction itself: pure with respect to IO, so a caller can run it
  /// between a fresh read of [messages] and the assignment with nothing able to
  /// interleave. [prefetchedRow] carries whatever [_prefetchRowFor] fetched.
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
            if (!existing.isMentioned && msg.isMentioned) {
              final List<Message> updated = List<Message>.from(messages);
              updated[matchedIndex] = existing.copyWith(isMentioned: true);
              return updated;
            }
            return null;
          }
          final List<Message> updated = List<Message>.from(messages);
          updated[matchedIndex] = msg.copyWith(
            deliveryState: MessageDeliveryState.sent,
            sendError: null,
          );
          return updated;
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
      case MessageUpdated(:final event):
        if (event.message.channelId != state.channelId) {
          return null;
        }
        final String messageId = event.message.id;
        final int idx = messages.indexWhere((m) => m.id == messageId);
        if (idx != -1) {
          final Message merged = messages[idx].applyGatewayUpdate(
            event.message,
            currentUserId: ref.read(currentUserIdProvider),
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

  /// Switches the open channel. A request identical to the one already running
  /// joins it: isLoading and isSyncingMessages are written only after the first
  /// await, so same-frame callers cannot see each other.
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
    if (state.channelId == channelId &&
        targetMessageId != null &&
        state.isLoading) {
      return;
    }
    if (state.channelId == channelId &&
        targetMessageId == null &&
        loadMessages &&
        (state.isLoading || state.isSyncingMessages) &&
        state.messages.isNotEmpty) {
      return;
    }
    // A switch replaces the window wholesale; a stale scroll-active flag
    // from the outgoing list must not defer recovery resyncs forever.
    _userScrollActive = false;
    _pendingSessionResync = false;
    final int switchGeneration = ++_channelSwitchGeneration;
    bool isCurrentSwitch() => switchGeneration == _channelSwitchGeneration;
    // The cached-window install below is a page-producing read like any other.
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
          replaceWindow: isChannelChange,
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
          replaceWindow: true,
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
          !isChannelChange &&
          state.messages.isNotEmpty) {
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
      final cached = mergeMentionHighlightFlags(
        await repo.getCachedMessages(channelId, limit: _kInitialPageSize),
        currentUserId: currentUserId,
      );
      if (!isCurrentSwitch()) {
        return;
      }
      final hasUnread = await _channelHasNewUnreadMessages(channelId);
      if (!isCurrentSwitch()) {
        return;
      }
      if (cached.isNotEmpty && !hasUnread) {
        final bool incompleteCache = cached.length < _kPageSize;
        final bool willRefresh =
            incompleteCache || _shouldRefreshChannelFromNetwork(channelId);
        state = _switchedChannelState(
          channelId: channelId,
          messages: _applyPendingLocalMutations(cached, cacheOrdinal),
          draft: draft,
          replyMentioning: replyMentioning,
          scrollToBottomSignal: state.scrollToBottomSignal,
          isLoading: false,
          isSyncingMessages: willRefresh,
          isLoadingMore: false,
          isLoadingNewer: false,
          hasMoreMessages: incompleteCache || cached.length >= _kPageSize,
          hasMoreNewerMessages: false,
          replaceWindow: true,
        );
        _invalidateMessageCacheTrust();
        _deferMessageReferencesLoaded(channelId: channelId, messages: cached);
        if (willRefresh) {
          unawaited(
            _refreshMessagesFromNetwork(
              channelId,
              isDirectLatestLoad: incompleteCache,
              preserveLoadedWindow: !incompleteCache,
              shouldApplyResult: isCurrentSwitch,
            ),
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
        replaceWindow: true,
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
        aroundMessageId: aroundUnreadId,
        isDirectLatestLoad: aroundUnreadId == null,
        shouldApplyResult: isCurrentSwitch,
      );
    } finally {
      if (cacheFetchOrdinal != null) {
        _endPageFetch(cacheFetchOrdinal);
      }
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

  /// Refreshes the open channel after gateway READY/RESUMED without navigation
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
      // A wholesale swap under an active fling resets the pagination pumps
      // and thrashes the window (profile log, 20:56:51-57). Defer to the
      // scroll end that setUserScrollActive(false) reports.
      _pendingSessionResync = true;
      return;
    }
    // Ownership, captured before the flag becomes ours. Only three sites move
    // these counters: a channel switch and an around jump bump the switch
    // generation, a jump to latest bumps the window generation. Our OWN refresh
    // bumps neither — its commit moves _windowWrites only — so this reads
    // exactly as "nobody has taken the window away from us", and stays true
    // through our own success.
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
          // Runs synchronously at the post-commit guarded point. Deciding
          // after the outer await instead would race the refresh's own later
          // awaits, where a same-channel sibling can replace the window
          // through the arm token without moving any generation.
          onApplied: scrollToBottom,
        );
      } else {
        await _refreshMessagesFromNetwork(
          channelId,
          isDirectLatestLoad: false,
          preserveLoadedWindow: state.messages.isNotEmpty,
        );
      }
      // Nothing to mark here. The refresh is the ONLY layer that decides
      // "reconciled", and it decides it on the path that applied; re-deriving it
      // out here is how a superseded refresh came to mark a window it never
      // touched. m15 pins the regression.
    } finally {
      // Only the owner clears the flag. A jump that superseded us set
      // isSyncingMessages for ITSELF, and clearing it mid-flight leaves the
      // channel reading as not-busy to every dedup guard and busy gate for the
      // rest of its run. Same shape as jumpToLatestMessages' finally; m15 pins.
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

  /// Identity-preserving [mergeMentionHighlightFlags]: several preserve-window
  /// paths prove "this write kept the window" by list identity, so a no-op
  /// mention pass must return the input instance untouched.
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
    // Fires exactly once, on the path that installed the page - after the
    // commit applied and survived the continuation recheck. Callers hang
    // post-install scroll effects here instead of re-deriving "applied".
    VoidCallback? onApplied,
  }) async {
    final int windowGeneration = _windowGeneration;
    final int switchGeneration = _channelSwitchGeneration;
    bool shouldApply() =>
        windowGeneration == _windowGeneration &&
        (shouldApplyResult?.call() ?? true);
    // What the commit is gated on: everything shouldApply covers, plus channel
    // switches, which move the switch generation without touching the window
    // generation and, when they load nothing, without arming either.
    bool stillCurrent() =>
        shouldApply() &&
        switchGeneration == _channelSwitchGeneration &&
        state.channelId == channelId;
    // ONE guard shape for every path below that writes state:
    // stillCurrent() && ownsSwap(). They compose, and neither subsumes the
    // other. Generations catch what never re-arms — a same-channel no-load
    // switch keeps the window and writes its own flags, and for the callers
    // that pass no shouldApplyResult (the recovery reconcile, retry, reload)
    // shouldApply is the window generation ALONE, blind to it. The arm catches
    // what bumps no generation — a sibling refresh on the same channel. The one
    // exception is the spinner write directly below: it runs synchronously,
    // before the arm and the first await, so nothing can have superseded us
    // yet, and a targeted load legitimately runs before state.channelId has
    // become [channelId].
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
    // The identity generations cannot express, and it is scoped to the paths
    // BEFORE the commit plus the failure path. Two refreshes on ONE channel
    // (retry plus a DM-list reload, say) bump no counter at all: the second's
    // arm simply replaces the first's token, so only the arm tells them apart.
    //
    // NEVER fold this into stillCurrent or into anything the post-commit path
    // reads. A landed commit NULLS the arm before it completes the commit
    // future, so the same null means OPPOSITE things on the two sides of the
    // commit: before it, "somebody took the window, write nothing"; after it,
    // "our own write landed". A unified predicate cannot exist, and one that
    // included the token would reject every successful refresh and silently
    // skip publish and the reconcile mark.
    bool ownsSwap() => _armedSwap?.token == swapToken;
    final int fetchOrdinal = _beginPageFetch();
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
      if (!stillCurrent() || !ownsSwap()) {
        return;
      }
      // THE BEFORE-CURSOR RESCUE, one shot, only for the one latest-page shape
      // the direct proof below cannot cover: the raw top-N all filtered, the
      // page EMPTY, older visible rows possibly within reach. The
      // latest-equality probe is structurally out here (an empty window has no
      // tail to anchor it, and _confirmProvisionalTail early-returns on a null
      // tail), but the channel pointer IS a cursor, and `get_before` raw-scans
      // DESCENDING from it BEFORE the visibility retain and orphan partition
      // run (shard_impl.rs:380-397, 616-628): filtered rows consume limit
      // slots, they cannot hide a visible row that falls within the raw reach.
      // So ONE bounded before=<pointer> page recovers the window exactly when
      // the filtered run below the pointer is shorter than the limit; a run at
      // or past the limit comes back EMPTY, yields no new cursor to advance to
      // (no rows, no id), and the install falls through to the sealed-empty
      // behavior below - bounded honesty, no loop, same residual as before.
      // A non-empty rescue page is NOT a latest-tail proof (its reach started
      // at the pointer, not at the channel's newest bucket, and the pointer is
      // an opinion), so the install drops the direct-latest short-circuit and
      // lets the normal pointer consult rule on hasMoreNewer. m16t pins the
      // recovery, m16u the stuck residual.
      bool emptyLatestRescued = false;
      // THE RESCUE IS ITS OWN PAGE FETCH. Its request goes on the wire a
      // full await after the primary's response came back, and a local
      // mutation can be ACKNOWLEDGED in that gap; under the primary's
      // borrowed ordinal the overlay would read the rescue page as pre-ack
      // and stamp a stale field op over post-ack server truth (and over any
      // newer remote change to the same field). So the rescue takes a rescue
      // ordinal of its own, minted at ITS request time, and an ADOPTED
      // rescue page carries that ordinal into the install: the overlay in
      // reduceAgainst and the commit's retirement bookkeeping both see the
      // ordinal of the fetch that actually produced the page. The primary's
      // ordinal keeps governing every no-rescue path. m16v pins the
      // interleave, ledger M-AE the borrow.
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
            }
          } finally {
            // Adopted, empty, or superseded, the rescue's outstanding entry
            // ends here; an adopted page's protection is carried onward by
            // the commit's fetchOrdinal (and the primary, still open, spans
            // the handoff), so retirement still empties once the lanes
            // drain.
            _endPageFetch(rescueOrdinal);
          }
        }
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
      // The reduction, as a function of the window it is given. Called twice:
      // once here on a pre-lane snapshot, purely to DERIVE things that need an
      // await (the channel-pointer consult and member hydration), and once
      // again inside the commit closure against the window as it stands at
      // write time. Only the second result is ever installed.
      List<Message> reduceAgainst(List<Message> current) {
        final List<Message> reconciled = preserveLoadedWindow
            ? reconcileStaleDeletionsInLoadedWindow(
                current: current,
                networkPage: page.messages,
              )
            : reconcileMessagesWithNetworkPage(
                current: current,
                networkPage: page.messages,
                syncBaselineOldestId: current.isEmpty ? null : current.first.id,
              );
        return _applyPendingLocalMutations(reconciled, effectiveFetchOrdinal);
      }

      final List<Message> merged = reduceAgainst(state.messages);
      final String? mergedServerTailId = newestServerBackedMessageId(merged);
      // A DIRECT latest load PROVES its own newer edge, and the row count has
      // nothing to do with the proof. `get_latest` scans DESCENDING from the
      // newest bucket with no cursor, and the visibility retain and the orphan
      // partition run after that scan and can only REMOVE rows
      // (shard_impl.rs:372-378, 623-628), so filtering cannot surface an older
      // row as the page's newest: any visible row newer than it would have been
      // scanned first. A NON-EMPTY latest page's newest row therefore IS the
      // channel's newest visible row - the very monotonicity the tail
      // confirmation is built on - and this install replaces the window with
      // that page (all four isDirectLatestLoad call sites fetch with no anchor
      // and no window preservation), so the window's tail becomes that row and
      // nothing newer exists. Full page or short, the newer edge is settled;
      // page fullness speaks to hasMoreOlder below and to nothing else.
      //
      // So it does NOT consult the pointer, and that is a cost decision as much
      // as a correctness one: the consult would ask the server a question this
      // fetch just answered, and the ladder's non-proof rungs would answer it
      // PROVISIONALLY whenever the pointer is missing or stale-behind - a
      // redundant confirmation fetch on an ordinary channel open, plus a
      // transiently open flag on a window already known to be live. m16r pins
      // both halves. An EMPTY direct latest page proves nothing (every row in
      // the raw top-N may have been filtered), yet it still seals
      // hasMoreNewer:false - INHERITED pre-existing parent behavior, not a
      // verdict this ladder reaches: with no rows there is no merged tail to
      // consult about. The LATEST-EQUALITY probe specifically can do no
      // better: an empty window has no anchor to compare against, and
      // _confirmProvisionalTail early-returns on a null tail. That
      // impossibility is scoped to the probe, NOT to recovery as such - the
      // channel pointer is a cursor, and the before-cursor rescue above
      // recovers the window whenever the filtered run below the pointer is
      // shorter than the limit. What remains sealed-empty here is the
      // residual: a filtered run at or past the limit (rescue page empty, no
      // cursor to advance to) plus the widget layer's stranded-empty resync
      // (fires once), until the server reports the raw-exhaustion flag it does
      // not have today. m16u pins the residual as-is.
      //
      // A RESCUED install is neither of those shapes: the page is real but its
      // reach started at the pointer, so it proves nothing about the newer
      // edge and takes the normal consult like any other anchored page.
      final ({bool hasMoreNewer, bool needsTailProbe}) newerConsult =
          (isDirectLatestLoad && !emptyLatestRescued) ||
              mergedServerTailId == null
          ? const (hasMoreNewer: false, needsTailProbe: false)
          : await _hasNewerMessagesThanChannel(
              mergedServerTailId,
              // Detached by construction means built AROUND an anchor rather
              // than from the tail. Not merely "not a direct latest load": a
              // plain reconcile of a live-tail window is still at the tail, and
              // treating it as detached would suppress auto-ack. An around page
              // whose newer side came back SHORT of the server's quota for it
              // is not detached either, since that IS the server reporting
              // nothing newer than the page's own tail remains, and it is how
              // opening an unread channel whose tail was deleted still reaches
              // auto-ack. The quota is derived from the limit this fetch
              // actually asked for, so the page and the yardstick always come
              // from the same request.
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

      // Around page missing the requested anchor: the server was not centred
      // where we asked, so the page shape cannot seal the older edge. Newer
      // still comes from the pointer consult - a missing anchor already makes
      // aroundPageReachesLiveTail false (detached), and pointer equality can
      // still prove the live tail (deleted/filtered ack near the present).
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

      // Around pages are split before/after the anchor; near the live tail they
      // can be shorter than [limit] while older history still exists. A rescued
      // window keeps older OPEN regardless of count: its page is a BEFORE page,
      // and a before page short of the limit is the post-truncation-filter
      // ambiguity, not proof of exhaustion - ordinary pagination settles it.
      final bool hasMoreOlder =
          aroundTargetMissing ||
          (preserveLoadedWindow
              ? state.hasMoreMessages
              : emptyLatestRescued ||
                    page.messages.length >= effectiveLimit ||
                    (effectiveAroundMessageId != null &&
                        page.messages.isNotEmpty));
      // The wholesale write commits as ONE queue item, and it composes its list
      // INSIDE the closure, from the window as it stands at write time. The
      // page is prefetched input; the merge against local state is a reduction,
      // and a reduction computed before the lane installs a list that predates
      // whatever the user did while the commit waited.
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
      // TWO windows, two guards. [applied] closes the lane wait: the commit sat
      // behind a reducer and may have been superseded before it ran. The
      // predicate recheck closes the continuation resume: completing the
      // commit's future hands control back a microtask later, and a superseding
      // intent whose own continuation was already queued can bump the
      // generation, arm and write in between. Publishing or reconciling on a
      // stale true would claim this channel is up to date on the strength of a
      // page the winner has already replaced. NO token here, deliberately: our
      // own commit nulled the arm on its way out, so ownsSwap() is false for
      // exactly the refresh that succeeded.
      if (!applied || !stillCurrent()) {
        return;
      }
      onApplied?.call();
      unawaited(
        _onMessageBatchLoaded(
          channelId: channelId,
          messages: state.messages,
          embeddedReplyParents: page.embeddedReplyParents,
        ),
      );
      // AFTER the commit, and only here: the probe pages forward from the window
      // this install just published, so firing it before the commit would have
      // it fetch from whatever the window used to end on. A missing around
      // target leaves the older edge open without a trustworthy shape to probe.
      if (newerConsult.needsTailProbe && !aroundTargetMissing) {
        _confirmProvisionalTail(channelId);
      }
      if (targetMessageId == null) {
        _markChannelNetworkRefresh(channelId);
        // THE decision, made once, only on the path that installed the page.
        // No caller may re-derive it: an outer mark on channel equality fires
        // for superseded refreshes too, and the skip machinery then suppresses
        // the next resync of a stale window.
        _markMessagesReconciled(channelId);
        await _onMessagesLoaded(channelId);
        if (isDirectLatestLoad &&
            !emptyLatestRescued &&
            page.messages.length < effectiveLimit) {
          await _reconcileReadStateAfterLatestLoad(channelId);
        }
      }
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to load messages: $e');
      // The failure belongs to THIS refresh; the state may already belong to
      // whoever superseded it. Writing a banner and clearing busy flags over a
      // successor that did not fail is the same ownership bug as the finally.
      // m15b pins the superseding switch, m15c the superseding sibling refresh.
      if (!stillCurrent() || !ownsSwap()) {
        return;
      }
      final bool hasCachedMessages = state.messages.isNotEmpty;
      state = state.copyWith(
        isLoading: false,
        isSyncingMessages: false,
        messageLoadFailed: !hasCachedMessages,
        errorMessage: hasCachedMessages ? 'Failed to sync messages' : null,
      );
    } finally {
      // A failed or superseded load must still not swallow realtime events.
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

  Future<PageLoadResult> loadMore() async {
    final String channelId = state.channelId;
    final int entryEpoch = state.windowEpoch;
    PageLoadResult older({
      required PageLoadStatus status,
      required bool hasMoreAtEdge,
      String? requestCursor,
      String? installedBoundary,
    }) => PageLoadResult(
      edge: PaginationEdge.older,
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
      // At the in-memory cap: pause instead of installing - installs never
      // trim (a directional trim mid-fling teleports the viewport). The
      // coordinator parks this edge; the next scroll gesture re-arms it,
      // after the scroll-end around-trim has shrunk the window.
      return older(
        status: PageLoadStatus.skipped,
        hasMoreAtEdge: state.hasMoreMessages,
      );
    }
    final String requestedBeforeId = state.messages.first.id;
    // Load-bearing supersession key, not just result metadata: a same-channel
    // wholesale refresh can preserve the same boundary id, so the boundary
    // check inside applyOlderPage would accept a stale page and write it into
    // the replaced window. The epoch names the window itself.
    bool isStale() =>
        state.channelId != channelId || state.windowEpoch != entryEpoch;
    state = state.copyWith(isLoadingMore: true);
    // Pagination is a page-producing fetch like any other, so it joins the
    // protocol. Registering at ENTRY covers the cache read as well as the
    // network one: a cached window can predate an optimistic delete too, and
    // being invisible here would let _retireLocalMutations drop an acked
    // operation while this fetch is still in flight, which no amount of
    // overlay at the install site could repair.
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
                  messages: _applyPendingLocalMutations(
                    window.messages,
                    fetchOrdinal,
                  ),
                  origin: MessagesOrigin.olderPage,
                ),
                hasMoreMessages: window.hasMoreOlder,
                hasMoreNewerMessages: window.hasMoreNewer,
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
              messages: _applyPendingLocalMutations(
                window.messages,
                fetchOrdinal,
              ),
              origin: MessagesOrigin.olderPage,
            ),
            hasMoreMessages: window.hasMoreOlder,
            hasMoreNewerMessages: window.hasMoreNewer,
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
      edge: PaginationEdge.newer,
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
      // At the in-memory cap: pause instead of installing - installs never
      // trim (a directional trim mid-fling teleports the viewport). The
      // coordinator parks this edge; the scroll-end around-trim shrinks the
      // window and re-arms it via MessageListDemandSource.onWindowTrimmed.
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
    // Load-bearing supersession key - see loadMore.
    bool isStale() =>
        state.channelId != channelId || state.windowEpoch != entryEpoch;
    state = state.copyWith(isLoadingNewer: true);
    // Same protocol membership as loadMore, for the same two reasons.
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
          // A partial cache page means the contiguity filter clipped verified-
          // local rows; fall through to network instead of sealing the tail.
          //
          // The entry guard above means this window had unloaded newer history,
          // and a page that stops where verified contiguity stops has proven
          // nothing about the tail, so the consult is a detached one - which
          // also means it can never come back provisional, since the ambiguous
          // rung sits behind `detachedWindow` being false.
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
                  messages: _applyPendingLocalMutations(
                    window.messages,
                    fetchOrdinal,
                  ),
                  origin: MessagesOrigin.newerPage,
                ),
                hasMoreMessages: window.hasMoreOlder,
                hasMoreNewerMessages: window.hasMoreNewer,
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
      // COUNTS ARE HINTS, ONLY PROOFS SEAL - the same epistemics the around
      // install runs on, for the same reason. A full page was truncated at the
      // limit, so the window still ends short of the tail: detached by
      // construction. A SHORT page used to seal the tail here by itself, and it
      // cannot: the server truncates the raw scan and filters invisible and
      // orphaned rows afterwards (shard_impl.rs:610-628), so a page one row
      // under the limit is either the side exhausted or a filtered row standing
      // in front of real messages. Sealing on that count strands everything past
      // it until a reselect, and welds the next MESSAGE_CREATE across the gap -
      // the same failure as the around path, in the pagination class. So the
      // ladder decides: a POSITIVE pointer proof (equality, or the pointer's own
      // row present) still seals immediately, and only the genuinely ambiguous
      // signature defers to a confirmation.
      final ({bool hasMoreNewer, bool needsTailProbe}) newerConsult =
          await _hasNewerMessagesThanChannel(
            page.messages.isEmpty ? requestedAfterId : page.messages.last.id,
            detachedWindow: page.messages.length >= _kPageSize,
          );
      final bool pageIndicatesMoreNewer = newerConsult.hasMoreNewer;
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
              messages: _applyPendingLocalMutations(
                window.messages,
                fetchOrdinal,
              ),
              origin: MessagesOrigin.newerPage,
            ),
            hasMoreMessages: window.hasMoreOlder,
            hasMoreNewerMessages: window.hasMoreNewer,
          );
          _releaseLoadingNewer(fetchOrdinal);
          // Fired AFTER the install, so the confirmation captures THIS page's
          // tail as its anchor rather than the one we paged away from.
          if (newerConsult.needsTailProbe) {
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
      write: (messages: trim.messages, origin: MessagesOrigin.trim),
      hasMoreMessages: trim.droppedOlder || state.hasMoreMessages,
    );
  }

  /// Scroll-end trim for a detached window: keeps the rows around what the
  /// user is looking at and re-opens pagination for whichever sides were
  /// dropped. The widget re-anchors before calling this when the current
  /// anchor falls outside the kept span, so the write is structurally
  /// scroll-stable (both removals happen at the far sliver ends).
  void trimAroundVisible(String visibleMessageId) {
    if (state.messages.length <= kMaxLoadedMessages) {
      return;
    }
    final MessageWindowTrim trim = trimMessageWindowAround(
      state.messages,
      aroundId: visibleMessageId,
    );
    if (identical(trim.messages, state.messages)) {
      return;
    }
    state = state.copyWith(
      write: (messages: trim.messages, origin: MessagesOrigin.trim),
      hasMoreMessages: state.hasMoreMessages || trim.droppedOlder,
      hasMoreNewerMessages: state.hasMoreNewerMessages || trim.droppedNewer,
    );
  }

  /// Widget-reported scroll activity (drag or ballistic). While true,
  /// gateway-recovery window reconciles are deferred: a wholesale swap under
  /// an active fling resets the pagination pumps and thrashes the window
  /// (profile log, 20:56:51-57).
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
    // The jump is the only escape hatch out of a detached window, so it
    // preempts in-flight page loads instead of refusing while they run.
    // Bumping the generation makes their results non-applicable on return.
    if (_jumpToLatestActive || state.isLoading) {
      return false;
    }
    final int windowGeneration = ++_windowGeneration;
    final int switchGeneration = _channelSwitchGeneration;
    // Superseded by a newer window replacement, or by any channel switch,
    // including one that loads nothing and therefore never arms.
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
      // The wholesale write commits as ONE queue item, and composes its list
      // INSIDE the closure: the local-only rows it preserves have to be the
      // ones present at WRITE time, or a send that landed while this commit
      // waited in the lane is erased by a snapshot taken before it.
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
              messages: _applyPendingLocalMutations(
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
      // Two windows, two guards: [applied] for the lane wait, the predicate for
      // the microtask between the commit completing and this resuming. Either
      // way the tail window is not what the user is looking at, so nothing is
      // published, nothing is scrolled, and this must NOT report success.
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
      // Unconditional, unlike the flag below, and safe because this jump owns
      // it exclusively: the entry guard turns any second jump away while it is
      // true, and this line runs before the first await in the finally, so no
      // other jump can have set it true in between. It is also REQUIRED: this
      // is a mutex no successor can own, so gating it the way the flag below is
      // gated wedges jump-to-latest shut forever after one superseded jump.
      // m14b pins that; the flag below is pinned by m14.
      _jumpToLatestActive = false;
      _endPageFetch(fetchOrdinal);
      await _disarmWindowSwap(swapToken);
      // Only the winning jump clears the busy flag. A same-channel operation
      // that superseded this one owns its own isSyncingMessages, and clearing
      // that while it is still in flight makes the channel read as not-busy to
      // every dedup guard and busy gate for the rest of its run.
      if (stillCurrent() &&
          state.channelId == channelId &&
          state.isSyncingMessages) {
        state = state.copyWith(isSyncingMessages: false);
      }
    }
  }

  /// The channel's last-message pointer, guild row first, DM row as fallback:
  /// DMs are not in the guild channel table, so without the fallback their
  /// pointer always reads as unknown and every DM window looks detached.
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

  /// Verdict of the channel-pointer consult.
  ///
  /// `needsTailProbe` marks a NON-PROOF state: the ladder was asked to seal the
  /// tail and has nothing to seal it with. Three signatures qualify, and each one
  /// reaches it only when the caller's own row count was the alternative - a page
  /// short of the limit it asked for, which proves nothing either, because the
  /// server truncates the raw scan to the limit and filters invisible and orphaned
  /// rows AFTER (shard_impl.rs:610-628, no backfill):
  ///
  ///   * the pointer is MISSING, which says nothing about any row (m16p);
  ///   * the pointer is BEHIND our newest row, which says only that the local
  ///     record is stale (m16q);
  ///   * the pointer is AHEAD, its own row is nowhere to be found, and the ack has
  ///     passed us - the genuinely ambiguous one, where an orphaned pointer (we
  ///     really are at the tail) and valid rows a filtered short read hid (we are
  ///     not) look exactly alike locally (m16j, m16i).
  ///
  /// `hasMoreNewer` is then computed PESSIMISTICALLY - one flag, still, just the
  /// safe value - and the install site owes the window one confirmation fetch. The
  /// POSITIVE proofs (pointer equal to our tail, or its row present) seal
  /// immediately and owe nothing, and a caller holding a proof of its own does not
  /// consult at all (a direct latest load: m16r).
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
      // A NON-PROOF STATE, and that is the whole content of this rung: a
      // MISSING pointer proves nothing at all - not that the channel ends at
      // our newest row, not that it does not. So it cannot seal, and what it
      // defers to depends on whether anything else in this consult can.
      // `detachedWindow` true is already the pessimistic answer and needs no
      // help. `detachedWindow` false is not a proof, it is a COUNT: the caller
      // saw a page come back under the limit it asked for, and a page under the
      // limit is either the side exhausted or a filtered row standing in front
      // of real messages (the raw scan is truncated first and visibility and
      // orphan filtering run after, shard_impl.rs:610-628). Returning it
      // verbatim let that count seal the tail with zero proof behind it, which
      // strands everything past the filtered row until a reselect and welds the
      // next MESSAGE_CREATE across the gap. Answer provisionally instead and
      // owe the window the SAME one-shot confirmation the ambiguous rung owes:
      // a latest page compared by id, which either proves our tail or leaves
      // the flag open for ordinary pagination. m16p pins this rung.
      if (detachedWindow) {
        return const (hasMoreNewer: true, needsTailProbe: false);
      }
      return const (hasMoreNewer: true, needsTailProbe: true);
    }
    // [messageId] is the newest message of a page just fetched from the network;
    // [lastMessageId] is a cached local pointer. The two cases differ and must
    // not be lumped together.
    final int pointerVsFetchedTail = compareSnowflakeIds(
      lastMessageId,
      messageId,
    );
    if (pointerVsFetchedTail < 0) {
      // The fetched page contains messages NEWER than the pointer claims exist,
      // so the pointer is behind reality. The other non-proof state, and the
      // more common one: a pointer BEHIND our newest row proves only that the
      // local record is stale - never that nothing newer exists. Any fetch
      // racing a MessageWriteBatcher flush lands here. So, exactly as for a
      // missing pointer: an already-detached window keeps its pessimistic
      // answer, and a count hint claiming the tail (a page short of the limit
      // the caller asked for, which post-truncation filtering produces just as
      // readily as an exhausted side) is not allowed to seal on its own. It
      // returns provisional-true and the install site settles it with the one
      // latest-page confirmation. m16q pins this rung.
      if (detachedWindow) {
        return const (hasMoreNewer: true, needsTailProbe: false);
      }
      return const (hasMoreNewer: true, needsTailProbe: true);
    }
    if (pointerVsFetchedTail == 0) {
      // The pointer exactly matches our fetched tail: the page ended on the
      // newest message the server has told us about. Trustworthy, and not by
      // convention alone. The row pointer advances on every MESSAGE_CREATE in
      // every channel, visited or not, subscribed or not
      // (MessageWriteBatcher.enqueueMessage records last_message_id per
      // channel unconditionally), and a connect re-seeds it from the READY
      // snapshot authoritatively, so a pointer stale BEHIND reality needs an
      // event this client never received and a reconnect repairs it. Failing
      // open here would cost more than it buys: an unread open builds its
      // window AROUND the ack and that window normally contains the tail, so
      // every such open would show a phantom jump button with auto-ack
      // suppressed until the user scrolled. m16c pins this branch.
      return const (hasMoreNewer: false, needsTailProbe: false);
    }
    // Past here the pointer is strictly AHEAD of our newest row, and every
    // test below asks one question: is that pointer REAL, or an orphan left by
    // a deleted tail? Fair for a tail-built window, and the wrong question for
    // a window built AROUND a target, which ends mid-history by construction:
    // whatever lies between it and a pointer ahead of it is unloaded newer
    // history, and no verdict about the pointer's own existence can turn that
    // into a live tail. A channel this session never opened is where it bites,
    // because both orphan tests below misfire on it. READY seeds the row
    // pointer and the read state for every channel but caches no messages, so
    // the cache lookup misses and the ack, sitting at or past a searched
    // message, seals the around-window as the tail: jump-to-latest
    // short-circuits, loadNewer refuses, and MESSAGE_CREATE appends across the
    // gap. Warm channels escape only because opening them cached the pointer's
    // row. m16 pins this branch, on the shape a device log confirmed: a search
    // hit two days behind a pointer READY had just seeded.
    if (detachedWindow) {
      return const (hasMoreNewer: true, needsTailProbe: false);
    }
    // Unreachable (ledger M-C): an in-window pointer is never strictly ahead.
    if (knownLoadedMessageIds?.contains(lastMessageId) ?? false) {
      return const (hasMoreNewer: true, needsTailProbe: false);
    }
    final database = ref.read(fluxerDatabaseProvider);
    final pointerExists =
        await database.messageDao.getMessage(lastMessageId) != null;
    if (pointerExists) {
      return const (hasMoreNewer: true, needsTailProbe: false);
    }
    final readState = await database.readStateDao.getReadState(state.channelId);
    final String? ackMessageId = readState?.lastMessageId;
    if (ackMessageId != null &&
        ackMessageId.isNotEmpty &&
        compareSnowflakeIds(ackMessageId, messageId) >= 0) {
      // THE genuinely ambiguous signature, as opposed to the two rungs above
      // that are merely uninformed. The pointer is ahead, its row is nowhere
      // (not loaded, not cached), and the ack has passed our newest row. Two
      // worlds fit that description exactly: an orphaned pointer left by a
      // deleted tail, where this window IS the tail; and a short read whose
      // missing rows were filtered out of a raw scan that had already been
      // truncated (shard_impl.rs:610-628), where real messages sit just past
      // us. This used to answer "tail", which glues the next MESSAGE_CREATE
      // onto the far side of that gap and silently loses everything in
      // between. Answer with the pessimistic flag instead and let the install
      // site settle it with _runTailConfirmation's ONE LATEST page, compared
      // by ID: equality with our newest server-backed row is positive proof of
      // the live tail and seals the flag false; a mismatch installs NOTHING
      // (that page is anchored to the channel's tail, not to our window) and
      // leaves the flag true for ordinary pagination to fill the gap in order;
      // an EMPTY page proves nothing and fails open, flag still true.
      // m16j pins the orphan resolution, m16i the filtered one.
      return const (hasMoreNewer: true, needsTailProbe: true);
    }
    return const (hasMoreNewer: true, needsTailProbe: false);
  }

  /// Settles a provisionally detached window with ONE after-fetch from its own
  /// tail, fired by the install that created the ambiguity rather than deferred
  /// to a user gesture: the window is wrong RIGHT NOW or it is not, and a create
  /// can arrive before any gesture ever happens.
  ///
  /// ARMED, and that is the whole correctness argument. A bare fetch cannot
  /// confirm anything, because its response describes the channel as it was when
  /// the SERVER evaluated it: a create landing between that snapshot and this
  /// client applying the response would be dropped against the still-true flag
  /// (`_nextMessagesForSync`'s hasMoreNewerMessages guard), and then the
  /// answer would flip the flag false and put every fetch that could have
  /// retrieved it out of reach - the message gone until the channel is
  /// reselected, which is the exact bug this line of work is about. Arming
  /// closes the window by construction:
  /// the realtime worker holds events for an armed channel at INGESTION
  /// (`_runRealtimeQueue`'s `_swapOwnsChannel` gate), upstream of the drop, and
  /// `_runSwapCommit` replays them onto the window the commit installs. A create
  /// during the confirmation is therefore captured, not dropped, and lands
  /// against the POST-confirmation flag.
  ///
  /// The arm happens SYNCHRONOUSLY, before the first await, or the same race
  /// just moves into the gap between the install and the fetch.
  ///
  /// The confirmation is a LATEST page compared by ID, never a row count. An
  /// `after` page cannot settle this: it is truncated to the limit and filtered
  /// afterwards, so a short one is the very ambiguity that got us here and
  /// reading it as proof would re-glue the gap one request later. A latest page
  /// has a property no other page shape has: `get_latest` scans DESCENDING from
  /// the newest bucket with no cursor (`shard_impl.rs:372-378`), and the
  /// visibility retain and orphan partition run after that scan
  /// (`shard_impl.rs:623-628`) and can only REMOVE rows. Filtering therefore
  /// cannot surface an older row as the page's newest: any visible row newer
  /// than that row would have been scanned before it. So for a NON-EMPTY latest
  /// page, its newest id IS the channel's newest visible id, and comparing it
  /// with ours is a positive proof rather than an inference:
  ///
  /// - equal to our newest server-backed row: we hold the live tail, flag false;
  /// - different: genuinely newer visible rows exist, flag stays TRUE and this
  ///   page installs NOTHING - it is anchored to the channel tail, not to our
  ///   window, and the true flag is what lets ordinary pagination fill the gap
  ///   in order;
  /// - EMPTY (every row in the raw top-N filtered away): nothing is provable, so
  ///   fail open and leave the flag TRUE. A phantom jump button in a pathological
  ///   state, and no message loss.
  ///
  /// Being armed makes the flag flip a SWAP-class write, so it validates at
  /// execution time in the commit lane rather than on channel and anchor alone: a
  /// newer same-channel swap (a preserveLoadedWindow reconcile, say) can replace
  /// this confirmation's token while leaving the window's tail exactly where we
  /// measured it, and an anchor check would wave that through.
  ///
  /// One shot: the equality proof leaves hasMoreNewerMessages false, which is the
  /// condition [loadNewer] refuses on, and every other outcome leaves it true,
  /// which is the state ordinary pagination already handles. Nothing re-arms and
  /// no retry loop is needed. A create replayed after an equality proof becomes
  /// the live tail with the flag false, which stays correct: it is loaded, and
  /// nothing newer is unloaded. A create replayed after either open verdict is
  /// dropped exactly as any event against a detached window, and pagination
  /// brings it back in order.
  ///
  /// Dropping rather than buffering stays deliberate: buffering client-side
  /// against a gap of unknown size reintroduces the ordering problem the drop
  /// semantics exist to avoid, and server truth plus this confirmation covers the
  /// ambiguous case without it.
  void _confirmProvisionalTail(String channelId) {
    final String? windowTailId = newestServerBackedMessageId(state.messages);
    if (windowTailId == null) {
      return;
    }
    final ({String channelId, String tailId, int windowGeneration})? probed =
        _tailProbeLedger;
    if (probed != null &&
        probed.channelId == channelId &&
        probed.tailId == windowTailId &&
        probed.windowGeneration == _windowGeneration) {
      // This tail already has a standing verdict (or one in flight). A
      // mismatch cannot age into equality while the tail sits still, so
      // re-asking buys nothing and costs a full latest-page round trip —
      // repeated empty pages on one cursor must not each pay one.
      talker.debug('[ChatPagination] tail probe deduped tail=$windowTailId');
      return;
    }
    _tailProbeLedger = (
      channelId: channelId,
      tailId: windowTailId,
      windowGeneration: _windowGeneration,
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
    // ALL of this confirmation's validation, in the predicate the lane evaluates
    // at EXECUTION time - because that is the lane's contract: the write closure
    // is pure payload, and a closure that enters and then decides not to write is
    // a contract violation, not defensive style. _runSwapCommit derives `applied`
    // from the gate alone, so an early return inside the payload would still bump
    // _windowWrites, clear the arm and report success: the confirmation would log
    // a proof it never made, and the spurious _windowWrites bump would make the
    // unread-boundary loader (which captures that counter and refuses to write if
    // it moved) discard a page it was entitled to install.
    //
    // Three classes, three clauses:
    //   * generations - intents that supersede without arming;
    //   * channel - a switch that loads nothing and never arms;
    //   * ANCHOR IDENTITY - pagination, the one writer class that moves the
    //     window's tail while arming nothing and bumping no generation, and which
    //     is reachable precisely here because the provisional flag is TRUE and
    //     that is what lets loadNewer run. A proof about tail A must not certify
    //     tail B. Skip conservatively rather than re-certify against B: the
    //     pagination that moved the tail ran its own consult on fresher data, so
    //     this proof is redundant, not merely late. m16l pins the race.
    bool stillValid() =>
        windowGeneration == _windowGeneration &&
        switchGeneration == _channelSwitchGeneration &&
        state.channelId == channelId &&
        newestServerBackedMessageId(state.messages) == windowTailId;
    try {
      final MessageListLoadResult page = await ref
          .read(messageRepositoryProvider)
          .loadMessagePage(
            channelId: channelId,
            // The latest page, sized to the standard pagination quota.
            limit: _kPageSize,
          );
      if (!stillValid()) {
        return;
      }
      final String? channelNewestId = newestServerBackedMessageId(
        page.messages,
      );
      if (channelNewestId == null || channelNewestId != windowTailId) {
        // Unprovable (everything in the raw top-N was filtered) or disproved
        // (newer visible rows exist). Either way the pessimistic flag already
        // standing is the right answer and there is nothing to install: this
        // page is anchored to the channel's tail, not to our window.
        talker.debug(
          '[ChatPagination] tail unconfirmed window=$windowTailId '
          'channel=${channelNewestId ?? '<none>'}',
        );
        return;
      }
      // A latest page whose newest row IS ours: positive proof of the live tail.
      final bool applied = await _commitWindowSwap(
        swapToken,
        channelId,
        fetchOrdinal,
        stillValid,
        () => state = state.copyWith(hasMoreNewerMessages: false),
      );
      // Consumed like every other commit caller: the lane may have refused, and
      // the resume after it can still land on a newer owner's window.
      if (!applied || !stillValid()) {
        talker.debug('[ChatPagination] tail confirmation superseded');
        return;
      }
      talker.debug('[ChatPagination] tail confirmed at $windowTailId');
    } on Exception catch (e) {
      talker.warning('[ChatPagination] tail confirmation failed', e);
      // No verdict was obtained, so the dedupe entry must not stand for one:
      // the next install owing this tail may re-ask.
      final ({String channelId, String tailId, int windowGeneration})? probed =
          _tailProbeLedger;
      if (probed != null &&
          probed.channelId == channelId &&
          probed.tailId == windowTailId) {
        _tailProbeLedger = null;
      }
    } finally {
      _endPageFetch(fetchOrdinal);
      // Replays whatever the arm held, even when nothing was committed.
      await _disarmWindowSwap(swapToken);
    }
  }

  /// One pointer value per channel proven orphaned by a terminal latest-page
  /// fetch; only this exact value may be acked above the visible tail. A
  /// pointer that advances past it is a fresh, unproven claim.
  ({String channelId, String pointerId})? _provenOrphanPointer;

  /// Live-tail ack target: max(visibleTail, channel.lastMessageId) for web
  /// parity. A pointer ahead of the visible tail is either an orphan left by
  /// a deleted tail (ack it, like web ackWithStickyUnread) or a real create
  /// whose pointer write raced ahead of its message event (never ack unseen
  /// rows). Locally identical, so a fresh latest-page fetch decides: the
  /// pointer was read before the fetch left, so a page whose newest row is
  /// still [visibleTailId] proves the pointer row is not visibly there.
  /// Every other answer falls back to the validated visible tail.
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
    final ({String channelId, String pointerId})? proven = _provenOrphanPointer;
    if (proven != null &&
        proven.channelId == channelId &&
        proven.pointerId == pointer) {
      // A standing verdict for this exact value: an orphaned pointer cannot
      // age back into a live row, so re-probing buys nothing.
      return pointer;
    }
    try {
      // `fresh` is load-bearing: an in-flight latest page with the same key
      // could carry a server snapshot that predates the pointer read, and
      // equality against it would launder a real raced pointer into an
      // "orphan" verdict.
      final MessageListLoadResult page = await ref
          .read(messageRepositoryProvider)
          .loadMessagePage(
            channelId: channelId,
            limit: _kPageSize,
            fresh: true,
          );
      final String? channelNewestId = newestServerBackedMessageId(
        page.messages,
      );
      if (channelNewestId == visibleTailId) {
        _provenOrphanPointer = (channelId: channelId, pointerId: pointer);
        return pointer;
      }
      talker.debug(
        '[ChatViewModel] pointer $pointer unproven above tail '
        '$visibleTailId (server newest=${channelNewestId ?? '<none>'})',
      );
    } on Exception catch (e) {
      talker.warning('[ChatViewModel] orphan pointer probe failed', e);
    }
    return visibleTailId;
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
          await ref.read(readStateRepositoryProvider).ackLatest(channelId);
        }
      }
      return;
    }
    final now = DateTime.now();
    final ChatReadViewportState viewport = ref.read(chatReadViewportProvider);
    final bool isReadViewportEligible = viewport.canAutoAck;
    // Same strict predicate as the eligibility listener, so direct
    // realtime/retry callers cannot bypass the tail token. The gate ANDs
    // both flags; the canAutoAck overlap is harmless.
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
      // Bound at entry: the pointer can advance mid-await (a create's
      // pointer update may precede its message event), and a target derived
      // after the awaits would ack rows this attempt never validated.
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
      if (!force &&
          (state.channelId != channelId ||
              state.hasMoreNewerMessages ||
              newestServerBackedMessageId(state.messages) != visibleTailId)) {
        // The window moved while this attempt awaited: acking the
        // entry-bound target would cover rows this attempt never validated.
        // Bail; the finally-block re-run (or the next publication)
        // re-evaluates against the new tail.
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

    // The rows below are qualified against the window AS IT IS NOW (the
    // boundary checks above). Every post-await guard here used to be a channel
    // check, which is blind to a jump or refresh replacing the window in the
    // same channel while the fetch runs: the rows would be merged into a window
    // they were never checked against, and extendNewer would then assert a
    // contiguity nobody validated.
    // ALL THREE generations, which is the convention the refresh path already
    // uses. Neither counter above moves when switchChannel's targeted branch
    // blanks the window synchronously in the SAME channel: that is a direct
    // write, not a swap commit, and switchChannel bumps only the switch
    // generation. Without this, the rows below would be merged into a blanked
    // window, becoming the ENTIRE window, and extendNewer would stamp
    // contiguity on that phantom.
    final int switchGeneration = _channelSwitchGeneration;
    final int windowGeneration = _windowGeneration;
    final int windowWrites = _windowWrites;
    // A page-producing fetch like any other. getMessages is database-or-network
    // backed, and the repository only deletes the local row at ACK, so a cached
    // answer can carry a tombstoned message exactly as a network one can: no
    // exemption.
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
            _applyPendingLocalMutations(messages, fetchOrdinal),
          ),
          origin: MessagesOrigin.boundaryFill,
        ),
      );
      _contiguity.extendNewer(channelId, messages.last.id);
      // COMMITTED ONLY ON A SUCCESSFUL INSTALL. Adding it before the fetch
      // deduped ATTEMPTS, not loads, so one empty result, one exception or one
      // stale discard suppressed this boundary for the rest of the session.
      // Commit-on-success is simpler than unwinding on every failure path.
      _loadedUnreadBoundaryKeys.add(key);
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to load unread boundary: $e');
    } finally {
      _endPageFetch(fetchOrdinal);
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
      write: (
        messages: [...state.messages, optimisticMessage],
        origin: MessagesOrigin.ownSend,
      ),
      errorMessage: null,
      scrollToBottomSignal: _scrollToBottomSignalAfterSend(),
    );
    clearStickyUnread();
    unawaited(ref.read(readStateRepositoryProvider).clearSticky(channelId));
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
      return;
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
      write: (
        messages: [...state.messages, optimisticMessage],
        origin: MessagesOrigin.ownSend,
      ),
      errorMessage: null,
      scrollToBottomSignal: _scrollToBottomSignalAfterSend(),
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
      state = state.copyWith(
        write: (messages: nextMessages, origin: MessagesOrigin.localMutation),
      );
      unawaited(_recordSlowmodeSendOnSuccess(channelId));
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
      state = state.copyWith(
        write: (messages: nextMessages, origin: MessagesOrigin.localMutation),
      );
      unawaited(_recordSlowmodeSendOnSuccess(channelId));
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

  Future<void> _recordSlowmodeSendOnSuccess(String channelId) async {
    if (await ref.read(isSlowmodeImmuneProvider(channelId).future)) {
      return;
    }
    ref.read(slowmodeTrackerProvider.notifier).recordSend(channelId);
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
    _syncSlowmodeFromSendError(error, state.channelId);
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
      state = state.copyWith(
        write: (messages: nextMessages, origin: MessagesOrigin.localMutation),
      );
      return;
    }
    if (optimisticIndex == -1) {
      state = state.copyWith(errorMessage: failedMessage);
      return;
    }
    state = state.copyWith(
      write: (messages: nextMessages, origin: MessagesOrigin.localMutation),
      errorMessage: failedMessage,
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
    if (!message.hasFailed) {
      return;
    }
    final List<Message> pendingMessages = List<Message>.from(state.messages);
    pendingMessages[messageIndex] = message.copyWith(
      deliveryState: MessageDeliveryState.sending,
      sendError: null,
    );
    state = state.copyWith(
      write: (messages: pendingMessages, origin: MessagesOrigin.localMutation),
      errorMessage: null,
    );
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
      state = state.copyWith(
        write: (messages: nextMessages, origin: MessagesOrigin.localMutation),
      );
      unawaited(_recordSlowmodeSendOnSuccess(message.channelId));
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
      _syncSlowmodeFromSendError(e, message.channelId);
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
    state = state.copyWith(
      write: (messages: next, origin: MessagesOrigin.localMutation),
    );
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
    final List<Message>? optimisticallyRemoved = _removeIds(state.messages, {
      messageId,
    });
    if (optimisticallyRemoved != null) {
      state = state.copyWith(
        write: (
          messages: optimisticallyRemoved,
          origin: MessagesOrigin.localMutation,
        ),
      );
    }
    // A page already in flight was fetched before the server saw this, so it
    // still carries the row. The tombstone survives the request completing,
    // because that page can still be waiting in the commit lane.
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
        // Withdrawn unconditionally, BEFORE the channel gate: the overlay must
        // not keep killing a message whose delete failed, whether or not this
        // window is still the one to restore it into.
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

  /// Admits one attachment mutation and returns when it has settled.
  ///
  /// The FIRST op on a message freezes the row it finds as the confirmed
  /// baseline: nothing of ours is in flight at that moment, so the row is
  /// server truth. Later ops join the queue behind it and change no baseline.
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
      // Nothing to operate on. An op already queued may be the reason it is
      // absent, and that op owns the outcome.
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

  /// Runs one message's attachment ops strictly in start order, one request at
  /// a time, until the queue drains.
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
            // Void response: derive the new baseline by applying the removal
            // to the old one.
            _confirmedAttachmentRows[messageId] = _applyAttachmentOp(
              confirmed,
              op,
            );
          case _LocalMutationKind.setAttachmentAlt:
            // Whole-array PATCH, so the array must be the CONFIRMED one with
            // just this op applied. It carries no content: this operation does
            // not own the text, and the per-message queue cannot serialise
            // against another client editing it mid-flight.
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
        return row;
    }
  }

  /// The optimistic row IS confirmed + replay(queue). Every enqueue, ack and
  /// failure ends here, which is why no failure path needs an inverse.
  ///
  /// Only the attachments are composed onto the live row: a gateway update
  /// landing mid-queue owns every other field, and substituting a whole
  /// derived row would revert it.
  void _rederiveAttachmentRow(String messageId) {
    final Message? confirmed = _confirmedAttachmentRows[messageId];
    if (confirmed == null) {
      return;
    }
    final int index = state.messages.indexWhere(
      (Message m) => m.id == messageId,
    );
    if (index == -1) {
      // The row is gone. Its absence is newer truth, exactly as for the
      // overlay.
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
    // PREEMPT, never drop. Returning here while a load was in flight left the
    // older request current, so it completed, scrolled to ITS target and
    // overwrote this window: the user saw a highlight flash on the message they
    // asked for and then landed on the previous one. Preempt rather than queue
    // because the in-flight page is for a target the user no longer wants, and
    // every shared write below happens after the generation check, so a
    // preempted load touches neither the window nor _contiguity.
    final int jumpGeneration = ++_channelSwitchGeneration;
    // Also invalidate window-scoped work: _refreshMessagesFromNetwork and
    // jump-to-latest gate on _windowGeneration, not on the switch generation,
    // so without this an in-flight refresh that started before this jump would
    // complete after it and overwrite the window we are about to install.
    _windowGeneration++;
    bool isCurrentJump() =>
        jumpGeneration == _channelSwitchGeneration &&
        state.channelId == channelId;
    // Same arm/commit protocol the refresh path uses: a realtime event
    // arriving during the await would otherwise be applied to the OLD window
    // and then thrown away by the wholesale replace below.
    final int swapToken = _armWindowSwap(channelId);
    final int fetchOrdinal = _beginPageFetch();
    state = state.copyWith(isSyncingMessages: true);
    try {
      // ONE limit, bound once, for the fetch AND for the tail verdict below,
      // which measures this page's newer side against the server's quota for
      // exactly this limit. Reading the fetch limit off the repository default
      // instead would leave the yardstick and the page free to drift apart.
      const int aroundLimit = _kPageSize;
      final page = await ref
          .read(messageRepositoryProvider)
          .loadMessagePage(
            channelId: channelId,
            around: messageId,
            // Pinned, see above.
            limit: aroundLimit,
          );
      if (!isCurrentJump()) {
        return;
      }
      if (page.messages.isEmpty) {
        return;
      }
      // Around jumps consult the pointer, and the page's own shape says whether
      // the pointer is even allowed to seal the tail: a newer side filled to the
      // server's quota means the page was centred and truncated, not stopped at
      // the tail.
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
      // The wholesale write commits as ONE queue item, so no reducer can be
      // half applied around it, and everything the queue held replays in
      // ordinal order once it lands.
      //
      // An around jump installs the server's window for that range wholesale,
      // by design: local-only rows live at the live tail, and a DETACHED window
      // legitimately excludes them. What it must not do is resurrect a message
      // the user just deleted, because the page was fetched before the server
      // saw the delete. The overlay re-applies exactly the local mutations the
      // page cannot know about, and nothing else.
      final bool applied = await _commitWindowSwap(
        swapToken,
        channelId,
        fetchOrdinal,
        isCurrentJump,
        () {
          state = state.copyWith(
            write: (
              messages: _applyPendingLocalMutations(
                page.messages,
                fetchOrdinal,
              ),
              origin: MessagesOrigin.windowSwap,
            ),
            // Missing around target: keep the older edge open. Newer comes
            // from the pointer consult (detached when the anchor is absent).
            hasMoreMessages:
                aroundTargetMissing || page.messages.length >= _kPageSize,
            hasMoreNewerMessages: hasMoreNewer,
            windowEpoch: state.windowEpoch + 1,
            // The preempted switch set isLoading and can no longer reach any of
            // its own clearing paths, so the winner owns BOTH flags or the
            // channel is wedged busy forever: no jump button, dedupe stuck, and
            // even the stranded-empty recovery locked out.
            isLoading: false,
          );
          _contiguity.setVerified(channelId, page.messages);
          _contiguityTrusted = true;
        },
      );
      // Two windows, two guards: [applied] for the lane wait, isCurrentJump for
      // the microtask between the commit completing and this resuming.
      // Publishing this page's references and scrolling to THIS target would
      // drag the user away from the message they actually asked for.
      if (!applied || !isCurrentJump()) {
        return;
      }
      _notifyMessageReferencesLoaded(
        channelId: channelId,
        messages: state.messages,
        embeddedReplyParents: page.embeddedReplyParents,
      );
      if (newerConsult.needsTailProbe && !aroundTargetMissing) {
        _confirmProvisionalTail(channelId);
      }
      scrollToMessage(messageId);
    } on Exception catch (e) {
      debugPrint('[ChatViewModel] Failed to jump to replied message: $e');
    } finally {
      // A failed or superseded jump must still not swallow realtime events.
      _endPageFetch(fetchOrdinal);
      await _disarmWindowSwap(swapToken);
      // Only the winning jump clears the flags, and it clears BOTH: it may have
      // superseded a switch that owned isLoading.
      if (isCurrentJump() && (state.isSyncingMessages || state.isLoading)) {
        state = state.copyWith(isSyncingMessages: false, isLoading: false);
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
    // Deliberately unguarded against an in-flight refresh: this is the escape
    // hatch out of a failed load, and refusing while a stale request runs is
    // the wedge it exists to break. Overlap is safe by ownership — the newest
    // arm owns the window and the loser writes nothing.
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
    // Same as retryLoadMessages: reachable from the DM list while a retry is
    // still out, and resolved by arm ownership rather than by refusing.
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
        write: (
          messages: nextMessages ?? state.messages,
          origin: MessagesOrigin.localMutation,
        ),
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
      talker.error('[ChatViewModel] Reaction failed', e);
      final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
      final String fallback = hasReacted
          ? l10n.chatReactionRemoveFailed
          : l10n.chatReactionAddFailed;
      _restoreMessageReactions(
        messageId,
        previousReactions,
        errorMessage: e is DioException
            ? dioExceptionMessage(e, fallback)
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
            messageId,
            jsonEncode(reactions.map((Reaction r) => r.toJson()).toList()),
          ),
    );
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
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (optimisticIndex != -1) {
      updated[optimisticIndex] = mergeMentionHighlightFlag(
        incoming: delivered,
        previous: updated[optimisticIndex],
        currentUserId: currentUserId,
      );
      return updated;
    }
    if (deliveredIndex != -1) {
      updated[deliveredIndex] = mergeMentionHighlightFlag(
        incoming: delivered,
        previous: updated[deliveredIndex],
        currentUserId: currentUserId,
      );
      return updated;
    }
    updated.add(
      mergeMentionHighlightFlag(
        incoming: delivered,
        currentUserId: currentUserId,
      ),
    );
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
