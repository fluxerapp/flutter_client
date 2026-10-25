import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_header.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_results_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/slowmode_rate_limited_dialog.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/upload_drop_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/voice/direct_voice_session_strip.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/voice/dm_embedded_voice_call_panel.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_header_search_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_sync_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_page_sync.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/dm_call_e2ee_footer.dart';
import 'package:fluxer_app/material_ui.dart';

void _logChannelChatContentDebug(void Function() log) {
  assert(() {
    log();
    return true;
  }(), 'channel chat content debug logging');
}

class ChannelChatContent extends ConsumerStatefulWidget {
  final String channelId;
  final bool showTopBar;
  final bool showInlineEmojiPicker;
  final String? targetMessageId;

  const ChannelChatContent({
    required this.channelId,
    this.showTopBar = true,
    this.showInlineEmojiPicker = true,
    this.targetMessageId,
    super.key,
  });

  @override
  ConsumerState<ChannelChatContent> createState() => _ChannelChatContentState();
}

class _ChannelChatContentState extends ConsumerState<ChannelChatContent> {
  ({String channelId, String? targetMessageId, bool loadMessages})?
  _lastSwitchRequest;
  ({String channelId, String? targetMessageId})? _lastClosedPanelRequest;
  bool? _lastMobileLayout;
  String? _strandedEmptyResyncChannelId;

  @override
  void initState() {
    super.initState();
    _scheduleSyncChannelIfNeeded();
  }

  @override
  void didUpdateWidget(ChannelChatContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId == widget.channelId &&
        oldWidget.targetMessageId == widget.targetMessageId) {
      return;
    }
    _lastSwitchRequest = null;
    _strandedEmptyResyncChannelId = null;
    _scheduleSyncChannelIfNeeded();
  }

  void _scheduleSyncChannelIfNeeded() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _syncChannelIfNeeded();
    });
  }

  void _syncChannelIfNeeded() {
    if (widget.channelId.isEmpty) {
      return;
    }
    if (!_canSyncForRoute()) {
      return;
    }
    final String? routeTarget = widget.targetMessageId;
    final request = buildChannelChatSyncRequest(
      channelId: widget.channelId,
      routeTarget: routeTarget,
      consumption: ref.read(channelJumpTargetLedgerProvider),
    );
    final String? effectiveTarget = request.targetMessageId;
    if (_shouldDedupSwitchRequest(request)) {
      return;
    }
    _lastSwitchRequest = request;
    _logChannelChatContentDebug(
      () => talker.debug(
        '[ChannelChatContent] sync channel=${widget.channelId} '
        'target=$effectiveTarget',
      ),
    );
    unawaited(
      ref.read(slowmodeSyncProvider.notifier).fetchIfNeeded(widget.channelId),
    );
    unawaited(_runChannelSync(request));
  }

  bool _canSyncForRoute() {
    if (!mounted || !context.mounted) {
      return false;
    }
    final String? activeChannelId = ref.read(activeChannelIdProvider);
    final bool hasPopup = ref.read(shellHasPopupOverlayProvider);
    if (hasPopup) {
      return false;
    }
    if (activeChannelId != widget.channelId) {
      return false;
    }
    return true;
  }

  bool _shouldDedupSwitchRequest(
    ({String channelId, String? targetMessageId, bool loadMessages}) request,
  ) {
    return shouldDedupChannelChatSwitchRequest(
      lastRequest: _lastSwitchRequest,
      request: request,
      state: ref.read(chatViewModelProvider),
    );
  }

  Future<void> _runChannelSync(
    ({String channelId, String? targetMessageId, bool loadMessages}) request,
  ) async {
    if (!mounted) {
      return;
    }
    final closeRequest = (
      channelId: request.channelId,
      targetMessageId: request.targetMessageId,
    );
    if (_lastClosedPanelRequest != closeRequest) {
      _lastClosedPanelRequest = closeRequest;
      ref.read(expressionPanelProvider.notifier).close();
      ref.read(attachmentPanelProvider.notifier).close();
    }
    await ref
        .read(chatViewModelProvider.notifier)
        .switchChannel(
          request.channelId,
          targetMessageId: request.targetMessageId,
          loadMessages: request.loadMessages,
        );
  }

  void _maybeConsumeSettledJumpTarget(
    ChatViewState? previous,
    ChatViewState next,
  ) {
    if (!shouldConsumeChannelJumpTarget(
      channelId: widget.channelId,
      routeTarget: widget.targetMessageId,
      consumption: ref.read(channelJumpTargetLedgerProvider),
      previousSignal: previous?.scrollToMessageSignal,
      nextSignal: next.scrollToMessageSignal,
    )) {
      return;
    }
    ref
        .read(channelJumpTargetLedgerProvider.notifier)
        .markConsumed(
          channelId: widget.channelId,
          messageId: widget.targetMessageId!,
        );
  }

  void _maybeResyncChannelMismatch(ChatViewState state) {
    if (!shouldResyncMismatchedChatWindow(
      widgetChannelId: widget.channelId,
      state: state,
    )) {
      return;
    }
    if (!shouldScheduleMismatchedChatWindowResync(state: state)) {
      return;
    }
    if (!_canSyncForRoute()) {
      return;
    }
    _lastSwitchRequest = null;
    _logChannelChatContentDebug(
      () => talker.debug(
        '[ChannelChatContent] resync mismatched window channel=${widget.channelId} '
        'vm=${state.channelId}',
      ),
    );
    _scheduleSyncChannelIfNeeded();
  }

  void _maybeResyncStrandedEmptyChannel(ChatViewState state) {
    if (!shouldResyncStrandedEmptyChannel(
      widgetChannelId: widget.channelId,
      state: state,
      alreadyResyncedChannelId: _strandedEmptyResyncChannelId,
      canSyncForRoute: _canSyncForRoute(),
    )) {
      if (state.channelId != widget.channelId || state.messages.isNotEmpty) {
        _strandedEmptyResyncChannelId = null;
      }
      return;
    }
    _strandedEmptyResyncChannelId = widget.channelId;
    _lastSwitchRequest = null;
    _logChannelChatContentDebug(
      () => talker.debug(
        '[ChannelChatContent] resync stranded empty channel=${widget.channelId}',
      ),
    );
    _scheduleSyncChannelIfNeeded();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = isMobileLayout(context);
    if (_lastMobileLayout != isMobile) {
      _lastMobileLayout = isMobile;
      _scheduleSyncChannelIfNeeded();
    }
    ref
      ..listen<String?>(activeChannelIdProvider, (_, _) {
        if (!mounted || !context.mounted) {
          return;
        }
        _scheduleSyncChannelIfNeeded();
      })
      ..listen<bool>(shellHasPopupOverlayProvider, (_, _) {
        if (!mounted || !context.mounted) {
          return;
        }
        _scheduleSyncChannelIfNeeded();
      });
    ref.listen<ChatViewState>(chatViewModelProvider, (previous, next) {
      if (!mounted || !context.mounted) {
        return;
      }
      _maybeResyncChannelMismatch(next);
      _maybeResyncStrandedEmptyChannel(next);
      _maybeConsumeSettledJumpTarget(previous, next);
    });
    final ChatViewState chatState = ref.read(chatViewModelProvider);
    _maybeResyncStrandedEmptyChannel(chatState);
    _maybeResyncChannelMismatch(chatState);
    listenChatViewModelErrors(ref);
    listenSlowmodeRateLimitedAlerts(ref, context);

    final ChannelHeaderSearchState searchState = ref.watch(
      channelHeaderSearchProvider,
    );
    final bool isSearchActive =
        searchState.isActive && searchState.channelId == widget.channelId;
    final bool showInlineSearchPanel =
        widget.showTopBar && isWideLayout(context) && isSearchActive;
    if (widget.showTopBar && isWideLayout(context)) {
      ref.watch(channelSearchProvider(widget.channelId, null));
    }

    final bool reserveBottomSafeArea = chatLayoutReservesBottomSafeArea(
      isMobile: isMobile,
      keyboardSlotOccupied:
          !isMobile &&
          wideLayoutKeyboardSlotOccupied(
            bottomInputSlotHeight: ref.watch(
              bottomInputSlotProvider.select(
                (BottomInputSlotState state) => state.slotHeight,
              ),
            ),
            keyboardInsetBottom: resolvedKeyboardInsetBottom(context),
          ),
    );

    return ColoredBox(
      color: isMobile
          ? context.colors.chatInputBackground
          : context.colors.chatBackground,
      child: SafeArea(
        bottom: reserveBottomSafeArea,
        child: UploadDropOverlay(
          channelId: widget.channelId,
          child: Column(
            children: <Widget>[
              if (widget.showTopBar) ChannelHeader(channelId: widget.channelId),
              DmCallE2eeFooter(channelId: widget.channelId),
              DirectVoiceSessionStrip(channelId: widget.channelId),
              if (isWideLayout(context))
                DmEmbeddedVoiceCallPanel(channelId: widget.channelId),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ChannelChatPanel(
                        displayChannelId: widget.channelId,
                        targetMessageId: widget.targetMessageId,
                        showInlineEmojiPicker: widget.showInlineEmojiPicker,
                      ),
                    ),
                    if (showInlineSearchPanel)
                      ChannelSearchResultsPanel(
                        channelId: widget.channelId,
                        guildId: null,
                        onClose: () => ref
                            .read(channelHeaderSearchProvider.notifier)
                            .closeSearch(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool shouldConsumeChannelJumpTarget({
  required String channelId,
  required String? routeTarget,
  required ChannelJumpTargetConsumption consumption,
  required (String, int)? previousSignal,
  required (String, int)? nextSignal,
}) {
  if (routeTarget == null || routeTarget.isEmpty) {
    return false;
  }
  if (consumption.isConsumed(channelId: channelId, messageId: routeTarget)) {
    return false;
  }
  if (previousSignal == nextSignal) {
    return false;
  }
  return nextSignal != null && nextSignal.$1 == routeTarget;
}

({String channelId, String? targetMessageId, bool loadMessages})
buildChannelChatSyncRequest({
  required String channelId,
  required String? routeTarget,
  required ChannelJumpTargetConsumption consumption,
}) {
  return (
    channelId: channelId,
    targetMessageId: resolveEffectiveChannelJumpTarget(
      channelId: channelId,
      routeTarget: routeTarget,
      consumption: consumption,
    ),
    loadMessages: true,
  );
}

String? resolveEffectiveChannelJumpTarget({
  required String channelId,
  required String? routeTarget,
  required ChannelJumpTargetConsumption consumption,
}) {
  if (routeTarget == null || routeTarget.isEmpty) {
    return null;
  }
  if (consumption.isConsumed(channelId: channelId, messageId: routeTarget)) {
    return null;
  }
  if (consumption.isSuperseded(channelId: channelId, messageId: routeTarget)) {
    return null;
  }
  return routeTarget;
}

bool shouldDedupChannelChatSwitchRequest({
  required ({String channelId, String? targetMessageId, bool loadMessages})?
  lastRequest,
  required ({String channelId, String? targetMessageId, bool loadMessages})
  request,
  required ChatViewState state,
}) {
  if (lastRequest != request) {
    return false;
  }
  if (shouldResyncMismatchedChatWindow(
    widgetChannelId: request.channelId,
    state: state,
  )) {
    return false;
  }
  if (state.isLoading || state.isSyncingMessages) {
    return state.messages.isNotEmpty;
  }
  final String? targetMessageId = request.targetMessageId;
  if (targetMessageId != null && targetMessageId.isNotEmpty) {
    if (state.messages.any(
      (Message message) => message.id == targetMessageId,
    )) {
      return true;
    }
    if (state.messages.isNotEmpty) {
      return true;
    }
    return false;
  }
  return !state.messageLoadFailed;
}

@visibleForTesting
bool shouldResyncMismatchedChatWindow({
  required String widgetChannelId,
  required ChatViewState state,
}) {
  return chatWindowMismatchesChannel(
    expectedChannelId: widgetChannelId,
    channelId: state.channelId,
    messages: state.messages,
  );
}

@visibleForTesting
bool shouldScheduleMismatchedChatWindowResync({required ChatViewState state}) {
  return !state.isLoading && !state.isSyncingMessages;
}

@visibleForTesting
bool shouldResyncStrandedEmptyChannel({
  required String widgetChannelId,
  required ChatViewState state,
  required String? alreadyResyncedChannelId,
  required bool canSyncForRoute,
}) {
  if (widgetChannelId.isEmpty) {
    return false;
  }
  if (state.channelId != widgetChannelId) {
    return false;
  }
  if (state.messages.isNotEmpty) {
    return false;
  }
  if (state.isLoading || state.isSyncingMessages || state.messageLoadFailed) {
    return false;
  }
  if (!canSyncForRoute) {
    return false;
  }
  if (alreadyResyncedChannelId == widgetChannelId) {
    return false;
  }
  return true;
}
