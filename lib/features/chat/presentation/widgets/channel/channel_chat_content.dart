import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
  void didUpdateWidget(ChannelChatContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId ||
        oldWidget.targetMessageId != widget.targetMessageId) {
      _lastSwitchRequest = null;
    }
  }

  void _scheduleChannelSync({required bool loadMessages}) {
    final request = (
      channelId: widget.channelId,
      targetMessageId: widget.targetMessageId,
      loadMessages: loadMessages,
    );
    if (_lastSwitchRequest == request) {
      return;
    }
    _lastSwitchRequest = request;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_runChannelSync(request));
    });
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
    final isMobile = isMobileLayout(context);
    final revealSide = isMobile
        ? ref.watch(currentRevealSideProvider)
        : RevealSide.main;
    final shouldLoadMessages = channelChatShouldLoadMessages(
      isMobile: isMobile,
      revealSide: revealSide,
    );
    _scheduleChannelSync(loadMessages: shouldLoadMessages);
    listenChatViewModelErrors(ref);

    return ColoredBox(
      color: context.colors.chatBackground,
      child: SafeArea(
        child: UploadDropOverlay(
          channelId: widget.channelId,
          child: Column(
            children: <Widget>[
              if (widget.showTopBar) const ChannelHeader(),
              DmCallE2eeFooter(channelId: widget.channelId),
              DirectVoiceSessionStrip(channelId: widget.channelId),
              if (layoutModeOf(
                    layoutReferenceExtentOf(MediaQuery.sizeOf(context)),
                  ) ==
                  LayoutMode.desktop)
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
bool channelChatShouldLoadMessages({
  required bool isMobile,
  required RevealSide revealSide,
}) {
  return !isMobile || revealSide == RevealSide.main;
}
