import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/friends/presentation/widgets/friends_list.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_chat_back_scope.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:material_ui/material_ui.dart';

class DMLayout extends ConsumerWidget {
  final String? channelId;
  final String? targetMessageId;

  const DMLayout({this.channelId, this.targetMessageId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (channelId == null) {
      return ColoredBox(
        color: context.colors.chatBackground,
        child: isMobileLayout(context)
            ? const SizedBox.shrink()
            : const FriendsList(),
      );
    }

    return MobileChatBackScope(
      child: ChannelChatContent(
        channelId: channelId!,
        targetMessageId: targetMessageId,
      ),
    );
  }
}
