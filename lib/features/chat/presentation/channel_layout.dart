import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/category_channel_route_handler.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/link_channel_route_handler.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_header.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_content_channel_gate.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/members/presentation/widgets/channel_members.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_chat_back_scope.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/presentation/voice_channel_page_view.dart';

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
    final Channel? channel = ref.watch(channelByIdProvider(channelId)).value;
    final bool isLinkChannel = channel?.type == ChannelType.guildLink;
    final bool isCategoryChannel = channel?.type == ChannelType.guildCategory;
    final bool isVoiceChannel = channel?.type == ChannelType.guildVoice;
    final isMobile = isMobileLayout(context);
    final AsyncValue<bool> showGateAsync = ref.watch(
      shouldShowMatureContentGateProvider(channelId),
    );
    final bool showMatureContentGate = showGateAsync.value ?? false;

    final Widget primaryContent = showMatureContentGate
        ? MatureContentChannelGate(
            channelId: channelId,
            guildId: guildId,
            channelType: channel?.type,
          )
        : isLinkChannel && channel != null
        ? LinkChannelRouteHandler(
            guildId: guildId,
            channel: channel,
            child: const SizedBox.shrink(),
          )
        : isCategoryChannel && channel != null
        ? CategoryChannelRouteHandler(
            guildId: guildId,
            channel: channel,
            child: const SizedBox.shrink(),
          )
        : isVoiceChannel
        ? VoiceChannelPageView(guildId: guildId, channelId: channelId)
        : ChannelChatContent(
            channelId: channelId,
            targetMessageId: messageId,
            showTopBar: false,
          );
    final Widget header = ChannelHeader(showMessageActions: !isVoiceChannel);

    return MobileChatBackScope(
      child: ColoredBox(
        color: isMobile
            ? context.colors.chatInputBackground
            : context.colors.chatBackground,
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final showMemberList =
                      isMemberListVisible &&
                      constraints.maxWidth >= _minWidthForMemberList;
                  return Column(
                    children: [
                      header,
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(child: primaryContent),
                            if (showMemberList)
                              ChannelMembers(
                                key: ValueKey<String>(channelId),
                                guildId: guildId,
                                channelId: channelId,
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
