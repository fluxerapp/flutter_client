import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_header.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/upload_drop_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/voice/direct_voice_session_strip.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/voice/dm_embedded_voice_call_panel.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/dm_call_e2ee_footer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_chat_content.g.dart';

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
    }
    _scheduleSyncChannelIfNeeded();
  }

  void _scheduleSyncChannelIfNeeded() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _syncChannelIfNeeded(loadMessages: _resolveLoadMessages());
    });
  }

  bool _resolveLoadMessages() {
    final bool isMobile = isMobileLayout(context);
    if (!isMobile) {
      return true;
    }
    return ref.read(channelChatShouldLoadMessagesProvider(widget.channelId));
  }

  void _syncChannelIfNeeded({required bool loadMessages}) {
    final String? activeChannelId = ref.read(activeChannelIdProvider);
    final bool hasPopup = ref.read(shellHasPopupOverlayProvider);
    if (widget.channelId != activeChannelId || hasPopup) {
      talker.debug(
        '[ChannelChatContent] skip sync channel=${widget.channelId} '
        'active=$activeChannelId popup=$hasPopup',
      );
      return;
    }
    if (widget.targetMessageId != null &&
        widget.targetMessageId!.isNotEmpty &&
        !loadMessages) {
      talker.debug(
        '[ChannelChatContent] defer target sync until visible '
        'channel=${widget.channelId} target=${widget.targetMessageId}',
      );
      return;
    }
    final request = (
      channelId: widget.channelId,
      targetMessageId: widget.targetMessageId,
      loadMessages: loadMessages,
    );
    if (_lastSwitchRequest == request &&
        ref.read(chatViewModelProvider).channelId == request.channelId) {
      talker.debug(
        '[ChannelChatContent] dedup sync channel=${widget.channelId} '
        'target=${widget.targetMessageId} load=$loadMessages',
      );
      return;
    }
    _lastSwitchRequest = request;
    talker.debug(
      '[ChannelChatContent] run sync channel=${widget.channelId} '
      'target=${widget.targetMessageId} load=$loadMessages',
    );
    unawaited(_runChannelSync(request));
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

  @override
  Widget build(BuildContext context) {
    final bool isMobile = isMobileLayout(context);
    final bool shouldLoadMessages =
        !isMobile ||
        ref.watch(channelChatShouldLoadMessagesProvider(widget.channelId));
    ref
      ..listen<String?>(activeChannelIdProvider, (_, _) {
        _scheduleSyncChannelIfNeeded();
      })
      ..listen<bool>(shellHasPopupOverlayProvider, (_, _) {
        _scheduleSyncChannelIfNeeded();
      })
      ..listen<bool>(channelChatShouldLoadMessagesProvider(widget.channelId), (
        _,
        _,
      ) {
        _scheduleSyncChannelIfNeeded();
      });
    if (_lastMobileLayout != isMobile) {
      _lastMobileLayout = isMobile;
      _scheduleSyncChannelIfNeeded();
    }
    listenChatViewModelErrors(ref);

    return ColoredBox(
      color: isMobile
          ? context.colors.chatInputBackground
          : context.colors.chatBackground,
      child: SafeArea(
        child: UploadDropOverlay(
          channelId: widget.channelId,
          child: Column(
            children: <Widget>[
              if (widget.showTopBar) const ChannelHeader(),
              DmCallE2eeFooter(channelId: widget.channelId),
              DirectVoiceSessionStrip(channelId: widget.channelId),
              if (isWideLayout(context))
                DmEmbeddedVoiceCallPanel(channelId: widget.channelId),
              Expanded(
                child: ChannelChatPanel(
                  displayChannelId: widget.channelId,
                  targetMessageId: widget.targetMessageId,
                  loadMessages: shouldLoadMessages,
                  showInlineEmojiPicker: widget.showInlineEmojiPicker,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
bool computeChannelChatShouldLoadMessages({
  required bool isMobile,
  required RevealSide revealSide,
}) {
  return !isMobile || revealSide == RevealSide.main;
}

@riverpod
bool channelChatShouldLoadMessages(Ref ref, String channelId) {
  return computeChannelChatShouldLoadMessages(
    isMobile: true,
    revealSide: ref.watch(currentRevealSideProvider),
  );
}
