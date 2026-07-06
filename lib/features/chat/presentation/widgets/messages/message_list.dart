import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/data/chat_unread_summary.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_list_anchor.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/channel_pins_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/delete_message_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/message_reactions_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/remove_all_reactions_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/system_message_actions_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/chat_loading_spinner.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/channel_welcome_section.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_body.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_pagination.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_unread_review.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_tile_cache.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/system_message.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/spoiler_reveal_provider.dart';
import 'package:fluxer_app/features/chat/utils/chat_spinner_debug.dart';
import 'package:fluxer_app/features/chat/utils/message_action_permissions.dart';
import 'package:fluxer_app/features/chat/utils/message_grouping_utils.dart';
import 'package:fluxer_app/features/chat/utils/pinned_system_message_navigation.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_welcome_section.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/personal_notes_welcome_section.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/moderation/iar/iar_flow.dart';
import 'package:fluxer_app/features/moderation/iar/iar_simple_report_sheet.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

const _kUnreadDividerHeight = 16.0;
const _kUnreadDateDividerHeight = 20.0;
const _kMessageListScrollCacheExtent = 1200.0;
const _kMessageListCompactScrollCacheExtent = 400.0;

// Riverpod does not export the concrete auto-dispose family type.
// ignore: specify_nonobvious_property_types
final _messageListReadStateProvider = StreamProvider.autoDispose
    .family<drift_db.ReadState?, String>((ref, channelId) {
      final db = ref.watch(fluxerDatabaseProvider);
      return db.readStateDao.watchReadState(channelId);
    });

// Riverpod does not export the concrete auto-dispose family type.
// ignore: specify_nonobvious_property_types
final _channelLastMessageIdProvider = StreamProvider.autoDispose
    .family<String?, String>((ref, channelId) {
      final db = ref.watch(fluxerDatabaseProvider);
      return db.channelDao
          .watchChannelById(channelId)
          .map((drift_db.Channel? row) => row?.lastMessageId);
    });

const _kMonthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

/// Viewport fraction where the NEW divider sits on unread opens.
const double _kUnreadOpenAnchor = 0.5;

/// How a channel open positions its first rendered message frame.
enum _MessageListOpenMode { unresolved, unread, bottom }

/// The scrollable list of messages in the chat area: a single `reverse: true`
/// [ListView] anchored by a [ChatScrollObserver] (older messages prepend
/// above the viewport; newer ones hold position unless at the live tail).
class MessageList extends ConsumerStatefulWidget {
  const MessageList({
    this.expectedChannelId,
    this.targetMessageId,
    this.visible = true,
    super.key,
  });

  /// When set, shows a loading shell until [ChatViewState.channelId] matches.
  final String? expectedChannelId;

  final String? targetMessageId;

  /// False while the shell keeps the list mounted but hidden (drawer
  /// revealed). Deactivates the read viewport so hidden arrivals never
  /// auto-ack.
  final bool visible;

  @override
  ConsumerState<MessageList> createState() => _MessageListState();
}

class _MessageListState extends ConsumerState<MessageList> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _unreadCenterKey = GlobalKey();
  late final ListObserverController _observerController;
  late final SliverObserverController _sliverObserverController;
  late final ChatScrollObserver _chatObserver;
  final Map<String, GlobalKey> _itemKeys = <String, GlobalKey>{};
  final MessageTileCache _tileCache = MessageTileCache();
  late final ChatViewModel _chatViewModel;
  String? _pendingScrollTarget;
  int _messageJumpInFlight = 0;
  bool _landAtLatestTailPending = false;
  String? _centerAnchorMessageId;
  BuildContext? _leadingSliverCtx;
  BuildContext? _trailingSliverCtx;
  final MessageEdgeLoadTrigger _edgeLoadTrigger = MessageEdgeLoadTrigger();
  _MessageListOpenMode _openMode = _MessageListOpenMode.unresolved;
  String? _lastChannelId;
  List<Message>? _lastAnchorMessages;
  ChatUnreadSummary? _cachedUnreadSummary;
  Object? _unreadSummaryKey;
  bool _useCompactScrollCache = true;
  int _lastMessageCount = 0;

  @override
  void initState() {
    super.initState();
    _chatViewModel = ref.read(chatViewModelProvider.notifier);
    _observerController = ListObserverController(controller: _scrollController);
    _sliverObserverController = SliverObserverController(
      controller: _scrollController,
    );
    _chatObserver = ChatScrollObserver(_observerController)
      ..fixedPositionOffset = kMessageListReadBottomThreshold;
    _scrollController.addListener(_onScroll);
    _pendingScrollTarget = widget.targetMessageId;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _chatViewModel.setReadViewportActive(isActive: widget.visible);
      _onScroll();
    });
  }

  @override
  void didUpdateWidget(MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.targetMessageId != oldWidget.targetMessageId &&
        widget.targetMessageId != null) {
      _pendingScrollTarget = widget.targetMessageId;
    }
    if (widget.visible != oldWidget.visible) {
      _chatViewModel.setReadViewportActive(isActive: widget.visible);
    }
  }

  @override
  void dispose() {
    _chatViewModel
      ..setReadViewportActive(isActive: false)
      ..clearCurrentManualUnread()
      ..clearStickyUnreadAfterBuildForCurrentChannel();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    switch (_openMode) {
      case _MessageListOpenMode.unresolved:
        return;
      case _MessageListOpenMode.unread:
        _maybeLoadOlderCenter();
        _maybeLoadNewerCenter();
        _syncReadViewportCenter();
      case _MessageListOpenMode.bottom:
        _maybeLoadOlder();
        _maybeLoadNewer();
        _syncReadViewport();
    }
  }

  bool get _isUserDrivenScroll =>
      _scrollController.hasClients &&
      _scrollController.position.userScrollDirection != ScrollDirection.idle;

  void _maybeLoadOlder() {
    if (!_scrollController.hasClients ||
        _openMode != _MessageListOpenMode.bottom) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final ChatViewState state = ref.read(chatViewModelProvider);
    if (_edgeLoadTrigger.shouldRequest(
      edge: MessageLoadEdge.older,
      distanceFromEdge: position.maxScrollExtent - position.pixels,
      viewportHeight: position.viewportDimension,
      hasMore: state.hasMoreMessages,
      isLoading: state.isLoadingMore,
      isUserDrivenScroll: _isUserDrivenScroll,
      hasActiveJumpTarget: _hasActiveJumpTarget(),
    )) {
      unawaited(_chatViewModel.loadMore());
    }
  }

  void _maybeLoadNewer() {
    if (!_scrollController.hasClients ||
        _openMode != _MessageListOpenMode.bottom) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final ChatViewState state = ref.read(chatViewModelProvider);
    if (_edgeLoadTrigger.shouldRequest(
      edge: MessageLoadEdge.newer,
      distanceFromEdge: position.pixels - position.minScrollExtent,
      viewportHeight: position.viewportDimension,
      hasMore: state.hasMoreNewerMessages,
      isLoading: state.isLoadingNewer,
      isUserDrivenScroll: _isUserDrivenScroll,
      hasActiveJumpTarget: _hasActiveJumpTarget(),
    )) {
      unawaited(_chatViewModel.loadNewer());
    }
  }

  double _centerLeadingDistance(ScrollPosition position) =>
      position.pixels - position.minScrollExtent;

  double _centerTrailingDistance(ScrollPosition position) =>
      (position.maxScrollExtent - position.pixels).clamp(0, double.infinity);

  void _maybeLoadOlderCenter() {
    if (!_scrollController.hasClients ||
        _openMode != _MessageListOpenMode.unread) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final ChatViewState state = ref.read(chatViewModelProvider);
    if (_edgeLoadTrigger.shouldRequest(
      edge: MessageLoadEdge.older,
      distanceFromEdge: _centerLeadingDistance(position),
      viewportHeight: position.viewportDimension,
      hasMore: state.hasMoreMessages,
      isLoading: state.isLoadingMore,
      isUserDrivenScroll: _isUserDrivenScroll,
      hasActiveJumpTarget: _hasActiveJumpTarget(),
    )) {
      unawaited(_chatViewModel.loadMore());
    }
  }

  void _maybeLoadNewerCenter() {
    if (!_scrollController.hasClients ||
        _openMode != _MessageListOpenMode.unread) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final ChatViewState state = ref.read(chatViewModelProvider);
    if (_edgeLoadTrigger.shouldRequest(
      edge: MessageLoadEdge.newer,
      distanceFromEdge: _centerTrailingDistance(position),
      viewportHeight: position.viewportDimension,
      hasMore: state.hasMoreNewerMessages,
      isLoading: state.isLoadingNewer,
      isUserDrivenScroll: _isUserDrivenScroll,
      hasActiveJumpTarget: _hasActiveJumpTarget(),
    )) {
      unawaited(_chatViewModel.loadNewer());
    }
  }

  // Keeps the viewport anchored across data-end (newest) changes by snapshotting
  // the reference item before the rebuild lays out. Runs from the messages
  // listener, outside this widget's build phase, so markNeedsLayout is legal and
  // the snapshot reflects the still-current layout.
  void _applyChatAnchor(List<Message> next) {
    final List<Message>? prev = _lastAnchorMessages;
    _lastAnchorMessages = next;
    if (_openMode == _MessageListOpenMode.bottom &&
        prev != null &&
        prev.isNotEmpty &&
        next.isNotEmpty) {
      final LeadingEdgeDelta delta = computeLeadingEdgeDelta(prev, next);
      if (delta.addedNewest > 0) {
        // At the bottom (extentBefore <= fixedPositionOffset) the physics
        // follows; scrolled up it pins the visible message in place.
        unawaited(
          _chatObserver.standby(
            changeCount: delta.addedNewest,
            isNeedObserveSwitchShrinkWrap: false,
          ),
        );
      } else if (delta.removedNewest > 0) {
        // Newest entries were trimmed/deleted while scrolled up: hold the first
        // displaying item fixed across the index shift. isRemove would skip the
        // position fix, and a cache-edge reference falls out of cache after the
        // shift, so anchor on the displaying item via specified mode.
        unawaited(
          _chatObserver.standby(
            mode: ChatScrollObserverHandleMode.specified,
            refIndexType:
                ChatScrollObserverRefIndexType.relativeIndexStartFromDisplaying,
            refItemIndexAfterUpdate: -delta.removedNewest,
            isNeedObserveSwitchShrinkWrap: false,
          ),
        );
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _onScroll();
      }
    });
  }

  void _resetOpenModeIfReloading({
    required String channelId,
    required bool isLoading,
    required bool hasMessages,
  }) {
    final bool isFreshInitialLoad = isLoading && !hasMessages;
    if (channelId == _lastChannelId && !isFreshInitialLoad) {
      return;
    }
    _lastChannelId = channelId;
    _lastAnchorMessages = null;
    _leadingSliverCtx = null;
    _trailingSliverCtx = null;
    _centerAnchorMessageId = null;
    _landAtLatestTailPending = false;
    _openMode = _MessageListOpenMode.unresolved;
    _edgeLoadTrigger.reset();
    _useCompactScrollCache = true;
    _lastMessageCount = 0;
  }

  void _scheduleScrollCacheExpansion(int messageCount) {
    if (!_useCompactScrollCache || messageCount == 0) {
      return;
    }
    if (_lastMessageCount == messageCount && messageCount > 0) {
      return;
    }
    _lastMessageCount = messageCount;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_useCompactScrollCache) {
        return;
      }
      setState(() => _useCompactScrollCache = false);
    });
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification.depth != 0) {
      return false;
    }
    return switch (_openMode) {
      _MessageListOpenMode.unresolved => false,
      _MessageListOpenMode.unread => _onScrollNotificationCenter(notification),
      _MessageListOpenMode.bottom => _onScrollNotificationBottom(notification),
    };
  }

  bool _onScrollNotificationBottom(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      _syncReadViewport();
      if (_isLiveNearBottom()) {
        _chatViewModel.trimToNewestWindow();
      }
    }
    return false;
  }

  bool _onScrollNotificationCenter(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      _syncReadViewportCenter();
      if (_scrollController.hasClients &&
          isNearTrailingEdge(
            distanceFromTrailingEdge: _centerTrailingDistance(
              _scrollController.position,
            ),
          )) {
        _chatViewModel.trimToNewestWindow();
      }
    }
    return false;
  }

  bool _isLiveNearBottom() {
    if (!_scrollController.hasClients) {
      return true;
    }
    final ScrollPosition position = _scrollController.position;
    return isLiveNearBottom(
      pixels: position.pixels,
      minScrollExtent: position.minScrollExtent,
    );
  }

  bool _isNearLiveTail() {
    if (_openMode == _MessageListOpenMode.unread) {
      if (!_scrollController.hasClients) {
        return false;
      }
      return isNearTrailingEdge(
        distanceFromTrailingEdge: _centerTrailingDistance(
          _scrollController.position,
        ),
      );
    }
    return _isLiveNearBottom();
  }

  bool _hasActiveJumpTarget() =>
      _pendingScrollTarget != null || _messageJumpInFlight > 0;

  String? _channelLastMessageIdFor(String channelId) {
    if (channelId.isEmpty) {
      return null;
    }
    return ref.read(_channelLastMessageIdProvider(channelId)).asData?.value;
  }

  ChatUnreadSummary _unreadSummaryFor({
    required List<Message> messages,
    required String? ackLastMessageId,
    required int mentionCount,
    required String? currentUserId,
    required String? channelLastMessageId,
    required bool hasMoreNewerMessages,
    required bool hasMoreOlderMessages,
  }) {
    final Object key = (
      messages,
      ackLastMessageId,
      mentionCount,
      currentUserId,
      channelLastMessageId,
      hasMoreNewerMessages,
      hasMoreOlderMessages,
    );
    final ChatUnreadSummary? cached = _cachedUnreadSummary;
    if (cached != null && _unreadSummaryKey == key) {
      return cached;
    }
    final ChatUnreadSummary summary = computeChatUnreadSummary(
      messages: messages.map(
        (Message message) =>
            ChatUnreadMessageRef(id: message.id, authorId: message.authorId),
      ),
      ackLastMessageId: ackLastMessageId,
      mentionCount: mentionCount,
      currentUserId: currentUserId,
      channelLastMessageId: channelLastMessageId,
      hasMoreNewerMessages: hasMoreNewerMessages,
      hasMoreOlderMessages: hasMoreOlderMessages,
    );
    _unreadSummaryKey = key;
    _cachedUnreadSummary = summary;
    return summary;
  }

  void _syncReadViewport({bool ignoreJumpTarget = false}) {
    if (!_scrollController.hasClients ||
        _openMode != _MessageListOpenMode.bottom ||
        (!ignoreJumpTarget && _hasActiveJumpTarget())) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    _chatViewModel.updateReadViewport(
      isNearBottom: _isLiveNearBottom(),
      distanceFromBottom: distanceFromScrollExtentEnd(
        pixels: position.pixels,
        minScrollExtent: position.minScrollExtent,
      ),
      viewportHeight: position.viewportDimension,
    );
  }

  void _syncReadViewportCenter() {
    if (!_scrollController.hasClients ||
        _openMode != _MessageListOpenMode.unread ||
        _hasActiveJumpTarget()) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final double distanceFromTrailingEdge = _centerTrailingDistance(position);
    _chatViewModel.updateReadViewport(
      isNearBottom: isNearTrailingEdge(
        distanceFromTrailingEdge: distanceFromTrailingEdge,
      ),
      distanceFromBottom: distanceFromTrailingEdge,
      viewportHeight: position.viewportDimension,
    );
  }

  void _onScrollToBottom() {
    if (_hasActiveJumpTarget()) {
      return;
    }
    if (_openMode == _MessageListOpenMode.unread) {
      final ChatViewState chatState = ref.read(chatViewModelProvider);
      if (chatState.hasMoreNewerMessages) {
        _centerAnchorMessageId = null;
        _landAtLatestTailPending = true;
        unawaited(_chatViewModel.jumpToLatestMessages());
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
      });
      return;
    }
    if (_openMode == _MessageListOpenMode.unresolved) {
      return;
    }
    final ChatViewState chatState = ref.read(chatViewModelProvider);
    if (chatState.hasMoreNewerMessages) {
      _landAtLatestTailPending = true;
      unawaited(_chatViewModel.jumpToLatestMessages());
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        // Instant jump: animateTo would build every tile it scrolls past.
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      }
    });
  }

  void _followTailCenter() {
    if (!_scrollController.hasClients) {
      return;
    }
    final ChatViewState state = ref.read(chatViewModelProvider);
    if (state.hasMoreNewerMessages) {
      return;
    }
    final bool isNearTrailing = isNearTrailingEdge(
      distanceFromTrailingEdge: _centerTrailingDistance(
        _scrollController.position,
      ),
    );
    if (!isNearTrailing) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  // A short unread block can't fill the viewport below _kUnreadOpenAnchor:
  // the viewport clamps maxScrollExtent to 0, leaving an unscrollable gap
  // under the newest message. Once the open frame lays out, fall back to a
  // bottom-anchored open. The NEW divider is per-tile, so it stays visible.
  void _scheduleUnreadUnderfillFallback() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted ||
          _openMode != _MessageListOpenMode.unread ||
          _centerAnchorMessageId == null ||
          !_scrollController.hasClients) {
        return;
      }
      if (ref.read(chatViewModelProvider).hasMoreNewerMessages) {
        // Newer pagination will fill the trailing half; keep the anchor.
        return;
      }
      if (_scrollController.position.maxScrollExtent > 0) {
        return;
      }
      setState(() => _centerAnchorMessageId = null);
    });
  }

  // Coordinates the latest-window replacement with its tail landing so the
  // reverse list never paints a clamped intermediate frame.
  void _landAtLatestTail(List<Message> next) {
    _lastAnchorMessages = next;
    _edgeLoadTrigger.reset();
    if (_openMode == _MessageListOpenMode.unread) {
      // Center-split newest edge is only known after layout.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
      });
    } else if (_scrollController.hasClients) {
      // Reverse ListView newest edge is valid before the new window lays out.
      _scrollController.jumpTo(_scrollController.position.minScrollExtent);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _onScroll();
      }
    });
  }

  void _onUnreadBarMarkRead() {
    _onScrollToBottom();
    unawaited(_chatViewModel.markCurrentChannelRead());
  }

  void _onUnreadBarJump() {
    unawaited(_chatViewModel.jumpToFirstUnread());
  }

  void _confirmJumpHighlightScroll(String messageId) {
    final String? highlightedMessageId = ref
        .read(chatViewModelProvider)
        .highlightedMessageId;
    if (highlightedMessageId == messageId) {
      _chatViewModel.extendJumpHighlight(messageId);
    }
  }

  Future<void> _jumpToMessageBottom(String messageId) {
    final Completer<void> completer = Completer<void>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        if (!mounted || !_scrollController.hasClients) {
          return;
        }
        final List<Message> messages = ref.read(chatViewModelProvider).messages;
        final int dataIndex = messages.indexWhere(
          (Message m) => m.id == messageId,
        );
        if (dataIndex == -1) {
          return;
        }
        final int renderIndex = messages.length - 1 - dataIndex;
        _confirmJumpHighlightScroll(messageId);
        // alignment is child-relative: 0.5 puts the message's midpoint at the
        // viewport's leading edge, so shift by half the viewport to center it.
        await _observerController
            .jumpTo(
              index: renderIndex,
              alignment: 0.5,
              offset: (_) => _scrollController.position.viewportDimension * 0.5,
            )
            .timeout(const Duration(seconds: 2), onTimeout: () {});
      } finally {
        if (!completer.isCompleted) {
          completer.complete();
        }
      }
    });
    return completer.future;
  }

  Future<void> _jumpToMessageCenter(String messageId) {
    final Completer<void> completer = Completer<void>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        if (!mounted || !_scrollController.hasClients) {
          return;
        }
        final List<Message> messages = ref.read(chatViewModelProvider).messages;
        final String? anchorId = _centerAnchorMessageId;
        final int rawSplit = anchorId == null
            ? -1
            : messages.indexWhere((Message m) => m.id == anchorId);
        final int splitIndex = rawSplit < 0 ? messages.length : rawSplit;
        final loc = _centerSliverLocationFor(messageId, messages, splitIndex);
        if (loc == null) {
          return;
        }
        _confirmJumpHighlightScroll(messageId);
        await _sliverObserverController
            .jumpTo(
              sliverContext: loc.$1,
              index: loc.$2,
              alignment: 0.5,
              offset: (_) => _scrollController.position.viewportDimension * 0.5,
            )
            .timeout(const Duration(seconds: 2), onTimeout: () {});
      } finally {
        if (!completer.isCompleted) {
          completer.complete();
        }
      }
    });
    return completer.future;
  }

  Future<void> _jumpToMessage(String messageId) {
    _messageJumpInFlight++;
    final Future<void> done = switch (_openMode) {
      _MessageListOpenMode.unread => _jumpToMessageCenter(messageId),
      _ => _jumpToMessageBottom(messageId),
    };
    return done.whenComplete(() {
      if (_messageJumpInFlight > 0) {
        _messageJumpInFlight--;
      }
    });
  }

  void _onScrollToMessage(String messageId) {
    unawaited(_jumpToMessage(messageId));
  }

  Widget _buildMessageTile({
    required BuildContext context,
    required Message message,
    required Message? previousMessage,
    required String? visualUnreadId,
    required String? highlightedMessageId,
    required String? currentUserId,
    required bool isDmChannel,
    required String? guildId,
    required int? channelPermissionBits,
    required bool channelCanSendMessages,
    required bool channelCanAddReactions,
    required bool channelCanPinMessage,
    required bool channelCanManageMessages,
    required MessageRenderSettings renderSettings,
  }) {
    final bool isNewDay =
        previousMessage == null ||
        !_isSameDay(message.timestamp, previousMessage.timestamp);
    final bool isGrouped =
        !message.isSystemMessage &&
        !isNewDay &&
        _shouldGroup(message, previousMessage);
    final bool isJumpHighlighted = message.id == highlightedMessageId;
    final bool isUnreadBoundary = message.id == visualUnreadId;
    final double leading = leadingGroupSpacing(
      isGroupStart: !isGrouped,
      isNewDay: isNewDay,
      isUnreadBoundary: isUnreadBoundary,
      hasPrevious: previousMessage != null,
      bothSystem:
          message.isSystemMessage &&
          (previousMessage?.isSystemMessage ?? false),
      spacing: renderSettings.messageGroupSpacing,
    );
    final Object signature = (
      message,
      isNewDay,
      isGrouped,
      isUnreadBoundary,
      isJumpHighlighted,
      currentUserId,
      isDmChannel,
      guildId,
      channelPermissionBits,
      channelCanSendMessages,
      channelCanAddReactions,
      channelCanPinMessage,
      channelCanManageMessages,
      renderSettings,
      leading,
    );
    return _tileCache.resolve(message.id, signature, () {
      if (message.isSystemMessage) {
        final bool canDelete = canDeleteMessage(
          message: message,
          currentUserId: currentUserId,
          isDmChannel: isDmChannel,
          channelPermissionBits: channelPermissionBits,
        );
        final bool isMobile = isMobileLayout(context);
        final bool isPinSystemMessage =
            message.type == messageTypeChannelPinnedMessage;
        return _withMessageSeparators(
          context,
          message: message,
          isNewDay: isNewDay,
          visualUnreadId: visualUnreadId,
          leadingGroupSpacing: leading,
          child: SystemMessage(
            key: ValueKey(message.id),
            message: message,
            guildId: guildId,
            onJumpToPinnedMessage: isPinSystemMessage
                ? () => unawaited(
                    jumpToPinnedSystemMessage(ref, message: message),
                  )
                : null,
            onViewAllPins: isPinSystemMessage
                ? () => unawaited(
                    showChannelPinsSheet(
                      context,
                      ref,
                      channelId: message.channelId,
                    ),
                  )
                : null,
            onLongPress: isMobile
                ? () => unawaited(
                    showSystemMessageActionsSheet(
                      context,
                      ref,
                      message: message,
                      guildId: guildId,
                      isDmChannel: isDmChannel,
                      canDelete: canDelete,
                      canAddReactions: channelCanAddReactions,
                      canManageMessages: channelCanManageMessages,
                      currentUserId: currentUserId,
                    ),
                  )
                : null,
            onSecondaryTapUp: !isMobile
                ? (_) => unawaited(
                    showSystemMessageActionsSheet(
                      context,
                      ref,
                      message: message,
                      guildId: guildId,
                      isDmChannel: isDmChannel,
                      canDelete: canDelete,
                      canAddReactions: channelCanAddReactions,
                      canManageMessages: channelCanManageMessages,
                      currentUserId: currentUserId,
                    ),
                  )
                : null,
            canAddReactions: channelCanAddReactions,
            onReaction:
                (String emoji, {String? emojiId, bool animated = false}) => ref
                    .read(chatViewModelProvider.notifier)
                    .toggleReaction(
                      message.id,
                      emoji,
                      emojiId: emojiId,
                      animated: animated,
                    ),
          ),
        );
      }
      final GlobalKey itemKey = _itemKeys.putIfAbsent(
        message.id,
        GlobalKey.new,
      );
      final bool canDelete = canDeleteMessage(
        message: message,
        currentUserId: currentUserId,
        isDmChannel: isDmChannel,
        channelPermissionBits: channelPermissionBits,
      );
      return _withMessageSeparators(
        context,
        message: message,
        isNewDay: isNewDay,
        visualUnreadId: visualUnreadId,
        leadingGroupSpacing: leading,
        child: RepaintBoundary(
          child: MessageItem(
            key: itemKey,
            message: message,
            isGrouped: isGrouped,
            renderSettings: renderSettings,
            isJumpHighlighted: isJumpHighlighted,
            currentUserId: currentUserId,
            canDelete: canDelete,
            canAddReactions: channelCanAddReactions,
            canPinMessage: channelCanPinMessage,
            canManageMessages: channelCanManageMessages,
            canSendMessages: channelCanSendMessages,
            isDmChannel: isDmChannel,
            onReply: () =>
                ref.read(chatViewModelProvider.notifier).startReply(message),
            onForward: () =>
                unawaited(showForwardMessageSheet(context, message: message)),
            onEdit: () =>
                ref.read(chatViewModelProvider.notifier).startEdit(message),
            onRemoveAllReactions: () => unawaited(
              showRemoveAllReactionsConfirmSheet(
                context,
                ref,
                messageId: message.id,
              ),
            ),
            onDelete: () => unawaited(
              showDeleteMessageConfirmSheet(
                context,
                ref,
                message: message,
                guildId: guildId,
              ),
            ),
            onRetry: () => ref
                .read(chatViewModelProvider.notifier)
                .retryMessageSend(message.id),
            onDeleteFailed: () => ref
                .read(chatViewModelProvider.notifier)
                .deleteFailedMessage(message.id),
            onDismissClientSystem: () => ref
                .read(chatViewModelProvider.notifier)
                .dismissClientSystemMessage(message.id),
            onMarkAsUnread: () => ref
                .read(chatViewModelProvider.notifier)
                .markMessageUnread(message.id),
            onViewReactions: () =>
                unawaited(showMessageReactionsSheet(context, message: message)),
            onReport: () => unawaited(
              showSimpleIarReportSheet(
                context,
                iarContext: IarMessageContext(
                  message: message,
                  guildId: guildId,
                ),
              ),
            ),
            onReaction:
                (String emoji, {String? emojiId, bool animated = false}) => ref
                    .read(chatViewModelProvider.notifier)
                    .toggleReaction(
                      message.id,
                      emoji,
                      emojiId: emojiId,
                      animated: animated,
                    ),
          ),
        ),
      );
    });
  }

  int? _findMessageListChildIndex(Key key, List<Message> messages) {
    for (final MapEntry<String, GlobalKey> entry in _itemKeys.entries) {
      if (entry.value != key) {
        continue;
      }
      final int dataIndex = messages.indexWhere(
        (Message message) => message.id == entry.key,
      );
      if (dataIndex == -1) {
        return null;
      }
      return messages.length - 1 - dataIndex;
    }
    return null;
  }

  Widget _buildMessageListView({
    required BuildContext context,
    required List<Message> messages,
    required String? visualUnreadId,
    required String? highlightedMessageId,
    required String? currentUserId,
    required bool isDmChannel,
    required String? guildId,
    required int? channelPermissionBits,
    required bool channelCanSendMessages,
    required bool channelCanAddReactions,
    required bool channelCanPinMessage,
    required bool channelCanManageMessages,
    required MessageRenderSettings renderSettings,
    required bool isLoadingMore,
    required bool isLoadingNewer,
    required Widget? startOfChannelHeader,
  }) {
    final ScrollPhysics chatPhysics = ScrollConfiguration.of(context)
        .getScrollPhysics(context)
        .applyTo(ChatObserverClampingScrollPhysics(observer: _chatObserver));
    return Stack(
      fit: StackFit.expand,
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: ListViewObserver(
            controller: _observerController,
            child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              scrollCacheExtent: ScrollCacheExtent.pixels(
                _useCompactScrollCache
                    ? _kMessageListCompactScrollCacheExtent
                    : _kMessageListScrollCacheExtent,
              ),
              padding: const EdgeInsets.only(top: 8, bottom: 33),
              physics: chatPhysics,
              itemCount:
                  messages.length + (startOfChannelHeader != null ? 1 : 0),
              addAutomaticKeepAlives: false,
              findChildIndexCallback: (Key key) =>
                  _findMessageListChildIndex(key, messages),
              itemBuilder: (BuildContext context, int renderIndex) {
                if (startOfChannelHeader != null &&
                    renderIndex == messages.length) {
                  return startOfChannelHeader;
                }
                final int dataIndex = messages.length - 1 - renderIndex;
                final Message message = messages[dataIndex];
                final Message? previousMessage = dataIndex > 0
                    ? messages[dataIndex - 1]
                    : null;
                return _buildMessageTile(
                  context: context,
                  message: message,
                  previousMessage: previousMessage,
                  visualUnreadId: visualUnreadId,
                  highlightedMessageId: highlightedMessageId,
                  currentUserId: currentUserId,
                  isDmChannel: isDmChannel,
                  guildId: guildId,
                  channelPermissionBits: channelPermissionBits,
                  channelCanSendMessages: channelCanSendMessages,
                  channelCanAddReactions: channelCanAddReactions,
                  channelCanPinMessage: channelCanPinMessage,
                  channelCanManageMessages: channelCanManageMessages,
                  renderSettings: renderSettings,
                );
              },
            ),
          ),
        ),
        if (isLoadingMore)
          Positioned(
            top: 8,
            left: 0,
            right: 0,
            child: Center(
              child: ChatLoadingSpinner(
                reason: ChatSpinnerReason.loadingMore,
                color: context.colors.brandPrimary,
              ),
            ),
          ),
        if (isLoadingNewer)
          Positioned(
            bottom: 33,
            left: 0,
            right: 0,
            child: Center(
              child: ChatLoadingSpinner(
                reason: ChatSpinnerReason.loadingNewer,
                color: context.colors.brandPrimary,
              ),
            ),
          ),
      ],
    );
  }

  Widget _centerTile({
    required BuildContext context,
    required List<Message> messages,
    required int dataIndex,
    required String? visualUnreadId,
    required String? highlightedMessageId,
    required String? currentUserId,
    required bool isDmChannel,
    required String? guildId,
    required int? channelPermissionBits,
    required bool channelCanSendMessages,
    required bool channelCanAddReactions,
    required bool channelCanPinMessage,
    required bool channelCanManageMessages,
    required MessageRenderSettings renderSettings,
  }) {
    final Message message = messages[dataIndex];
    final Message? previousMessage = dataIndex > 0
        ? messages[dataIndex - 1]
        : null;
    return KeyedSubtree(
      key: ValueKey<String>('msg-${message.id}'),
      child: _buildMessageTile(
        context: context,
        message: message,
        previousMessage: previousMessage,
        visualUnreadId: visualUnreadId,
        highlightedMessageId: highlightedMessageId,
        currentUserId: currentUserId,
        isDmChannel: isDmChannel,
        guildId: guildId,
        channelPermissionBits: channelPermissionBits,
        channelCanSendMessages: channelCanSendMessages,
        channelCanAddReactions: channelCanAddReactions,
        channelCanPinMessage: channelCanPinMessage,
        channelCanManageMessages: channelCanManageMessages,
        renderSettings: renderSettings,
      ),
    );
  }

  int? _centerChildIndex(
    Key key,
    List<Message> messages,
    int startInclusive,
    int endExclusive, {
    required bool reverse,
  }) {
    if (key is! ValueKey<String>) {
      return null;
    }
    const String prefix = 'msg-';
    final String value = key.value;
    if (!value.startsWith(prefix)) {
      return null;
    }
    final String id = value.substring(prefix.length);
    final int dataIndex = messages.indexWhere((Message m) => m.id == id);
    if (dataIndex < startInclusive || dataIndex >= endExclusive) {
      return null;
    }
    if (reverse) {
      return endExclusive - 1 - dataIndex;
    }
    return dataIndex - startInclusive;
  }

  (BuildContext, int)? _centerSliverLocationFor(
    String id,
    List<Message> messages,
    int splitIndex,
  ) {
    final int dataIndex = messages.indexWhere((Message m) => m.id == id);
    if (dataIndex < 0) {
      return null;
    }
    if (dataIndex < splitIndex) {
      final BuildContext? context = _leadingSliverCtx;
      return context == null ? null : (context, splitIndex - 1 - dataIndex);
    }
    final BuildContext? context = _trailingSliverCtx;
    return context == null ? null : (context, dataIndex - splitIndex);
  }

  Widget _buildUnreadCenterListView({
    required BuildContext context,
    required List<Message> messages,
    required String? visualUnreadId,
    required String? highlightedMessageId,
    required String? currentUserId,
    required bool isDmChannel,
    required String? guildId,
    required int? channelPermissionBits,
    required bool channelCanSendMessages,
    required bool channelCanAddReactions,
    required bool channelCanPinMessage,
    required bool channelCanManageMessages,
    required MessageRenderSettings renderSettings,
    required bool isLoadingMore,
    required bool isLoadingNewer,
    required Widget? startOfChannelHeader,
  }) {
    final String? anchorId = _centerAnchorMessageId;
    final int found = anchorId == null
        ? -1
        : messages.indexWhere((Message m) => m.id == anchorId);
    final bool centered = found >= 0;
    final int splitIndex = centered ? found : messages.length;
    final double anchor = centered ? _kUnreadOpenAnchor : 1.0;
    return Stack(
      fit: StackFit.expand,
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: SliverViewObserver(
            controller: _sliverObserverController,
            sliverContexts: () => [?_leadingSliverCtx, ?_trailingSliverCtx],
            child: CustomScrollView(
              controller: _scrollController,
              center: _unreadCenterKey,
              anchor: anchor,
              scrollCacheExtent: ScrollCacheExtent.pixels(
                _useCompactScrollCache
                    ? _kMessageListCompactScrollCacheExtent
                    : _kMessageListScrollCacheExtent,
              ),
              slivers: [
                if (startOfChannelHeader != null)
                  SliverToBoxAdapter(child: startOfChannelHeader),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        _leadingSliverCtx = context;
                        return _centerTile(
                          context: context,
                          messages: messages,
                          dataIndex: splitIndex - 1 - index,
                          visualUnreadId: visualUnreadId,
                          highlightedMessageId: highlightedMessageId,
                          currentUserId: currentUserId,
                          isDmChannel: isDmChannel,
                          guildId: guildId,
                          channelPermissionBits: channelPermissionBits,
                          channelCanSendMessages: channelCanSendMessages,
                          channelCanAddReactions: channelCanAddReactions,
                          channelCanPinMessage: channelCanPinMessage,
                          channelCanManageMessages: channelCanManageMessages,
                          renderSettings: renderSettings,
                        );
                      },
                      childCount: splitIndex,
                      findChildIndexCallback: (Key key) => _centerChildIndex(
                        key,
                        messages,
                        0,
                        splitIndex,
                        reverse: true,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  key: _unreadCenterKey,
                  child: const SizedBox.shrink(),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 33),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        _trailingSliverCtx = context;
                        return _centerTile(
                          context: context,
                          messages: messages,
                          dataIndex: splitIndex + index,
                          visualUnreadId: visualUnreadId,
                          highlightedMessageId: highlightedMessageId,
                          currentUserId: currentUserId,
                          isDmChannel: isDmChannel,
                          guildId: guildId,
                          channelPermissionBits: channelPermissionBits,
                          channelCanSendMessages: channelCanSendMessages,
                          channelCanAddReactions: channelCanAddReactions,
                          channelCanPinMessage: channelCanPinMessage,
                          channelCanManageMessages: channelCanManageMessages,
                          renderSettings: renderSettings,
                        );
                      },
                      childCount: messages.length - splitIndex,
                      findChildIndexCallback: (Key key) => _centerChildIndex(
                        key,
                        messages,
                        splitIndex,
                        messages.length,
                        reverse: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isLoadingMore)
          Positioned(
            top: 8,
            left: 0,
            right: 0,
            child: Center(
              child: ChatLoadingSpinner(
                reason: ChatSpinnerReason.loadingMore,
                color: context.colors.brandPrimary,
              ),
            ),
          ),
        if (isLoadingNewer)
          Positioned(
            bottom: 33,
            left: 0,
            right: 0,
            child: Center(
              child: ChatLoadingSpinner(
                reason: ChatSpinnerReason.loadingNewer,
                color: context.colors.brandPrimary,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ref
      ..listen<int>(
        chatViewModelProvider.select(
          (ChatViewState state) => state.scrollToBottomSignal,
        ),
        (int? previous, int next) {
          if (next != previous) {
            _onScrollToBottom();
          }
        },
      )
      ..listen<(String, int)?>(
        chatViewModelProvider.select(
          (ChatViewState s) => s.scrollToMessageSignal,
        ),
        ((String, int)? previous, (String, int)? next) {
          if (next != null && next != previous) {
            _onScrollToMessage(next.$1);
          }
        },
      )
      ..listen<List<Message>>(
        chatViewModelProvider.select((ChatViewState s) => s.messages),
        (List<Message>? previous, List<Message> next) {
          if (_landAtLatestTailPending &&
              !ref.read(chatViewModelProvider).hasMoreNewerMessages) {
            _landAtLatestTailPending = false;
            _landAtLatestTail(next);
            return;
          }
          if (_openMode == _MessageListOpenMode.unread) {
            _followTailCenter();
          } else {
            _applyChatAnchor(next);
          }
        },
      );

    final String? currentUserId = ref.watch(currentUserIdProvider);
    final List<Message> messages = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.messages),
    );
    final String channelId = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.channelId),
    );
    final String? expectedChannelId = widget.expectedChannelId;
    if (expectedChannelId != null &&
        expectedChannelId.isNotEmpty &&
        channelId != expectedChannelId) {
      return Center(
        child: ChatLoadingSpinner(
          reason: ChatSpinnerReason.panelNotReady,
          color: context.colors.brandPrimary,
        ),
      );
    }
    final String? stickyUnreadId = ref.watch(
      chatViewModelProvider.select(
        (ChatViewState s) => s.stickyUnreadMessageId,
      ),
    );
    final String? highlightedMessageId = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.highlightedMessageId),
    );
    final bool hasMoreNewerMessages = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.hasMoreNewerMessages),
    );
    final bool isLoading = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.isLoading),
    );
    final bool messageLoadFailed = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.messageLoadFailed),
    );
    final bool isLoadingMore = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.isLoadingMore),
    );
    final bool isLoadingNewer = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.isLoadingNewer),
    );
    final bool hasMoreMessages = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.hasMoreMessages),
    );
    _resetOpenModeIfReloading(
      channelId: channelId,
      isLoading: isLoading,
      hasMessages: messages.isNotEmpty,
    );
    _scheduleScrollCacheExpansion(messages.length);
    final bool isDmChannel =
        channelId.isNotEmpty &&
        ref.watch(
          dmViewModelProvider.select(
            (DmViewState dmState) =>
                findDmById(dmState.conversations, channelId) != null,
          ),
        );
    final bool isPersonalNotesChannel =
        isPersonalNotesChannelRoute(
          channelId: channelId,
          currentUserId: currentUserId,
        ) ||
        ref.watch(
          dmViewModelProvider.select((DmViewState dmState) {
            final dm = findDmById(dmState.conversations, channelId);
            return dm?.isPersonalNotes ?? false;
          }),
        );
    final DmConversation? groupDmConversation = ref.watch(
      dmViewModelProvider.select((DmViewState dmState) {
        final DmConversation? dm = findDmById(dmState.conversations, channelId);
        return dm != null && dm.isGroup ? dm : null;
      }),
    );
    final channelRow = isDmChannel || channelId.isEmpty
        ? null
        : findChannelById(ref.watch(channelListViewModelProvider), channelId);
    final String? guildId = channelRow?.guildId;
    final int? channelPermissionBits = channelId.isEmpty
        ? null
        : ref
              .read(channelPermissionCacheProvider.notifier)
              .getChannelBits(channelId);
    final AsyncValue<drift_db.ReadState?> readStateAsync = channelId.isEmpty
        ? const AsyncValue<drift_db.ReadState?>.data(null)
        : ref.watch(_messageListReadStateProvider(channelId));
    final drift_db.ReadState? readState = readStateAsync.asData?.value;
    final ChatUnreadSummary unreadSummary = _unreadSummaryFor(
      messages: messages,
      ackLastMessageId: readState?.lastMessageId,
      mentionCount: readState?.mentionCount ?? 0,
      currentUserId: currentUserId,
      channelLastMessageId: _channelLastMessageIdFor(channelId),
      hasMoreNewerMessages: hasMoreNewerMessages,
      hasMoreOlderMessages: hasMoreMessages,
    );
    final String? oldestUnreadId = unreadSummary.oldestUnreadMessageId;
    final String? visualUnreadId = resolveVisualUnreadId(
      messages: messages.map(
        (Message message) =>
            ChatUnreadMessageRef(id: message.id, authorId: message.authorId),
      ),
      stickyUnreadId: stickyUnreadId,
      oldestUnreadId: oldestUnreadId,
      currentUserId: currentUserId,
    );
    if (_openMode == _MessageListOpenMode.unresolved &&
        !isLoading &&
        readStateAsync.hasValue) {
      final bool hasJumpTarget =
          widget.targetMessageId != null || _pendingScrollTarget != null;
      final String? anchorId = hasJumpTarget ? null : visualUnreadId;
      final bool canAnchor =
          anchorId != null && messages.any((Message m) => m.id == anchorId);
      if (canAnchor) {
        _openMode = _MessageListOpenMode.unread;
        _centerAnchorMessageId = anchorId;
        _scheduleUnreadUnderfillFallback();
      } else {
        _openMode = _MessageListOpenMode.bottom;
      }
    }
    final int unreadCount = unreadSummary.displayUnreadCount;
    final bool liveNearBottom = _isNearLiveTail();
    final bool showUnreadBarEligible = shouldShowUnreadBar(
      hasUnread: unreadCount > 0,
      liveNearBottom: liveNearBottom,
      hasMoreNewerMessages: hasMoreNewerMessages,
      isManualReadState: readState?.manual ?? false,
      stickyUnreadMessageId: stickyUnreadId,
    );
    final DateTime? unreadSince = _messageTimestamp(messages, visualUnreadId);
    final int chatFontSize = ref.watch(
      themePreferenceProvider.select(
        (ThemePreferenceState s) => s.chatFontSize,
      ),
    );

    if (messages.isEmpty) {
      _itemKeys.clear();
      _tileCache.clear();
    }

    if (!isLoading && _pendingScrollTarget != null) {
      final String target = _pendingScrollTarget!;
      if (messages.any((Message m) => m.id == target)) {
        _pendingScrollTarget = null;
        unawaited(_jumpToMessage(target));
      }
    }

    final Widget? startOfChannelHeader = !hasMoreMessages
        ? switch ((channelRow, groupDmConversation)) {
            (final channel?, null) => ChannelWelcomeSection(
              key: const ValueKey<String>('channel-welcome-section'),
              channel: channel,
              effectivePermissionBits: channelPermissionBits,
            ),
            (null, final dm?) => GroupDmWelcomeSection(
              key: const ValueKey<String>('group-dm-welcome-section'),
              dm: dm,
            ),
            _ => null,
          }
        : null;

    return _MessageListSettingsLayer(
      channelId: channelId,
      isDmChannel: isDmChannel,
      channelPermissionBits: channelPermissionBits,
      builder:
          (
            BuildContext context,
            MessageRenderSettings messageRenderSettings,
            ({
              bool canSendMessages,
              bool canAddReactions,
              bool canPinMessage,
              bool canManageMessages,
            })
            channelActions,
          ) {
            final Widget body;
            if (_openMode == _MessageListOpenMode.unresolved ||
                (isLoading && messages.isEmpty)) {
              body = Center(
                child: ChatLoadingSpinner(
                  reason: ChatSpinnerReason.listLoading,
                  color: context.colors.brandPrimary,
                ),
              );
            } else if (messageLoadFailed && messages.isEmpty) {
              final FluxerLocalizations l10n = FluxerLocalizations.of(context);
              body = Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      PhosphorIcon(
                        PhosphorIconsFill.warningCircle,
                        size: 48,
                        color: context.colors.textPrimaryMuted,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.chatMessagesLoadError,
                        style: context.textStyles.bodySmall.copyWith(
                          color: context.colors.textPrimaryMuted,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      FluxerButton.primary(
                        label: l10n.retry,
                        onPressed: () => unawaited(
                          ref
                              .read(chatViewModelProvider.notifier)
                              .retryLoadMessages(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (messages.isEmpty) {
              if (isPersonalNotesChannel) {
                body = const PersonalNotesWelcomeSection();
              } else if (groupDmConversation != null) {
                body = Align(
                  alignment: Alignment.bottomCenter,
                  child: GroupDmWelcomeSection(dm: groupDmConversation),
                );
              } else if (channelRow != null) {
                body = Align(
                  alignment: Alignment.bottomLeft,
                  child: ChannelWelcomeSection(
                    channel: channelRow,
                    effectivePermissionBits: channelPermissionBits,
                  ),
                );
              } else {
                body = Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PhosphorIcon(
                        PhosphorIconsFill.chatCircleDots,
                        size: 48,
                        color: context.colors.textPrimaryMuted,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No messages yet',
                        style: TextStyle(
                          color: context.colors.textPrimaryMuted,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Be the first to send a message!',
                        style: TextStyle(
                          color: context.colors.textTertiaryMuted,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              }
            } else {
              _tileCache.retainKeys(messages.map((Message m) => m.id).toSet());
              body = _openMode == _MessageListOpenMode.unread
                  ? _buildUnreadCenterListView(
                      context: context,
                      messages: messages,
                      visualUnreadId: visualUnreadId,
                      highlightedMessageId: highlightedMessageId,
                      currentUserId: currentUserId,
                      isDmChannel: isDmChannel,
                      guildId: guildId,
                      channelPermissionBits: channelPermissionBits,
                      channelCanSendMessages: channelActions.canSendMessages,
                      channelCanAddReactions: channelActions.canAddReactions,
                      channelCanPinMessage: channelActions.canPinMessage,
                      channelCanManageMessages:
                          channelActions.canManageMessages,
                      renderSettings: messageRenderSettings,
                      isLoadingMore: isLoadingMore,
                      isLoadingNewer: isLoadingNewer,
                      startOfChannelHeader: startOfChannelHeader,
                    )
                  : _buildMessageListView(
                      context: context,
                      messages: messages,
                      visualUnreadId: visualUnreadId,
                      highlightedMessageId: highlightedMessageId,
                      currentUserId: currentUserId,
                      isDmChannel: isDmChannel,
                      guildId: guildId,
                      channelPermissionBits: channelPermissionBits,
                      channelCanSendMessages: channelActions.canSendMessages,
                      channelCanAddReactions: channelActions.canAddReactions,
                      channelCanPinMessage: channelActions.canPinMessage,
                      channelCanManageMessages:
                          channelActions.canManageMessages,
                      renderSettings: messageRenderSettings,
                      isLoadingMore: isLoadingMore,
                      isLoadingNewer: isLoadingNewer,
                      startOfChannelHeader: startOfChannelHeader,
                    );
            }

            final double scaleRatio = chatFontSize / 16.0;
            final bool showUnreadBar =
                !isLoading && messages.isNotEmpty && showUnreadBarEligible;
            return MessageListOverlay(
              body: MessageListBody(child: body),
              showUnreadBar: showUnreadBar,
              unreadCount: unreadCount,
              isEstimated: unreadSummary.isEstimated,
              unreadSince: unreadSince,
              onJumpToUnread: _onUnreadBarJump,
              onMarkRead: _onUnreadBarMarkRead,
              scaleRatio: scaleRatio,
            );
          },
    );
  }

  DateTime? _messageTimestamp(List<Message> messages, String? messageId) {
    if (messageId == null) {
      return null;
    }
    for (final Message message in messages) {
      if (message.id == messageId) {
        return message.timestamp;
      }
    }
    return null;
  }

  bool _shouldGroup(Message current, Message? previous) =>
      shouldGroupMessages(current, previous);

  bool _isSameDay(DateTime a, DateTime b) {
    final DateTime localA = a.toLocal();
    final DateTime localB = b.toLocal();
    return localA.year == localB.year &&
        localA.month == localB.month &&
        localA.day == localB.day;
  }

  Widget _withMessageSeparators(
    BuildContext context, {
    required Message message,
    required bool isNewDay,
    required String? visualUnreadId,
    required Widget child,
    required double leadingGroupSpacing,
  }) {
    final bool isUnreadBoundary = message.id == visualUnreadId;
    if (isNewDay) {
      return Column(
        children: [
          if (isUnreadBoundary)
            _buildUnreadDateSeparator(context, message.timestamp)
          else
            _buildDateSeparator(context, message.timestamp),
          child,
        ],
      );
    }
    if (isUnreadBoundary) {
      return Column(children: [_buildUnreadSeparator(context), child]);
    }
    if (leadingGroupSpacing > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: leadingGroupSpacing),
          child,
        ],
      );
    }
    return child;
  }

  Widget _buildUnreadSeparator(BuildContext context) {
    final Color danger = context.colors.statusDanger;
    return SizedBox(
      height: _kUnreadDividerHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(child: _buildUnreadLine(danger)),
            _buildUnreadBadge(context, danger, height: _kUnreadDividerHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildUnreadDateSeparator(BuildContext context, DateTime date) {
    final Color danger = context.colors.statusDanger;
    final DateTime local = date.toLocal();
    final String formatted =
        '${_kMonthNames[local.month - 1]} ${local.day},'
        ' ${local.year}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SizedBox(
        height: _kUnreadDateDividerHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: [
                Expanded(child: _buildUnreadLine(danger)),
                _buildUnreadBadge(
                  context,
                  danger,
                  height: _kUnreadDateDividerHeight,
                ),
              ],
            ),
            ColoredBox(
              color: context.colors.chatBackground,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  formatted,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.smallText.copyWith(
                    color: danger,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnreadLine(Color color) {
    return Container(height: 2, color: color.withValues(alpha: 0.4));
  }

  Widget _buildUnreadBadge(
    BuildContext context,
    Color color, {
    required double height,
  }) {
    return Container(
      height: height,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        'NEW',
        maxLines: 1,
        style: context.textStyles.smallText.copyWith(
          color: Colors.white.withValues(alpha: 0.9),
          fontSize: 10,
          fontWeight: FontWeight.w700,
          height: 1,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildDateSeparator(BuildContext context, DateTime date) {
    final DateTime local = date.toLocal();
    final String formatted =
        '${_kMonthNames[local.month - 1]} ${local.day},'
        ' ${local.year}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(child: Divider(color: context.colors.borderColor)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(formatted, style: context.textStyles.smallText),
          ),
          Expanded(child: Divider(color: context.colors.borderColor)),
        ],
      ),
    );
  }
}

/// User settings and channel permission watches isolated from the message list
/// body so read-state and message updates do not rebuild settings providers.
class _MessageListSettingsLayer extends ConsumerWidget {
  const _MessageListSettingsLayer({
    required this.channelId,
    required this.isDmChannel,
    required this.channelPermissionBits,
    required this.builder,
  });

  final String channelId;
  final bool isDmChannel;
  final int? channelPermissionBits;
  final Widget Function(
    BuildContext context,
    MessageRenderSettings settings,
    ({
      bool canSendMessages,
      bool canAddReactions,
      bool canPinMessage,
      bool canManageMessages,
    })
    channelActions,
  )
  builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChannelMessagePermissions channelMessagePerms = channelId.isEmpty
        ? ChannelMessagePermissions.unresolved
        : channelMessagePermissionsForComposer(
            ref.watch(channelMessagePermissionsProvider(channelId)),
          );
    final DmConversation? dmConversation = ref.watch(
      dmViewModelProvider.select((DmViewState dmState) {
        return findDmById(dmState.conversations, channelId);
      }),
    );
    final bool interactionsBlocked =
        dmConversation != null && isSystemDmConversation(dmConversation);
    final RenderSpoilers renderSpoilers = ref.watch(
      userSettingsViewModelProvider.select((s) => s.renderSpoilers),
    );
    final MessageRenderSettings settings = MessageRenderSettings(
      activeGuildId: ref.watch(activeGuildIdProvider),
      renderEmbeds: ref.watch(
        userSettingsViewModelProvider.select((s) => s.renderEmbeds),
      ),
      renderReactions: ref.watch(
        userSettingsViewModelProvider.select((s) => s.renderReactions),
      ),
      inlineAttachmentMedia: ref.watch(
        userSettingsViewModelProvider.select((s) => s.inlineAttachmentMedia),
      ),
      renderSpoilers: renderSpoilers,
      revealSpoilers: switch (renderSpoilers) {
        RenderSpoilers.always => true,
        RenderSpoilers.ifModerator =>
          channelId.isNotEmpty &&
              (ref.watch(spoilerAutoRevealProvider(channelId)).value ?? false),
        RenderSpoilers.onClick || RenderSpoilers.$unknown => false,
      },
      chatPreferences: ref.watch(chatPreferencesProvider),
      messageGroupSpacing: ref.watch(
        appearancePreferencesProvider.select((s) => s.messageGroupSpacing),
      ),
    );
    return builder(context, settings, (
      canSendMessages: channelMessagePerms.canSendMessages,
      canAddReactions: canAddReactionsInChannel(
        isDmChannel: isDmChannel,
        channelPermissionBits: channelPermissionBits,
        interactionsBlocked: interactionsBlocked,
      ),
      canPinMessage: canPinMessageInChannel(
        isDmChannel: isDmChannel,
        channelPermissionBits: channelPermissionBits,
        interactionsBlocked: interactionsBlocked,
      ),
      canManageMessages: canManageMessagesInChannel(
        isDmChannel: isDmChannel,
        channelPermissionBits: channelPermissionBits,
      ),
    ));
  }
}
