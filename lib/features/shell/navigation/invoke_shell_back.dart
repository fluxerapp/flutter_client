import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_drawer_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_panel.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_handler.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_resolver.dart';
import 'package:fluxer_app/features/shell/navigation/shell_chat_back.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_manual_gesture_block_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_phone_call_layout.dart';
import 'package:fluxer_app/material_ui.dart';

void invokeShellBack(BuildContext context, WidgetRef ref) {
  handleShellBack(context, ref);
}

void handleShellBack(
  BuildContext context,
  WidgetRef ref, {
  bool isSystemBack = false,
}) {
  final ShellChatBackContext chatBack = shellChatBackContext(context, ref);
  applyShellBackAction(
    context: context,
    container: ref.container,
    action: resolveShellBackAction(
      hasPopupOverlay: ref.read(shellHasPopupOverlayProvider),
      hasManualGestureBlock: ref.read(shellManualGestureBlockProvider),
      hasExpressionPanelOpen: isComposerPanelOpen(
        expressionPanelOpen: ref.read(expressionPanelProvider),
        attachmentPanelOpen: ref.read(attachmentPanelProvider),
      ),
      hasChannelDetailsDrawerOpen: ref.read(channelDetailsDrawerIsOpenProvider),
      revealSide: ref.read(currentRevealSideProvider),
      shellLocation: ref.read(shellLocationProvider),
      minimizePhoneVoiceCall: shouldMinimizePhoneVoiceCall(context, ref),
      isSystemBack: isSystemBack,
      pinnedSidebar: isPinnedSidebarLayout(context),
      chatShowsConcurrentChannelList: chatBack.showsConcurrentChannelList,
      isThreadChat: chatBack.isThread,
    ),
    closeExpressionPanel: () {
      ref.read(expressionPanelProvider.notifier).close();
      ref.read(attachmentPanelProvider.notifier).close();
    },
  );
}
