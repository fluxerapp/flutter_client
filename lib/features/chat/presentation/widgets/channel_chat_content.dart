import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel_header.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel_textarea.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/direct_voice_session_strip.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/dm_embedded_voice_call_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/inline_expression_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/slowmode_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/typing_indicator_bar.dart';
import 'package:fluxer_app/features/chat/providers/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_layout.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

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
  @override
  void initState() {
    super.initState();
    unawaited(Future(() => ref.read(expressionPanelProvider.notifier).close()));
    unawaited(Future(_switchChannel));
  }

  @override
  void didUpdateWidget(ChannelChatContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId ||
        oldWidget.targetMessageId != widget.targetMessageId) {
      unawaited(
        Future(() => ref.read(expressionPanelProvider.notifier).close()),
      );
      unawaited(Future(_switchChannel));
    }
  }

  Future<void> _switchChannel() => ref
      .read(chatViewModelProvider.notifier)
      .switchChannel(widget.channelId, targetMessageId: widget.targetMessageId);

  @override
  Widget build(BuildContext context) {
    final isMobile = isMobileLayout(context);
    final isPanelOpen = ref.watch(expressionPanelProvider);
    final panelBottomOffset = inlineExpressionPanelBottomOffset(
      keyboardInset: MediaQuery.viewInsetsOf(context).bottom,
    );

    return ColoredBox(
      color: context.colors.chatBackground,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                if (widget.showTopBar) const ChannelHeader(),
                DirectVoiceSessionStrip(channelId: widget.channelId),
                if (layoutModeOf(MediaQuery.sizeOf(context).width) ==
                    LayoutMode.desktop)
                  DmEmbeddedVoiceCallPanel(channelId: widget.channelId),
                Expanded(
                  child: Stack(
                    children: [
                      MessageList(targetMessageId: widget.targetMessageId),
                      const Positioned(
                        left: 8,
                        right: 8,
                        bottom: 8,
                        child: Row(
                          spacing: 8,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: TypingIndicatorBar()),
                            SlowmodeIndicator(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const ChannelTextarea(),
                if (isMobile && isPanelOpen)
                  const SizedBox(height: kCollapsedPanelHeight),
              ],
            ),
            if (isMobile && isPanelOpen && widget.showInlineEmojiPicker)
              Positioned(
                left: 0,
                right: 0,
                bottom: panelBottomOffset,
                child: InlineExpressionPanel(
                  onClose: () =>
                      ref.read(expressionPanelProvider.notifier).close(),
                  onEmojiSelect: (name, surrogates) {
                    ref
                        .read(pendingEmojiInsertProvider.notifier)
                        .emit(name, surrogates);
                  },
                  onGifSelect: (selection) {
                    ref
                        .read(pendingGifSelectionProvider.notifier)
                        .emit(selection);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
