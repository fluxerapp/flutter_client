import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/data/chat_unread_summary.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_list_pivot.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/delete_message_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/message_reactions_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'sheets/remove_all_reactions_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_pagination.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/message_list_unread_review.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/messages/system_message.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/message_action_permissions.dart';
import 'package:fluxer_app/features/chat/utils/message_grouping_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/personal_notes_welcome_section.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/moderation/iar/iar_flow.dart';
import 'package:fluxer_app/features/moderation/iar/iar_simple_report_sheet.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kUnreadDividerHeight = 16.0;
const _kUnreadDateDividerHeight = 20.0;

// Riverpod does not export the concrete auto-dispose family type.
// ignore: specify_nonobvious_property_types
final _messageListReadStateProvider = StreamProvider.autoDispose
    .family<drift_db.ReadState?, String>((ref, channelId) {
      final db = ref.watch(fluxerDatabaseProvider);
      return db.readStateDao.watchReadState(channelId);
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

/// The scrollable list of messages in the chat area.
///
/// Uses a center-anchored [CustomScrollView] so prepending older
/// messages and appending newer messages do not shift the viewport.
class MessageList extends ConsumerStatefulWidget {
  const MessageList({this.targetMessageId, super.key});

  final String? targetMessageId;

  @override
  ConsumerState<MessageList> createState() => _MessageListState();
}

class _MessageListState extends ConsumerState<MessageList> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _centerKey = GlobalKey();
  final Map<String, GlobalKey> _itemKeys = <String, GlobalKey>{};
  late final ChatViewModel _chatViewModel;
  late final MessageListPaginationGuard _paginationGuard;
  String? _pendingScrollTarget;
  String? _explicitPivotMessageId;
  String? _scrollAnchoredPivotMessageId;
  String? _lastChannelId;
  bool _initialUnreadPivotReleased = false;
  bool _awaitingInitialUnreadScroll = false;
  bool _pinnedLiveNearBottom = false;

  @override
  void initState() {
    super.initState();
    _chatViewModel = ref.read(chatViewModelProvider.notifier);
    _paginationGuard = MessageListPaginationGuard(
      scrollController: _scrollController,
      isProgrammaticScroll: () => _awaitingInitialUnreadScroll,
    );
    _scrollController.addListener(_onScroll);
    _pendingScrollTarget = widget.targetMessageId;
    _explicitPivotMessageId = widget.targetMessageId;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _chatViewModel.setReadViewportActive(isActive: true);
      _syncReadViewport();
    });
  }

  @override
  void didUpdateWidget(MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.targetMessageId != oldWidget.targetMessageId &&
        widget.targetMessageId != null) {
      _pendingScrollTarget = widget.targetMessageId;
      _explicitPivotMessageId = widget.targetMessageId;
    }
  }

  @override
  void dispose() {
    _paginationGuard.dispose();
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
    final ChatViewState chatState = ref.read(chatViewModelProvider);
    if (!_isLiveNearBottom()) {
      _pinnedLiveNearBottom = false;
    }
    if (_paginationGuard.shouldLoadMore(
      hasMoreMessages: chatState.hasMoreMessages,
      isLoadingMore: chatState.isLoadingMore,
      isLoadingNewer: chatState.isLoadingNewer,
    )) {
      unawaited(ref.read(chatViewModelProvider.notifier).loadMore());
    }
    if (_canTriggerLoadNewer(chatState)) {
      unawaited(ref.read(chatViewModelProvider.notifier).loadNewer());
    }
    _syncReadViewport();
  }

  bool _isInUnreadReview(ChatViewState state) {
    return isInUnreadReview(
      stickyUnreadMessageId: state.stickyUnreadMessageId,
      initialUnreadPivotReleased: _initialUnreadPivotReleased,
    );
  }

  bool _canTriggerLoadNewer(ChatViewState state) {
    if (!_paginationGuard.shouldLoadNewer(
      hasMoreNewerMessages: state.hasMoreNewerMessages,
      isLoadingMore: state.isLoadingMore,
      isLoadingNewer: state.isLoadingNewer,
    )) {
      return false;
    }
    return canTriggerLoadNewerDuringUnreadReview(
      inUnreadReview: _isInUnreadReview(state),
    );
  }

  void _syncChannelPivot(ChatViewState state) {
    if (state.channelId != _lastChannelId) {
      _lastChannelId = state.channelId;
      _explicitPivotMessageId = widget.targetMessageId;
      _scrollAnchoredPivotMessageId = null;
      _initialUnreadPivotReleased = false;
      _awaitingInitialUnreadScroll = false;
      _pinnedLiveNearBottom = false;
      _paginationGuard.resetScrollIntent();
    }
    if (_awaitingInitialUnreadScroll) {
      return;
    }
    if (widget.targetMessageId != null &&
        state.messages.any((Message m) => m.id == widget.targetMessageId)) {
      _explicitPivotMessageId = widget.targetMessageId;
      return;
    }
    if (!state.hasMoreNewerMessages) {
      _explicitPivotMessageId = null;
    }
  }

  void _completeUnreadReviewAtBottom(ChatViewState state) {
    _initialUnreadPivotReleased = true;
    if (shouldClearPivotOnUnreadReviewRelease(
      hasMoreNewerMessages: state.hasMoreNewerMessages,
    )) {
      _scrollAnchoredPivotMessageId = null;
      if (widget.targetMessageId == null) {
        _explicitPivotMessageId = null;
      }
    }
    _paginationGuard.resetScrollIntent();
    _chatViewModel.clearCurrentManualUnread();
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      final ChatViewState state = ref.read(chatViewModelProvider);
      bool releasedAtBottom = false;
      if (_scrollController.hasClients) {
        final ScrollPosition position = _scrollController.position;
        if (shouldReleaseUnreadReviewOnScrollEnd(
          inUnreadReview: _isInUnreadReview(state),
          pixels: position.pixels,
          minScrollExtent: position.minScrollExtent,
        )) {
          _completeUnreadReviewAtBottom(state);
          releasedAtBottom = true;
        }
      }
      _syncReadViewport(ignoreJumpTarget: releasedAtBottom);
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

  bool _effectiveLiveNearBottom() {
    if (_pinnedLiveNearBottom) {
      return true;
    }
    return _isLiveNearBottom();
  }

  bool _hasActiveJumpTarget() {
    if (widget.targetMessageId != null || _pendingScrollTarget != null) {
      return true;
    }
    if (_awaitingInitialUnreadScroll) {
      return true;
    }
    return ref.read(chatViewModelProvider).highlightedMessageId != null;
  }

  void _onMessagesAppended({
    required List<Message> previousMessages,
    required List<Message> nextMessages,
  }) {
    if (_hasActiveJumpTarget()) {
      return;
    }
    if (previousMessages.isEmpty ||
        nextMessages.length <= previousMessages.length ||
        !_scrollController.hasClients) {
      return;
    }
    final bool isEndAppend =
        previousMessages.last.id ==
        nextMessages[previousMessages.length - 1].id;
    if (!isEndAppend) {
      return;
    }
    final bool isStartPrepend =
        previousMessages.first.id != nextMessages.first.id;
    final ChatViewState state = ref.read(chatViewModelProvider);
    if (isStartPrepend) {
      if (_isInUnreadReview(state)) {
        _restoreScrollOffset(_scrollController.position.pixels);
      }
      return;
    }
    if (_isInUnreadReview(state)) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final double savedOffset = position.pixels;
    final bool liveNearBottom = isLiveNearBottom(
      pixels: savedOffset,
      minScrollExtent: position.minScrollExtent,
    );
    if (liveNearBottom && !state.hasMoreNewerMessages) {
      _pinnedLiveNearBottom = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.minScrollExtent);
          _pinnedLiveNearBottom = false;
        }
      });
      return;
    }
    _scrollAnchoredPivotMessageId ??= previousMessages.last.id;
    _restoreScrollOffset(savedOffset);
  }

  void _restoreScrollOffset(double offset) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) {
        return;
      }
      _jumpToClampedOffset(offset);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_scrollController.hasClients) {
          return;
        }
        _jumpToClampedOffset(offset);
      });
    });
  }

  void _jumpToClampedOffset(double offset) {
    final ScrollPosition position = _scrollController.position;
    final double target = offset.clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    if ((position.pixels - target).abs() > 1) {
      position.jumpTo(target);
    }
  }

  String? _resolvedPivotMessageId(ChatViewState state) {
    return resolvePivotMessageId(
      hasMoreNewerMessages: state.hasMoreNewerMessages,
      explicitPivotMessageId: _explicitPivotMessageId,
      scrollAnchoredPivotMessageId: _scrollAnchoredPivotMessageId,
      messages: state.messages,
    );
  }

  void _syncReadViewport({bool ignoreJumpTarget = false}) {
    if (!_scrollController.hasClients ||
        (!ignoreJumpTarget && _hasActiveJumpTarget())) {
      return;
    }
    final ChatViewState state = ref.read(chatViewModelProvider);
    final bool liveNearBottom = _isLiveNearBottom();
    final bool inUnreadReview = _isInUnreadReview(state);
    final bool isNearBottom = reportIsNearBottomForReadViewport(
      inUnreadReview: inUnreadReview,
      liveNearBottom: liveNearBottom,
    );
    if (!inUnreadReview) {
      if (isNearBottom) {
        _scrollAnchoredPivotMessageId = null;
      } else {
        final List<Message> messages = state.messages;
        if (messages.isNotEmpty) {
          _scrollAnchoredPivotMessageId ??= messages.last.id;
        }
      }
    }
    _chatViewModel.updateReadViewport(isNearBottom: isNearBottom);
  }

  void _onScrollToBottom({bool forceDuringUnreadReview = false}) {
    if (_hasActiveJumpTarget()) {
      return;
    }
    final ChatViewState chatState = ref.read(chatViewModelProvider);
    if (_isInUnreadReview(chatState) && !forceDuringUnreadReview) {
      return;
    }
    _initialUnreadPivotReleased = true;
    _scrollAnchoredPivotMessageId = null;
    if (widget.targetMessageId == null) {
      _explicitPivotMessageId = null;
    }
    _paginationGuard.resetScrollIntent();
    if (chatState.hasMoreNewerMessages) {
      unawaited(
        ref.read(chatViewModelProvider.notifier).jumpToLatestMessages(),
      );
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        unawaited(
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          ),
        );
      }
    });
  }

  void _onUnreadBarTap() {
    _onScrollToBottom(forceDuringUnreadReview: true);
    unawaited(_chatViewModel.markCurrentChannelRead());
  }

  void _confirmJumpHighlightScroll(String messageId) {
    final String? highlightedMessageId = ref
        .read(chatViewModelProvider)
        .highlightedMessageId;
    if (highlightedMessageId == messageId) {
      _chatViewModel.extendJumpHighlight(messageId);
    }
  }

  Future<void> _scrollToTarget(String messageId, {double alignment = 0.5}) {
    final Completer<void> completer = Completer<void>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(
        _runScrollToTarget(
          messageId: messageId,
          alignment: alignment,
          completer: completer,
        ),
      );
    });
    return completer.future;
  }

  Future<void> _runScrollToTarget({
    required String messageId,
    required double alignment,
    required Completer<void> completer,
  }) async {
    try {
      if (!mounted || !_scrollController.hasClients) {
        return;
      }
      final BuildContext? itemContext = _itemKeys[messageId]?.currentContext;
      if (itemContext != null) {
        _confirmJumpHighlightScroll(messageId);
        await Scrollable.ensureVisible(
          itemContext,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          alignment: alignment,
        );
        return;
      }
      final List<Message> messages = ref.read(chatViewModelProvider).messages;
      final int idx = messages.indexWhere((Message m) => m.id == messageId);
      if (idx == -1) {
        return;
      }
      final int reversedIdx = messages.length - 1 - idx;
      final double extent = _scrollController.position.maxScrollExtent;
      final double approx = (reversedIdx / messages.length * extent).clamp(
        0.0,
        extent,
      );
      _scrollController.jumpTo(approx);
      await Future<void>.delayed(Duration.zero);
      await WidgetsBinding.instance.endOfFrame;
      await Future<void>.delayed(Duration.zero);
      await WidgetsBinding.instance.endOfFrame;
      if (!mounted || !_scrollController.hasClients) {
        return;
      }
      final BuildContext? contextAfterLayout =
          _itemKeys[messageId]?.currentContext;
      if (contextAfterLayout == null) {
        return;
      }
      _confirmJumpHighlightScroll(messageId);
      await Scrollable.ensureVisible(
        contextAfterLayout,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        alignment: alignment,
      );
    } finally {
      if (!completer.isCompleted) {
        completer.complete();
      }
    }
  }

  void _onScrollToMessage(String messageId) {
    _explicitPivotMessageId = messageId;
    final String? stickyUnreadId = ref
        .read(chatViewModelProvider)
        .stickyUnreadMessageId;
    final bool isInitialUnreadLanding =
        !_initialUnreadPivotReleased &&
        stickyUnreadId != null &&
        stickyUnreadId == messageId;
    if (isInitialUnreadLanding) {
      _awaitingInitialUnreadScroll = true;
    }
    unawaited(
      _scrollToTarget(messageId).whenComplete(() {
        if (!mounted) {
          return;
        }
        _awaitingInitialUnreadScroll = false;
        if (_scrollController.hasClients) {
          _paginationGuard.seedScrollPixels(_scrollController.position.pixels);
        }
        if (isInitialUnreadLanding) {
          _explicitPivotMessageId = null;
          _scrollAnchoredPivotMessageId = stickyUnreadId;
        }
      }),
    );
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
  }) {
    final bool isNewDay =
        previousMessage == null ||
        !_isSameDay(message.timestamp, previousMessage.timestamp);
    if (message.isSystemMessage) {
      return _withMessageSeparators(
        context,
        message: message,
        isNewDay: isNewDay,
        visualUnreadId: visualUnreadId,
        child: SystemMessage(key: ValueKey(message.id), message: message),
      );
    }
    final bool isGrouped = !isNewDay && _shouldGroup(message, previousMessage);
    final GlobalKey itemKey = _itemKeys.putIfAbsent(message.id, GlobalKey.new);
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
      child: MessageItem(
        key: itemKey,
        message: message,
        isGrouped: isGrouped,
        isJumpHighlighted: message.id == highlightedMessageId,
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
        onMarkAsUnread: () => ref
            .read(chatViewModelProvider.notifier)
            .markMessageUnread(message.id),
        onViewReactions: () =>
            unawaited(showMessageReactionsSheet(context, message: message)),
        onReport: () => unawaited(
          showSimpleIarReportSheet(
            context,
            iarContext: IarMessageContext(message: message, guildId: guildId),
          ),
        ),
        onReaction: (String emoji, {String? emojiId, bool animated = false}) =>
            ref
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

  Widget _buildPreCenterSliver({
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
  }) {
    if (messages.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final int messageIndex = messages.length - 1 - index;
        final Message message = messages[messageIndex];
        final Message? previousMessage = messageIndex > 0
            ? messages[messageIndex - 1]
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
        );
      }, childCount: messages.length),
    );
  }

  Widget _buildPostCenterSliver({
    required BuildContext context,
    required List<Message> messages,
    required Message? preCenterLastMessage,
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
  }) {
    if (messages.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final Message message = messages[index];
        final Message? previousMessage = index > 0
            ? messages[index - 1]
            : preCenterLastMessage;
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
        );
      }, childCount: messages.length),
    );
  }

  Widget _buildCenterScrollView({
    required BuildContext context,
    required MessageListPivotSplit split,
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
    required bool isLoadingMore,
    required bool isLoadingNewer,
  }) {
    final Message? preCenterLastMessage = split.preCenter.isEmpty
        ? null
        : split.preCenter.last;
    return Stack(
      fit: StackFit.expand,
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: CustomScrollView(
            controller: _scrollController,
            reverse: true,
            center: _centerKey,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 33),
                sliver: _buildPostCenterSliver(
                  context: context,
                  messages: split.postCenter,
                  preCenterLastMessage: preCenterLastMessage,
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
                ),
              ),
              SliverPadding(
                key: _centerKey,
                padding: EdgeInsets.zero,
                sliver: const SliverToBoxAdapter(child: SizedBox.shrink()),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 8),
                sliver: _buildPreCenterSliver(
                  context: context,
                  messages: split.preCenter,
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
                ),
              ),
            ],
          ),
        ),
        if (isLoadingMore)
          Positioned(
            top: 8,
            left: 0,
            right: 0,
            child: Center(
              child: FluxerLoadingSpinner(color: context.colors.brandPrimary),
            ),
          ),
        if (isLoadingNewer)
          Positioned(
            bottom: 33,
            left: 0,
            right: 0,
            child: Center(
              child: FluxerLoadingSpinner(color: context.colors.brandPrimary),
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
            _onScrollToBottom(forceDuringUnreadReview: true);
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
      ..listen<bool>(
        chatViewModelProvider.select((ChatViewState s) => s.isLoadingMore),
        (bool? previous, bool next) {
          if ((previous ?? false) && !next) {
            _paginationGuard.beginCooldown();
          }
        },
      )
      ..listen<bool>(
        chatViewModelProvider.select((ChatViewState s) => s.isLoadingNewer),
        (bool? previous, bool next) {
          if ((previous ?? false) && !next) {
            _paginationGuard.beginCooldown();
          }
        },
      )
      ..listen<List<Message>>(
        chatViewModelProvider.select((ChatViewState s) => s.messages),
        (List<Message>? previous, List<Message> next) {
          _onMessagesAppended(
            previousMessages: previous ?? const [],
            nextMessages: next,
          );
        },
      );

    final String? currentUserId = ref.watch(currentUserIdProvider);
    final ChatViewState state = ref.watch(chatViewModelProvider);
    final List<Message> messages = state.messages;
    _syncChannelPivot(state);
    final String channelId = state.channelId;
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
    final String? guildId = isDmChannel || channelId.isEmpty
        ? null
        : findChannelById(
            ref.watch(channelListViewModelProvider),
            channelId,
          )?.guildId;
    ref.watch(channelPermissionCacheProvider);
    final int? channelPermissionBits = channelId.isEmpty
        ? null
        : ref
              .read(channelPermissionCacheProvider.notifier)
              .getChannelBits(channelId);
    final drift_db.ReadState? readState = state.channelId.isEmpty
        ? null
        : ref
              .watch(_messageListReadStateProvider(state.channelId))
              .asData
              ?.value;
    final ChatUnreadSummary unreadSummary = computeChatUnreadSummary(
      messages: messages.map(
        (Message message) =>
            ChatUnreadMessageRef(id: message.id, authorId: message.authorId),
      ),
      ackLastMessageId: readState?.lastMessageId,
      mentionCount: readState?.mentionCount ?? 0,
      currentUserId: currentUserId,
    );
    final String? oldestUnreadId = unreadSummary.oldestUnreadMessageId;
    final String? stickyUnreadId = state.stickyUnreadMessageId;
    final String? highlightedMessageId = state.highlightedMessageId;
    final String? visualUnreadId = _visualUnreadId(
      messages: messages,
      stickyUnreadId: stickyUnreadId,
      oldestUnreadId: oldestUnreadId,
      currentUserId: currentUserId,
    );
    final int unreadCount = unreadSummary.displayUnreadCount;
    final bool showUnreadIndicators = shouldShowUnreadIndicators(
      hasUnread: unreadCount > 0,
      liveNearBottom: _effectiveLiveNearBottom(),
      hasMoreNewerMessages: state.hasMoreNewerMessages,
      isManualReadState: readState?.manual ?? false,
      inUnreadReview: _isInUnreadReview(state),
      stickyUnreadMessageId: stickyUnreadId,
    );
    final String? effectiveVisualUnreadId = showUnreadIndicators
        ? visualUnreadId
        : null;
    final DateTime? unreadSince = _messageTimestamp(
      messages,
      effectiveVisualUnreadId,
    );
    final int chatFontSize = ref.watch(
      themePreferenceProvider.select(
        (ThemePreferenceState s) => s.chatFontSize,
      ),
    );
    final ChannelMessagePermissions channelMessagePerms = channelId.isEmpty
        ? ChannelMessagePermissions.unresolved
        : channelMessagePermissionsForComposer(
            ref.watch(channelMessagePermissionsProvider(channelId)),
          );
    final bool channelCanSendMessages = channelMessagePerms.canSendMessages;
    final bool channelCanAddReactions = canAddReactionsInChannel(
      isDmChannel: isDmChannel,
      channelPermissionBits: channelPermissionBits,
    );
    final bool channelCanPinMessage = canPinMessageInChannel(
      isDmChannel: isDmChannel,
      channelPermissionBits: channelPermissionBits,
    );
    final bool channelCanManageMessages = canManageMessagesInChannel(
      isDmChannel: isDmChannel,
      channelPermissionBits: channelPermissionBits,
    );

    if (messages.isEmpty) {
      _itemKeys.clear();
    }

    if (!state.isLoading && _pendingScrollTarget != null) {
      final String target = _pendingScrollTarget!;
      if (messages.any((Message m) => m.id == target)) {
        _pendingScrollTarget = null;
        unawaited(_scrollToTarget(target));
      }
    }

    final MessageListPivotSplit split = splitMessagesForCenterSliver(
      messages: messages,
      pivotMessageId: _resolvedPivotMessageId(state),
    );

    final Widget body;
    if (state.isLoading && messages.isEmpty) {
      body = Center(
        child: FluxerLoadingSpinner(color: context.colors.brandPrimary),
      );
    } else if (messages.isEmpty) {
      body = isPersonalNotesChannel
          ? const PersonalNotesWelcomeSection()
          : Center(
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
    } else {
      body = _buildCenterScrollView(
        context: context,
        split: split,
        visualUnreadId: effectiveVisualUnreadId,
        highlightedMessageId: highlightedMessageId,
        currentUserId: currentUserId,
        isDmChannel: isDmChannel,
        guildId: guildId,
        channelPermissionBits: channelPermissionBits,
        channelCanSendMessages: channelCanSendMessages,
        channelCanAddReactions: channelCanAddReactions,
        channelCanPinMessage: channelCanPinMessage,
        channelCanManageMessages: channelCanManageMessages,
        isLoadingMore: state.isLoadingMore,
        isLoadingNewer: state.isLoadingNewer,
      );
    }

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double scaleRatio = chatFontSize / 16.0;
    final TextScaler combinedScaler = TextScaler.linear(
      mediaQuery.textScaler.scale(1) * scaleRatio,
    );

    final bool showUnreadBar =
        !state.isLoading && messages.isNotEmpty && showUnreadIndicators;
    final Widget scaledBody = Stack(
      fit: StackFit.expand,
      children: [
        body,
        if (showUnreadBar)
          Positioned(
            top: 8,
            left: 12,
            right: 12,
            child: _buildNewMessagesBar(
              context,
              count: unreadCount,
              isEstimated: unreadSummary.isEstimated,
              since: unreadSince,
              onTap: _onUnreadBarTap,
            ),
          ),
      ],
    );

    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: combinedScaler),
      child: scaledBody,
    );
  }

  String? _visualUnreadId({
    required List<Message> messages,
    required String? stickyUnreadId,
    required String? oldestUnreadId,
    required String? currentUserId,
  }) {
    if (stickyUnreadId == null) {
      return oldestUnreadId;
    }
    final bool hasVisibleSticky = messages.any(
      (Message message) =>
          message.id == stickyUnreadId &&
          !_isOwnMessage(message, currentUserId),
    );
    return hasVisibleSticky ? stickyUnreadId : oldestUnreadId;
  }

  bool _isOwnMessage(Message message, String? currentUserId) {
    return currentUserId != null &&
        currentUserId.isNotEmpty &&
        message.authorId == currentUserId;
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
              color: context.colors.backgroundSecondaryLighter,
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

  Widget _buildNewMessagesBar(
    BuildContext context, {
    required int count,
    required bool isEstimated,
    required DateTime? since,
    required VoidCallback onTap,
  }) {
    final String displayCount = unreadCountLabel(
      count,
      isEstimated: isEstimated,
    );
    final String messageLabel = count == 1 && !isEstimated
        ? '1 new message'
        : '$displayCount new';
    final String sinceLabel = since == null
        ? ''
        : ' since ${_formatTime(since)}';
    return Material(
      color: context.colors.brandPrimary,
      elevation: 3,
      shadowColor: Colors.black.withValues(alpha: 0.22),
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          child: Row(
            children: [
              PhosphorIcon(
                PhosphorIconsRegular.envelopeOpen,
                color: context.colors.textOnBrandPrimary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '$messageLabel$sinceLabel',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.smallText.copyWith(
                    color: context.colors.textOnBrandPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Mark Read',
                maxLines: 1,
                style: context.textStyles.smallText.copyWith(
                  color: context.colors.textOnBrandPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime date) {
    final DateTime local = date.toLocal();
    final int hour = local.hour == 0
        ? 12
        : local.hour > 12
        ? local.hour - 12
        : local.hour;
    final String minute = local.minute.toString().padLeft(2, '0');
    final String period = local.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
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
