import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_details_drawer_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_header.dart';
import 'package:fluxer_app/features/chat/utils/chat_shell_layout.dart';
import 'package:fluxer_app/features/friends/presentation/widgets/friends_list.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_content_channel_gate.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/shell/hosted_ui/hosted_ui_chat_scaffold.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_chat_back_scope.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';

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

    final MatureAccess access = ref.watch(
      sensitiveContentProvider.select((SensitiveContentState s) => s.access),
    );
    final AsyncValue<bool> showGateAsync = ref.watch(
      shouldShowMatureContentGateProvider(channelId!),
    );
    final bool showMatureContentGate =
        showGateAsync.hasError ||
        (showGateAsync.value ?? access != MatureAccess.allowed);

    return HostedUiChatScaffold(
      channelId: channelId!,
      child: MobileChatBackScope(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            if (showMatureContentGate)
              ColoredBox(
                color: channelChatShellBackgroundColor(context),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: <Widget>[
                      ChannelHeader(channelId: channelId),
                      Expanded(
                        child: MatureContentChannelGate(channelId: channelId!),
                      ),
                    ],
                  ),
                ),
              )
            else
              ChannelChatContent(
                channelId: channelId!,
                targetMessageId: targetMessageId,
              ),
            Positioned.fill(
              child: SafeArea(
                bottom: false,
                child: ChannelDetailsDrawerOverlay(channelId: channelId!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
