import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding, SchedulerPhase;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/accessibility/domain/message_group_spacing.dart';
import 'package:fluxer_app/features/accessibility/providers/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/chat/data/chat_unread_summary.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/attachment_alt_text_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/delete_message_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/remove_all_reactions_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/system_message_actions_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/animated_image_playback_controller.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/blocked_message_groups.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/channel_welcome_section.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_body.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_demand_source.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_pin.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_placeholder_specs.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_row_motion.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_scroll_metrics.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_scroll_position.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_skeleton.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_unread_review.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_viewport.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_reactions_bar.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_tile_cache.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/system_message.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/chat_wallpaper_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/core/message_pagination_coordinator.dart';
import 'package:fluxer_app/features/chat/providers/messages/channel_spoiler_sync_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/spoiler_reveal_provider.dart';
import 'package:fluxer_app/features/chat/utils/messages/channel_message_stream.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_action_permissions.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_grouping_utils.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_page_sync.dart';
import 'package:fluxer_app/features/chat/utils/messages/pinned_system_message_navigation.dart';
import 'package:fluxer_app/features/chat/wallpaper/chat_wallpaper.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_welcome_section.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/personal_notes_welcome_section.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/input/providers/chat_keybind_effects_provider.dart';
import 'package:fluxer_app/features/input/providers/focused_message_provider.dart';
import 'package:fluxer_app/features/input/providers/keyboard_mode_provider.dart';
import 'package:fluxer_app/features/input/providers/message_keyboard_navigation_provider.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/open_report_flow.dart';
import 'package:fluxer_app/features/moderation/providers/local_user_spam_override_provider.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/threads/presentation/thread_browser_sheet.dart';
import 'package:fluxer_app/features/threads/presentation/thread_messages.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/defer_horizontal_drag_while_coasting.dart';
import 'package:fluxer_app/shared/markdown/message_markdown_settings.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_app/shared/utils/locale_upper_case.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';

part 'message_list_settings_layer.dart';

const _kUnreadDividerHeight = 16.0;
const _kUnreadDateDividerHeight = 20.0;
const _kMessageListScrollCacheExtent = 1200.0;
const _kMessageListCompactScrollCacheExtent = 400.0;
const _kOlderRevealRowsPerFrame = 2;

const double _kMessageListStatusOverlayInsetMobile =
    WideComposerLayout.mobileMessageListTrailingInset;
const double _kMessageListStatusOverlayInsetWide =
    WideComposerLayout.messageListTrailingInset;

const int _kPinnedRecenterTrailingThreshold = 60;

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

// Riverpod does not export the concrete auto-dispose family type.
// ignore: specify_nonobvious_property_types
final _cachedUnreadCountProvider = StreamProvider.autoDispose
    .family<int, ({String channelId, String ackId})>((ref, key) {
      final db = ref.watch(fluxerDatabaseProvider);
      return db.messageDao.watchServerMessageCountAfter(
        key.channelId,
        key.ackId,
      );
    });

const double _kUnreadOpenAnchor = 0.5;

const double _kUnreadOpenTopInset = 32;

const double _kUnreadOpenFillSlop = 32;

const int _kUnreadOpenSettleMaxPasses = 4;

const Duration _kPendingScrollTargetTimeout = Duration(seconds: 6);

const Duration _kDetachedTrimIdleDelay = Duration(seconds: 2);

typedef _AttachedRows = ({
  String id,
  int first,
  int last,
  String firstId,
  double firstTop,
  String lastId,
  double lastBottom,
  double viewportTop,
  double viewportHeight,
});

class MessageList extends ConsumerStatefulWidget {
  const MessageList({
    this.expectedChannelId,
    this.targetMessageId,
    this.visible = true,
    super.key,
  });

  final String? expectedChannelId;

  final String? targetMessageId;

  final bool visible;

  @override
  ConsumerState<MessageList> createState() => _MessageListState();
}

const int _kMaxSimultaneousRowResizes = 2;
const double _kJumpToPresentApproachFraction = 0.75;
const int _kMaxSimultaneousDeleteCollapses = 3;

class _MessageListState extends ConsumerState<MessageList> {
  late final _LiveTailScrollController _scrollController =
      _LiveTailScrollController(holdTrailingEdge: _holdsLiveTailEdge);
  final GlobalKey _unreadCenterKey = GlobalKey();
  late final MessageListDemandSource _demandSource;

  String? _anchorId;
  double _anchorFraction = 1;
  MessageListAnchorEdge _anchorEdge = MessageListAnchorEdge.after;
  int _anchorEpoch = 0;
  bool _anchorResolved = false;
  int _pendingOlderReveal = 0;
  bool _olderRevealScheduled = false;
  String? _olderRevealBoundaryId;
  ChannelStreamIndex _builtStreamIndex = ChannelStreamIndex.empty;
  MessageListViewport? _builtViewport;
  bool _unreadOpenLayout = false;
  bool _unreadOpenSettling = false;
  int _unreadOpenSettlePasses = 0;
  final MessageListPin _pin = MessageListPin();
  final AnimatedImagePlaybackController _animatedImagePlaybackController =
      AnimatedImagePlaybackController(
        maxActiveVideos: kMaxActiveChatAnimatedImages,
      );
  final MessageTileCache _tileCache = MessageTileCache();
  late final ChatViewModel _chatViewModel;
  late final ChatReadViewport _readViewport;
  late String _viewportChannelId;
  bool? _viewportVisible;
  String? _pendingScrollTarget;
  String? _pendingScrollTargetChannelId;
  int? _pendingScrollTargetWindowEpoch;
  Timer? _pendingScrollTargetTimer;
  bool _landAtLatestTailPending = false;
  int _jumpToLatestTicket = 0;
  bool _jumpToLatestInFlight = false;
  String? _lastChannelId;
  ChatUnreadSummary? _cachedUnreadSummary;
  Object? _unreadSummaryKey;
  bool _useCompactScrollCache = true;
  int _lastMessageCount = 0;
  bool _scrollCacheExpansionPending = false;
  bool _messagesWereLoading = false;
  double? _lastViewportDimension;
  double? _lastMinScrollExtent;
  double? _lastMaxScrollExtent;

  bool _userDragActive = false;
  int _activePointers = 0;
  final ValueNotifier<bool> _deferHorizontalWhileCoasting = ValueNotifier<bool>(
    false,
  );
  bool? _deferHorizontalWhileCoastingAfterFrame;
  final _LiveDouble _openPad = _LiveDouble(0);
  bool _settleDeferredForHold = false;
  Timer? _detachedTrimTimer;
  bool _detachedTrimPending = false;
  double _leadingFillerExtent = 0;
  double _trailingFillerExtent = 0;
  MessageListEdgeFiller? _leadingFiller;
  MessageListEdgeFiller? _trailingFiller;
  String? _fillerChannelId;
  bool? _fillerCompact;
  double? _fillerGroupSpacing;
  double? _fillerFontSize;
  bool _followDisarmed = false;
  bool _pinnedTailGlueScheduled = false;
  String? _tailGlueRowId;
  bool _pinnedTailGlueIgnorePin = false;
  bool _tailEdgeHoldSuspended = false;
  bool _liveTailFollowAnimated = false;
  int _suppressPinnedTailReconcileExtentChanges = 0;
  final Map<String, Message> _collapsingMessageSnapshots = <String, Message>{};
  final Map<String, int> _collapsingMessageIndex = <String, int>{};
  final Set<String> _collapsingMessageIds = <String>{};
  final Set<String> _rowResizeMessageIds = <String>{};
  Timer? _rowResizeClearTimer;
  int _tailSettleGeneration = 0;

  void _refreshLiveTailFollowAnimated(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) {
      _liveTailFollowAnimated = false;
      return;
    }
    _liveTailFollowAnimated = !platformReducedMotionOf(ref, context);
  }

  int _uiEpoch = 0;

  late final void Function() _focusNextMessage;
  late final void Function() _focusPreviousMessage;
  late final MessageKeyboardNavigationCoordinator _messageKeyboardNavigation;
  ProviderSubscription<int>? _chatKeybindEffectsSubscription;

  @override
  void initState() {
    super.initState();
    _messageKeyboardNavigation = ref.read(messageKeyboardNavigationProvider);
    _focusNextMessage = () => _focusAdjacentMessage(previous: false);
    _focusPreviousMessage = () => _focusAdjacentMessage(previous: true);
    _messageKeyboardNavigation.register(
      focusNext: _focusNextMessage,
      focusPrevious: _focusPreviousMessage,
    );
    _chatKeybindEffectsSubscription = listenChatKeybindEffects(
      ref,
      _handleChatKeybindEffect,
      where: (ChatKeybindEffect effect) =>
          effect != ChatKeybindEffect.triggerUpload,
    );
    _chatViewModel = ref.read(chatViewModelProvider.notifier);
    _readViewport = ref.read(chatReadViewportProvider.notifier);
    _viewportChannelId =
        widget.expectedChannelId ?? ref.read(chatViewModelProvider).channelId;
    _demandSource = MessageListDemandSource(
      port: ref.read(messagePaginationCoordinatorProvider),
    );
    _scrollController.addListener(_onScroll);
    _setPendingScrollTarget(widget.targetMessageId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _readViewport.setViewportActive(
        channelId: _viewportChannelId,
        isActive: _viewportVisible ?? false,
      );
      _onScroll();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bool? previousVisible = _viewportVisible;
    final bool nextVisible = _isViewportVisible();
    _viewportVisible = nextVisible;
    if (previousVisible != null && previousVisible != nextVisible) {
      _readViewport.setViewportActive(
        channelId: _viewportChannelId,
        isActive: nextVisible,
      );
      if (!nextVisible) {
        _leaveChannelReadSession();
      }
    }
  }

  void _leaveChannelReadSession() {
    _chatViewModel
      ..clearCurrentManualUnread()
      ..clearStickyUnreadAfterBuildForCurrentChannel();
  }

  bool _isViewportVisible() =>
      widget.visible && ChatOnScreenScope.onScreenOf(context);

  @override
  void didUpdateWidget(MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.targetMessageId != oldWidget.targetMessageId &&
        widget.targetMessageId != null) {
      _setPendingScrollTarget(widget.targetMessageId);
    }
    final String nextViewportChannelId =
        widget.expectedChannelId ?? ref.read(chatViewModelProvider).channelId;
    final bool previousVisible = _viewportVisible ?? false;
    final bool nextVisible = _isViewportVisible();
    _viewportVisible = nextVisible;
    if (nextViewportChannelId != _viewportChannelId) {
      final String previousViewportChannelId = _viewportChannelId;
      _viewportChannelId = nextViewportChannelId;
      _cancelDetachedTrim();
      if (previousVisible) {
        _readViewport.setViewportActive(
          channelId: previousViewportChannelId,
          isActive: false,
        );
      }
      if (nextVisible) {
        _readViewport.setViewportActive(
          channelId: _viewportChannelId,
          isActive: true,
        );
      }
    } else if (nextVisible != previousVisible) {
      _readViewport.setViewportActive(
        channelId: _viewportChannelId,
        isActive: nextVisible,
      );
      if (!nextVisible) {
        _leaveChannelReadSession();
      }
    }
  }

  @override
  void dispose() {
    _chatKeybindEffectsSubscription?.close();
    _messageKeyboardNavigation.unregister(
      focusNext: _focusNextMessage,
      focusPrevious: _focusPreviousMessage,
    );
    _detachedTrimTimer?.cancel();
    _rowResizeClearTimer?.cancel();
    _pendingScrollTargetTimer?.cancel();
    _pendingScrollTargetTimer = null;
    _readViewport.setViewportActive(
      channelId: _viewportChannelId,
      isActive: false,
    );
    _chatViewModel.setUserScrollActive(
      channelId: _viewportChannelId,
      active: false,
    );
    _leaveChannelReadSession();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _deferHorizontalWhileCoasting.dispose();
    _openPad.dispose();
    _animatedImagePlaybackController.dispose();
    _pinnedTailGlueScheduled = false;
    _pinnedTailGlueIgnorePin = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _refreshLiveTailFollowAnimated(context);
    ref
      ..listen<List<Message>>(
        chatViewModelProvider.select((ChatViewState s) => s.messages),
        (List<Message>? previous, List<Message> next) {
          final MessagesOrigin? origin = ref
              .read(chatViewModelProvider)
              .writeOriginFor(previous: previous, next: next);
          _armSuppressPinnedTailReconcile(origin);
          if (_advancesNewestRow(previous, next)) {
            _suspendTailEdgeHoldForFrame();
          }
          if (previous != null) {
            final bool motionStateChanged = _applyMessageMotionTransitions(
              previous: previous,
              next: next,
              origin: origin,
            );
            if (motionStateChanged && mounted) {
              setState(() {});
            }
          }
          if (next.isEmpty || next.last.id != _tailGlueRowId) {
            _tailGlueRowId = null;
          }
          if (origin == MessagesOrigin.windowSwap) {
            _uiEpoch++;
            _exposeOlderRowsNow();
          }
          if (origin == MessagesOrigin.olderPage) {
            _beginOlderReveal(previous);
          }
          if (origin == MessagesOrigin.olderPage ||
              origin == MessagesOrigin.newerPage) {
            final PaginationEdge installedEdge =
                origin == MessagesOrigin.olderPage
                ? PaginationEdge.older
                : PaginationEdge.newer;
            final int installEpoch = _uiEpoch;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _runIfSameEpoch(installEpoch, () {
                _publishDemandGeometry();
                _demandSource.forceGeometryRevision(installedEdge);
              });
            });
          }
          final ChatViewState postWrite = ref.read(chatViewModelProvider);
          if (postWrite.hasMoreNewerMessages) {
            _pin.onDetached();
          }
          if (origin == MessagesOrigin.windowSwap &&
              !postWrite.hasMoreNewerMessages &&
              (_landAtLatestTailPending || _shouldRelandLiveTail(next))) {
            final bool animate = _landAtLatestTailPending;
            _landAtLatestTailPending = false;
            _landAtLatestTail(next, animate: animate);
            return;
          }
          if (_anchorResolved) {
            _repairDeletedAnchor(next);
          }
          if (origin == MessagesOrigin.ownSend) {
            _pin.onOwnSend();
            _followDisarmed = false;
          }
          if (_pin.pinned &&
              (origin == MessagesOrigin.liveCreate ||
                  origin == MessagesOrigin.ownSend ||
                  origin == MessagesOrigin.realtimeEvent)) {
            _scheduleLiveTailFollow();
          } else if (_pin.pinned &&
              (origin == MessagesOrigin.localMutation ||
                  origin == MessagesOrigin.realtimeEvent) &&
              _tailAppendedMessageIds(previous, next).isEmpty &&
              previous != null &&
              next.length >= previous.length &&
              _isNearLiveTail()) {
            _schedulePinnedTailGlue();
          }
        },
      )
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
      ..listen<Set<String>>(blockedUserIdsProvider, (
        Set<String>? previous,
        Set<String> next,
      ) {
        if (previous != null && !setEquals(previous, next)) {
          _holdReadingRowAcrossRegroup();
        }
      })
      ..listen<(String, int)?>(
        chatViewModelProvider.select(
          (ChatViewState s) => s.scrollToMessageSignal,
        ),
        ((String, int)? previous, (String, int)? next) {
          if (next != null && next != previous) {
            _onScrollToMessage(next.$1);
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
    final String spoilerChannelId = expectedChannelId ?? channelId;
    if (spoilerChannelId.isNotEmpty) {
      ref.watch(channelSpoilerSyncProvider(spoilerChannelId));
    }
    if (expectedChannelId != null &&
        chatWindowMismatchesChannel(
          expectedChannelId: expectedChannelId,
          channelId: channelId,
          messages: messages,
        )) {
      return MessageListMismatchPlaceholder(channelId: expectedChannelId);
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
    final String? replyingToMessageId = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.replyingTo?.id),
    );
    final String? revealedCollapsedGroupKey = ref.watch(
      chatViewModelProvider.select(
        (ChatViewState s) => s.revealedCollapsedGroupKey,
      ),
    );
    final Set<String> blockedUserIds = ref.watch(blockedUserIdsProvider);
    ref.watch(localUserSpamOverrideProvider.select((state) => state.version));
    final bool hasMoreNewerMessages = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.hasMoreNewerMessages),
    );
    final bool isLoading = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.isLoading),
    );
    final bool isSyncingMessages = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.isSyncingMessages),
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
        : resolveGuildChannel(ref, channelId);
    final int? channelPermissionBits = channelId.isEmpty
        ? null
        : ref.watch(
            channelPermissionCacheProvider.select(
              (ChannelPermissionCaches caches) => caches.effective[channelId],
            ),
          );
    final AsyncValue<drift_db.ReadState?> readStateAsync = channelId.isEmpty
        ? const AsyncValue<drift_db.ReadState?>.data(null)
        : ref.watch(messageListReadStateProvider(channelId));
    final drift_db.ReadState? readState = readStateAsync.asData?.value;
    final bool autoAckImminent =
        channelId.isNotEmpty &&
        !hasMoreNewerMessages &&
        !(readState?.manual ?? false) &&
        ref.watch(
          chatReadViewportProvider.select(
            (ChatReadViewportState viewport) =>
                viewport.channelId == channelId &&
                viewport.nearLoadedTail &&
                viewport.canAutoAck,
          ),
        );
    final String? effectiveAckId = readState?.manual ?? false
        ? readState?.lastMessageId
        : compareSnowflakeIds(pendingAutoAckId, readState?.lastMessageId) > 0
        ? pendingAutoAckId
        : readState?.lastMessageId;
    final int cachedUnreadCount =
        hasMoreNewerMessages &&
            effectiveAckId != null &&
            effectiveAckId.isNotEmpty
        ? ref
                  .watch(
                    _cachedUnreadCountProvider((
                      channelId: channelId,
                      ackId: effectiveAckId,
                    )),
                  )
                  .asData
                  ?.value ??
              0
        : 0;
    final ChatUnreadSummary unreadSummary = _unreadSummaryFor(
      messages: messages,
      ackLastMessageId: effectiveAckId,
      mentionCount: readState?.mentionCount ?? 0,
      channelLastMessageId: _channelLastMessageIdFor(channelId),
      hasMoreNewerMessages: hasMoreNewerMessages,
      hasMoreOlderMessages: hasMoreMessages,
      cachedUnreadCount: cachedUnreadCount,
    );
    final String? oldestUnreadId = unreadSummary.oldestUnreadMessageId;
    final String? visualUnreadId = resolveVisualUnreadId(
      messages: messages.map(
        (Message message) => ChatUnreadMessageRef(id: message.id),
      ),
      stickyUnreadId: stickyUnreadId,
      oldestUnreadId: oldestUnreadId,
    );
    final List<Message> displayMessages = _messagesIncludingCollapsing(
      messages,
    );
    final ({List<ChannelStreamItem> items, ChannelStreamIndex index}) built =
        _channelStreamFor(
          messages: displayMessages,
          oldestUnreadMessageId: visualUnreadId,
          currentUserId: currentUserId,
          blockedUserIds: blockedUserIds,
        );
    final List<ChannelStreamItem> channelStream = built.items;
    final ChannelStreamIndex streamIndex = built.index;
    final String? revealBoundaryId = _olderRevealBoundaryId;
    if (revealBoundaryId != null) {
      _olderRevealBoundaryId = null;
      final int? before = _builtStreamIndex.itemOfMessage(revealBoundaryId);
      final int? after = streamIndex.itemOfMessage(revealBoundaryId);
      final int addedItems = before == null || after == null
          ? 0
          : after - before;
      if (addedItems > _kOlderRevealRowsPerFrame) {
        _pendingOlderReveal = addedItems;
        _scheduleOlderReveal();
      }
    }
    _builtStreamIndex = streamIndex;
    final bool hasJumpTarget =
        widget.targetMessageId != null || _pendingScrollTarget != null;
    if (!_anchorResolved && (!isLoading || messages.isNotEmpty)) {
      if (hasJumpTarget && messages.isEmpty) {
      } else if (readStateAsync.hasValue ||
          (hasJumpTarget && messages.isNotEmpty)) {
        final String? unreadAnchorId = hasJumpTarget ? null : visualUnreadId;
        final bool canAnchorUnread =
            unreadAnchorId != null &&
            streamIndex.itemOfMessage(unreadAnchorId) != null;
        final String? jumpRequestId =
            _pendingScrollTarget ?? widget.targetMessageId;
        final String? jumpAnchorId =
            jumpRequestId != null &&
                jumpTargetWindowSettled(
                  jumpTargetId: jumpRequestId,
                  messageIds: messages.map((Message m) => m.id),
                  hasMoreOlder: hasMoreMessages,
                  hasMoreNewer: hasMoreNewerMessages,
                )
            ? resolveJumpScrollTargetId(
                jumpTargetId: jumpRequestId,
                messageIds: messages.map((Message m) => m.id),
              )
            : null;
        _anchorResolved = true;
        _anchorEpoch++;
        _pin.pinned = false;
        _exposeOlderRowsNow();
        _followDisarmed = false;
        if (canAnchorUnread) {
          _unreadOpenLayout = true;
          _unreadOpenSettling = true;
          _unreadOpenSettlePasses = 0;
          _setUnreadLeadingPad(0);
          _anchorId = unreadAnchorId;
          _anchorFraction = _kUnreadOpenAnchor;
          _anchorEdge = MessageListAnchorEdge.before;
          _scheduleUnreadOpenLayoutPass();
        } else if (jumpAnchorId != null) {
          _anchorId = jumpAnchorId;
          _anchorFraction = _kUnreadOpenAnchor;
          _anchorEdge = MessageListAnchorEdge.before;
          _scheduleUnderfillBottomReanchor();
          _scheduleJumpHighlightConfirm(jumpRequestId!);
        } else {
          _anchorId = messages.isEmpty ? null : messages.last.id;
          _anchorFraction = 1;
          _anchorEdge = MessageListAnchorEdge.after;
          if (!hasMoreNewerMessages) {
            _pin.onJumpToPresentLanded();
            _scrollController.armedInitialOffset = _statusOverlayInset;
          }
        }
        _expandScrollCacheNow();
        _scheduleBottomViewportSync();
      }
    }
    if (!isLoading && _messagesWereLoading && _anchorResolved) {
      _scheduleBottomViewportSync();
    }
    _messagesWereLoading = isLoading;
    if (_anchorResolved) {
      final int scheduledEpoch = _uiEpoch;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _uiEpoch == scheduledEpoch) {
          _publishDemandGeometry();
          if (messages.isEmpty) {
            _syncReadViewport();
          }
        }
      });
    }
    MediaQuery.sizeOf(context);
    final int unreadCount = unreadSummary.displayUnreadCount;
    final DateTime? unreadSince =
        _messageTimestamp(messages, visualUnreadId) ??
        (effectiveAckId == null
            ? null
            : dateTimeFromUserSnowflakeOrNull(effectiveAckId));
    final int chatFontSize = ref.watch(
      themePreferenceProvider.select(
        (ThemePreferenceState s) => s.chatFontSize,
      ),
    );

    if (messages.isEmpty) {
      _tileCache.clear();
    }

    if (!isLoading && _anchorResolved && _pendingScrollTarget != null) {
      final String target = _pendingScrollTarget!;
      final int windowEpoch = ref.read(chatViewModelProvider).windowEpoch;
      final bool windowUpdatedSincePark =
          _pendingScrollTargetWindowEpoch != null &&
          windowEpoch != _pendingScrollTargetWindowEpoch;
      final bool targetLoaded = messages.any(
        (Message message) => message.id == target,
      );
      final String? scrollId = targetLoaded
          ? target
          : windowUpdatedSincePark
          ? resolveJumpScrollTargetId(
              jumpTargetId: target,
              messageIds: messages.map((Message m) => m.id),
            )
          : null;
      if (scrollId != null) {
        _clearPendingScrollTarget();
        talker.debug(
          '[MessageList] consume pending target $target'
          '${scrollId == target ? '' : ' via neighbour $scrollId'}',
        );
        _pin.pinned = false;
        _unreadOpenLayout = false;
        _setUnreadLeadingPad(0);
        _anchorId = scrollId;
        _anchorFraction = _kUnreadOpenAnchor;
        _anchorEdge = MessageListAnchorEdge.before;
        _anchorEpoch++;
        _uiEpoch++;
        _exposeOlderRowsNow();
        _demandSource.resetApproachVelocity();
        _scheduleAnchorCenterCorrection(scrollId);
        _scheduleUnderfillBottomReanchor();
        _scheduleJumpHighlightConfirm(target);
      } else if (messageLoadFailed) {
        talker.debug(
          '[MessageList] pending target $target dropped: load failed',
        );
        _clearPendingScrollTarget();
      } else if (windowUpdatedSincePark && messages.isNotEmpty) {
        talker.debug(
          '[MessageList] pending target $target not in ${messages.length} '
          'messages',
        );
      }
    }

    final bool showChannelWelcome = shouldShowChannelWelcome(
      hasMoreOlderMessages: hasMoreMessages,
      messageLoadFailed: messageLoadFailed,
    );
    final Widget? startOfChannelHeader = showChannelWelcome
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
            String? guildId, {
            required bool isGuildSendDisabled,
            required ({
              bool canSendMessages,
              bool canAddReactions,
              bool canPinMessage,
              bool canManageMessages,
            })
            channelActions,
          }) {
            final bool unreadOpenSettling =
                _unreadOpenSettling && _unreadOpenLayout;
            final Widget body;
            if (messages.isEmpty &&
                (isLoading || (!_anchorResolved && hasJumpTarget))) {
              body = MessageListSkeleton(channelId: channelId);
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
                        style: context.textStyles.bodyMedium.copyWith(
                          color: context.colors.textPrimaryMuted,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Be the first to send a message!',
                        style: context.textStyles.bodySmall.copyWith(
                          color: context.colors.textTertiaryMuted,
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
              _refreshFillers(
                channelId: channelId,
                compact: messageRenderSettings.messageDisplayCompact,
                groupSpacing: messageRenderSettings.messageGroupSpacing,
                fontSize: chatFontSize.toDouble(),
              );
              final MessageListEdgeFiller? leadingFiller = hasMoreMessages
                  ? _leadingFiller
                  : null;
              final MessageListEdgeFiller? trailingFiller = hasMoreNewerMessages
                  ? _trailingFiller
                  : null;
              _leadingFillerExtent = leadingFiller?.specs.totalHeight ?? 0;
              _trailingFillerExtent = trailingFiller?.specs.totalHeight ?? 0;
              final Widget list = AnimatedImagePlaybackScope(
                controller: _animatedImagePlaybackController,
                child: ListenableBuilder(
                  listenable: _deferHorizontalWhileCoasting,
                  builder: (BuildContext context, Widget? child) {
                    return DeferHorizontalDragWhileCoasting(
                      defer: _deferHorizontalWhileCoasting.value,
                      child: child!,
                    );
                  },
                  child: _builtViewport = MessageListViewport(
                    anchorEpoch: _anchorEpoch,
                    withheldLeadingCount: _pendingOlderReveal,
                    stream: channelStream,
                    anchorId: _anchorId,
                    anchorFraction: _anchorFraction,
                    anchorEdge: _anchorEdge,
                    controller: _scrollController,
                    leadingFiller: leadingFiller,
                    trailingFiller: trailingFiller,
                    centerKey: _unreadCenterKey,
                    itemBuilder: (BuildContext context, int dataIndex) =>
                        _centerStreamTile(
                          context: context,
                          stream: channelStream,
                          dataIndex: dataIndex,
                          visualUnreadId: visualUnreadId,
                          highlightedMessageId: highlightedMessageId,
                          replyingToMessageId: replyingToMessageId,
                          currentUserId: currentUserId,
                          isDmChannel: isDmChannel,
                          guildId: guildId,
                          channelPermissionBits: channelPermissionBits,
                          channelCanSendMessages:
                              channelActions.canSendMessages,
                          channelCanAddReactions:
                              channelActions.canAddReactions,
                          channelCanPinMessage: channelActions.canPinMessage,
                          channelCanManageMessages:
                              channelActions.canManageMessages,
                          renderSettings: messageRenderSettings,
                          blockedUserIds: blockedUserIds,
                          revealedCollapsedGroupKey: revealedCollapsedGroupKey,
                          isGuildSendDisabled: isGuildSendDisabled,
                        ),
                    childIndexForKey:
                        (
                          Key key,
                          int startInclusive,
                          int endExclusive, {
                          required bool reverse,
                        }) => _centerChildIndexForStream(
                          key,
                          channelStream,
                          streamIndex,
                          startInclusive,
                          endExclusive,
                          reverse: reverse,
                        ),
                    scrollCacheExtentPixels: _useCompactScrollCache
                        ? _kMessageListCompactScrollCacheExtent
                        : _kMessageListScrollCacheExtent,
                    onScrollNotification: _onScrollNotification,
                    onScrollMetricsNotification: _onScrollMetricsNotification,
                    isLoadingMore: isLoadingMore,
                    isLoadingNewer: isLoadingNewer,
                    onPointerDown: _onViewportPointerDown,
                    onPointerUp: _onViewportPointerUp,
                    trailingInset: _statusOverlayInset,
                    liveLeadingPad: _unreadOpenLayout ? _openPad : null,
                    startOfChannelHeader: startOfChannelHeader,
                  ),
                ),
              );
              body = Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Opacity(opacity: unreadOpenSettling ? 0 : 1, child: list),
                  if (unreadOpenSettling)
                    MessageListSkeleton(channelId: channelId),
                ],
              );
            }

            final double scaleRatio = chatFontSize / 16.0;
            final bool showUnreadBar =
                !isLoading &&
                messages.isNotEmpty &&
                unreadCount > 0 &&
                !unreadOpenSettling &&
                !autoAckImminent;
            final bool showLoadErrorBar =
                messageLoadFailed && messages.isNotEmpty;
            final bool loadErrorRetryInFlight =
                isLoadingMore || isLoadingNewer || isSyncingMessages;
            return MessageMarkdownSettingsScope(
              settings: messageRenderSettings.markdown,
              child: MessageListOverlay(
                body: MessageListBody(child: body),
                showUnreadBar: showUnreadBar,
                unreadCount: unreadCount,
                isEstimated: unreadSummary.isEstimated,
                unreadSince: unreadSince,
                onJumpToUnread: _onUnreadBarJump,
                onMarkRead: _onUnreadBarMarkRead,
                showLoadErrorBar: showLoadErrorBar,
                loadErrorRetryInFlight: loadErrorRetryInFlight,
                onRetryLoadMessages: () => unawaited(
                  ref
                      .read(chatViewModelProvider.notifier)
                      .retryFailedMessages(),
                ),
                scaleRatio: scaleRatio,
              ),
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

  void _handleChatKeybindEffect(ChatKeybindEffect effect) {
    if (!mounted) {
      return;
    }
    switch (effect) {
      case ChatKeybindEffect.scrollPageUp:
        _scrollByPage(up: true);
      case ChatKeybindEffect.scrollPageDown:
        _scrollByPage(up: false);
      case ChatKeybindEffect.togglePins:
        requestOpenChannelPins(ref);
      case ChatKeybindEffect.addReaction:
        _openReactionPickerForFocusedMessage();
      case ChatKeybindEffect.triggerUpload:
        break;
    }
  }

  void _openReactionPickerForFocusedMessage() {
    final Message? message = lookupFocusedMessage(
      ref.read(focusedMessageProvider),
      ref.read(chatViewModelProvider).messages,
    );
    if (message == null || !context.mounted) {
      return;
    }
    unawaited(
      openReactionPickerSheet(
        context,
        channelId: message.channelId,
        onEmojiSelected: (FluxerSelectedEmoji emoji) {
          dispatchSelectedEmojiReaction(
            emoji,
            (String emoji, {String? emojiId, bool animated = false}) => ref
                .read(chatViewModelProvider.notifier)
                .toggleReaction(
                  message.id,
                  emoji,
                  emojiId: emojiId,
                  animated: animated,
                ),
          );
        },
      ),
    );
  }

  void _scrollByPage({required bool up}) {
    if (!_scrollController.hasClients) {
      return;
    }
    final double delta = _scrollController.position.viewportDimension * 0.85;
    final double target = (_scrollController.offset + (up ? -delta : delta))
        .clamp(
          _scrollController.position.minScrollExtent,
          _scrollController.position.maxScrollExtent,
        );
    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  void _focusAdjacentMessage({required bool previous}) {
    final List<Message> messages = ref
        .read(chatViewModelProvider)
        .messages
        .where((Message message) => !message.isSystemMessage)
        .toList();
    if (messages.isEmpty) {
      return;
    }
    final String? currentId = ref.read(focusedMessageProvider).messageId;
    var index = messages.indexWhere(
      (Message message) => message.id == currentId,
    );
    if (index < 0) {
      index = previous ? messages.length - 1 : 0;
    } else {
      final int nextIndex = previous ? index - 1 : index + 1;
      if (nextIndex < 0 || nextIndex >= messages.length) {
        return;
      }
      index = nextIndex;
    }
    final Message target = messages[index];
    if (target.id == currentId) {
      return;
    }
    ref.read(keyboardModeProvider.notifier).enter();
    ref
        .read(focusedMessageProvider.notifier)
        .focus(messageId: target.id, channelId: target.channelId);
    _ensureMessageVisibleForKeyboardNav(target.id);
  }

  void _ensureMessageVisibleForKeyboardNav(String messageId) {
    if (!_anchorResolved || !_scrollController.hasClients) {
      _chatViewModel.scrollToMessage(messageId);
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final BuildContext? itemContext = _findStreamTileContext(messageId);
      if (itemContext == null || !itemContext.mounted) {
        _chatViewModel.scrollToMessage(messageId);
        return;
      }
      final RenderObject? renderObject = itemContext.findRenderObject();
      if (renderObject is! RenderBox || !renderObject.hasSize) {
        return;
      }
      final ScrollPosition position = _scrollController.position;
      final RenderAbstractViewport viewport = RenderAbstractViewport.of(
        renderObject,
      );
      final double itemTop = viewport.getOffsetToReveal(renderObject, 0).offset;
      final double itemBottom = viewport
          .getOffsetToReveal(renderObject, 1)
          .offset;
      final double viewTop = position.pixels;
      final double viewBottom = viewTop + position.viewportDimension;
      const double margin = 72;

      double? targetOffset;
      if (itemTop < viewTop + margin) {
        targetOffset = itemTop - margin;
      } else if (itemBottom > viewBottom - margin) {
        targetOffset = itemBottom - position.viewportDimension + margin;
      }
      if (targetOffset == null) {
        return;
      }
      unawaited(
        position.animateTo(
          targetOffset.clamp(
            position.minScrollExtent,
            position.maxScrollExtent,
          ),
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOutCubic,
        ),
      );
    });
  }

  void _runIfSameEpoch(int scheduledEpoch, VoidCallback fn) {
    if (mounted && scheduledEpoch == _uiEpoch) {
      fn();
    }
  }

  void _beginOlderReveal(List<Message>? previous) {
    _exposeOlderRowsNow();
    if (previous == null ||
        previous.isEmpty ||
        !ref.read(chatViewModelProvider).hasMoreMessages) {
      return;
    }
    _olderRevealBoundaryId = previous.first.id;
  }

  void _scheduleOlderReveal() {
    if (_olderRevealScheduled) {
      return;
    }
    _olderRevealScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _olderRevealScheduled = false;
      if (!mounted || _pendingOlderReveal == 0) {
        return;
      }
      final int remaining = _pendingOlderReveal - _kOlderRevealRowsPerFrame;
      setState(() {
        _pendingOlderReveal = remaining < 0 ? 0 : remaining;
      });
      if (_pendingOlderReveal > 0) {
        _scheduleOlderReveal();
      } else {
        _publishDemandGeometry();
      }
    });
  }

  void _exposeOlderRowsNow() {
    _pendingOlderReveal = 0;
    _olderRevealBoundaryId = null;
  }

  void _refreshFillers({
    required String channelId,
    required bool compact,
    required double groupSpacing,
    required double fontSize,
  }) {
    if (_leadingFiller != null &&
        _fillerChannelId == channelId &&
        _fillerCompact == compact &&
        _fillerGroupSpacing == groupSpacing &&
        _fillerFontSize == fontSize) {
      return;
    }
    _fillerChannelId = channelId;
    _fillerCompact = compact;
    _fillerGroupSpacing = groupSpacing;
    _fillerFontSize = fontSize;
    _leadingFiller = MessageListEdgeFiller(
      key: const ValueKey<String>('edge-filler-older'),
      specs: buildMessageListPlaceholderSpecs(
        seedKey: '$channelId|older',
        compact: compact,
        groupSpacing: groupSpacing,
        fontSize: fontSize,
      ),
      alignment: Alignment.bottomCenter,
    );
    _trailingFiller = MessageListEdgeFiller(
      key: const ValueKey<String>('edge-filler-newer'),
      specs: buildMessageListPlaceholderSpecs(
        seedKey: '$channelId|newer',
        compact: compact,
        groupSpacing: groupSpacing,
        fontSize: fontSize,
      ),
      alignment: Alignment.topCenter,
    );
  }

  void _setUnreadLeadingPad(double next, {bool notify = false}) {
    _openPad.update(next, notify: notify);
  }

  void _reanchor(
    String? anchorId,
    double fraction, {
    required MessageListAnchorEdge edge,
    bool rebase = false,
  }) {
    if (!rebase && fraction >= 1.0 && edge == MessageListAnchorEdge.after) {
      _scrollController.armedInitialOffset = _statusOverlayInset;
    }
    setState(() {
      _anchorId = anchorId;
      _anchorFraction = fraction;
      _anchorEdge = edge;
      _anchorEpoch++;
      _exposeOlderRowsNow();
      _uiEpoch++;
      if (!rebase) {
        _unreadOpenLayout = false;
        _setUnreadLeadingPad(0);
      }
    });
    _demandSource.resetApproachVelocity();
    if (!rebase && anchorId != null && fraction < 1.0) {
      _scheduleAnchorCenterCorrection(anchorId);
      _scheduleUnderfillBottomReanchor();
    }
  }

  void _scheduleAnchorCenterCorrection(String anchorId) {
    final int epoch = _uiEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _runIfSameEpoch(epoch, () {
        final RenderBox? box = _streamTileBox(anchorId);
        if (box == null) {
          return;
        }
        final double half = box.size.height / 2;
        if (half <= 0.5) {
          return;
        }
        final ScrollPosition position = _scrollController.position;
        final double corrected = _anchorEdge == MessageListAnchorEdge.before
            ? position.pixels + half
            : position.pixels - half;
        position.jumpTo(
          corrected.clamp(position.minScrollExtent, position.maxScrollExtent),
        );
      });
    });
  }

  String _streamTileKeyFor(String messageId) {
    final String? groupKey = _builtStreamIndex.groupOfMessage(messageId);
    return groupKey == null ? 'msg-$messageId' : 'group-$groupKey';
  }

  RenderBox? _streamTileBox(String messageId) {
    final String target = _streamTileKeyFor(messageId);
    RenderBox? found;
    _forEachStreamTile((String keyValue, Element element) {
      if (keyValue != target) {
        return false;
      }
      final RenderObject? renderObject = element.renderObject;
      if (renderObject is RenderBox && renderObject.hasSize) {
        found = renderObject;
        return true;
      }
      return false;
    });
    return found;
  }

  Map<String, RenderBox> _streamTileBoxes(List<String> messageIds) {
    if (messageIds.isEmpty) {
      return const <String, RenderBox>{};
    }
    final Map<String, List<String>> remaining = <String, List<String>>{};
    for (final String id in messageIds) {
      (remaining[_streamTileKeyFor(id)] ??= <String>[]).add(id);
    }
    final Map<String, RenderBox> found = <String, RenderBox>{};
    _forEachStreamTile((String keyValue, Element element) {
      final List<String>? ids = remaining[keyValue];
      final RenderObject? renderObject = element.renderObject;
      if (ids != null && renderObject is RenderBox && renderObject.hasSize) {
        for (final String id in ids) {
          found[id] = renderObject;
        }
        remaining.remove(keyValue);
      }
      return remaining.isEmpty;
    });
    return found;
  }

  BuildContext? _findStreamTileContext(String messageId) {
    final String target = _streamTileKeyFor(messageId);
    BuildContext? found;
    _forEachStreamTile((String keyValue, Element element) {
      if (keyValue == target) {
        found = element;
        return true;
      }
      return false;
    });
    return found;
  }

  bool _forEachStreamTile(
    bool Function(String keyValue, Element element) visit,
  ) {
    if (!_scrollController.hasClients) {
      return false;
    }
    final BuildContext? root =
        _scrollController.position.context.notificationContext;
    if (root == null) {
      return false;
    }
    var done = false;
    void visitor(Element element) {
      if (done) {
        return;
      }
      final Key? key = element.widget.key;
      if (key is ValueKey<String>) {
        final String value = key.value;
        if (value.startsWith('msg-') ||
            value.startsWith('group-') ||
            value.startsWith('divider-')) {
          done = visit(value, element);
          return;
        }
      }
      element.visitChildren(visitor);
    }

    root.visitChildElements(visitor);
    return done;
  }

  void _scheduleUnderfillBottomReanchor() {
    final int epoch = _uiEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _runIfSameEpoch(epoch, () {
        if (_unreadOpenLayout ||
            !_scrollController.hasClients ||
            _anchorId == null ||
            _anchorFraction >= 1.0) {
          return;
        }
        final ChatViewState state = ref.read(chatViewModelProvider);
        if (state.hasMoreNewerMessages) {
          return;
        }
        final ScrollPosition position = _scrollController.position;
        if (position.maxScrollExtent > 0 ||
            position.pixels < position.maxScrollExtent - 0.5) {
          return;
        }
        final List<Message> messages = state.messages;
        _followDisarmed = false;
        _pin.onJumpToPresentLanded();
        _reanchor(
          messages.isEmpty ? null : messages.last.id,
          1,
          edge: MessageListAnchorEdge.after,
        );
      });
    });
  }

  void _scheduleUnreadOpenLayoutPass() {
    final int epoch = _uiEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final bool rescheduled = epoch == _uiEpoch && _applyUnreadOpenLayout();
      _unreadOpenSettlePasses++;
      if (!rescheduled ||
          _unreadOpenSettlePasses >= _kUnreadOpenSettleMaxPasses) {
        _finishUnreadOpenSettle();
      }
    });
  }

  void _finishUnreadOpenSettle() {
    if (_unreadOpenSettling) {
      setState(() => _unreadOpenSettling = false);
    }
    _syncReadViewport();
  }

  void _pinWhenRestingAtLiveTail({
    required double distanceFromLiveTail,
    required bool hasMoreNewerMessages,
  }) {
    if (hasMoreNewerMessages ||
        _unreadOpenSettling ||
        _isUserDrivenScroll ||
        distanceFromLiveTail > kMessageListPinEngageDistance) {
      return;
    }
    _followDisarmed = false;
    _pin.onJumpToPresentLanded();
  }

  bool _applyUnreadOpenLayout() {
    if (!_unreadOpenLayout ||
        _anchorId == null ||
        !_scrollController.hasClients) {
      return false;
    }
    final ChatViewState state = ref.read(chatViewModelProvider);
    final String firstUnreadId = _anchorId!;
    final String? newestId = state.messages.isEmpty
        ? null
        : state.messages.last.id;
    final Map<String, RenderBox> tiles = _streamTileBoxes(<String>[
      firstUnreadId,
      if (newestId != null && newestId != firstUnreadId) newestId,
    ]);
    final RenderBox? firstUnread = tiles[firstUnreadId];
    if (firstUnread == null) {
      return false;
    }
    final RenderAbstractViewport? abstractViewport =
        RenderAbstractViewport.maybeOf(firstUnread);
    if (abstractViewport is! RenderViewport || !abstractViewport.hasSize) {
      return false;
    }
    final RenderViewport viewport = abstractViewport;
    final RenderBox? newest = newestId == null || newestId == firstUnreadId
        ? firstUnread
        : tiles[newestId];
    final double firstUnreadTop = firstUnread.localToGlobal(Offset.zero).dy;
    final double viewportTop = viewport.localToGlobal(Offset.zero).dy;
    final double viewportHeight = viewport.size.height;
    final double trailingBottom = newest == null
        ? firstUnreadTop + firstUnread.size.height
        : newest.localToGlobal(Offset(0, newest.size.height)).dy;
    final double filledBelow =
        (trailingBottom - firstUnreadTop).clamp(0, viewportHeight) +
        _statusOverlayInset;
    final double nextFraction = _unreadOpenFraction(
      newestLaidOut: newest != null,
      hasMoreNewer: state.hasMoreNewerMessages,
      filledBelow: filledBelow,
      viewportHeight: viewportHeight,
      currentFraction: _anchorFraction,
    );
    if ((nextFraction - _anchorFraction).abs() * viewportHeight > 1) {
      _anchorFraction = nextFraction;
      viewport.anchor = nextFraction;
      _scheduleUnreadOpenLayoutPass();
      return true;
    }
    final double currentPad = _openPad.value;
    final double nextLeadingPad = _unreadOpenLeadingPad(
      currentPad: currentPad,
      fraction: _anchorFraction,
      firstUnreadTop: firstUnreadTop,
      viewportTop: viewportTop,
      viewportHeight: viewportHeight,
    );
    if ((nextLeadingPad - currentPad).abs() <= 0.5) {
      return false;
    }
    _setUnreadLeadingPad(nextLeadingPad, notify: true);
    _scheduleUnreadOpenLayoutPass();
    return true;
  }

  double _unreadOpenFraction({
    required bool newestLaidOut,
    required bool hasMoreNewer,
    required double filledBelow,
    required double viewportHeight,
    required double currentFraction,
  }) {
    if (hasMoreNewer) {
      return _kUnreadOpenAnchor;
    }
    if (!newestLaidOut) {
      return currentFraction;
    }
    final double lowerHalf = viewportHeight * (1 - _kUnreadOpenAnchor);
    if (filledBelow >= lowerHalf - _kUnreadOpenFillSlop) {
      return currentFraction > _kUnreadOpenAnchor + 0.02
          ? currentFraction
          : _kUnreadOpenAnchor;
    }
    return (1.0 - filledBelow / viewportHeight).clamp(_kUnreadOpenAnchor, 1.0);
  }

  double _unreadOpenLeadingPad({
    required double currentPad,
    required double fraction,
    required double firstUnreadTop,
    required double viewportTop,
    required double viewportHeight,
  }) {
    final double maxPad = viewportHeight * _kUnreadOpenAnchor;
    var pad = 0.0;
    if (fraction <= _kUnreadOpenAnchor + 0.02) {
      pad = currentPad;
      final double delta =
          firstUnreadTop - (viewportTop + viewportHeight * fraction);
      if (delta.abs() > 24) {
        pad = (pad - delta).clamp(0, maxPad);
      }
    }
    final double minTop = viewportTop + _kUnreadOpenTopInset;
    if (firstUnreadTop < minTop - 0.5) {
      pad = (pad + (minTop - firstUnreadTop)).clamp(0, maxPad);
    }
    return pad;
  }

  void _onScroll() {
    _syncCoastingDefer();
    if (!_anchorResolved) {
      return;
    }
    if (_scrollController.hasClients) {
      _lastViewportDimension ??= _scrollController.position.viewportDimension;
    }
    if (_tailFollowOwnsScroll()) {
      return;
    }
    _publishDemandGeometry();
    _signalFillerEntry();
    _syncReadViewport();
  }

  bool _tailFollowOwnsScroll() {
    if (!_scrollController.hasClients) {
      return false;
    }
    final ScrollPosition position = _scrollController.position;
    return position is MessageListScrollPosition && position.isFollowingTail;
  }

  List<String> _tailAppendedMessageIds(
    List<Message>? previous,
    List<Message> next,
  ) {
    if (previous == null || next.isEmpty || next.length <= previous.length) {
      return const <String>[];
    }
    for (int index = 0; index < previous.length; index++) {
      if (previous[index].id != next[index].id) {
        return const <String>[];
      }
    }
    return next
        .sublist(previous.length)
        .map((Message message) => message.id)
        .toList();
  }

  bool _shouldFollowPinnedTailAppend(List<Message> messages, String newestId) {
    final String? anchor = _anchorId;
    if (!_anchorResolved ||
        !_parkedAtLiveTail ||
        anchor == null ||
        anchor == newestId) {
      return false;
    }
    final int anchorIndex = messages.indexWhere(
      (Message message) => message.id == anchor,
    );
    return anchorIndex >= 0 && anchorIndex + 1 == messages.length - 1;
  }

  void _scheduleLiveTailFollow() {
    _refreshLiveTailFollowAnimated(context);
    final List<Message> messages = ref.read(chatViewModelProvider).messages;
    if (messages.isNotEmpty) {
      _tailGlueRowId = messages.last.id;
    }
    _schedulePinnedTailGlue();
  }

  void _armSuppressPinnedTailReconcile(MessagesOrigin? origin) {
    if (origin == MessagesOrigin.liveCreate ||
        origin == MessagesOrigin.ownSend ||
        origin == MessagesOrigin.realtimeEvent) {
      return;
    }
    _suppressPinnedTailReconcileExtentChanges += 2;
  }

  bool _shouldAnimateMessageRemoval(MessagesOrigin? origin) {
    if (!_liveTailFollowAnimated) {
      return false;
    }
    return origin == MessagesOrigin.localMutation ||
        origin == MessagesOrigin.realtimeEvent;
  }

  bool _applyMessageMotionTransitions({
    required List<Message> previous,
    required List<Message> next,
    required MessagesOrigin? origin,
  }) {
    _refreshLiveTailFollowAnimated(context);
    final bool removals = _trackMessageRemovals(
      previous: previous,
      next: next,
      origin: origin,
    );
    final bool resizes = _trackRowResizeAnimations(
      previous: previous,
      next: next,
      origin: origin,
    );
    return removals || resizes;
  }

  bool _trackMessageRemovals({
    required List<Message> previous,
    required List<Message> next,
    required MessagesOrigin? origin,
  }) {
    if (!_shouldAnimateMessageRemoval(origin) ||
        previous.length <= next.length) {
      return false;
    }
    final Set<String> nextIds = next.map((Message m) => m.id).toSet();
    final List<(int index, Message message)> removed = <(int, Message)>[];
    for (int index = 0; index < previous.length; index++) {
      final Message message = previous[index];
      if (!nextIds.contains(message.id)) {
        removed.add((index, message));
      }
    }
    if (removed.isEmpty || removed.length > _kMaxSimultaneousDeleteCollapses) {
      return false;
    }
    for (final (int index, Message message) in removed) {
      _collapsingMessageSnapshots[message.id] = message;
      _collapsingMessageIndex[message.id] = index;
      _collapsingMessageIds.add(message.id);
    }
    return true;
  }

  bool _trackRowResizeAnimations({
    required List<Message> previous,
    required List<Message> next,
    required MessagesOrigin? origin,
  }) {
    if (!_liveTailFollowAnimated) {
      return false;
    }
    bool tracked = false;
    if (next.length > previous.length &&
        (origin == MessagesOrigin.liveCreate ||
            origin == MessagesOrigin.ownSend ||
            origin == MessagesOrigin.realtimeEvent)) {
      final List<String> appendedIds = _tailAppendedMessageIds(previous, next);
      if (appendedIds.length == 1 &&
          _rowResizeMessageIds.add(appendedIds.single)) {
        tracked = true;
      }
    }
    if (origin != MessagesOrigin.localMutation &&
        origin != MessagesOrigin.realtimeEvent) {
      if (tracked) {
        _armRowResizeClear();
      }
      return tracked;
    }
    final Map<String, Message> previousById = <String, Message>{
      for (final Message message in previous) message.id: message,
    };
    final List<String> changedIds = <String>[];
    for (final Message message in next) {
      final Message? prior = previousById[message.id];
      if (prior == null || prior.isRenderEquivalent(message)) {
        continue;
      }
      changedIds.add(message.id);
    }
    if (changedIds.length > _kMaxSimultaneousRowResizes) {
      return tracked;
    }
    for (final String id in changedIds) {
      if (_rowResizeMessageIds.add(id)) {
        tracked = true;
      }
    }
    if (tracked) {
      _armRowResizeClear();
    }
    return tracked;
  }

  void _clearRowResizeMessageIds() {
    _rowResizeMessageIds.clear();
  }

  void _armRowResizeClear() {
    _rowResizeClearTimer?.cancel();
    _rowResizeClearTimer = Timer(kMessageListLiveTailMotionDuration, () {
      _rowResizeClearTimer = null;
      if (!mounted || _rowResizeMessageIds.isEmpty) {
        return;
      }
      setState(_clearRowResizeMessageIds);
    });
  }

  void _finishMessageCollapse(String messageId) {
    _collapsingMessageIds.remove(messageId);
    _collapsingMessageSnapshots.remove(messageId);
    _collapsingMessageIndex.remove(messageId);
    _rowResizeMessageIds.remove(messageId);
    if (mounted) {
      setState(() {});
    }
    if (_pin.pinned && _isNearLiveTail()) {
      _schedulePinnedTailGlue();
    }
  }

  List<Message> _messagesIncludingCollapsing(List<Message> messages) {
    if (_collapsingMessageSnapshots.isEmpty) {
      return messages;
    }
    final Set<String> presentIds = messages.map((Message m) => m.id).toSet();
    final List<String> ghostIds =
        _collapsingMessageSnapshots.keys
            .where((String id) => !presentIds.contains(id))
            .toList()
          ..sort(
            (String a, String b) => (_collapsingMessageIndex[a] ?? 0).compareTo(
              _collapsingMessageIndex[b] ?? 0,
            ),
          );
    if (ghostIds.isEmpty) {
      return messages;
    }
    final List<Message> merged = List<Message>.from(messages);
    for (final String id in ghostIds) {
      final Message ghost = _collapsingMessageSnapshots[id]!;
      final int index = (_collapsingMessageIndex[id] ?? merged.length).clamp(
        0,
        merged.length,
      );
      merged.insert(index, ghost);
    }
    return merged;
  }

  Widget _wrapMessageRowMotion({
    required String? messageId,
    required Widget child,
  }) {
    if (messageId == null) {
      return child;
    }
    final bool collapsing = _collapsingMessageIds.contains(messageId);
    final bool resizing =
        !collapsing && _rowResizeMessageIds.contains(messageId);
    Widget row = resizing ? MessageListRowResize(child: child) : child;
    if (collapsing) {
      row = MessageListLiveRemoval(
        onComplete: () => _finishMessageCollapse(messageId),
        child: row,
      );
    }
    return row;
  }

  void _setDeferHorizontalWhileCoasting(bool value) {
    if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.idle) {
      _deferHorizontalWhileCoastingAfterFrame = null;
      if (_deferHorizontalWhileCoasting.value != value) {
        _deferHorizontalWhileCoasting.value = value;
      }
      return;
    }
    final bool schedule = _deferHorizontalWhileCoastingAfterFrame == null;
    _deferHorizontalWhileCoastingAfterFrame = value;
    if (!schedule) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bool? pending = _deferHorizontalWhileCoastingAfterFrame;
      _deferHorizontalWhileCoastingAfterFrame = null;
      if (!mounted || pending == null) {
        return;
      }
      if (_deferHorizontalWhileCoasting.value != pending) {
        _deferHorizontalWhileCoasting.value = pending;
      }
    });
  }

  void _syncCoastingDefer() {
    if (!_scrollController.hasClients) {
      return;
    }
    if (_scrollController.position.isScrollingNotifier.value) {
      _setDeferHorizontalWhileCoasting(true);
    }
  }

  bool get _isUserDrivenScroll =>
      _userDragActive ||
      (_scrollController.hasClients &&
          _scrollController.position.userScrollDirection !=
              ScrollDirection.idle);

  void _publishDemandGeometry() {
    if (!_anchorResolved || !_scrollController.hasClients) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final ChatViewState state = ref.read(chatViewModelProvider);
    _demandSource.updateGeometry(
      distanceToOlderEdge: _centerLeadingDistance(position),
      distanceToNewerEdge: _centerTrailingDistance(position),
      viewportHeight: position.viewportDimension,
      hasMoreOlder: state.hasMoreMessages,
      olderInstallPending: _pendingOlderReveal > 0,
      hasMoreNewer: state.hasMoreNewerMessages,
      context: ContextToken(
        channelId: state.channelId,
        windowEpoch: state.windowEpoch,
      ),
    );
  }

  double _centerLeadingDistance(ScrollPosition position) =>
      position.pixels - position.minScrollExtent - _leadingFillerExtent;

  double get _statusOverlayInset => isMobileLayout(context)
      ? _kMessageListStatusOverlayInsetMobile
      : _kMessageListStatusOverlayInsetWide;

  double _centerTrailingDistance(ScrollPosition position) =>
      _rawTrailingDistance(position).clamp(0, double.infinity);

  double _rawTrailingDistance(ScrollPosition position) =>
      _rawTrailingDistanceAt(
        maxScrollExtent: position.maxScrollExtent,
        pixels: position.pixels,
      );

  double _rawTrailingDistanceAt({
    required double maxScrollExtent,
    required double pixels,
  }) => maxScrollExtent - pixels - _statusOverlayInset - _trailingFillerExtent;

  double _loadedTailExtent(ScrollPosition position) =>
      position.maxScrollExtent - _trailingFillerExtent;

  void _reconcileScrollPastLoadedTail() {
    if (!mounted || !_anchorResolved || !_scrollController.hasClients) {
      return;
    }
    if (_isJumpOwningViewport() || _isUserDrivenScroll) {
      return;
    }
    if (ref.read(chatViewModelProvider).hasMoreNewerMessages) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final double tail = _loadedTailExtent(position);
    if (position.pixels <= tail + kMessageListMetricsEpsilon) {
      return;
    }
    position.jumpTo(tail);
    _publishDemandGeometry();
  }

  void _reconcilePinnedLiveTailScroll() {
    if (!mounted || !_anchorResolved || !_scrollController.hasClients) {
      return;
    }
    _refreshLiveTailFollowAnimated(context);
    if (_followDisarmed ||
        _isUserDrivenScroll ||
        !_parkedAtLiveTail ||
        _isJumpOwningViewport()) {
      return;
    }
    if (ref.read(chatViewModelProvider).hasMoreNewerMessages) {
      return;
    }
    if (!_pin.pinned && !_tailFollowOwnsScroll()) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final double tail = _loadedTailExtent(position);
    if (position.pixels > tail + kMessageListMetricsEpsilon) {
      if (_liveTailFollowAnimated &&
          _tailFollowOwnsScroll() &&
          position is MessageListScrollPosition) {
        position.followTailTo(
          tail,
          resolveTarget: () => _loadedTailExtent(position),
        );
        return;
      }
      position.jumpTo(tail);
      return;
    }
    if (position.pixels >= tail - kMessageListMetricsEpsilon) {
      return;
    }
    if (_liveTailFollowAnimated &&
        _tailFollowOwnsScroll() &&
        position is MessageListScrollPosition) {
      position.followTailTo(
        tail,
        resolveTarget: () => _loadedTailExtent(position),
      );
      return;
    }
    position.jumpTo(tail);
  }

  void _signalFillerEntry() {
    if (!_isUserDrivenScroll || !_scrollController.hasClients) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    if (_leadingFillerExtent > 0 && _centerLeadingDistance(position) < 0) {
      _demandSource.onOverscrollTowardEdge(PaginationEdge.older);
    }
    if (_trailingFillerExtent > 0 && _rawTrailingDistance(position) < 0) {
      _demandSource.onOverscrollTowardEdge(PaginationEdge.newer);
    }
  }

  double _towardOlderDelta(double scrollDelta) => -scrollDelta;

  PaginationEdge? _overscrollEdge(double overscroll) {
    if (overscroll == 0) {
      return null;
    }
    return overscroll > 0 ? PaginationEdge.newer : PaginationEdge.older;
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
    _cancelDetachedTrim();
    if (ref.read(focusedMessageProvider).hasFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        ref.read(focusedMessageProvider.notifier).clear();
      });
    }
    _uiEpoch++;
    _anchorId = null;
    _anchorFraction = 1;
    _anchorEdge = MessageListAnchorEdge.after;
    _anchorEpoch++;
    _exposeOlderRowsNow();
    _anchorResolved = false;
    _unreadOpenLayout = false;
    _setUnreadLeadingPad(0);
    _pin.pinned = false;
    _followDisarmed = false;
    _landAtLatestTailPending = false;
    _jumpToLatestTicket++;
    _jumpToLatestInFlight = false;
    _collapsingMessageSnapshots.clear();
    _collapsingMessageIndex.clear();
    _collapsingMessageIds.clear();
    _rowResizeMessageIds.clear();
    _rowResizeClearTimer?.cancel();
    _rowResizeClearTimer = null;
    if (_pendingScrollTargetChannelId != null &&
        _pendingScrollTargetChannelId != channelId) {
      _clearPendingScrollTarget();
    }
    _lastViewportDimension = null;
    _lastMinScrollExtent = null;
    _lastMaxScrollExtent = null;
    _useCompactScrollCache = true;
    _lastMessageCount = 0;
    _scrollCacheExpansionPending = false;
    _messagesWereLoading = false;
  }

  void _expandScrollCacheNow() {
    if (!_useCompactScrollCache) {
      return;
    }
    _useCompactScrollCache = false;
    _scrollCacheExpansionPending = false;
  }

  void _scheduleScrollCacheExpansion(int messageCount) {
    if (messageCount >= kTrimmedMessageWindowSize) {
      _expandScrollCacheNow();
    }
    if (messageCount == 0 || !_useCompactScrollCache) {
      return;
    }
    if (_lastMessageCount == messageCount) {
      if (!_scrollCacheExpansionPending) {
        _scrollCacheExpansionPending = true;
        _scheduleScrollCacheExpansionWhenIdle();
      }
      return;
    }
    _lastMessageCount = messageCount;
    _scrollCacheExpansionPending = true;
    _scheduleScrollCacheExpansionWhenIdle();
  }

  void _scheduleScrollCacheExpansionWhenIdle() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted ||
          !_scrollCacheExpansionPending ||
          !_useCompactScrollCache) {
        return;
      }
      if (_isUserDrivenScroll) {
        _scheduleScrollCacheExpansionWhenIdle();
        return;
      }
      _maybeExpandScrollCache();
    });
  }

  void _maybeExpandScrollCache() {
    if (!_scrollCacheExpansionPending || !_useCompactScrollCache) {
      return;
    }
    _scrollCacheExpansionPending = false;
    setState(() => _useCompactScrollCache = false);
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null) {
      _userDragActive = true;
    } else if (notification is ScrollEndNotification) {
      _userDragActive = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        if (!_isUserDrivenScroll) {
          _maybeExpandScrollCache();
        } else {
          _scheduleScrollCacheExpansionWhenIdle();
        }
      });
    }
    if (notification.depth != 0) {
      return false;
    }
    if (_tailFollowOwnsScroll()) {
      return false;
    }
    if (notification is ScrollStartNotification) {
      _settleDeferredForHold = false;
      _cancelDetachedTrim();
      if (notification.dragDetails == null) {
        _setDeferHorizontalWhileCoasting(true);
      }
      _syncCoastingDefer();
      _chatViewModel.setUserScrollActive(
        channelId: _viewportChannelId,
        active: true,
      );
      if (notification.dragDetails != null) {
        _demandSource.onDragStart();
      }
    } else if (notification is ScrollUpdateNotification) {
      if (notification.dragDetails == null) {
        _setDeferHorizontalWhileCoasting(true);
      }
      final double? delta = notification.scrollDelta;
      if (delta != null && delta != 0) {
        _demandSource.onScrollDelta(_towardOlderDelta(delta));
        if (_isUserDrivenScroll &&
            _scrollController.hasClients &&
            _centerTrailingDistance(_scrollController.position) > 8) {
          _pin.pinned = false;
          _followDisarmed = true;
        }
      }
    } else if (notification is OverscrollNotification) {
      final PaginationEdge? edge = _overscrollEdge(notification.overscroll);
      if (edge != null) {
        _demandSource.onOverscrollTowardEdge(edge);
      }
    } else if (notification is ScrollEndNotification) {
      scheduleMicrotask(_settleUnlessHeld);
    }
    return false;
  }

  // Settling under a finger remounts the list and drops the next drag: https://feedback.fluxer.com/p/2094
  void _settleUnlessHeld() {
    if (!mounted) {
      return;
    }
    if (_activePointers > 0) {
      _settleDeferredForHold = true;
      return;
    }
    _settleDeferredForHold = false;
    _onUserScrollSettled();
  }

  void _onViewportPointerDown(PointerDownEvent event) {
    _activePointers++;
    _detachedTrimTimer?.cancel();
    _detachedTrimTimer = null;
  }

  void _onViewportPointerUp(PointerEvent event) {
    if (_activePointers > 0) {
      _activePointers--;
    }
    if (_activePointers == 0 && _settleDeferredForHold) {
      scheduleMicrotask(_settleUnlessHeld);
    } else if (_activePointers == 0 && _detachedTrimPending) {
      _armDetachedTrim();
    }
  }

  void _onUserScrollSettled() {
    _setDeferHorizontalWhileCoasting(false);
    if (!_anchorResolved ||
        !_scrollController.hasClients ||
        _tailFollowOwnsScroll()) {
      _chatViewModel.setUserScrollActive(
        channelId: _viewportChannelId,
        active: false,
      );
      return;
    }
    final ChatViewState state = ref.read(chatViewModelProvider);
    final double distanceFromLiveTail = _centerTrailingDistance(
      _scrollController.position,
    );
    if (_followDisarmed) {
      _pin.pinned = !state.hasMoreNewerMessages && distanceFromLiveTail <= 8;
      if (_pin.pinned) {
        _followDisarmed = false;
      }
    } else {
      _pin.onUserScrollEnd(
        distanceFromLiveTail: distanceFromLiveTail,
        hasMoreNewer: state.hasMoreNewerMessages,
      );
    }
    _syncReadViewport();
    if (_pin.pinned) {
      if (isNearTrailingEdge(distanceFromTrailingEdge: distanceFromLiveTail)) {
        _chatViewModel.trimToNewestWindow();
      }
      _maybeRecenterPinnedTail(state.messages);
    } else if (state.messages.length >= kMaxLoadedMessagesHard) {
      _maybeTrimDetachedWindow(state);
    } else if (state.messages.length > kMaxLoadedMessages) {
      _chatViewModel.setPendingTrimAround(
        channelId: _viewportChannelId,
        messageId: _measureAttachedRows(state)?.id,
      );
      _armDetachedTrim();
    }
    if (_anchorId != null && _anchorFraction < 1.0 && !_unreadOpenLayout) {
      _scheduleUnderfillBottomReanchor();
    }
    _reconcileScrollPastLoadedTail();
    _chatViewModel.setUserScrollActive(
      channelId: _viewportChannelId,
      active: false,
    );
  }

  void _armDetachedTrim() {
    _detachedTrimPending = true;
    _detachedTrimTimer?.cancel();
    final int epoch = _uiEpoch;
    final String channelId = _viewportChannelId;
    _detachedTrimTimer = Timer(_kDetachedTrimIdleDelay, () {
      _detachedTrimTimer = null;
      _runIdleDetachedTrim(epoch, channelId);
    });
  }

  void _cancelDetachedTrim() {
    _detachedTrimPending = false;
    _detachedTrimTimer?.cancel();
    _detachedTrimTimer = null;
    _chatViewModel.setPendingTrimAround(
      channelId: _viewportChannelId,
      messageId: null,
    );
  }

  void _runIdleDetachedTrim(int epoch, String channelId) {
    if (!mounted || epoch != _uiEpoch || channelId != _viewportChannelId) {
      _detachedTrimPending = false;
      return;
    }
    if (!_anchorResolved ||
        !_scrollController.hasClients ||
        _activePointers > 0 ||
        _userDragActive ||
        _scrollController.position.isScrollingNotifier.value) {
      return;
    }
    _detachedTrimPending = false;
    _maybeTrimDetachedWindow(ref.read(chatViewModelProvider));
  }

  void _maybeTrimDetachedWindow(ChatViewState state) {
    if (state.messages.length <= kMaxLoadedMessages) {
      return;
    }
    final _AttachedRows? rows = _measureAttachedRows(state);
    if (rows == null) {
      return;
    }
    final List<Message> messages = state.messages;
    int anchorIdx = messages.indexWhere((Message m) => m.id == _anchorId);
    if (anchorIdx < 0) {
      anchorIdx = messages.length - 1;
    }
    ({int start, int end})? span = _trimSpan(messages.length, anchorIdx, rows);
    if (span == null) {
      final bool anchorNewer = anchorIdx > rows.last;
      span = _trimSpan(
        messages.length,
        anchorNewer ? rows.last : rows.first,
        rows,
      );
      if (span == null) {
        return;
      }
      _moveAnchorToAttachedEdge(rows, anchorNewer: anchorNewer);
    }
    _chatViewModel.trimToSpan(
      firstId: messages[span.start].id,
      lastId: messages[span.end].id,
    );
    final int epoch = _uiEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _runIfSameEpoch(epoch, () {
        _publishDemandGeometry();
        _demandSource.onWindowTrimmed();
      });
    });
  }

  ({int start, int end})? _trimSpan(
    int messageCount,
    int anchorIdx,
    _AttachedRows rows,
  ) {
    int start = anchorIdx < rows.first ? anchorIdx : rows.first;
    int end = anchorIdx > rows.last ? anchorIdx : rows.last;
    final int shortfall = kTrimmedMessageWindowSize - (end - start + 1);
    if (shortfall > 0) {
      start = (start - shortfall ~/ 2).clamp(
        0,
        messageCount - kTrimmedMessageWindowSize,
      );
      end = start + kTrimmedMessageWindowSize - 1;
    }
    if (end - start + 1 > kMaxLoadedMessages) {
      return null;
    }
    return (start: start, end: end);
  }

  void _moveAnchorToAttachedEdge(
    _AttachedRows rows, {
    required bool anchorNewer,
  }) {
    final double splitY = anchorNewer ? rows.lastBottom : rows.firstTop;
    final double fraction = ((splitY - rows.viewportTop) / rows.viewportHeight)
        .clamp(0.0, 1.0);
    _scrollController.position.correctPixels(
      rows.viewportTop + fraction * rows.viewportHeight - splitY,
    );
    setState(() {
      _anchorId = anchorNewer ? rows.lastId : rows.firstId;
      _anchorFraction = fraction;
      _anchorEdge = anchorNewer
          ? MessageListAnchorEdge.after
          : MessageListAnchorEdge.before;
      _exposeOlderRowsNow();
      _uiEpoch++;
    });
  }

  _AttachedRows? _measureAttachedRows(ChatViewState state) {
    final BuildContext? scrollableContext =
        _scrollController.position.context.notificationContext;
    final RenderObject? viewportRender = scrollableContext?.findRenderObject();
    if (viewportRender is! RenderBox || !viewportRender.hasSize) {
      return null;
    }
    final double viewportTop = viewportRender.localToGlobal(Offset.zero).dy;
    final double viewportH = _scrollController.position.viewportDimension;
    final int? Function(String id) windowIndexOf;
    if (identical(_builtStreamIndex.messages, state.messages)) {
      windowIndexOf = _builtStreamIndex.windowIndexOf;
    } else {
      final Map<String, int> byId = <String, int>{
        for (int i = 0; i < state.messages.length; i += 1)
          state.messages[i].id: i,
      };
      windowIndexOf = (String id) => byId[id];
    }
    final double centerY = viewportTop + viewportH / 2;
    String? visibleId;
    double bestDistance = double.infinity;
    int firstIdx = state.messages.length;
    int lastIdx = -1;
    String firstId = '';
    String lastId = '';
    double firstTop = 0;
    double lastBottom = 0;
    final BuildContext? scrollRoot =
        _scrollController.position.context.notificationContext;
    if (scrollRoot == null) {
      return null;
    }
    void visitor(Element element) {
      final Key? key = element.widget.key;
      if (key is! ValueKey<String>) {
        element.visitChildren(visitor);
        return;
      }
      final String value = key.value;
      if (value.startsWith('group-') || value.startsWith('divider-')) {
        return;
      }
      if (!value.startsWith('msg-')) {
        element.visitChildren(visitor);
        return;
      }
      final String messageId = value.substring('msg-'.length);
      final int idx = windowIndexOf(messageId) ?? -1;
      if (idx < 0) {
        return;
      }
      final RenderObject? inner = element.renderObject;
      if (inner is! RenderBox || !inner.hasSize || !inner.attached) {
        return;
      }
      RenderObject? node = inner;
      while (node != null &&
          node.parentData is! SliverMultiBoxAdaptorParentData) {
        node = node.parent;
      }
      if (node is! RenderBox || !node.hasSize) {
        return;
      }
      final RenderObject? sliver = node.parent;
      if (sliver is RenderSliver && (sliver.geometry?.cacheExtent ?? 0) <= 0) {
        return;
      }
      if ((node.parentData! as SliverMultiBoxAdaptorParentData).keptAlive) {
        return;
      }
      final double top = node.localToGlobal(Offset.zero).dy;
      if (idx < firstIdx) {
        firstIdx = idx;
        firstId = messageId;
        firstTop = top;
      }
      if (idx > lastIdx) {
        lastIdx = idx;
        lastId = messageId;
        lastBottom = top + node.size.height;
      }
      final double distance = (top - centerY).abs();
      if (distance < bestDistance) {
        bestDistance = distance;
        visibleId = messageId;
      }
    }

    scrollRoot.visitChildElements(visitor);
    final String? nearestId = visibleId;
    if (nearestId == null) {
      return null;
    }
    return (
      id: nearestId,
      first: firstIdx,
      last: lastIdx,
      firstId: firstId,
      firstTop: firstTop,
      lastId: lastId,
      lastBottom: lastBottom,
      viewportTop: viewportTop,
      viewportHeight: viewportH,
    );
  }

  void _holdReadingRowAcrossRegroup() {
    final MessageListViewport? built = _builtViewport;
    if (built == null ||
        !_anchorResolved ||
        !_scrollController.hasClients ||
        _isNearLiveTail()) {
      return;
    }
    RenderViewport? viewport;
    void findViewport(RenderObject node) {
      if (viewport != null) {
        return;
      }
      if (node is RenderViewport) {
        viewport = node;
        return;
      }
      node.visitChildren(findViewport);
    }

    final RenderObject? scrollable = _scrollController
        .position
        .context
        .notificationContext
        ?.findRenderObject();
    if (scrollable != null) {
      findViewport(scrollable);
    }
    final RenderViewport? laidOut = viewport;
    if (laidOut == null || !laidOut.hasSize) {
      return;
    }
    final double viewportTop = laidOut.localToGlobal(Offset.zero).dy;
    final double viewportHeight = laidOut.size.height;
    final double viewportBottom = viewportTop + viewportHeight;
    String? rowId;
    double rowTop = double.infinity;
    String? straddlingId;
    double straddlingTop = 0;
    built.visitLaidOutRows(laidOut, (int dataIndex, RenderBox row) {
      final List<Message> rowMessages = built.stream[dataIndex].messages;
      if (rowMessages.isEmpty) {
        return;
      }
      final double top = row.localToGlobal(Offset.zero).dy;
      if (top + row.size.height <= viewportTop || top >= viewportBottom) {
        return;
      }
      if (top < viewportTop) {
        straddlingId = rowMessages.first.id;
        straddlingTop = top;
      } else if (top < rowTop) {
        rowId = rowMessages.first.id;
        rowTop = top;
      }
    });
    final String? anchorId = rowId ?? straddlingId;
    if (anchorId == null) {
      return;
    }
    final double splitY = rowId != null ? rowTop : straddlingTop;
    final double fraction = ((splitY - viewportTop) / viewportHeight).clamp(
      0.0,
      1.0,
    );
    _scrollController.position.correctPixels(
      viewportTop + fraction * viewportHeight - splitY,
    );
    setState(() {
      _anchorId = anchorId;
      _anchorFraction = fraction;
      _anchorEdge = MessageListAnchorEdge.before;
      _unreadOpenLayout = false;
      _setUnreadLeadingPad(0);
      _exposeOlderRowsNow();
      _uiEpoch++;
    });
  }

  void _maybeRecenterPinnedTail(List<Message> messages) {
    final String? anchor = _anchorId;
    if (messages.isEmpty) {
      return;
    }
    final String newestId = messages.last.id;
    if (anchor == null || anchor == newestId) {
      if (anchor != null) {
        return;
      }
    }
    if (anchor == null) {
      return;
    }
    int trailing = 0;
    for (int i = messages.length - 1; i >= 0; i -= 1) {
      if (compareSnowflakeIds(messages[i].id, anchor) <= 0) {
        break;
      }
      trailing += 1;
    }
    if (trailing > _kPinnedRecenterTrailingThreshold) {
      _reanchor(newestId, 1, edge: MessageListAnchorEdge.after);
    }
  }

  void _repairDeletedAnchor(List<Message> next) {
    final String? anchor = _anchorId;
    if (anchor == null) {
      return;
    }
    if (next.any((Message m) => m.id == anchor)) {
      return;
    }
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (currentUserId != null && currentUserId.isNotEmpty) {
      for (final Message message in next.reversed) {
        if (message.clientNonce == anchor &&
            message.authorId == currentUserId) {
          setState(() {
            _anchorId = message.id;
          });
          return;
        }
      }
    }
    String? nearestOlder;
    for (final Message message in next.reversed) {
      if (compareSnowflakeIds(message.id, anchor) < 0) {
        nearestOlder = message.id;
        break;
      }
    }
    String? nearestNewer;
    for (final Message message in next) {
      if (compareSnowflakeIds(message.id, anchor) > 0) {
        nearestNewer = message.id;
        break;
      }
    }
    final String? replacement = _anchorEdge == MessageListAnchorEdge.before
        ? (nearestNewer ?? nearestOlder)
        : (nearestOlder ?? nearestNewer);
    setState(() {
      _anchorId = replacement;
    });
  }

  bool _onScrollMetricsNotification(ScrollMetricsNotification notification) {
    if (notification.depth != 0) {
      return false;
    }
    final ScrollMetrics metrics = notification.metrics;
    final double viewport = metrics.viewportDimension;
    final double minExtent = metrics.minScrollExtent;
    final double extent = metrics.maxScrollExtent;
    final double? previousViewport = _lastViewportDimension;
    final double? previousMinExtent = _lastMinScrollExtent;
    final double? previousExtent = _lastMaxScrollExtent;
    final bool pixelOnly = isPixelOnlyScrollMetricsChange(
      viewportDimension: viewport,
      minScrollExtent: minExtent,
      maxScrollExtent: extent,
      lastViewportDimension: previousViewport,
      lastMinScrollExtent: previousMinExtent,
      lastMaxScrollExtent: previousExtent,
    );
    _lastViewportDimension = viewport;
    _lastMinScrollExtent = minExtent;
    _lastMaxScrollExtent = extent;
    if (previousExtent != null) {
      final bool extentGrew =
          extent > previousExtent + kMessageListMetricsEpsilon;
      final bool extentShrank =
          extent < previousExtent - kMessageListMetricsEpsilon;
      if (extentShrank) {
        _reconcileScrollPastLoadedTail();
      }
      if ((_pin.pinned || _tailFollowOwnsScroll()) &&
          (extentGrew || extentShrank)) {
        if (_suppressPinnedTailReconcileExtentChanges > 0) {
          _suppressPinnedTailReconcileExtentChanges -= 1;
        } else {
          _reconcilePinnedLiveTailScroll();
        }
      }
    }
    if (!pixelOnly) {
      _demandSource.resetApproachVelocity();
      _publishDemandGeometry();
      _syncReadViewport();
      if (previousViewport != null &&
          viewport < previousViewport - kMessageListMetricsEpsilon &&
          !_isJumpOwningViewport() &&
          _shouldGluePinnedTailOnViewportShrink(
            previousMaxScrollExtent: previousExtent,
            pixels: metrics.pixels,
          )) {
        _schedulePinnedTailGlue(ignorePin: true);
      }
    }
    if (_anchorId != null &&
        _anchorFraction < 1.0 &&
        !_unreadOpenLayout &&
        metrics.maxScrollExtent <= 0 &&
        metrics.pixels >=
            metrics.maxScrollExtent - kMessageListMetricsEpsilon) {
      _scheduleUnderfillBottomReanchor();
    }
    return false;
  }

  bool _shouldGluePinnedTailOnViewportShrink({
    required double? previousMaxScrollExtent,
    required double pixels,
  }) {
    if (previousMaxScrollExtent == null) {
      return false;
    }
    final double preShrinkDistance = _rawTrailingDistanceAt(
      maxScrollExtent: previousMaxScrollExtent,
      pixels: pixels,
    ).clamp(0, double.infinity);
    return isNearTrailingEdge(
      distanceFromTrailingEdge: preShrinkDistance,
      threshold: _pin.pinned
          ? kMessageListPinHoldDistance
          : kMessageListReadBottomThreshold,
    );
  }

  bool _isNearLiveTail() {
    if (!_scrollController.hasClients) {
      return false;
    }
    return isNearTrailingEdge(
      distanceFromTrailingEdge: _centerTrailingDistance(
        _scrollController.position,
      ),
    );
  }

  bool _hasPendingScrollTarget() => _pendingScrollTarget != null;

  bool _isJumpOwningViewport() => _hasPendingScrollTarget();

  void _setPendingScrollTarget(String? messageId) {
    _pendingScrollTargetTimer?.cancel();
    _pendingScrollTargetTimer = null;
    _pendingScrollTarget = messageId;
    if (messageId == null) {
      _pendingScrollTargetChannelId = null;
      _pendingScrollTargetWindowEpoch = null;
      return;
    }
    _pendingScrollTargetChannelId = _viewportChannelId;
    _pendingScrollTargetWindowEpoch = ref
        .read(chatViewModelProvider)
        .windowEpoch;
    _pendingScrollTargetTimer = Timer(_kPendingScrollTargetTimeout, () {
      _pendingScrollTargetTimer = null;
      if (!mounted || _pendingScrollTarget != messageId) {
        return;
      }
      talker.debug('[MessageList] pending target $messageId expired');
      _clearPendingScrollTarget();
      _scheduleJumpHighlightConfirm(messageId);
      _onScroll();
    });
  }

  void _clearPendingScrollTarget() {
    _pendingScrollTargetTimer?.cancel();
    _pendingScrollTargetTimer = null;
    _pendingScrollTarget = null;
    _pendingScrollTargetChannelId = null;
    _pendingScrollTargetWindowEpoch = null;
  }

  ({List<ChannelStreamItem> items, ChannelStreamIndex index})
  _channelStreamFor({
    required List<Message> messages,
    required String? oldestUnreadMessageId,
    required String? currentUserId,
    required Set<String> blockedUserIds,
  }) {
    return createIndexedChannelStream(
      messages: messages,
      oldestUnreadMessageId: oldestUnreadMessageId,
      groupSplitBoundaryId: _anchorEdge == MessageListAnchorEdge.after
          ? _anchorId
          : null,
      context: ChannelCollapseContext(
        treatSpam: true,
        currentUserId: currentUserId,
        blockedUserIds: blockedUserIds,
        isUserMarkedAsSpammer: ref
            .read(localUserSpamOverrideProvider.notifier)
            .isUserMarkedAsSpammer,
      ),
    );
  }

  String? _channelLastMessageIdFor(String channelId) {
    if (channelId.isEmpty) {
      return null;
    }
    final String? row = ref
        .read(_channelLastMessageIdProvider(channelId))
        .asData
        ?.value;
    if (row == null) {
      return null;
    }
    final String? indexed = ref
        .read(channelLastMessageIndexProvider)
        .lastMessageIdFor(channelId);
    return compareSnowflakeIds(indexed, row) > 0 ? indexed : row;
  }

  ChatUnreadSummary _unreadSummaryFor({
    required List<Message> messages,
    required String? ackLastMessageId,
    required int mentionCount,
    required String? channelLastMessageId,
    required bool hasMoreNewerMessages,
    required bool hasMoreOlderMessages,
    required int cachedUnreadCount,
  }) {
    final Object key = (
      messages,
      ackLastMessageId,
      mentionCount,
      channelLastMessageId,
      hasMoreNewerMessages,
      hasMoreOlderMessages,
      cachedUnreadCount,
    );
    final ChatUnreadSummary? cached = _cachedUnreadSummary;
    if (cached != null && _unreadSummaryKey == key) {
      return cached;
    }
    final ChatUnreadSummary summary = computeChatUnreadSummary(
      messages: messages
          .where((Message message) => !isLocalOnlyMessage(message))
          .map((Message message) => ChatUnreadMessageRef(id: message.id)),
      ackLastMessageId: ackLastMessageId,
      mentionCount: mentionCount,
      channelLastMessageId: channelLastMessageId,
      hasMoreNewerMessages: hasMoreNewerMessages,
      hasMoreOlderMessages: hasMoreOlderMessages,
      cachedUnreadCount: cachedUnreadCount,
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
    if (_tailFollowOwnsScroll()) {
      return;
    }
    if (!_anchorResolved) {
      return;
    }
    final ChatViewState chatState = ref.read(chatViewModelProvider);
    if (chatState.messages.isEmpty) {
      if (chatState.isLoading || chatState.hasMoreNewerMessages) {
        return;
      }
      _readViewport.updateViewport(
        channelId: _viewportChannelId,
        nearLoadedTail: true,
        distanceFromBottom: 0,
        sampledTailId: null,
        followsLiveTail: true,
      );
      return;
    }
    if (!_scrollController.hasClients) {
      return;
    }
    final bool jumpOwnsViewport = !ignoreJumpTarget && _isJumpOwningViewport();
    final ScrollPosition position = _scrollController.position;
    final double distanceFromTrailingEdge = _centerTrailingDistance(position);
    if (!jumpOwnsViewport) {
      _pinWhenRestingAtLiveTail(
        distanceFromLiveTail: distanceFromTrailingEdge,
        hasMoreNewerMessages: chatState.hasMoreNewerMessages,
      );
    }
    _readViewport.updateViewport(
      channelId: _viewportChannelId,
      nearLoadedTail:
          !jumpOwnsViewport &&
          isNearTrailingEdge(
            distanceFromTrailingEdge: distanceFromTrailingEdge,
          ),
      distanceFromBottom: distanceFromTrailingEdge,
      sampledTailId: newestServerBackedMessageId(chatState.messages),
      followsLiveTail: !jumpOwnsViewport && _pin.pinned && !_followDisarmed,
    );
  }

  void _onScrollToBottom({bool explicitIntent = false}) {
    if (!explicitIntent && _isSoftReconcileWhileDisarmed()) {
      return;
    }
    _clearPendingScrollTarget();
    if (!_anchorResolved) {
      return;
    }
    final ChatViewState chatState = ref.read(chatViewModelProvider);
    if (chatState.hasMoreNewerMessages) {
      _followDisarmed = false;
      _requestJumpToLatest();
      return;
    }
    final List<Message> messages = chatState.messages;
    final String? newestId = messages.isEmpty ? null : messages.last.id;
    if (_parkedAtLiveTail && _anchorId == newestId) {
      _followDisarmed = false;
      _pin.onJumpToPresentLanded();
      _refreshLiveTailFollowAnimated(context);
      if (!_liveTailFollowAnimated || !_scrollController.hasClients) {
        _schedulePinnedTailGlue(ignorePin: true);
        return;
      }
      final ScrollPosition position = _scrollController.position;
      final double approachStart =
          _loadedTailExtent(position) -
          position.viewportDimension * _kJumpToPresentApproachFraction;
      if (position.pixels < approachStart) {
        position.jumpTo(approachStart);
      }
      _followToLoadedTail();
      return;
    }
    if (newestId != null && _shouldFollowPinnedTailAppend(messages, newestId)) {
      _followDisarmed = false;
      _pin.onJumpToPresentLanded();
      _scheduleLiveTailFollow();
      return;
    }
    _landAtLatestTail(messages, animate: true);
  }

  bool _isSoftReconcileWhileDisarmed() {
    if (!_followDisarmed || !_scrollController.hasClients) {
      return false;
    }
    if (ref.read(chatViewModelProvider).hasMoreNewerMessages) {
      return false;
    }
    return !isBeyondJumpToBottomThreshold(
      distanceFromBottom: _centerTrailingDistance(_scrollController.position),
    );
  }

  void _requestJumpToLatest() {
    if (_jumpToLatestInFlight) {
      return;
    }
    final int ticket = ++_jumpToLatestTicket;
    _jumpToLatestInFlight = true;
    _landAtLatestTailPending = true;
    unawaited(
      _chatViewModel
          .jumpToLatestMessages()
          .then<bool>((bool started) {
            if (ticket == _jumpToLatestTicket && !started && mounted) {
              _landAtLatestTailPending = false;
            }
            return started;
          })
          .onError<Object>((Object error, StackTrace stackTrace) {
            talker.handle(error, stackTrace, '[MessageList] jump to latest');
            if (ticket == _jumpToLatestTicket && mounted) {
              _landAtLatestTailPending = false;
            }
            return false;
          })
          .whenComplete(() {
            if (ticket == _jumpToLatestTicket) {
              _jumpToLatestInFlight = false;
            }
          }),
    );
  }

  void _scheduleBottomViewportSync() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _anchorResolved) {
        _syncReadViewport();
      }
    });
  }

  void _schedulePinnedTailGlue({bool ignorePin = false}) {
    if (_pinnedTailGlueScheduled) {
      _pinnedTailGlueIgnorePin = _pinnedTailGlueIgnorePin || ignorePin;
      return;
    }
    final List<Message> messages = ref.read(chatViewModelProvider).messages;
    if (messages.isNotEmpty) {
      _tailGlueRowId = messages.last.id;
    }
    _pinnedTailGlueScheduled = true;
    _pinnedTailGlueIgnorePin = ignorePin;
    final int glueEpoch = _uiEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bool scheduledIgnorePin = _pinnedTailGlueIgnorePin;
      _pinnedTailGlueScheduled = false;
      _pinnedTailGlueIgnorePin = false;
      _runIfSameEpoch(glueEpoch, () {
        if (!_scrollController.hasClients ||
            (!_pin.pinned && !scheduledIgnorePin)) {
          return;
        }
        if (ref.read(chatViewModelProvider).hasMoreNewerMessages) {
          return;
        }
        if (!scheduledIgnorePin && (_followDisarmed || _isUserDrivenScroll)) {
          return;
        }
        final List<Message> messages = ref.read(chatViewModelProvider).messages;
        _tailGlueRowId = messages.isEmpty ? null : messages.last.id;
        _jumpToLiveTailExtent(
          _scrollController.position,
          instantGlue: scheduledIgnorePin,
        );
        if (!_tailFollowOwnsScroll()) {
          _finishTailGlueSideEffects();
        }
      });
    });
  }

  void _jumpToLiveTailExtent(
    ScrollPosition position, {
    required bool instantGlue,
  }) {
    final double tail = _loadedTailExtent(position);
    if (position.pixels >= tail - kMessageListMetricsEpsilon) {
      return;
    }
    final double delta = tail - position.pixels;
    final bool tallSnap = delta > position.viewportDimension;
    final bool snap =
        instantGlue ||
        tallSnap ||
        !_liveTailFollowAnimated ||
        !(_viewportVisible ?? true);
    if (snap) {
      position.jumpTo(tail);
      return;
    }
    final MessageListScrollPosition? tailPosition =
        position is MessageListScrollPosition ? position : null;
    if (tailPosition == null) {
      position.jumpTo(tail);
      return;
    }
    tailPosition.followTailTo(
      tail,
      resolveTarget: () => _loadedTailExtent(position),
      onComplete: () {
        if (mounted) {
          _finishTailGlueSideEffects();
        }
      },
    );
  }

  void _finishTailGlueSideEffects() {
    _reconcilePinnedLiveTailScroll();
    _publishDemandGeometry();
    _syncReadViewport();
    _tailSettleGeneration++;
    _runPinnedTailSettle(_tailSettleGeneration, framesLeft: 2);
  }

  void _runPinnedTailSettle(int generation, {required int framesLeft}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || generation != _tailSettleGeneration) {
        return;
      }
      _reconcilePinnedLiveTailScroll();
      if (framesLeft <= 1) {
        VisibilityDetectorController.instance.notifyNow();
        return;
      }
      _runPinnedTailSettle(generation, framesLeft: framesLeft - 1);
    });
  }

  bool _advancesNewestRow(List<Message>? previous, List<Message> next) =>
      previous != null &&
      previous.isNotEmpty &&
      next.isNotEmpty &&
      compareSnowflakeIds(next.last.id, previous.last.id) > 0;

  void _suspendTailEdgeHoldForFrame() {
    if (_tailEdgeHoldSuspended) {
      return;
    }
    _tailEdgeHoldSuspended = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tailEdgeHoldSuspended = false;
    });
  }

  bool _holdsLiveTailEdge() =>
      mounted &&
      _anchorResolved &&
      _pin.pinned &&
      _parkedAtLiveTail &&
      !_followDisarmed &&
      !_userDragActive &&
      !_tailEdgeHoldSuspended &&
      !_isJumpOwningViewport() &&
      !ref.read(chatViewModelProvider).hasMoreNewerMessages;

  bool get _parkedAtLiveTail =>
      !_unreadOpenLayout &&
      _anchorFraction >= 1.0 &&
      _anchorEdge == MessageListAnchorEdge.after;

  bool _shouldRelandLiveTail(List<Message> next) {
    return _pin.pinned &&
        _anchorResolved &&
        _parkedAtLiveTail &&
        next.isNotEmpty &&
        _anchorId != next.last.id;
  }

  void _landAtLatestTail(List<Message> next, {bool animate = false}) {
    _pin.onJumpToPresentLanded();
    _followDisarmed = false;
    _refreshLiveTailFollowAnimated(context);
    final bool approach =
        animate && _liveTailFollowAnimated && _scrollController.hasClients;
    if (approach &&
        _centerTrailingDistance(_scrollController.position) <=
            _scrollController.position.viewportDimension) {
      _schedulePinnedTailGlue();
      return;
    }
    final double approachLead = approach
        ? _scrollController.position.viewportDimension *
              _kJumpToPresentApproachFraction
        : 0;
    _reanchor(
      next.isEmpty ? null : next.last.id,
      1,
      edge: MessageListAnchorEdge.after,
    );
    if (approach) {
      _scrollController.armedInitialOffset = _statusOverlayInset - approachLead;
      _scheduleJumpToPresentApproach();
    }
    _scheduleBottomViewportSync();
  }

  void _scheduleJumpToPresentApproach() {
    final int epoch = _uiEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _runIfSameEpoch(epoch, _followToLoadedTail);
    });
  }

  void _followToLoadedTail() {
    if (!_scrollController.hasClients) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    if (position is! MessageListScrollPosition) {
      position.jumpTo(_loadedTailExtent(position));
      _finishTailGlueSideEffects();
      return;
    }
    position.followTailTo(
      _loadedTailExtent(position),
      curve: Curves.easeOutCubic,
      resolveTarget: () => _loadedTailExtent(position),
      onComplete: () {
        if (mounted) {
          _finishTailGlueSideEffects();
        }
      },
    );
  }

  void _onUnreadBarMarkRead() {
    _onScrollToBottom(explicitIntent: true);
    unawaited(_chatViewModel.markCurrentChannelRead());
  }

  void _onUnreadBarJump() {
    unawaited(_chatViewModel.jumpToFirstUnread());
  }

  void _confirmJumpHighlightScroll(String messageId) {
    final String? highlightedMessageId = ref
        .read(chatViewModelProvider)
        .highlightedMessageId;
    talker.debug(
      '[MessageList] confirm highlight target=$messageId '
      'highlighted=$highlightedMessageId',
    );
    if (highlightedMessageId == messageId) {
      _chatViewModel.extendJumpHighlight(messageId);
    }
  }

  void _scheduleJumpHighlightConfirm(String messageId) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _confirmJumpHighlightScroll(messageId);
    });
  }

  void _onScrollToMessage(String messageId) {
    talker.debug(
      '[MessageList] _onScrollToMessage $messageId '
      'anchorResolved=$_anchorResolved '
      'hasClients=${_scrollController.hasClients}',
    );
    if (!_anchorResolved || !_scrollController.hasClients) {
      _setPendingScrollTarget(messageId);
      talker.debug('[MessageList] pending target parked $messageId');
      return;
    }
    final ChatViewState jumpState = ref.read(chatViewModelProvider);
    final Iterable<String> messageIds = jumpState.messages.map(
      (Message m) => m.id,
    );
    final bool targetLoaded = jumpState.messages.any(
      (Message message) => message.id == messageId,
    );
    final String? scrollId = targetLoaded
        ? messageId
        : jumpTargetWindowSettled(
            jumpTargetId: messageId,
            messageIds: messageIds,
            hasMoreOlder: jumpState.hasMoreMessages,
            hasMoreNewer: jumpState.hasMoreNewerMessages,
          )
        ? resolveJumpScrollTargetId(
            jumpTargetId: messageId,
            messageIds: messageIds,
          )
        : null;
    if (scrollId == null) {
      _setPendingScrollTarget(messageId);
      talker.debug('[MessageList] pending target parked $messageId');
      return;
    }
    _pin.pinned = false;
    if (scrollId != messageId) {
      talker.debug(
        '[MessageList] jump target $messageId missing; '
        'scroll neighbour $scrollId',
      );
    }
    _clearPendingScrollTarget();
    _reanchor(scrollId, _kUnreadOpenAnchor, edge: MessageListAnchorEdge.before);
    _scheduleJumpHighlightConfirm(messageId);
  }

  Widget _buildMessageTile({
    required BuildContext context,
    required Message message,
    required Message? previousMessage,
    required String? visualUnreadId,
    required String? highlightedMessageId,
    required String? replyingToMessageId,
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
    required bool isGuildSendDisabled,
    bool renderDaySeparator = true,
    bool prependUnreadSeparator = false,
    bool forceLeadingSpacing = false,
  }) {
    final bool startsNewDay =
        previousMessage == null ||
        !isSameLocalDay(message.timestamp, previousMessage.timestamp);
    final bool isNewDay = renderDaySeparator && startsNewDay;
    final bool isGrouped = shouldGroupMessages(message, previousMessage);
    final bool isJumpHighlighted =
        message.id == highlightedMessageId || message.id == replyingToMessageId;
    final bool isUnreadBoundary =
        !prependUnreadSeparator && message.id == visualUnreadId;
    final bool isAuthorBlocked = blockedUserIds.contains(message.authorId);
    final bool canAddReactionsForMessage =
        channelCanAddReactions && !isAuthorBlocked;
    final double leading = leadingGroupSpacing(
      isGroupStart: !isGrouped,
      isNewDay: startsNewDay,
      isUnreadBoundary: isUnreadBoundary,
      hasPrevious: previousMessage != null || forceLeadingSpacing,
      bothSystem:
          message.isSystemMessage &&
          (previousMessage?.isSystemMessage ?? false),
      spacing: renderSettings.messageGroupSpacing,
    );
    final Object layoutSignature = (
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
      isGuildSendDisabled,
      renderSettings.messageDisplayCompact,
    );
    return _tileCache.resolve(message.id, layoutSignature, () {
      if (message.type == messageTypeThreadStarterMessage) {
        return _withMessageSeparators(
          context,
          message: message,
          isNewDay: isNewDay,
          visualUnreadId: prependUnreadSeparator ? null : visualUnreadId,
          leadingGroupSpacing: leading,
          child: ThreadStarterMessage(
            key: ValueKey<String>(message.id),
            message: message,
            guildId: guildId,
          ),
        );
      }
      if (message.isSystemMessage) {
        final bool canDelete = canDeleteMessage(
          message: message,
          currentUserId: currentUserId,
          isDmChannel: isDmChannel,
          channelPermissionBits: channelPermissionBits,
        );
        final bool isMobile = isMobileLayout(context);
        final bool touchPrimary = isTouchPrimaryInput(ref);
        final bool useTouchMessageActions = isMobile || touchPrimary;
        final bool isPinSystemMessage =
            message.type == messageTypeChannelPinnedMessage;
        final bool isThreadCreated = message.type == messageTypeThreadCreated;
        final Widget systemMessage = SystemMessage(
          key: ValueKey(message.id),
          message: message,
          guildId: guildId,
          onJumpToPinnedMessage: isPinSystemMessage
              ? () =>
                    unawaited(jumpToPinnedSystemMessage(ref, message: message))
              : isThreadCreated && guildId != null
              ? () => unawaited(
                  openThreadById(
                    this.context,
                    ref,
                    guildId: guildId,
                    threadId: message.messageReference?.channelId ?? '',
                  ),
                )
              : null,
          onViewAllPins: isPinSystemMessage
              ? () => requestOpenChannelPins(ref)
              : isThreadCreated
              ? () => unawaited(
                  showThreadBrowserForChannel(
                    this.context,
                    ref,
                    message.channelId,
                  ),
                )
              : null,
          onLongPress: useTouchMessageActions
              ? () => showSystemMessageActionsSheet(
                  this.context,
                  ref,
                  message: message,
                  guildId: guildId,
                  isDmChannel: isDmChannel,
                  canDelete: canDelete,
                  canAddReactions: canAddReactionsForMessage,
                  canManageMessages: channelCanManageMessages,
                  currentUserId: currentUserId,
                )
              : null,
          onSecondaryTapUp: !useTouchMessageActions
              ? (_) => unawaited(
                  showSystemMessageActionsSheet(
                    this.context,
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
        );
        return _withMessageSeparators(
          context,
          message: message,
          isNewDay: isNewDay,
          visualUnreadId: prependUnreadSeparator ? null : visualUnreadId,
          leadingGroupSpacing: leading,
          child: systemMessage,
        );
      }
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
            key: ValueKey<String>(message.id),
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
            isSendDisabled: isGuildSendDisabled,
            onReply: () =>
                ref.read(chatViewModelProvider.notifier).startReply(message),
            onForward: () => unawaited(
              showForwardMessageSheet(this.context, message: message),
            ),
            onEdit: () =>
                ref.read(chatViewModelProvider.notifier).startEdit(message),
            onRemoveAllReactions: () => unawaited(
              showRemoveAllReactionsConfirmSheet(
                this.context,
                ref,
                messageId: message.id,
              ),
            ),
            onDelete: () => unawaited(
              showDeleteMessageConfirmSheet(
                this.context,
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
            onReport: () => unawaited(
              openReportFlow(
                this.context,
                iarContext: IarMessageContext(
                  message: message,
                  guildId: guildId,
                ),
              ),
            ),
            onDeleteAttachment: (Attachment attachment) => unawaited(
              showDeleteAttachmentConfirmSheet(
                this.context,
                ref,
                messageId: message.id,
                attachment: attachment,
              ),
            ),
            onEditAttachmentAltText: (Attachment attachment) => unawaited(
              editMessageAttachmentAltText(
                this.context,
                ref,
                messageId: message.id,
                attachment: attachment,
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
    }, message: message);
  }

  Widget _buildStreamItem({
    required BuildContext context,
    required List<ChannelStreamItem> stream,
    required int dataIndex,
    required String? visualUnreadId,
    required String? highlightedMessageId,
    required String? replyingToMessageId,
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
    required bool isGuildSendDisabled,
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
        final double leadingSpacing = leadingGroupSpacingBeforeStreamItem(
          stream,
          dataIndex,
          spacing: renderSettings.messageGroupSpacing,
        );
        final Object signature = (
          item.type,
          item.messages.length,
          isRevealed,
          highlightedMessageId,
          replyingToMessageId,
          leadingSpacing,
        );
        return _tileCache.resolve('group-$groupKey', signature, () {
          return _wrapWithUnreadSeparator(
            context,
            BlockedMessageGroups(
              item: item,
              isRevealed: isRevealed,
              leadingGroupSpacing: leadingSpacing,
              leadingPreviousMessage: resolvePreviousMessageForStreamItem(
                stream,
                dataIndex,
              ),
              onToggle: () {
                if (groupKey == null) {
                  return;
                }
                _chatViewModel.setCollapsedGroupRevealed(groupKey);
                if (_isNearLiveTail()) {
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
                  replyingToMessageId: replyingToMessageId,
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
                  isGuildSendDisabled: isGuildSendDisabled,
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
            forceLeadingSpacing: followsCollapsedGroup(stream, dataIndex),
            visualUnreadId: visualUnreadId,
            highlightedMessageId: highlightedMessageId,
            replyingToMessageId: replyingToMessageId,
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
            isGuildSendDisabled: isGuildSendDisabled,
          ),
          show: item.showUnreadDividerBefore,
        );
    }
  }

  Widget _centerStreamTile({
    required BuildContext context,
    required List<ChannelStreamItem> stream,
    required int dataIndex,
    required String? visualUnreadId,
    required String? highlightedMessageId,
    required String? replyingToMessageId,
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
    required bool isGuildSendDisabled,
  }) {
    final ChannelStreamItem item = stream[dataIndex];
    final String keyValue = switch (item.type) {
      ChannelStreamType.divider when dataIndex + 1 < stream.length =>
        channelStreamDividerKey(stream[dataIndex + 1].messages.first.id),
      _ when item.type.isCollapsedGroup => 'group-${item.groupKey}',
      _ => 'msg-${item.singleMessage?.id ?? dataIndex}',
    };
    final String? messageId = item.singleMessage?.id;
    return KeyedSubtree(
      key: ValueKey<String>(keyValue),
      child: _wrapMessageRowMotion(
        messageId: item.type == ChannelStreamType.message ? messageId : null,
        child: _buildStreamItem(
          context: context,
          stream: stream,
          dataIndex: dataIndex,
          visualUnreadId: visualUnreadId,
          highlightedMessageId: highlightedMessageId,
          replyingToMessageId: replyingToMessageId,
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
          isGuildSendDisabled: isGuildSendDisabled,
        ),
      ),
    );
  }

  int? _centerChildIndexForStream(
    Key key,
    List<ChannelStreamItem> stream,
    ChannelStreamIndex index,
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
    final bool isMessageKey = value.startsWith(messagePrefix);
    final int? dataIndex = isMessageKey
        ? index.itemOfMessage(value.substring(messagePrefix.length))
        : value.startsWith(groupPrefix)
        ? index.itemOfGroup(value.substring(groupPrefix.length))
        : index.itemOfDivider(value);
    if (dataIndex == null ||
        dataIndex < startInclusive ||
        dataIndex >= endExclusive) {
      return null;
    }
    if (isMessageKey && stream[dataIndex].type != ChannelStreamType.message) {
      return null;
    }
    if (reverse) {
      return endExclusive - 1 - dataIndex;
    }
    return dataIndex - startInclusive;
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
    final String formatted = formatUserFullDate(
      date.toLocal(),
      Localizations.localeOf(context).toString(),
    );
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
            _UnreadDateLabel(formatted: formatted, danger: danger),
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
        localeUpperCase(
          context,
          FluxerLocalizations.of(context).chatUnreadDividerNew,
        ),
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
    final String formatted = formatUserFullDate(
      date.toLocal(),
      Localizations.localeOf(context).toString(),
    );
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

class _UnreadDateLabel extends ConsumerWidget {
  const _UnreadDateLabel({required this.formatted, required this.danger});

  final String formatted;
  final Color danger;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool useOpaqueFill = ref.watch(
      chatWallpaperProvider.select(
        (ChatWallpaperSnapshot snapshot) => snapshot.resolved.isThemeBackground,
      ),
    );
    return ColoredBox(
      color: useOpaqueFill ? context.colors.chatBackground : Colors.transparent,
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
            shadows: useOpaqueFill
                ? null
                : const <Shadow>[
                    Shadow(color: Color(0xCC000000), blurRadius: 4),
                  ],
          ),
        ),
      ),
    );
  }
}

class _LiveDouble extends ChangeNotifier implements ValueListenable<double> {
  _LiveDouble(this._value);

  double _value;

  @override
  double get value => _value;

  void update(double next, {required bool notify}) {
    if (_value == next) {
      return;
    }
    _value = next;
    if (notify) {
      notifyListeners();
    }
  }
}

class _LiveTailScrollController extends ScrollController {
  _LiveTailScrollController({required this.holdTrailingEdge});

  final bool Function() holdTrailingEdge;
  double armedInitialOffset = 0;

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) {
    final double initialPixels = armedInitialOffset;
    armedInitialOffset = 0;
    return MessageListScrollPosition(
      physics: physics,
      context: context,
      initialPixels: initialPixels,
      keepScrollOffset: keepScrollOffset,
      oldPosition: oldPosition,
      debugLabel: debugLabel,
      holdTrailingEdge: holdTrailingEdge,
    );
  }
}
