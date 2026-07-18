import 'dart:async';

import 'package:flutter/foundation.dart';
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
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
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
    'widgets/messages/blocked_message_groups.dart';
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
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/channel_message_stream_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/spoiler_reveal_provider.dart';
import 'package:fluxer_app/features/chat/utils/channel_message_stream.dart';
import 'package:fluxer_app/features/chat/utils/chat_spinner_debug.dart';
import 'package:fluxer_app/features/chat/utils/message_action_permissions.dart';
import 'package:fluxer_app/features/chat/utils/message_grouping_utils.dart';
import 'package:fluxer_app/features/chat/utils/pinned_system_message_navigation.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_welcome_section.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/personal_notes_welcome_section.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
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
// Exposed for widget tests that hold read state in AsyncLoading.
@visibleForTesting
// Riverpod family type is not expressible without this ignore.
// ignore: specify_nonobvious_property_types
final messageListReadStateProvider = StreamProvider.autoDispose
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
/// above the viewport, and newer ones hold position unless at the live tail).
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
  late final ChatReadViewport _readViewport;
  late String _viewportChannelId;
  String? _pendingScrollTarget;
  int _messageJumpInFlight = 0;
  // Bumped to cancel an in-flight post-jump settle correction.
  int _bottomJumpGeneration = 0;

  int? _activeSettleGeneration;
  Timer? _bottomJumpSettleTimer;
  Completer<void>? _bottomJumpSettleDelay;
  bool _landAtLatestTailPending = false;
  int _jumpToLatestTicket = 0;
  bool _jumpToLatestInFlight = false;
  String? _centerAnchorMessageId;

  // Jump paths must reuse the build's unread input so render indices match.
  String? _lastVisualUnreadId;
  BuildContext? _leadingSliverCtx;
  BuildContext? _trailingSliverCtx;
  final MessageEdgeLoadTrigger _edgeLoadTrigger = MessageEdgeLoadTrigger();
  _MessageListOpenMode _openMode = _MessageListOpenMode.unresolved;
  String? _lastChannelId;
  List<Object>? _lastAnchorItemKeys;
  ChatUnreadSummary? _cachedUnreadSummary;
  Object? _unreadSummaryKey;
  bool _useCompactScrollCache = true;
  int _lastMessageCount = 0;
  double? _lastViewportDimension;

  bool _userDragActive = false;

  // Pre-shrink visibility: tall items can stay visible past the 48px threshold.
  bool? _newestMessageVisibleLatch;

  @override
  void initState() {
    super.initState();
    _chatViewModel = ref.read(chatViewModelProvider.notifier);
    _readViewport = ref.read(chatReadViewportProvider.notifier);
    _viewportChannelId =
        widget.expectedChannelId ?? ref.read(chatViewModelProvider).channelId;
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
      _readViewport.setViewportActive(
        channelId: _viewportChannelId,
        isActive: widget.visible,
      );
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
    final String nextViewportChannelId =
        widget.expectedChannelId ?? ref.read(chatViewModelProvider).channelId;
    if (nextViewportChannelId != _viewportChannelId) {
      final String previousViewportChannelId = _viewportChannelId;
      _viewportChannelId = nextViewportChannelId;
      if (oldWidget.visible) {
        _readViewport.setViewportActive(
          channelId: previousViewportChannelId,
          isActive: false,
        );
      }
      if (widget.visible) {
        _readViewport.setViewportActive(
          channelId: _viewportChannelId,
          isActive: true,
        );
      }
    } else if (widget.visible != oldWidget.visible) {
      _readViewport.setViewportActive(
        channelId: _viewportChannelId,
        isActive: widget.visible,
      );
    }
  }

  @override
  void dispose() {
    _cancelBottomJumpSettle();
    _readViewport.setViewportActive(
      channelId: _viewportChannelId,
      isActive: false,
    );
    _chatViewModel
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
        if (_scrollController.hasClients) {
          _lastViewportDimension ??=
              _scrollController.position.viewportDimension;
        }
        _updateNewestMessageVisibleLatch();
        _maybeLoadOlder();
        _maybeLoadNewer();
        _syncReadViewport();
    }
  }

  bool get _isUserDrivenScroll =>
      _userDragActive ||
      (_scrollController.hasClients &&
          _scrollController.position.userScrollDirection !=
              ScrollDirection.idle);

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

  Object _anchorItemKey(ChannelStreamItem item) {
    switch (item.type) {
      case ChannelStreamType.message:
        return (item.type, item.singleMessage?.id);
      case ChannelStreamType.messageGroupBlocked:
      case ChannelStreamType.messageGroupSpammer:
        return (item.type, item.groupKey);
      case ChannelStreamType.divider:
        final DateTime? date = item.dividerDate?.toLocal();
        return (item.type, date?.year, date?.month, date?.day);
    }
  }

  List<Object> _anchorItemKeysForStream(List<ChannelStreamItem> stream) =>
      stream.map(_anchorItemKey).toList(growable: false);

  List<Object> _anchorItemKeysForMessages(List<Message> messages) =>
      _anchorItemKeysForStream(
        createChannelStream(
          messages: messages,
          oldestUnreadMessageId: null,
          context: ref.read(channelCollapseContextProvider),
        ),
      );

  void _syncAnchorBaselineFromBuild(List<ChannelStreamItem> stream) {
    if (_openMode != _MessageListOpenMode.bottom) {
      return;
    }
    final List<Object> next = _anchorItemKeysForStream(stream);
    final List<Object>? prev = _lastAnchorItemKeys;
    if (listEquals(prev, next)) {
      return;
    }
    _lastAnchorItemKeys = next;
    if (prev == null) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _onScroll();
      }
    });
  }

  // Keeps the viewport anchored across render-leading changes by snapshotting
  // the reference item before the rebuild lays out. Runs from the messages
  // listener, outside this widget's build phase, so markNeedsLayout is legal.
  void _applyChatAnchor(List<Message> messages) {
    final List<Object> next = _anchorItemKeysForMessages(messages);
    final List<Object>? prev = _lastAnchorItemKeys;
    _lastAnchorItemKeys = next;
    if (_openMode == _MessageListOpenMode.bottom &&
        prev != null &&
        prev.isNotEmpty &&
        next.isNotEmpty) {
      final LeadingEdgeDelta delta = computeLeadingEdgeKeyDelta(prev, next);
      if (delta.addedNewest > 0) {
        final bool nearTail = _isLiveNearBottom();
        // Near-tail appends must reveal newest even when no viewport shrink
        // fires (e.g. keyboard already open).
        unawaited(
          _chatObserver.standby(
            changeCount: delta.addedNewest,
            isNeedObserveSwitchShrinkWrap: false,
          ),
        );
        if (nearTail) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted ||
                !_scrollController.hasClients ||
                _openMode != _MessageListOpenMode.bottom ||
                _hasActiveJumpTarget() ||
                _isUserDrivenScroll) {
              return;
            }
            final ScrollPosition position = _scrollController.position;
            // Pre-append nearTail authorized this pin. Post-append distance can
            // exceed 48px for a tall newest item — do not recheck isLiveNearBottom.
            if ((position.pixels - position.minScrollExtent).abs() < 0.5) {
              return;
            }
            position.jumpTo(position.minScrollExtent);
          });
        }
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
      } else if (listEquals(prev, next)) {
        // A collapsed tail item can absorb a message without adding a child.
        unawaited(
          _chatObserver.standby(
            mode: ChatScrollObserverHandleMode.specified,
            refIndexType:
                ChatScrollObserverRefIndexType.relativeIndexStartFromDisplaying,
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
    _lastAnchorItemKeys = null;
    _leadingSliverCtx = null;
    _trailingSliverCtx = null;
    _centerAnchorMessageId = null;
    _lastVisualUnreadId = null;
    _landAtLatestTailPending = false;
    _jumpToLatestTicket++;
    _jumpToLatestInFlight = false;
    _openMode = _MessageListOpenMode.unresolved;
    _edgeLoadTrigger.reset();
    _lastViewportDimension = null;
    _newestMessageVisibleLatch = null;
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
    // Track drag at any depth so post-frame shrink pin can honor it.
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null) {
      _userDragActive = true;
    } else if (notification is ScrollEndNotification) {
      _userDragActive = false;
    }
    if (notification.depth != 0) {
      return false;
    }
    // User finger/trackpad drag must cancel post-jump settle re-centering.
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null) {
      _cancelBottomJumpSettle();
    }
    return switch (_openMode) {
      _MessageListOpenMode.unresolved => false,
      _MessageListOpenMode.unread => _onScrollNotificationCenter(notification),
      _MessageListOpenMode.bottom => _onScrollNotificationBottom(notification),
    };
  }

  void _cancelBottomJumpSettle() {
    // Drop ownership immediately so hasActiveJumpTarget clears now.
    // A replacement jump installs its own token.
    if (_activeSettleGeneration == _bottomJumpGeneration) {
      _activeSettleGeneration = null;
    }
    _bottomJumpGeneration++;
    _bottomJumpSettleTimer?.cancel();
    _bottomJumpSettleTimer = null;
    final Completer<void>? delay = _bottomJumpSettleDelay;
    _bottomJumpSettleDelay = null;
    if (delay != null && !delay.isCompleted) {
      delay.complete();
    }
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

  bool _onScrollMetricsNotification(ScrollMetricsNotification notification) {
    if (_openMode == _MessageListOpenMode.bottom) {
      _onBottomViewportMetrics(notification.metrics);
    }
    return false;
  }

  bool? _isMessageIntersectingViewport(String messageId) {
    if (!_scrollController.hasClients) {
      return null;
    }
    final GlobalKey? key = _itemKeys[messageId];
    final BuildContext? itemContext = key?.currentContext;
    if (itemContext == null) {
      return null;
    }
    final RenderObject? itemRo = itemContext.findRenderObject();
    final RenderObject? viewportRo = _scrollController
        .position
        .context
        .notificationContext
        ?.findRenderObject();
    if (itemRo is! RenderBox ||
        !itemRo.attached ||
        !itemRo.hasSize ||
        viewportRo is! RenderBox ||
        !viewportRo.hasSize) {
      return null;
    }
    final Offset itemTopLeft = itemRo.localToGlobal(Offset.zero);
    final Rect itemRect = itemTopLeft & itemRo.size;
    final Offset viewportTopLeft = viewportRo.localToGlobal(Offset.zero);
    final Rect viewportRect = viewportTopLeft & viewportRo.size;
    return itemRect.overlaps(viewportRect);
  }

  void _updateNewestMessageVisibleLatch() {
    if (_openMode != _MessageListOpenMode.bottom ||
        !_scrollController.hasClients) {
      return;
    }
    final List<Message> messages = ref.read(chatViewModelProvider).messages;
    if (messages.isEmpty) {
      _newestMessageVisibleLatch = null;
      return;
    }
    final bool? visible = _isMessageIntersectingViewport(messages.last.id);
    if (visible != null) {
      _newestMessageVisibleLatch = visible;
    }
  }

  void _onBottomViewportMetrics(ScrollMetrics metrics) {
    final double viewport = metrics.viewportDimension;
    final double? previous = _lastViewportDimension;
    if (previous == null || viewport >= previous - 0.5) {
      _lastViewportDimension = viewport;
      _updateNewestMessageVisibleLatch();
      return;
    }
    // Order matters: capture visibility before adopting the shrunken viewport.
    _updateNewestMessageVisibleLatch();
    final bool? newestVisible = _newestMessageVisibleLatch;
    _lastViewportDimension = viewport;
    if (_hasActiveJumpTarget() || _isUserDrivenScroll) {
      return;
    }
    final bool nearTailPx = isLiveNearBottom(
      pixels: metrics.pixels,
      minScrollExtent: metrics.minScrollExtent,
    );
    // Prefer the visibility latch, falling back to 48px near-tail when unknown.
    final bool shouldPin = newestVisible ?? nearTailPx;
    if (!shouldPin) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted ||
          !_scrollController.hasClients ||
          _openMode != _MessageListOpenMode.bottom ||
          _hasActiveJumpTarget() ||
          _isUserDrivenScroll) {
        return;
      }
      final ScrollPosition position = _scrollController.position;
      // Do not re-apply the 48px gate after latch authorization.
      if ((position.pixels - position.minScrollExtent).abs() < 0.5) {
        return;
      }
      position.jumpTo(position.minScrollExtent);
    });
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
      _pendingScrollTarget != null ||
      _messageJumpInFlight > 0 ||
      _activeSettleGeneration != null;

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

  Widget _wrapWithUnreadSeparator(
    BuildContext context,
    Widget child, {
    required bool show,
  }) {
    if (!show) {
      return child;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [_buildUnreadSeparator(context), child],
    );
  }

  void _syncReadViewport({bool ignoreJumpTarget = false}) {
    if (!_scrollController.hasClients ||
        _openMode != _MessageListOpenMode.bottom ||
        (!ignoreJumpTarget && _hasActiveJumpTarget())) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    _readViewport.updateViewport(
      channelId: _viewportChannelId,
      nearLoadedTail: _isLiveNearBottom(),
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
    _readViewport.updateViewport(
      channelId: _viewportChannelId,
      nearLoadedTail: isNearTrailingEdge(
        distanceFromTrailingEdge: distanceFromTrailingEdge,
      ),
      distanceFromBottom: distanceFromTrailingEdge,
      viewportHeight: position.viewportDimension,
    );
  }

  void _onScrollToBottom() {
    // Cancel post-jump settle so a user "jump to latest" is not overwritten.
    _cancelBottomJumpSettle();
    if (_hasActiveJumpTarget()) {
      return;
    }
    if (_openMode == _MessageListOpenMode.unread) {
      final ChatViewState chatState = ref.read(chatViewModelProvider);
      if (chatState.hasMoreNewerMessages) {
        _centerAnchorMessageId = null;
        _requestJumpToLatest();
        return;
      }
      // Live-tail intent: demote so reverse-list pin/latch/append-follow apply.
      final List<Message> messages = chatState.messages;
      setState(() {
        _convertUnreadOpenToBottom(messages);
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted ||
            !_scrollController.hasClients ||
            _openMode != _MessageListOpenMode.bottom) {
          return;
        }
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
        _updateNewestMessageVisibleLatch();
        _syncReadViewport();
      });
      return;
    }
    if (_openMode == _MessageListOpenMode.unresolved) {
      return;
    }
    final ChatViewState chatState = ref.read(chatViewModelProvider);
    if (chatState.hasMoreNewerMessages) {
      _requestJumpToLatest();
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        // Instant jump: animateTo would build every tile it scrolls past.
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      }
    });
  }

  /// Arms the land-at-tail flag and starts a jump. Re-entrant requests are
  /// ignored so a rejected second call cannot clear the pending flag.
  void _requestJumpToLatest() {
    if (_jumpToLatestInFlight) {
      return;
    }
    final int ticket = ++_jumpToLatestTicket;
    _jumpToLatestInFlight = true;
    _landAtLatestTailPending = true;
    unawaited(
      _chatViewModel.jumpToLatestMessages().then((bool started) {
        if (ticket != _jumpToLatestTicket) {
          return;
        }
        _jumpToLatestInFlight = false;
        if (!started && mounted) {
          _landAtLatestTailPending = false;
        }
      }),
    );
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
  // under the newest message. Once the open frame lays out, switch to the real
  // bottom list so subsequent appends use the ChatScrollObserver pinning path.
  void _scheduleUnreadUnderfillFallback() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted ||
          _openMode != _MessageListOpenMode.unread ||
          _centerAnchorMessageId == null ||
          !_scrollController.hasClients) {
        return;
      }
      if (ref.read(chatViewModelProvider).hasMoreNewerMessages) {
        // Newer pagination will fill the trailing half, so keep the anchor.
        return;
      }
      if (_scrollController.position.maxScrollExtent > 0) {
        return;
      }
      final List<Message> messages = ref.read(chatViewModelProvider).messages;
      setState(() {
        _openMode = _MessageListOpenMode.bottom;
        _centerAnchorMessageId = null;
        _lastAnchorItemKeys = _anchorItemKeysForMessages(messages);
        _leadingSliverCtx = null;
        _trailingSliverCtx = null;
        _edgeLoadTrigger.reset();
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.minScrollExtent);
          _syncReadViewport(ignoreJumpTarget: true);
        }
      });
    });
  }

  // Unread mode requires the open-frame center anchor still in the stream.
  void _convertUnreadOpenToBottom(List<Message> messages) {
    if (_openMode != _MessageListOpenMode.unread) {
      return;
    }
    _openMode = _MessageListOpenMode.bottom;
    _centerAnchorMessageId = null;
    _lastAnchorItemKeys = _anchorItemKeysForMessages(messages);
    _leadingSliverCtx = null;
    _trailingSliverCtx = null;
    _edgeLoadTrigger.reset();
  }

  String? _visibleMessageIdNearViewportCenter() {
    if (!_scrollController.hasClients) {
      return null;
    }
    final RenderObject? viewportRo = _scrollController
        .position
        .context
        .notificationContext
        ?.findRenderObject();
    if (viewportRo is! RenderBox || !viewportRo.hasSize) {
      return null;
    }
    final double viewportCenterY = viewportRo
        .localToGlobal(Offset(0, viewportRo.size.height * 0.5))
        .dy;
    String? bestId;
    double bestDistance = double.infinity;
    for (final MapEntry<String, GlobalKey> entry in _itemKeys.entries) {
      final BuildContext? itemContext = entry.value.currentContext;
      if (itemContext == null) {
        continue;
      }
      final RenderObject? itemRo = itemContext.findRenderObject();
      if (itemRo is! RenderBox || !itemRo.attached || !itemRo.hasSize) {
        continue;
      }
      final double itemCenterY = itemRo
          .localToGlobal(Offset(0, itemRo.size.height * 0.5))
          .dy;
      final double distance = (itemCenterY - viewportCenterY).abs();
      if (distance < bestDistance) {
        bestDistance = distance;
        bestId = entry.key;
      }
    }
    return bestId;
  }

  // After center→bottom rebuild, keep the reader's place without a tail yank.
  void _scheduleViewportPreserveAfterBottomConvert(String messageId) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted ||
          _openMode != _MessageListOpenMode.bottom ||
          !_scrollController.hasClients) {
        return;
      }
      // A pending/active jump owns the viewport — do not fight it.
      if (_hasActiveJumpTarget()) {
        return;
      }
      if (!ref
          .read(chatViewModelProvider)
          .messages
          .any((Message m) => m.id == messageId)) {
        return;
      }
      unawaited(_jumpToMessageBottom(messageId));
    });
  }

  void _ensureUnreadCenterAnchorInStream({
    required List<ChannelStreamItem> stream,
    required List<Message> messages,
  }) {
    if (_openMode != _MessageListOpenMode.unread) {
      return;
    }
    final String? anchorId = _centerAnchorMessageId;
    if (anchorId != null &&
        findChannelStreamDataIndex(stream, anchorId) != null) {
      return;
    }
    // Defer while a center jump/settle is mid-flight so layout is not swapped
    // under an in-progress observer jump. Pending targets convert in-build and
    // then execute on the bottom path in the same frame.
    if (_messageJumpInFlight > 0 || _activeSettleGeneration != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || _openMode != _MessageListOpenMode.unread) {
          return;
        }
        if (_messageJumpInFlight > 0 || _activeSettleGeneration != null) {
          return;
        }
        final ChatViewState chatState = ref.read(chatViewModelProvider);
        final String? stillAnchor = _centerAnchorMessageId;
        if (stillAnchor != null &&
            chatState.messages.any((Message m) => m.id == stillAnchor)) {
          return;
        }
        final String? preserveId = _pendingScrollTarget == null
            ? _visibleMessageIdNearViewportCenter()
            : null;
        setState(() {
          _convertUnreadOpenToBottom(chatState.messages);
        });
        if (preserveId != null) {
          _scheduleViewportPreserveAfterBottomConvert(preserveId);
        }
      });
      return;
    }
    // Case 1: pending jump will position after convert. Case 2: no pending
    // target — preserve the currently visible message across the rebuild.
    final String? preserveId = _pendingScrollTarget == null
        ? _visibleMessageIdNearViewportCenter()
        : null;
    _convertUnreadOpenToBottom(messages);
    if (preserveId != null) {
      _scheduleViewportPreserveAfterBottomConvert(preserveId);
    }
  }

  // An unread-center open has no scroll event to publish live-tail auto-ack geometry.
  // Runs after underfill fallback, so a bottom-mode conversion makes it a no-op.
  void _scheduleUnreadViewportSync() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _openMode == _MessageListOpenMode.unread) {
        _syncReadViewportCenter();
      }
    });
  }

  // Coordinates the latest-window replacement with its tail landing so the
  // reverse list never paints a clamped intermediate frame.
  void _landAtLatestTail(List<Message> next) {
    // Live-tail land: demote unread so reverse-list pin owns keyboard shrinks.
    if (_openMode == _MessageListOpenMode.unread) {
      _convertUnreadOpenToBottom(next);
    }
    _lastAnchorItemKeys = _anchorItemKeysForMessages(next);
    _edgeLoadTrigger.reset();
    if (_scrollController.hasClients) {
      // Reverse ListView newest edge is valid before the new window lays out.
      _scrollController.jumpTo(_scrollController.position.minScrollExtent);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updateNewestMessageVisibleLatch();
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
    _cancelBottomJumpSettle();
    final int generation = _bottomJumpGeneration;
    // A list that mounts in this frame may not have observer sliver contexts
    // until the next frame, so retry briefly instead of no-opping the jump.
    void attempt({required int triesLeft}) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted || generation != _bottomJumpGeneration) {
          if (!completer.isCompleted) {
            completer.complete();
          }
          return;
        }
        if (!_scrollController.hasClients ||
            _observerController.fetchSliverContext() == null) {
          if (triesLeft > 0) {
            attempt(triesLeft: triesLeft - 1);
            return;
          }
          if (!completer.isCompleted) {
            completer.complete();
          }
          return;
        }
        try {
          await _runBottomJump(messageId);
        } finally {
          // Own settle before releasing the jump future so scroll handlers
          // still see an active jump target during correction.
          if (mounted && generation == _bottomJumpGeneration) {
            _activeSettleGeneration = generation;
          }
          if (!completer.isCompleted) {
            completer.complete();
          }
        }
        if (mounted && generation == _bottomJumpGeneration) {
          unawaited(_correctBottomJumpIfNeeded(messageId, generation));
        }
      });
    }

    attempt(triesLeft: 2);
    return completer.future;
  }

  Future<void> _runBottomJump(String messageId) async {
    if (!mounted || !_scrollController.hasClients) {
      return;
    }
    final ChatViewState chatState = ref.read(chatViewModelProvider);
    // Match the stream the reverse list was built with (visual unread).
    final List<ChannelStreamItem> stream = ref.read(
      channelMessageStreamProvider(
        ChannelMessageStreamInput(
          messages: chatState.messages,
          oldestUnreadMessageId: _lastVisualUnreadId,
        ),
      ),
    );
    final int? renderIndex = findChannelStreamRenderIndex(stream, messageId);
    if (renderIndex == null) {
      return;
    }
    _confirmJumpHighlightScroll(messageId);
    // Drop cached child offsets so a re-jump after tile reflow does not reuse
    // pre-reflow heights from the first locate pass.
    _observerController.clearScrollIndexCache();
    // alignment is child-relative: 0.5 puts the message's midpoint at the
    // viewport's leading edge, so shift by half the viewport to center it.
    await _observerController
        .jumpTo(
          index: renderIndex,
          alignment: 0.5,
          offset: (_) => _scrollController.position.viewportDimension * 0.5,
        )
        .timeout(const Duration(seconds: 2), onTimeout: () {});
  }

  Future<void> _correctBottomJumpIfNeeded(String messageId, int generation) =>
      _settleJumpCorrection(messageId, generation, _runBottomJump);

  double? _jumpCenterSignedDrift(String messageId) {
    final GlobalKey? itemKey = _itemKeys[messageId];
    final BuildContext? itemContext = itemKey?.currentContext;
    if (itemContext == null || !_scrollController.hasClients) {
      return null;
    }
    final RenderObject? itemRenderObject = itemContext.findRenderObject();
    final RenderObject? viewportRenderObject = _scrollController
        .position
        .context
        .notificationContext
        ?.findRenderObject();
    if (itemRenderObject is! RenderBox ||
        !itemRenderObject.hasSize ||
        viewportRenderObject is! RenderBox ||
        !viewportRenderObject.hasSize) {
      return null;
    }
    final double itemCenterY =
        itemRenderObject.localToGlobal(Offset.zero).dy +
        itemRenderObject.size.height / 2;
    final double viewportCenterY =
        viewportRenderObject.localToGlobal(Offset.zero).dy +
        viewportRenderObject.size.height / 2;
    return itemCenterY - viewportCenterY;
  }

  /// True when pixels cannot move further in the direction needed to reduce
  /// [signedDrift] (target below center → need content up / +pixels for down).
  bool _isJumpCenteringClamped(double signedDrift) {
    if (!_scrollController.hasClients) {
      return true;
    }
    final ScrollPosition position = _scrollController.position;
    const double edgeEps = 1;
    // AxisDirection.down: increasing pixels moves content up the screen.
    // AxisDirection.up (reverse lists): increasing pixels moves content down.
    final bool increasePixelsMovesContentUp =
        position.axisDirection == AxisDirection.down;
    if (signedDrift > 0) {
      // Target below center: need content to move up.
      return increasePixelsMovesContentUp
          ? position.pixels >= position.maxScrollExtent - edgeEps
          : position.pixels <= position.minScrollExtent + edgeEps;
    }
    // Target above center: need content to move down.
    return increasePixelsMovesContentUp
        ? position.pixels <= position.minScrollExtent + edgeEps
        : position.pixels >= position.maxScrollExtent - edgeEps;
  }

  Future<void> _settleJumpCorrection(
    String messageId,
    int generation,
    Future<void> Function(String messageId) reJump,
  ) async {
    // Watch the full window so late media reflow still re-centers.
    // Elapsed sums awaited delays (fake-async safe), not wall clock.
    try {
      const Duration maxWindow = Duration(milliseconds: 1800);
      Duration elapsed = Duration.zero;
      int pass = 0;

      Future<bool> waitCadence() async {
        if (pass == 0) {
          await WidgetsBinding.instance.endOfFrame;
          return mounted &&
              generation == _bottomJumpGeneration &&
              _scrollController.hasClients;
        }
        final Duration delay = pass < 8
            ? const Duration(milliseconds: 48)
            : pass < 14
            ? const Duration(milliseconds: 100)
            : const Duration(milliseconds: 160);
        final Completer<void> delayDone = Completer<void>();
        _bottomJumpSettleDelay = delayDone;
        _bottomJumpSettleTimer?.cancel();
        _bottomJumpSettleTimer = Timer(delay, () {
          if (!delayDone.isCompleted) {
            delayDone.complete();
          }
          if (identical(_bottomJumpSettleDelay, delayDone)) {
            _bottomJumpSettleDelay = null;
          }
          _bottomJumpSettleTimer = null;
        });
        await delayDone.future;
        elapsed += delay;
        return mounted &&
            generation == _bottomJumpGeneration &&
            _scrollController.hasClients;
      }

      while (elapsed < maxWindow) {
        if (!await waitCadence()) {
          return;
        }

        final double? signedDrift = _jumpCenterSignedDrift(messageId);
        if (signedDrift == null) {
          final double pixelsBefore = _scrollController.position.pixels;
          await reJump(messageId);
          if (!_scrollController.hasClients ||
              (_scrollController.position.pixels - pixelsBefore).abs() < 0.5) {
            return;
          }
          pass++;
          continue;
        }
        if (signedDrift.abs() <= 12) {
          pass++;
          continue;
        }
        if (_isJumpCenteringClamped(signedDrift)) {
          return;
        }
        final double pixelsBefore = _scrollController.position.pixels;
        await reJump(messageId);
        if (!_scrollController.hasClients ||
            (_scrollController.position.pixels - pixelsBefore).abs() < 0.5) {
          return;
        }
        pass++;
      }
    } finally {
      // A newer jump may already own the token.
      final bool naturalCompletion =
          mounted &&
          _activeSettleGeneration == generation &&
          generation == _bottomJumpGeneration;
      if (_activeSettleGeneration == generation) {
        _activeSettleGeneration = null;
      }
      // Cancellation defers the publish to ScrollEnd or the replacement jump.
      if (naturalCompletion) {
        _publishReadViewportAfterJumpSettle();
      }
    }
  }

  void _publishReadViewportAfterJumpSettle() {
    switch (_openMode) {
      case _MessageListOpenMode.unresolved:
        return;
      case _MessageListOpenMode.unread:
        _syncReadViewportCenter();
      case _MessageListOpenMode.bottom:
        _syncReadViewport();
    }
  }

  Future<void> _jumpToMessageCenter(String messageId) {
    final Completer<void> completer = Completer<void>();
    _cancelBottomJumpSettle();
    final int generation = _bottomJumpGeneration;

    void attempt({required int triesLeft}) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted || generation != _bottomJumpGeneration) {
          if (!completer.isCompleted) {
            completer.complete();
          }
          return;
        }
        if (!_scrollController.hasClients ||
            (_leadingSliverCtx == null && _trailingSliverCtx == null)) {
          if (triesLeft > 0) {
            attempt(triesLeft: triesLeft - 1);
            return;
          }
          if (!completer.isCompleted) {
            completer.complete();
          }
          return;
        }
        try {
          await _runCenterJump(messageId);
        } finally {
          if (mounted && generation == _bottomJumpGeneration) {
            _activeSettleGeneration = generation;
          }
          if (!completer.isCompleted) {
            completer.complete();
          }
        }
        if (mounted && generation == _bottomJumpGeneration) {
          unawaited(
            _settleJumpCorrection(messageId, generation, _runCenterJump),
          );
        }
      });
    }

    attempt(triesLeft: 2);
    return completer.future;
  }

  Future<void> _runCenterJump(String messageId) async {
    if (!mounted || !_scrollController.hasClients) {
      return;
    }
    final ChatViewState chatState = ref.read(chatViewModelProvider);
    // Match the open-frame stream split: the list was built with the visual
    // unread anchor, not necessarily stickyUnreadMessageId alone.
    final String? unreadForStream =
        _centerAnchorMessageId ?? chatState.stickyUnreadMessageId;
    final List<ChannelStreamItem> stream = ref.read(
      channelMessageStreamProvider(
        ChannelMessageStreamInput(
          messages: chatState.messages,
          oldestUnreadMessageId: unreadForStream,
        ),
      ),
    );
    final String? anchorId = _centerAnchorMessageId;
    final int splitIndex = anchorId == null
        ? stream.length
        : findChannelStreamSplitIndex(stream, anchorId);
    final loc = _centerSliverLocationForStream(messageId, stream, splitIndex);
    if (loc == null) {
      return;
    }
    _confirmJumpHighlightScroll(messageId);
    // Both center-anchored slivers: plain alignment 0.5 centers the child in
    // the viewport. The half-viewport offset is for reverse:true bottom lists
    // only. Applying it on either side of the unread center overshoots.
    _sliverObserverController.clearScrollIndexCache();
    await _sliverObserverController
        .jumpTo(sliverContext: loc.$1, index: loc.$2, alignment: 0.5)
        .timeout(const Duration(seconds: 2), onTimeout: () {});
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
    // Jumping while unresolved (or without clients) loses the post-frame
    // scroll because the real list is not mounted yet.
    if (_openMode == _MessageListOpenMode.unresolved ||
        !_scrollController.hasClients) {
      _pendingScrollTarget = messageId;
      return;
    }
    // Orphaned unread anchor: demote first so the jump uses the bottom path.
    if (_openMode == _MessageListOpenMode.unread) {
      final String? anchorId = _centerAnchorMessageId;
      final List<Message> messages = ref.read(chatViewModelProvider).messages;
      if (anchorId == null || !messages.any((Message m) => m.id == anchorId)) {
        _pendingScrollTarget = messageId;
        if (_messageJumpInFlight == 0 && _activeSettleGeneration == null) {
          setState(() {
            _convertUnreadOpenToBottom(messages);
          });
        }
        return;
      }
    }
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
    required Set<String> blockedUserIds,
    bool renderDaySeparator = true,
    bool prependUnreadSeparator = false,
  }) {
    final bool isNewDay =
        renderDaySeparator &&
        (previousMessage == null ||
            !_isSameDay(message.timestamp, previousMessage.timestamp));
    final bool isGrouped =
        !message.isSystemMessage &&
        !isNewDay &&
        _shouldGroup(message, previousMessage);
    final bool isJumpHighlighted = message.id == highlightedMessageId;
    final bool isUnreadBoundary =
        !prependUnreadSeparator && message.id == visualUnreadId;
    final bool isAuthorBlocked = blockedUserIds.contains(message.authorId);
    final bool canAddReactionsForMessage =
        channelCanAddReactions && !isAuthorBlocked;
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
      canAddReactionsForMessage,
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
          visualUnreadId: prependUnreadSeparator ? null : visualUnreadId,
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
                      canAddReactions: canAddReactionsForMessage,
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
                      canAddReactions: canAddReactionsForMessage,
                      canManageMessages: channelCanManageMessages,
                      currentUserId: currentUserId,
                    ),
                  )
                : null,
            canAddReactions: canAddReactionsForMessage,
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
        visualUnreadId: prependUnreadSeparator ? null : visualUnreadId,
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
            canAddReactions: canAddReactionsForMessage,
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

  int? _findMessageListChildIndex(Key key, List<ChannelStreamItem> stream) {
    if (key is! ValueKey<String>) {
      return null;
    }
    final String value = key.value;
    const String messagePrefix = 'msg-';
    const String groupPrefix = 'group-';
    if (value.startsWith(messagePrefix)) {
      final String id = value.substring(messagePrefix.length);
      final int? renderIndex = findChannelStreamRenderIndex(stream, id);
      return renderIndex;
    }
    if (value.startsWith(groupPrefix)) {
      final String groupKey = value.substring(groupPrefix.length);
      for (var i = 0; i < stream.length; i++) {
        if (stream[i].groupKey == groupKey) {
          return stream.length - 1 - i;
        }
      }
    }
    return null;
  }

  Widget _buildStreamItem({
    required BuildContext context,
    required List<ChannelStreamItem> stream,
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
    required Set<String> blockedUserIds,
    required String? revealedCollapsedGroupKey,
  }) {
    final ChannelStreamItem item = stream[dataIndex];
    final bool streamOwnsUnreadBoundary =
        item.showUnreadDividerBefore ||
        (dataIndex > 0 && stream[dataIndex - 1].dividerHasUnread);
    switch (item.type) {
      case ChannelStreamType.divider:
        if (item.dividerDate == null) {
          return const SizedBox.shrink();
        }
        if (item.dividerHasUnread) {
          return _buildUnreadDateSeparator(context, item.dividerDate!);
        }
        return _buildDateSeparator(context, item.dividerDate!);
      case ChannelStreamType.messageGroupBlocked:
      case ChannelStreamType.messageGroupSpammer:
        final String? groupKey = item.groupKey;
        final bool isRevealed =
            groupKey != null && revealedCollapsedGroupKey == groupKey;
        final Object signature = (
          item.type,
          item.messages.length,
          isRevealed,
          highlightedMessageId,
        );
        return _tileCache.resolve('group-$groupKey', signature, () {
          return _wrapWithUnreadSeparator(
            context,
            BlockedMessageGroups(
              item: item,
              isRevealed: isRevealed,
              leadingPreviousMessage: resolvePreviousMessageForStreamItem(
                stream,
                dataIndex,
              ),
              onToggle: () {
                if (groupKey == null) {
                  return;
                }
                _chatViewModel.setCollapsedGroupRevealed(groupKey);
                if (_isLiveNearBottom()) {
                  _chatViewModel.scrollToBottom();
                }
              },
              messageBuilder: (Message message, Message? previousMessage) {
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
                  blockedUserIds: blockedUserIds,
                  renderDaySeparator: false,
                  prependUnreadSeparator: streamOwnsUnreadBoundary,
                );
              },
            ),
            show: item.showUnreadDividerBefore,
          );
        });
      case ChannelStreamType.message:
        final Message? message = item.singleMessage;
        if (message == null) {
          return const SizedBox.shrink();
        }
        final Message? previousMessage = resolvePreviousMessageForStreamItem(
          stream,
          dataIndex,
        );
        return _wrapWithUnreadSeparator(
          context,
          _buildMessageTile(
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
            blockedUserIds: blockedUserIds,
            renderDaySeparator: false,
            prependUnreadSeparator: streamOwnsUnreadBoundary,
          ),
          show: item.showUnreadDividerBefore,
        );
    }
  }

  Widget _buildMessageListView({
    required BuildContext context,
    required List<ChannelStreamItem> stream,
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
    required Set<String> blockedUserIds,
    required String? revealedCollapsedGroupKey,
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
            child: NotificationListener<ScrollMetricsNotification>(
              onNotification: _onScrollMetricsNotification,
              child: ListView.builder(
                controller: _scrollController,
                reverse: true,
                scrollCacheExtent: ScrollCacheExtent.pixels(
                  _useCompactScrollCache
                      ? _kMessageListCompactScrollCacheExtent
                      : _kMessageListScrollCacheExtent,
                ),
                padding: const EdgeInsets.only(top: 8),
                physics: chatPhysics,
                itemCount:
                    stream.length + (startOfChannelHeader != null ? 1 : 0),
                addAutomaticKeepAlives: false,
                findChildIndexCallback: (Key key) =>
                    _findMessageListChildIndex(key, stream),
                itemBuilder: (BuildContext context, int renderIndex) {
                  if (startOfChannelHeader != null &&
                      renderIndex == stream.length) {
                    return startOfChannelHeader;
                  }
                  final int dataIndex = stream.length - 1 - renderIndex;
                  return _buildStreamItem(
                    context: context,
                    stream: stream,
                    dataIndex: dataIndex,
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
                    blockedUserIds: blockedUserIds,
                    revealedCollapsedGroupKey: revealedCollapsedGroupKey,
                  );
                },
              ),
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
            bottom: 8,
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

  Widget _centerStreamTile({
    required BuildContext context,
    required List<ChannelStreamItem> stream,
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
    required Set<String> blockedUserIds,
    required String? revealedCollapsedGroupKey,
  }) {
    final ChannelStreamItem item = stream[dataIndex];
    final String keyValue = item.type.isCollapsedGroup
        ? 'group-${item.groupKey}'
        : 'msg-${item.singleMessage?.id ?? dataIndex}';
    return KeyedSubtree(
      key: ValueKey<String>(keyValue),
      child: _buildStreamItem(
        context: context,
        stream: stream,
        dataIndex: dataIndex,
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
        blockedUserIds: blockedUserIds,
        revealedCollapsedGroupKey: revealedCollapsedGroupKey,
      ),
    );
  }

  int? _centerChildIndexForStream(
    Key key,
    List<ChannelStreamItem> stream,
    int startInclusive,
    int endExclusive, {
    required bool reverse,
  }) {
    if (key is! ValueKey<String>) {
      return null;
    }
    final String value = key.value;
    const String messagePrefix = 'msg-';
    const String groupPrefix = 'group-';
    int? dataIndex;
    if (value.startsWith(messagePrefix)) {
      final String id = value.substring(messagePrefix.length);
      dataIndex = findChannelStreamDataIndex(stream, id);
    } else if (value.startsWith(groupPrefix)) {
      final String groupKey = value.substring(groupPrefix.length);
      dataIndex = stream.indexWhere((item) => item.groupKey == groupKey);
      if (dataIndex < 0) {
        dataIndex = null;
      }
    }
    if (dataIndex == null ||
        dataIndex < startInclusive ||
        dataIndex >= endExclusive) {
      return null;
    }
    if (reverse) {
      return endExclusive - 1 - dataIndex;
    }
    return dataIndex - startInclusive;
  }

  (BuildContext, int)? _centerSliverLocationForStream(
    String messageId,
    List<ChannelStreamItem> stream,
    int splitIndex,
  ) {
    final int? dataIndex = findChannelStreamDataIndex(stream, messageId);
    if (dataIndex == null) {
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
    required List<ChannelStreamItem> stream,
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
    required Set<String> blockedUserIds,
    required String? revealedCollapsedGroupKey,
    required bool isLoadingMore,
    required bool isLoadingNewer,
    required Widget? startOfChannelHeader,
  }) {
    final String? anchorId = _centerAnchorMessageId;
    final int splitIndex = anchorId == null
        ? stream.length
        : findChannelStreamSplitIndex(stream, anchorId);
    final bool centered =
        anchorId != null &&
        findChannelStreamDataIndex(stream, anchorId) != null;
    final double anchor = centered ? _kUnreadOpenAnchor : 1.0;
    return Stack(
      fit: StackFit.expand,
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: SliverViewObserver(
            controller: _sliverObserverController,
            sliverContexts: () => [?_leadingSliverCtx, ?_trailingSliverCtx],
            child: NotificationListener<ScrollMetricsNotification>(
              onNotification: _onScrollMetricsNotification,
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
                          return _centerStreamTile(
                            context: context,
                            stream: stream,
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
                            blockedUserIds: blockedUserIds,
                            revealedCollapsedGroupKey:
                                revealedCollapsedGroupKey,
                          );
                        },
                        childCount: splitIndex,
                        findChildIndexCallback: (Key key) =>
                            _centerChildIndexForStream(
                              key,
                              stream,
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
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        _trailingSliverCtx = context;
                        return _centerStreamTile(
                          context: context,
                          stream: stream,
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
                          blockedUserIds: blockedUserIds,
                          revealedCollapsedGroupKey: revealedCollapsedGroupKey,
                        );
                      },
                      childCount: stream.length - splitIndex,
                      findChildIndexCallback: (Key key) =>
                          _centerChildIndexForStream(
                            key,
                            stream,
                            splitIndex,
                            stream.length,
                            reverse: false,
                          ),
                    ),
                  ),
                ],
              ),
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
            bottom: 8,
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
    final String? pendingAutoAckId = ref.watch(
      chatViewModelProvider.select(
        (ChatViewState s) => s.pendingAutoAckMessageId,
      ),
    );
    final String? highlightedMessageId = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.highlightedMessageId),
    );
    final String? revealedCollapsedGroupKey = ref.watch(
      chatViewModelProvider.select(
        (ChatViewState s) => s.revealedCollapsedGroupKey,
      ),
    );
    final Set<String> blockedUserIds = ref.watch(blockedUserIdsProvider);
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
        : ref.watch(messageListReadStateProvider(channelId));
    final drift_db.ReadState? readState = readStateAsync.asData?.value;
    final String? effectiveAckId = readState?.manual ?? false
        ? readState?.lastMessageId
        : compareSnowflakeIds(pendingAutoAckId, readState?.lastMessageId) > 0
        ? pendingAutoAckId
        : readState?.lastMessageId;
    final ChatUnreadSummary unreadSummary = _unreadSummaryFor(
      messages: messages,
      ackLastMessageId: effectiveAckId,
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
    _lastVisualUnreadId = visualUnreadId;
    final List<ChannelStreamItem> channelStream = ref.watch(
      channelMessageStreamProvider(
        ChannelMessageStreamInput(
          messages: messages,
          oldestUnreadMessageId: visualUnreadId,
        ),
      ),
    );
    if (_openMode == _MessageListOpenMode.unresolved &&
        !isLoading &&
        readStateAsync.hasValue) {
      final bool hasJumpTarget =
          widget.targetMessageId != null || _pendingScrollTarget != null;
      final String? anchorId = hasJumpTarget ? null : visualUnreadId;
      final bool canAnchor =
          anchorId != null &&
          findChannelStreamDataIndex(channelStream, anchorId) != null;
      if (canAnchor) {
        _openMode = _MessageListOpenMode.unread;
        _centerAnchorMessageId = anchorId;
        _scheduleUnreadUnderfillFallback();
        _scheduleUnreadViewportSync();
      } else {
        _openMode = _MessageListOpenMode.bottom;
      }
    }
    // Invariant: unread mode ⇒ center anchor present in the current stream.
    _ensureUnreadCenterAnchorInStream(
      stream: channelStream,
      messages: messages,
    );
    // Rebuild on keyboard view-size changes so ScrollMetricsNotification fires.
    MediaQuery.sizeOf(context);
    _syncAnchorBaselineFromBuild(channelStream);
    final int unreadCount = unreadSummary.displayUnreadCount;
    final bool viewportNearTail = ref.watch(
      chatReadViewportProvider.select(
        (ChatReadViewportState s) =>
            s.channelId == channelId && s.nearLoadedTail,
      ),
    );
    final bool liveNearBottom = _isNearLiveTail() || viewportNearTail;
    final bool showUnreadBarEligible = shouldShowUnreadBar(
      hasUnread: unreadCount > 0,
      liveNearBottom: liveNearBottom,
      hasMoreNewerMessages: hasMoreNewerMessages,
      isManualReadState: readState?.manual ?? false,
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

    // Defer until open mode is resolved so this build mounts the real list and
    // the post-frame jump can find scroll clients.
    if (!isLoading &&
        _openMode != _MessageListOpenMode.unresolved &&
        _pendingScrollTarget != null) {
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
              _tileCache.retainKeys(<String>{
                ...messages.map((Message m) => m.id),
                ...channelStream
                    .where(
                      (ChannelStreamItem item) => item.type.isCollapsedGroup,
                    )
                    .map((ChannelStreamItem item) => 'group-${item.groupKey}'),
              });
              body = _openMode == _MessageListOpenMode.unread
                  ? _buildUnreadCenterListView(
                      context: context,
                      stream: channelStream,
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
                      blockedUserIds: blockedUserIds,
                      revealedCollapsedGroupKey: revealedCollapsedGroupKey,
                      isLoadingMore: isLoadingMore,
                      isLoadingNewer: isLoadingNewer,
                      startOfChannelHeader: startOfChannelHeader,
                    )
                  : _buildMessageListView(
                      context: context,
                      stream: channelStream,
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
                      blockedUserIds: blockedUserIds,
                      revealedCollapsedGroupKey: revealedCollapsedGroupKey,
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
