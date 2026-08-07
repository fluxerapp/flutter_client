import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_header.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_results_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/upload_drop_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/voice/direct_voice_session_strip.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/voice/dm_embedded_voice_call_panel.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_header_search_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/dm_call_e2ee_footer.dart';

/// Composite chat view that assembles the top bar, message list,
/// and input field. Works for both server channels and DMs.
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
  String? _mismatchResyncChannelId;
  String? _strandedEmptyResyncChannelId;

  @override
  void initState() {
    super.initState();
    _scheduleSyncChannelIfNeeded();
  }

  @override
  void didUpdateWidget(ChannelChatContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId ||
        oldWidget.targetMessageId != widget.targetMessageId) {
      _lastSwitchRequest = null;
      _mismatchResyncChannelId = null;
      _strandedEmptyResyncChannelId = null;
    }
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
    // The whole request, including which target survives, is built by one
    // tested function so this widget holds no target-selection logic to bypass.
    final request = buildChannelChatSyncRequest(
      channelId: widget.channelId,
      routeTarget: routeTarget,
      consumption: ref.read(channelJumpTargetLedgerProvider),
    );
    final String? effectiveTarget = request.targetMessageId;
    if (_shouldDedupSwitchRequest(request)) {
      talker.debug(
        '[ChannelChatContent] dedup sync channel=${widget.channelId} '
        'target=$effectiveTarget',
      );
      return;
    }
    _lastSwitchRequest = request;
    talker.debug(
      '[ChannelChatContent] run sync channel=${widget.channelId} '
      'target=$effectiveTarget route=$routeTarget',
    );
    unawaited(_runChannelSync(request));
  }

  bool _canSyncForRoute() {
    final String? activeChannelId = ref.read(activeChannelIdProvider);
    final bool hasPopup = ref.read(shellHasPopupOverlayProvider);
    if (hasPopup) {
      talker.debug(
        '[ChannelChatContent] skip sync channel=${widget.channelId} popup=true',
      );
      return false;
    }
    if (activeChannelId != null && activeChannelId != widget.channelId) {
      talker.debug(
        '[ChannelChatContent] skip sync channel=${widget.channelId} '
        'active=$activeChannelId',
      );
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
      talker.debug('[ChannelChatContent] sync aborted: not mounted');
      return;
    }
    talker.debug(
      '[ChannelChatContent] _runChannelSync channel=${request.channelId} '
      'target=${request.targetMessageId} load=${request.loadMessages}',
    );
    final closeRequest = (
      channelId: request.channelId,
      targetMessageId: request.targetMessageId,
    );
    if (_lastClosedPanelRequest != closeRequest) {
      _lastClosedPanelRequest = closeRequest;
      ref.read(expressionPanelProvider.notifier).close();
    }
    await ref
        .read(chatViewModelProvider.notifier)
        .switchChannel(
          request.channelId,
          targetMessageId: request.targetMessageId,
          loadMessages: request.loadMessages,
        );
  }

  /// Consumption happens on the view model's own JUMP ACKNOWLEDGEMENT.
  ///
  /// Marking at issue time would destroy the retry this file depends on: a
  /// first jump whose target is outside the loaded window needs a fetch, and if
  /// that sync is interrupted the target must still be reapplied. Consuming
  /// only once the target is actually present keeps the retry intact while
  /// still closing the loop, because the stale re-fire needs the target to have
  /// been loaded at least once.
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

  void _maybeResyncChannelMismatch(String viewModelChannelId) {
    if (viewModelChannelId == widget.channelId) {
      _mismatchResyncChannelId = null;
      return;
    }
    if (_mismatchResyncChannelId == widget.channelId) {
      return;
    }
    _mismatchResyncChannelId = widget.channelId;
    _lastSwitchRequest = null;
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
    talker.debug(
      '[ChannelChatContent] resync stranded empty channel=${widget.channelId}',
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
        _scheduleSyncChannelIfNeeded();
      })
      ..listen<bool>(shellHasPopupOverlayProvider, (_, _) {
        _scheduleSyncChannelIfNeeded();
      });
    final String viewModelChannelId = ref.watch(
      chatViewModelProvider.select((ChatViewState state) => state.channelId),
    );
    ref.listen<String>(
      chatViewModelProvider.select((ChatViewState state) => state.channelId),
      (previous, next) {
        _maybeResyncChannelMismatch(next);
      },
    );
    ref.listen<ChatViewState>(chatViewModelProvider, (previous, next) {
      _maybeResyncStrandedEmptyChannel(next);
      _maybeConsumeSettledJumpTarget(previous, next);
    });
    _maybeResyncStrandedEmptyChannel(ref.read(chatViewModelProvider));

    _maybeResyncChannelMismatch(viewModelChannelId);
    listenChatViewModelErrors(ref);

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
          ref.watch(
            bottomInputSlotProvider.select(
              (BottomInputSlotState state) => state.slotHeight > 0,
            ),
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

/// The jump target this sync should actually apply.
///
/// The route keeps `/channels/<guild>/<channel>/<messageId>` after a jump lands,
/// so the target is a DURABLE trigger while any widget's memory of having
/// applied it is not. Returning null once the intent is consumed is what stops
/// an unrelated rebuild refetching the window around a stale search result.
/// Whether the route's jump target has now actually ARRIVED, and so may be
/// marked consumed.
///
/// Deliberately not "the sync was issued": an interrupted first jump must still
/// be retried, and the C1 loop requires the target to have been loaded at least
/// once, so arrival is both the safe and the sufficient moment.
@visibleForTesting
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
  // Only "already consumed" blocks acknowledgement. Requiring a matching entry
  // would leave a route target that was never registered, such as a restored
  // location, honoured forever but never acknowledgeable: the C1 loop with no
  // way to close it.
  if (consumption.isConsumed(channelId: channelId, messageId: routeTarget)) {
    return false;
  }
  // A TRANSITION, not a level or a version. scrollToMessageSignal is reset to
  // null by _switchedChannelState on every targeted fetch, so versions restart
  // at 1 and numeric ordering would never acknowledge a re-tap to the same
  // message. Listeners only fire on change, so a stale value cannot consume.
  if (previousSignal == nextSignal) {
    return false;
  }
  return nextSignal != null && nextSignal.$1 == routeTarget;
}

/// The complete sync request, so target selection lives in exactly one tested
/// place rather than inline in a widget where it can be silently bypassed.
@visibleForTesting
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

@visibleForTesting
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
  // A newer jump in this channel means the user asked for something else. An
  // unacknowledged older target would otherwise fail open and yank them back
  // off the message they just requested.
  if (consumption.isSuperseded(channelId: channelId, messageId: routeTarget)) {
    return null;
  }
  return routeTarget;
}

@visibleForTesting
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
  if (state.channelId != request.channelId) {
    return false;
  }
  if (state.isLoading || state.isSyncingMessages) {
    return state.messages.isNotEmpty;
  }
  final String? targetMessageId = request.targetMessageId;
  if (targetMessageId != null && targetMessageId.isNotEmpty) {
    return state.messages.any(
      (Message message) => message.id == targetMessageId,
    );
  }
  return state.messages.isNotEmpty && !state.messageLoadFailed;
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
