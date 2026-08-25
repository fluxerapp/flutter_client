import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/accessibility/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/accessibility/message_group_spacing.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/chat/data/chat_unread_summary.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/attachment_alt_text_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/channel_pins_sheet.dart';
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
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/core/message_pagination_coordinator.dart';
import 'package:fluxer_app/features/chat/providers/messages/spoiler_reveal_provider.dart';
import 'package:fluxer_app/features/chat/utils/channel_message_stream.dart';
import 'package:fluxer_app/features/chat/utils/message_action_permissions.dart';
import 'package:fluxer_app/features/chat/utils/message_grouping_utils.dart';
import 'package:fluxer_app/features/chat/utils/message_page_sync.dart';
import 'package:fluxer_app/features/chat/utils/pinned_system_message_navigation.dart';
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
import 'package:fluxer_app/features/moderation/iar/iar_flow.dart';
import 'package:fluxer_app/features/moderation/iar/iar_simple_report_sheet.dart';
import 'package:fluxer_app/features/moderation/providers/local_user_spam_override_provider.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/markdown/message_markdown_settings.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kUnreadDividerHeight = 16.0;
const _kUnreadDateDividerHeight = 20.0;
const _kMessageListScrollCacheExtent = 1200.0;
const _kMessageListCompactScrollCacheExtent = 400.0;

const double _kMessageListStatusOverlayInsetMobile =
    WideComposerLayout.mobileMessageListTrailingInset;
const double _kMessageListStatusOverlayInsetWide =
    WideComposerLayout.messageListTrailingInset;

/// Trailing-run length at which a pinned reader is re-anchored to the tail.
const int _kPinnedRecenterTrailingThreshold = 60;

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

/// Minimum inset from the viewport top for the NEW divider on unread opens.
const double _kUnreadOpenTopInset = 32;

/// How long a parked jump target may hold off edge pagination before it is
/// retired. The page that would contain it may never arrive - a deleted target
/// comes back as a neighbour window with no error - so the wait is bounded.
const Duration _kPendingScrollTargetTimeout = Duration(seconds: 6);

/// The scrollable list of messages in the chat area: one center-anchored
/// [MessageListViewport] for every open/jump/live state. Positioning is the
/// (anchorId, anchorFraction, anchorEdge) triple; prepends and appends are
/// structurally scroll-stable because they land at the far ends of the
/// leading/trailing slivers, away from the center marker.
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
  late final MessageListDemandSource _demandSource;

  // ---- Unified center-anchored viewport (Phase 3) ----
  // Positioning is always the pair (anchorId, anchorFraction); every
  // re-anchor bumps _anchorEpoch so a FRESH ScrollPosition lays the anchor
  // out at its fraction atomically (no wrong-paint frame, no settle loop).
  String? _anchorId;
  double _anchorFraction = 1;
  MessageListAnchorEdge _anchorEdge = MessageListAnchorEdge.after;
  int _anchorEpoch = 0;
  bool _anchorResolved = false;
  // True while the open anchor is the unread divider; underfill must not
  // bottom-pin short trailing blocks.
  bool _unreadOpenLayout = false;
  double _unreadLeadingPad = 0;
  final MessageListPin _pin = MessageListPin();
  final AnimatedImagePlaybackController _animatedImagePlaybackController =
      AnimatedImagePlaybackController();
  final MessageTileCache _tileCache = MessageTileCache();
  late final ChatViewModel _chatViewModel;
  late final ChatReadViewport _readViewport;
  late String _viewportChannelId;
  String? _pendingScrollTarget;
  // The channel the parked target belongs to, plus the deadline that retires
  // it. An `around=<id>` fetch whose target was deleted or filtered returns the
  // neighbour window with no error; once that window lands, pending is consumed
  // by scrolling the closest snowflake neighbour. The timeout is the residual
  // escape when even that cannot settle.
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

  bool _userDragActive = false;
  // Stays true after a user-driven leave of the 8px engage zone until the
  // reader returns to the tail or an explicit jump/send re-engages it.
  // Survives ScrollEnd (including ballistic) so onUserScrollEnd's 64px hold
  // cannot re-arm follow.
  bool _followDisarmed = false;

  // Invalidates deferred scroll effects scheduled against a previous UI
  // world: bumped on channel reload and on every wholesale window
  // replacement (windowSwap origin), so a stale post-frame callback can
  // never mutate the scroll position of the window that replaced it.
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
        isActive: widget.visible,
      );
      _onScroll();
    });
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
        unawaited(
          showChannelPinsSheet(
            context,
            ref,
            channelId: ref.read(chatViewModelProvider).channelId,
          ),
        );
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

  @override
  void didUpdateWidget(MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.targetMessageId != oldWidget.targetMessageId &&
        widget.targetMessageId != null) {
      _setPendingScrollTarget(widget.targetMessageId);
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
    _chatKeybindEffectsSubscription?.close();
    _messageKeyboardNavigation.unregister(
      focusNext: _focusNextMessage,
      focusPrevious: _focusPreviousMessage,
    );
    _pendingScrollTargetTimer?.cancel();
    _pendingScrollTargetTimer = null;
    _readViewport.setViewportActive(
      channelId: _viewportChannelId,
      isActive: false,
    );
    _chatViewModel
      ..setUserScrollActive(channelId: _viewportChannelId, active: false)
      ..clearCurrentManualUnread()
      ..clearStickyUnreadAfterBuildForCurrentChannel();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _animatedImagePlaybackController.dispose();
    super.dispose();
  }

  /// EVERY re-anchor: new (anchorId, fraction, edge) plus a fresh anchor
  /// epoch. _uiEpoch moves with it so previously scheduled deferred scroll
  /// effects die with the layout they described.
  void _reanchor(
    String? anchorId,
    double fraction, {
    required MessageListAnchorEdge edge,
    bool rebase = false,
  }) {
    setState(() {
      _anchorId = anchorId;
      _anchorFraction = fraction;
      _anchorEdge = edge;
      _anchorEpoch++;
      _uiEpoch++;
      if (!rebase) {
        _unreadOpenLayout = false;
        _unreadLeadingPad = 0;
      }
    });
    _demandSource.resetApproachVelocity();
    // A rebase keeps pixels identical: the fraction was MEASURED off the
    // live layout, so the half-height center correction (which centers a
    // jump target's rect) and the underfill fallback must not run. Jumps
    // leave unread-open layout so they can center the target tile.
    if (!rebase && anchorId != null && fraction < 1.0) {
      _scheduleAnchorCenterCorrection(anchorId);
      _scheduleUnderfillBottomReanchor();
    }
  }

  /// `CustomScrollView.anchor` places the anchor item's LEADING edge at the
  /// fraction; centering the item's RECT needs one measured half-height
  /// correction after the first layout. Single-shot and epoch-guarded - not
  /// a settle loop.
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
        // A `before` anchor has its LEADING edge at the fraction: centering
        // the rect moves the content UP by half (pixels grow toward newer).
        // An `after` anchor has its TRAILING edge there: content DOWN.
        final double corrected = _anchorEdge == MessageListAnchorEdge.before
            ? position.pixels + half
            : position.pixels - half;
        position.jumpTo(
          corrected.clamp(position.minScrollExtent, position.maxScrollExtent),
        );
      });
    });
  }

  RenderBox? _streamTileBox(String messageId) {
    final BuildContext? itemContext = _findStreamTileContext(messageId);
    if (itemContext == null || !itemContext.mounted) {
      return null;
    }
    final RenderObject? renderObject = itemContext.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return null;
    }
    return renderObject;
  }

  RenderBox? _scrollViewportBox() {
    if (!_scrollController.hasClients) {
      return null;
    }
    final RenderObject? viewportObject = _scrollController
        .position
        .context
        .notificationContext
        ?.findRenderObject();
    if (viewportObject is! RenderBox || !viewportObject.hasSize) {
      return null;
    }
    return viewportObject;
  }

  BuildContext? _findStreamTileContext(String messageId) {
    final BuildContext? root =
        _scrollController.position.context.notificationContext;
    if (root == null) {
      return null;
    }
    final Key target = ValueKey<String>('msg-$messageId');
    BuildContext? found;
    void visitor(Element element) {
      if (found != null) {
        return;
      }
      if (element.widget.key == target) {
        found = element;
        return;
      }
      element.visitChildren(visitor);
    }

    root.visitChildElements(visitor);
    return found;
  }

  /// A fractional anchor only holds while the content below it can fill
  /// `(1 - fraction) * viewportExtent`: once the trailing side clamps to zero
  /// extent no offset pulls the content down, so the band under the newest
  /// message is dead and undraggable. Re-anchor bottom when that happens -
  /// unless newer pagination is about to fill the trailing side.
  ///
  /// Only for a reader AT the trailing edge: the shrink that opens the band
  /// clamps an at-tail offset onto the collapsed maximum, while a reader deep
  /// in history keeps pixels below it and is left where they are - a re-anchor
  /// would remount at the tail and yank them out of history. Their own scroll
  /// back to the edge arms this again.
  ///
  /// Re-armed on later geometry, not just at anchor time: a bulk delete, a
  /// trim or a viewport growth invalidates a fraction that was valid when it
  /// was measured. Idempotent - the re-anchor it performs sets the fraction to
  /// 1.0, which the guard below then rejects.
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

  /// After an unread open, park NEW at [_kUnreadOpenAnchor] when the trailing
  /// unreads fill the lower half. If they do not, lower the split so the last
  /// unread sits on the composer instead of leaving a void under NEW.
  void _scheduleUnreadOpenLayoutPass() {
    final int epoch = _uiEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _runIfSameEpoch(epoch, _applyUnreadOpenLayout);
    });
  }

  void _applyUnreadOpenLayout() {
    if (!_unreadOpenLayout || _anchorId == null) {
      return;
    }
    final RenderBox? firstUnread = _streamTileBox(_anchorId!);
    final RenderBox? viewport = _scrollViewportBox();
    if (firstUnread == null || viewport == null) {
      return;
    }
    final ChatViewState state = ref.read(chatViewModelProvider);
    final String? newestId = state.messages.isEmpty
        ? null
        : state.messages.last.id;
    final RenderBox? newest = newestId == null || newestId == _anchorId
        ? firstUnread
        : _streamTileBox(newestId);
    final double firstUnreadTop = firstUnread.localToGlobal(Offset.zero).dy;
    final double viewportTop = viewport.localToGlobal(Offset.zero).dy;
    final double viewportHeight = viewport.size.height;
    final double trailingBottom = newest == null
        ? firstUnreadTop + firstUnread.size.height
        : newest.localToGlobal(Offset(0, newest.size.height)).dy;
    final double filledBelow =
        (trailingBottom - firstUnreadTop).clamp(0, viewportHeight) +
        _statusOverlayInset(context);
    final double nextFraction = _unreadOpenFraction(
      newestLaidOut: newest != null,
      hasMoreNewer: state.hasMoreNewerMessages,
      filledBelow: filledBelow,
      viewportHeight: viewportHeight,
    );
    final double nextLeadingPad = _unreadOpenLeadingPad(
      currentPad: _unreadLeadingPad,
      fraction: nextFraction,
      firstUnreadTop: firstUnreadTop,
      viewportTop: viewportTop,
      viewportHeight: viewportHeight,
    );
    final bool padChanged = (nextLeadingPad - _unreadLeadingPad).abs() > 0.5;
    final bool fractionChanged = (nextFraction - _anchorFraction).abs() > 0.01;
    if (!padChanged && !fractionChanged) {
      return;
    }
    setState(() {
      _unreadLeadingPad = nextLeadingPad;
      if (fractionChanged) {
        _anchorFraction = nextFraction;
        _anchorEpoch++;
        _uiEpoch++;
      }
    });
    _scheduleUnreadOpenLayoutPass();
  }

  double _unreadOpenFraction({
    required bool newestLaidOut,
    required bool hasMoreNewer,
    required double filledBelow,
    required double viewportHeight,
  }) {
    final double lowerHalf = viewportHeight * (1 - _kUnreadOpenAnchor);
    if (!newestLaidOut || hasMoreNewer || filledBelow >= lowerHalf - 8) {
      return _kUnreadOpenAnchor;
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
    var pad = fraction > _kUnreadOpenAnchor + 0.02 ? 0.0 : currentPad;
    if (fraction <= _kUnreadOpenAnchor + 0.02) {
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
    if (!_anchorResolved) {
      return;
    }
    if (_scrollController.hasClients) {
      _lastViewportDimension ??= _scrollController.position.viewportDimension;
    }
    _publishDemandGeometry();
    _syncReadViewport();
  }

  bool get _isUserDrivenScroll =>
      _userDragActive ||
      (_scrollController.hasClients &&
          _scrollController.position.userScrollDirection !=
              ScrollDirection.idle);

  /// Samples both edges' geometry and pushes demand levels/revisions into
  /// the pagination coordinator. Unified center-anchored convention: the
  /// live tail is the trailing (maxScrollExtent) direction - distance to
  /// older = pixels - min, distance to newer = trailing distance.
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
      hasMoreNewer: state.hasMoreNewerMessages,
      context: ContextToken(
        channelId: state.channelId,
        windowEpoch: state.windowEpoch,
      ),
    );
  }

  double _centerLeadingDistance(ScrollPosition position) =>
      position.pixels - position.minScrollExtent;

  double _statusOverlayInset(BuildContext context) => isMobileLayout(context)
      ? _kMessageListStatusOverlayInsetMobile
      : _kMessageListStatusOverlayInsetWide;

  double _centerTrailingDistance(ScrollPosition position) =>
      (position.maxScrollExtent -
              position.pixels -
              _statusOverlayInset(context))
          .clamp(0, double.infinity);

  /// Sign adapter for scroll deltas: positive = toward the OLDER edge.
  double _towardOlderDelta(double scrollDelta) =>
      // Center-anchored viewport: pixels grow toward newer history.
      -scrollDelta;

  /// Maps an overscroll sign to the loaded edge being pressed into.
  PaginationEdge? _overscrollEdge(double overscroll) {
    if (overscroll == 0) {
      return null;
    }
    // Beyond max = pressing into the newer (trailing) edge.
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
    _anchorFraction = 1.0;
    _anchorEdge = MessageListAnchorEdge.after;
    _anchorEpoch++;
    _anchorResolved = false;
    _unreadOpenLayout = false;
    _unreadLeadingPad = 0;
    _pin.pinned = false;
    _followDisarmed = false;
    _landAtLatestTailPending = false;
    _jumpToLatestTicket++;
    _jumpToLatestInFlight = false;
    // A target parked for another channel can never be consumed here.
    if (_pendingScrollTargetChannelId != null &&
        _pendingScrollTargetChannelId != channelId) {
      _clearPendingScrollTarget();
    }
    _lastViewportDimension = null;
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
      // The unified viewport keeps the compact cache only for the opening
      // frames; expansion is safe once idle regardless of the anchor.
      // Finger drag only; programmatic scroll must still expand cache.
      if (_userDragActive) {
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
    // Track drag at any depth so deferred pins can honor it.
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null) {
      _userDragActive = true;
    } else if (notification is ScrollEndNotification) {
      _userDragActive = false;
      _maybeExpandScrollCache();
    }
    if (notification.depth != 0) {
      return false;
    }
    if (notification is ScrollStartNotification) {
      // Drag, ballistic, or programmatic - each pairs with an End, and the
      // VM defers recovery window swaps while any of them is live.
      _chatViewModel.setUserScrollActive(
        channelId: _viewportChannelId,
        active: true,
      );
      if (notification.dragDetails != null) {
        // A user finger/trackpad drag mints the retry gesture: one deliberate
        // retry per parked cursor.
        _demandSource.onDragStart();
      }
    } else if (notification is ScrollUpdateNotification) {
      final double? delta = notification.scrollDelta;
      if (delta != null && delta != 0) {
        // Real scroll motion only: layout-time corrections dispatch no
        // update notifications, so page landings and reflows contribute
        // zero approach velocity.
        _demandSource.onScrollDelta(_towardOlderDelta(delta));
        // A user-driven leave of the engage zone must disarm before
        // ScrollEnd: a liveCreate can land mid-gesture while pinned.
        if (_isUserDrivenScroll &&
            _scrollController.hasClients &&
            _centerTrailingDistance(_scrollController.position) > 8) {
          _pin.pinned = false;
          _followDisarmed = true;
        }
      }
    } else if (notification is OverscrollNotification) {
      // At the hard wall a gesture toward the loaded edge moves ZERO pixels,
      // so the position listener never runs. The overscroll itself is the
      // "give me more" signal.
      final PaginationEdge? edge = _overscrollEdge(notification.overscroll);
      if (edge != null) {
        _demandSource.onOverscrollTowardEdge(edge);
      }
    } else if (notification is ScrollEndNotification) {
      _onUserScrollSettled();
    }
    return false;
  }

  /// A depth-0 scroll settled: update the pin latch, apply the re-center
  /// policy, trim the window at the tail, and republish the read viewport.
  void _onUserScrollSettled() {
    if (!_anchorResolved || !_scrollController.hasClients) {
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
      // Engage-only: the 64px hold would re-arm follow after a leave.
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
    } else {
      _maybeTrimDetachedWindow(state);
    }
    // A reader who scrolled back to the edge is the one the underfill repair
    // was withheld from while they were in history.
    if (_anchorId != null && _anchorFraction < 1.0 && !_unreadOpenLayout) {
      _scheduleUnderfillBottomReanchor();
    }
    // Inactive is reported LAST so a deferred recovery resync lands on the
    // trimmed window.
    _chatViewModel.setUserScrollActive(
      channelId: _viewportChannelId,
      active: false,
    );
  }

  /// Scroll-end trim of a detached window (the pinned tail path uses
  /// trimToNewestWindow). Measures the sliver child nearest the viewport
  /// center, re-anchors to it when the current anchor would fall outside
  /// the kept span (epoch remount, pixel-exact: the measured leading-edge
  /// fraction is exactly where the fresh before-edge layout places it),
  /// then trims around it and re-arms pagination on the fresh geometry.
  void _maybeTrimDetachedWindow(ChatViewState state) {
    if (state.messages.length <= kMaxLoadedMessages) {
      return;
    }
    final BuildContext? scrollableContext =
        _scrollController.position.context.notificationContext;
    final RenderObject? viewportRender = scrollableContext?.findRenderObject();
    if (viewportRender is! RenderBox || !viewportRender.hasSize) {
      return;
    }
    final double viewportTop = viewportRender.localToGlobal(Offset.zero).dy;
    final double viewportH = _scrollController.position.viewportDimension;
    final double centerY = viewportTop + viewportH / 2;
    String? visibleId;
    int visibleIdx = -1;
    double visibleTop = 0;
    double bestDistance = double.infinity;
    final BuildContext? scrollRoot =
        _scrollController.position.context.notificationContext;
    if (scrollRoot == null) {
      return;
    }
    void visitor(Element element) {
      final Key? key = element.widget.key;
      if (key is! ValueKey<String>) {
        element.visitChildren(visitor);
        return;
      }
      final String value = key.value;
      if (value.startsWith('group-')) {
        return;
      }
      if (!value.startsWith('msg-')) {
        element.visitChildren(visitor);
        return;
      }
      final String messageId = value.substring('msg-'.length);
      final int idx = state.messages.indexWhere(
        (Message m) => m.id == messageId,
      );
      if (idx < 0) {
        return;
      }
      final RenderObject? inner = element.renderObject;
      if (inner is! RenderBox || !inner.hasSize || !inner.attached) {
        return;
      }
      // The anchor positions the OUTER sliver child (the separator wrapper
      // around this MessageItem, dividers included) - ascend to it, or the
      // rebase would shift by the wrapper prefix height.
      RenderObject? node = inner;
      while (node != null &&
          node.parentData is! SliverMultiBoxAdaptorParentData) {
        node = node.parent;
      }
      if (node is! RenderBox || !node.hasSize) {
        return;
      }
      final double top = node.localToGlobal(Offset.zero).dy;
      final double distance = (top - centerY).abs();
      if (distance < bestDistance) {
        bestDistance = distance;
        visibleId = messageId;
        visibleIdx = idx;
        visibleTop = top;
      }
    }

    scrollRoot.visitChildElements(visitor);
    final String? nearestId = visibleId;
    if (nearestId == null) {
      // Nothing measurable this cycle; the next scroll end retries.
      return;
    }
    final int len = state.messages.length;
    final int start = (visibleIdx - kTrimmedMessageWindowSize ~/ 2).clamp(
      0,
      len - kTrimmedMessageWindowSize,
    );
    final int anchorIdx = _anchorId == null
        ? -1
        : state.messages.indexWhere((Message m) => m.id == _anchorId);
    if (anchorIdx < start || anchorIdx >= start + kTrimmedMessageWindowSize) {
      _reanchor(
        nearestId,
        ((visibleTop - viewportTop) / viewportH).clamp(0.0, 1.0),
        edge: MessageListAnchorEdge.before,
        rebase: true,
      );
    }
    _chatViewModel.trimAroundVisible(nearestId);
    // Re-arm pagination on the post-trim layout: the revision bump releases
    // idle pumps; onWindowTrimmed buys parked ones (capped mid-fling) one
    // retry. Epoch captured AFTER any rebase so the callback runs on the
    // layout it describes.
    final int epoch = _uiEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _runIfSameEpoch(epoch, () {
        _publishDemandGeometry();
        _demandSource.onWindowTrimmed();
      });
    });
  }

  /// Re-center policy: a pinned reader with a deep trailing run re-anchors
  /// to the newest message, then settles into the trailing inset.
  void _maybeRecenterPinnedTail(List<Message> messages) {
    final String? anchor = _anchorId;
    if (messages.isEmpty) {
      return;
    }
    final String newestId = messages.last.id;
    if (anchor == null || anchor == newestId) {
      // A null anchor already keeps ALL content in the leading sliver; the
      // trailing run cannot grow.
      if (anchor != null) {
        return;
      }
    }
    if (anchor == null) {
      return;
    }
    // Trailing run length, measured on messages (stream separators only add
    // items, so this undercounts slightly - a conservative threshold).
    int trailing = 0;
    for (int i = messages.length - 1; i >= 0; i -= 1) {
      if (compareSnowflakeIds(messages[i].id, anchor) <= 0) {
        break;
      }
      trailing += 1;
    }
    if (trailing > _kPinnedRecenterTrailingThreshold) {
      _reanchor(newestId, 1, edge: MessageListAnchorEdge.after);
      _settlePinnedTailScroll();
    }
  }

  /// A write removed the current anchor (deleted center). Swap to the
  /// nearest survivor on the side that keeps the split partition identical,
  /// without an epoch bump, so the position holds and only the deleted
  /// item's gap closes: `after` anchors take the nearest older survivor,
  /// `before` anchors the nearest newer; at the window's edge fall back to
  /// the other direction.
  void _repairDeletedAnchor(List<Message> next) {
    final String? anchor = _anchorId;
    if (anchor == null) {
      return;
    }
    if (next.any((Message m) => m.id == anchor)) {
      return;
    }
    // An acked own send renames the anchor's id instead of removing the row,
    // and nonces reach every recipient, so only the sender's row may claim it.
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
    // A dimension change (keyboard, rotation, layout swap) invalidates any
    // built-up approach velocity and is itself geometry progress.
    _demandSource.resetApproachVelocity();
    _publishDemandGeometry();
    // A re-anchor remount attaches a fresh position without any scroll, so
    // the read viewport (auto-ack, jump-to-bottom button) must republish
    // here - the metrics change IS the attach signal.
    _syncReadViewport();
    final double viewport = notification.metrics.viewportDimension;
    final double? previous = _lastViewportDimension;
    _lastViewportDimension = viewport;
    if (previous != null && viewport < previous - 0.5 && _pin.pinned) {
      // Keyboard/viewport shrink while pinned: stay glued to the live tail.
      final int epoch = _uiEpoch;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _runIfSameEpoch(epoch, () {
          if (_scrollController.hasClients && _pin.pinned) {
            _scrollController.jumpTo(
              _scrollController.position.maxScrollExtent,
            );
          }
        });
      });
    }
    // The fraction was measured against content that may since have shrunk
    // (bulk delete, trim, collapse) or a viewport that grew. Metrics
    // notifications also fire per scrolling frame (extentBefore/extentAfter
    // move with pixels), so the condition is pre-read off the notification
    // instead of arming a post-frame pass on every one.
    final ScrollMetrics metrics = notification.metrics;
    if (_anchorId != null &&
        _anchorFraction < 1.0 &&
        !_unreadOpenLayout &&
        metrics.maxScrollExtent <= 0 &&
        metrics.pixels >= metrics.maxScrollExtent - 0.5) {
      _scheduleUnderfillBottomReanchor();
    }
    return false;
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

  /// A target is parked waiting for the page that contains it.
  bool _hasPendingScrollTarget() => _pendingScrollTarget != null;

  /// A jump owns the viewport: edge pagination and read-viewport auto-ack
  /// must not treat a mid-jump position as where the user is reading.
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

  List<ChannelStreamItem> _channelStreamFor({
    required List<Message> messages,
    required String? oldestUnreadMessageId,
    required String? currentUserId,
    required Set<String> blockedUserIds,
  }) {
    if (messages.isEmpty) {
      return const <ChannelStreamItem>[];
    }
    return createChannelStream(
      messages: messages,
      oldestUnreadMessageId: oldestUnreadMessageId,
      // An after-edge anchor's containing item sits leading-of-center; the
      // split boundary stops collapsed groups from absorbing newer content
      // into it (which would shift everything above the marker).
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

  /// Publishes viewport geometry to the read-viewport provider.
  ///
  /// Geometry is published unconditionally: `viewportHeight` gates the
  /// jump-to-bottom distance branch, so withholding it during a jump hides the
  /// only escape hatch out of a detached window. Only `nearLoadedTail` - the
  /// flag that can trigger an auto-ack - is withheld while a jump owns the
  /// viewport, since the position mid-jump is not where the user is reading.
  void _syncReadViewport({bool ignoreJumpTarget = false}) {
    if (!_anchorResolved || !_scrollController.hasClients) {
      return;
    }
    final bool jumpOwnsViewport = !ignoreJumpTarget && _isJumpOwningViewport();
    final ScrollPosition position = _scrollController.position;
    final double distanceFromTrailingEdge = _centerTrailingDistance(position);
    _readViewport.updateViewport(
      channelId: _viewportChannelId,
      nearLoadedTail:
          !jumpOwnsViewport &&
          isNearTrailingEdge(
            distanceFromTrailingEdge: distanceFromTrailingEdge,
          ),
      distanceFromBottom: distanceFromTrailingEdge,
      viewportHeight: position.viewportDimension,
      // The tail this geometry was measured against: an atomic write that
      // advances the tail (terminal newer page, live create) makes this
      // publication stale for auto-ack until post-layout geometry
      // republishes with the fresh token.
      sampledTailId: newestServerBackedMessageId(
        ref.read(chatViewModelProvider).messages,
      ),
    );
  }

  /// Honors [explicitIntent] requests from any distance; a bare signal is
  /// filtered by [_isSoftReconcileWhileDisarmed].
  void _onScrollToBottom({bool explicitIntent = false}) {
    // Gated first: a dropped request must not retire the parked target.
    if (!explicitIntent && _isSoftReconcileWhileDisarmed()) {
      return;
    }
    // The escape hatch preempts: retire any parked target instead of
    // refusing the tap.
    _clearPendingScrollTarget();
    if (!_anchorResolved) {
      return;
    }
    final ChatViewState chatState = ref.read(chatViewModelProvider);
    // An unconfirmed tail must fetch the present: a local jump to the
    // trailing edge would land on the newest message of the LOADED window,
    // which in a detached window is history, not the present.
    if (chatState.hasMoreNewerMessages) {
      _followDisarmed = false;
      _requestJumpToLatest();
      return;
    }
    _followDisarmed = false;
    _pin.onJumpToPresentLanded();
    final List<Message> messages = chatState.messages;
    final String? newestId = messages.isEmpty ? null : messages.last.id;
    final bool alreadyAtLiveTail =
        !_unreadOpenLayout &&
        _anchorFraction >= 1.0 &&
        _anchorEdge == MessageListAnchorEdge.after &&
        _anchorId == newestId;
    if (!alreadyAtLiveTail) {
      _reanchor(newestId, 1, edge: MessageListAnchorEdge.after);
    }
    _settlePinnedTailScroll();
  }

  /// Only glue can have produced this request: the reader left the tail and
  /// is still nearer than the jump button's own visibility threshold.
  bool _isSoftReconcileWhileDisarmed() {
    if (!_followDisarmed || !_scrollController.hasClients) {
      return false;
    }
    // An unconfirmed tail must fetch the present, reconcile or not.
    if (ref.read(chatViewModelProvider).hasMoreNewerMessages) {
      return false;
    }
    final ScrollPosition position = _scrollController.position;
    return !isBeyondJumpToBottomThreshold(
      distanceFromBottom: _centerTrailingDistance(position),
      viewportHeight: position.viewportDimension,
    );
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
          // A thrown Error would otherwise strand the in-flight flag and wedge
          // every later jump request.
          .whenComplete(() {
            if (ticket == _jumpToLatestTicket) {
              _jumpToLatestInFlight = false;
            }
          }),
    );
  }

  // An open that lands without a jump has no scroll event, so the
  // jump-to-bottom button would never learn the viewport height it needs to
  // evaluate the distance branch.
  void _scheduleBottomViewportSync() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _anchorResolved) {
        _syncReadViewport();
      }
    });
  }

  // Scroll into the trailing inset so the newest message clears the composer
  // fade. The center anchor at fraction 1.0 parks at offset 0; maxScrollExtent
  // is the visual tail.
  void _settlePinnedTailScroll() {
    final int epoch = _uiEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _runIfSameEpoch(epoch, () {
        if (!_scrollController.hasClients || !_pin.pinned) {
          return;
        }
        if (ref.read(chatViewModelProvider).hasMoreNewerMessages) {
          return;
        }
        _jumpToLiveTailExtent(_scrollController.position);
        _syncReadViewport();
      });
    });
  }

  void _jumpToLiveTailExtent(ScrollPosition position) {
    if (position.pixels < position.maxScrollExtent) {
      position.jumpTo(position.maxScrollExtent);
    }
  }

  // Coordinates the latest-window replacement with its tail landing.
  void _landAtLatestTail(List<Message> next) {
    // Jump-to-present landing: re-anchor to the newest at the bottom, engage
    // the pin, then settle into the trailing inset.
    _pin.onJumpToPresentLanded();
    _followDisarmed = false;
    _reanchor(
      next.isEmpty ? null : next.last.id,
      1,
      edge: MessageListAnchorEdge.after,
    );
    _settlePinnedTailScroll();
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
    // A landed window that still lacks the target is the deleted or filtered
    // case: settle on the neighbour now. The view model signals after
    // installing the around page, so nothing later rebuilds this to retry.
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
      // Still in flight: park until the around page arrives. Resolving here
      // would land on the edge of the window the reader is leaving.
      _setPendingScrollTarget(messageId);
      talker.debug('[MessageList] pending target parked $messageId');
      return;
    }
    if (scrollId != messageId) {
      talker.debug(
        '[MessageList] jump target $messageId missing; '
        'scroll neighbour $scrollId',
      );
    }
    _clearPendingScrollTarget();
    _reanchor(scrollId, _kUnreadOpenAnchor, edge: MessageListAnchorEdge.before);
    final int highlightEpoch = _uiEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _runIfSameEpoch(highlightEpoch, () {
        // The jump landed atomically this frame: keep the highlight visible
        // for its full duration from the moment the user can see it.
        _confirmJumpHighlightScroll(messageId);
      });
    });
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
    required bool isGuildSendDisabled,
    required bool swipeToReplyEnabled,
    bool renderDaySeparator = true,
    bool prependUnreadSeparator = false,
    bool forceLeadingSpacing = false,
  }) {
    final bool isNewDay =
        renderDaySeparator &&
        (previousMessage == null ||
            !_isSameDay(message.timestamp, previousMessage.timestamp));
    final bool isGrouped = computeMessageRowGrouped(
      message: message,
      previousMessage: previousMessage,
      isNewDay: isNewDay,
    );
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
      swipeToReplyEnabled,
      renderSettings.messageDisplayCompact,
    );
    return _tileCache.resolve(message.id, layoutSignature, () {
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
            onLongPress: useTouchMessageActions
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
            onSecondaryTapUp: !useTouchMessageActions
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
            swipeToReplyEnabled: swipeToReplyEnabled,
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
            onReport: () => unawaited(
              showSimpleIarReportSheet(
                context,
                iarContext: IarMessageContext(
                  message: message,
                  guildId: guildId,
                ),
              ),
            ),
            onDeleteAttachment: (Attachment attachment) => ref
                .read(chatViewModelProvider.notifier)
                .deleteMessageAttachment(
                  messageId: message.id,
                  attachmentId: attachment.id,
                ),
            onEditAttachmentAltText: (Attachment attachment) => unawaited(
              editMessageAttachmentAltText(
                context,
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
    required bool swipeToReplyEnabled,
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
          swipeToReplyEnabled,
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
                  swipeToReplyEnabled: swipeToReplyEnabled,
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
            swipeToReplyEnabled: swipeToReplyEnabled,
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
    required bool swipeToReplyEnabled,
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
        isGuildSendDisabled: isGuildSendDisabled,
        swipeToReplyEnabled: swipeToReplyEnabled,
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
          // WHO asked decides what the viewport may do with this write. The
          // verdict is computed here, against exactly the transition this
          // invocation was handed, and frozen into a local — a later write
          // cannot re-authorize it (there is no shared latest-value cell).
          final MessagesOrigin? origin = ref
              .read(chatViewModelProvider)
              .writeOriginFor(previous: previous, next: next);
          if (origin == MessagesOrigin.windowSwap) {
            // EVERY wholesale replacement - jump landings AND network-refresh
            // reinstalls - invalidates deferred scroll effects scheduled
            // against the window it replaced.
            _uiEpoch++;
          }
          if (origin == MessagesOrigin.olderPage ||
              origin == MessagesOrigin.newerPage) {
            // Deterministic awaitingGeometry release: sample POST-layout
            // geometry of the window that scheduled it, then force-bump
            // exactly the installed edge's revision (an underfilled list
            // keeps min == max == 0 across installs, so no metrics
            // notification and no scroll fires). Epoch-guarded so a stale
            // install cannot release a newer context's pump.
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
            // Any write that leaves the window detached unpins: the loaded
            // tail is history, not the present.
            _pin.onDetached();
          }
          if (_landAtLatestTailPending &&
              origin == MessagesOrigin.windowSwap &&
              !postWrite.hasMoreNewerMessages) {
            // Only the swap's own write may be read as the jump landing: a
            // final newer page can flip the flag false while a jump is in
            // flight, and consuming the pending land on it would pin the
            // viewport onto a pagination install.
            _landAtLatestTailPending = false;
            _landAtLatestTail(next);
            return;
          }
          if (_anchorResolved) {
            _repairDeletedAnchor(next);
          }
          if (origin == MessagesOrigin.ownSend) {
            _pin.onOwnSend();
            _followDisarmed = false;
          }
          if ((origin == MessagesOrigin.liveCreate ||
                  origin == MessagesOrigin.ownSend) &&
              _pin.pinned) {
            // Follow: authorized by the write's own origin AND the
            // event-sourced pin - never recomputed from geometry here. The
            // terminal newer page of the user's own pagination lands with
            // pinned == false (they were detached) and preserves. A live
            // drag/fling or a disarmed leave owns the position.
            final int followEpoch = _uiEpoch;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _runIfSameEpoch(followEpoch, () {
                if (!_scrollController.hasClients ||
                    !_pin.pinned ||
                    _followDisarmed ||
                    _isUserDrivenScroll) {
                  return;
                }
                _scrollController.jumpTo(
                  _scrollController.position.maxScrollExtent,
                );
              });
            });
          }
          if (origin == MessagesOrigin.realtimeEvent && _pin.pinned) {
            // A delete or an edit changes the trailing extent under a reader
            // sitting AT the tail. The framework clamps an offset that grew
            // too large but never grows one that got too small, so a row that
            // got taller pushes the newest message below the fold. jumpTo goes
            // idle first, so a live drag/fling or a disarmed leave must own
            // the position.
            final int glueEpoch = _uiEpoch;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _runIfSameEpoch(glueEpoch, () {
                if (!_scrollController.hasClients ||
                    !_pin.pinned ||
                    _followDisarmed ||
                    _isUserDrivenScroll) {
                  return;
                }
                final ScrollPosition position = _scrollController.position;
                _jumpToLiveTailExtent(position);
              });
            });
          }
          // Every other origin: structurally scroll-stable by construction -
          // prepends/appends land at the far ends of the leading/trailing
          // slivers, away from the center.
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
      return MessageListSkeleton(channelId: expectedChannelId);
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
    ref.watch(localUserSpamOverrideProvider.select((state) => state.version));
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
        : resolveGuildChannel(ref, channelId);
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
    final List<ChannelStreamItem> channelStream = _channelStreamFor(
      messages: messages,
      oldestUnreadMessageId: visualUnreadId,
      currentUserId: currentUserId,
      blockedUserIds: blockedUserIds,
    );
    final bool hasJumpTarget =
        widget.targetMessageId != null || _pendingScrollTarget != null;
    if (!_anchorResolved && (!isLoading || messages.isNotEmpty)) {
      if (hasJumpTarget && messages.isEmpty) {
        // Wait for the around-window before anchoring.
      } else if (readStateAsync.hasValue ||
          (hasJumpTarget && messages.isNotEmpty)) {
        final String? unreadAnchorId = hasJumpTarget ? null : visualUnreadId;
        final bool canAnchorUnread =
            unreadAnchorId != null &&
            findChannelStreamDataIndex(channelStream, unreadAnchorId) != null;
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
        _followDisarmed = false;
        var settledReadTailOpen = false;
        if (canAnchorUnread) {
          // Unread open: the split falls BEFORE the first unread's stream
          // item, so the NEW divider - rendered at the top of that tile,
          // even when the unread lives inside a collapsed group - sits at
          // the fraction. A short trailing block is packed to the composer
          // after layout so NEW is not stuck at mid-viewport over a void.
          _unreadOpenLayout = true;
          _unreadLeadingPad = 0;
          _anchorId = unreadAnchorId;
          _anchorFraction = _kUnreadOpenAnchor;
          _anchorEdge = MessageListAnchorEdge.before;
          _scheduleUnreadOpenLayoutPass();
        } else if (jumpAnchorId != null) {
          // Jump open: land on the target, or the closest neighbour when the
          // around page omitted it (deleted / filtered). Never the live tail.
          _anchorId = jumpAnchorId;
          _anchorFraction = _kUnreadOpenAnchor;
          _anchorEdge = MessageListAnchorEdge.before;
          _scheduleUnderfillBottomReanchor();
        } else {
          _anchorId = messages.isEmpty ? null : messages.last.id;
          _anchorFraction = 1.0;
          _anchorEdge = MessageListAnchorEdge.after;
          if (!hasMoreNewerMessages) {
            // A bottom-anchored open at the live tail starts pinned.
            _pin.onJumpToPresentLanded();
            _settlePinnedTailScroll();
            settledReadTailOpen = true;
          }
        }
        _expandScrollCacheNow();
        if (!settledReadTailOpen) {
          _scheduleBottomViewportSync();
        }
      }
    }
    if (!isLoading && _messagesWereLoading && _anchorResolved) {
      _scheduleBottomViewportSync();
    }
    _messagesWereLoading = isLoading;
    // Steady demand publish: a resolved open with a static viewport emits no
    // scroll and no further metrics notification (a bottom open attaches at
    // the tail and stays there; the mode can resolve AFTER the only attach
    // notification fired), so the demand source would otherwise never learn
    // the geometry - leaving overscroll retries without a context. Post-frame
    // so it samples laid-out geometry; a static sample pushes nothing.
    if (_anchorResolved) {
      // Epoch captured at schedule time: a re-anchor inside this same
      // frame's callbacks would otherwise be sampled against the
      // still-mounted old geometry.
      final int scheduledEpoch = _uiEpoch;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _uiEpoch == scheduledEpoch) {
          _publishDemandGeometry();
        }
      });
    }
    // Rebuild on keyboard view-size changes so ScrollMetricsNotification fires.
    MediaQuery.sizeOf(context);
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
      _tileCache.clear();
    }

    // Defer until the anchor is resolved so this build mounts the real list
    // and the correction post-frame can find scroll clients.
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
        // Mid-build re-anchor: direct field writes - THIS build already
        // renders the new anchor (setState here would assert).
        _unreadOpenLayout = false;
        _unreadLeadingPad = 0;
        _anchorId = scrollId;
        _anchorFraction = _kUnreadOpenAnchor;
        _anchorEdge = MessageListAnchorEdge.before;
        _anchorEpoch++;
        _uiEpoch++;
        _demandSource.resetApproachVelocity();
        _scheduleAnchorCenterCorrection(scrollId);
        _scheduleUnderfillBottomReanchor();
      } else if (messageLoadFailed) {
        // The page that would carry the target will not arrive.
        talker.debug(
          '[MessageList] pending target $target dropped: load failed',
        );
        _clearPendingScrollTarget();
      } else if (windowUpdatedSincePark && messages.isNotEmpty) {
        // New window landed without a neighbour to settle on
        talker.debug(
          '[MessageList] pending target $target not in ${messages.length} '
          'messages',
        );
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
            final bool swipeToReplyEnabled = !isCompactWideDrawerPeekMode(
              context,
              shellLocation: ref.watch(shellLocationProvider),
              revealSide: ref.watch(currentRevealSideProvider),
            );
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
              body = AnimatedImagePlaybackScope(
                controller: _animatedImagePlaybackController,
                child: MessageListViewport(
                  anchorEpoch: _anchorEpoch,
                  stream: channelStream,
                  anchorId: _anchorId,
                  anchorFraction: _anchorFraction,
                  anchorEdge: _anchorEdge,
                  controller: _scrollController,
                  centerKey: _unreadCenterKey,
                  itemBuilder: (BuildContext context, int dataIndex) =>
                      _centerStreamTile(
                        context: context,
                        stream: channelStream,
                        dataIndex: dataIndex,
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
                        isGuildSendDisabled: isGuildSendDisabled,
                        swipeToReplyEnabled: swipeToReplyEnabled,
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
                  trailingInset: _statusOverlayInset(context),
                  leadingPad: _unreadOpenLayout ? _unreadLeadingPad : 0,
                  startOfChannelHeader: startOfChannelHeader,
                ),
              );
            }

            final double scaleRatio = chatFontSize / 16.0;
            final bool showUnreadBar =
                !isLoading && messages.isNotEmpty && showUnreadBarEligible;
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
    String? guildId, {
    required bool isGuildSendDisabled,
    required ({
      bool canSendMessages,
      bool canAddReactions,
      bool canPinMessage,
      bool canManageMessages,
    })
    channelActions,
  })
  builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChannelMessagePermissions channelMessagePerms = channelId.isEmpty
        ? ChannelMessagePermissions.unresolved
        : watchChannelMessagePermissionsForComposer(ref, channelId);
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
    final String? guildId = ref.watch(contextualGuildIdProvider);
    final bool isGuildSendDisabled =
        guildId != null &&
        guildId.isNotEmpty &&
        ref.watch(
          guildByIdProvider(guildId).select(
            (AsyncValue<Guild?> guild) => guild.value?.isSendDisabled ?? false,
          ),
        );
    final SearchEnginesState searchEngines = ref.watch(
      advancedPreferencesProvider.select((s) => s.searchEngines),
    );
    final bool messageDisplayCompact = ref.watch(
      userSettingsViewModelProvider.select((s) => s.messageDisplayCompact),
    );
    final MessageRenderSettings settings = MessageRenderSettings(
      activeGuildId: guildId,
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
      // Rebuild only when media sizes change.
      chatPreferences: _watchChatMediaPreferences(ref),
      messageGroupSpacing: ref.watch(
        appearancePreferencesProvider.select(
          (AppearancePreferencesState s) => messageGroupSpacingForDisplayMode(
            messageGroupSpacing: s.messageGroupSpacing,
            compactMessageGroupSpacing: s.compactMessageGroupSpacing,
            messageDisplayCompact: messageDisplayCompact,
          ),
        ),
      ),
      messageDisplayCompact: messageDisplayCompact,
      showUserAvatarsInCompactMode: ref.watch(
        appearancePreferencesProvider.select(
          (s) => s.showUserAvatarsInCompactMode,
        ),
      ),
      markdown: MessageMarkdownSettings(
        use12Hour: ref.watch(use12HourTimeFormatProvider),
        alwaysUnderlineLinks: ref.watch(
          appearancePreferencesProvider.select((s) => s.alwaysUnderlineLinks),
        ),
        dimStrikethroughText: ref.watch(
          appearancePreferencesProvider.select((s) => s.dimStrikethroughText),
        ),
        animateCustomEmoji: effectiveMotionOf(
          ref,
          context,
        ).effectiveAnimateEmoji,
        enableTextSelection: ref.watch(
          advancedPreferencesProvider.select((s) => s.enableTextSelection),
        ),
        searchEngines: searchEngines,
        selectionContextMenuBuilder: selectionMenuBuilderFor(searchEngines),
      ),
    );
    return builder(
      context,
      settings,
      guildId,
      isGuildSendDisabled: isGuildSendDisabled,
      channelActions: (
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
      ),
    );
  }
}

ChatPreferencesState _watchChatMediaPreferences(WidgetRef ref) {
  ref.watch(
    chatPreferencesProvider.select(
      (ChatPreferencesState s) =>
          (s.embedMediaDimensionSize, s.attachmentMediaDimensionSize),
    ),
  );
  return ref.read(chatPreferencesProvider);
}
