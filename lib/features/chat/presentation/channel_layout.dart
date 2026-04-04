import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel_chat_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel_header.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/inline_expression_panel.dart';
import 'package:fluxer_app/features/chat/providers/expression_panel_provider.dart';
import 'package:fluxer_app/features/members/presentation/widgets/channel_members.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

/// Wrapper screen for the chat area content.
/// Takes guildId and channelId from go_router params.
class ChannelLayout extends ConsumerWidget {
  final String guildId;
  final String channelId;
  final String? messageId;

  const ChannelLayout({
    required this.guildId,
    required this.channelId,
    this.messageId,
    super.key,
  });

  static const _minWidthForMemberList = 600.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMemberListVisible = ref.watch(
      channelListViewModelProvider.select((s) => s.isMemberListVisible),
    );
    final isMobile = isMobileLayout(context);
    final isPanelOpen = ref.watch(expressionPanelProvider);

    return ColoredBox(
      color: context.colors.chatBackground,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final showMemberList =
                isMemberListVisible &&
                constraints.maxWidth >= _minWidthForMemberList;

            return Stack(
              children: [
                Column(
                  children: [
                    const ChannelHeader(),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ChannelChatContent(
                              channelId: channelId,
                              targetMessageId: messageId,
                              showTopBar: false,
                              showInlineEmojiPicker: false,
                            ),
                          ),
                          if (showMemberList) const ChannelMembers(),
                        ],
                      ),
                    ),
                  ],
                ),
                if (isMobile && isPanelOpen)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: InlineExpressionPanel(
                      onClose: () =>
                          ref.read(expressionPanelProvider.notifier).close(),
                      onEmojiSelect: (name, surrogates) {
                        ref
                            .read(pendingEmojiInsertProvider.notifier)
                            .emit(name, surrogates);
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
