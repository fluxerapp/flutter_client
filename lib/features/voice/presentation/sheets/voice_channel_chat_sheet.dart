import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/router/shell_popup_overlay_sync.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_channel_chat_surface.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kChatSheetMaxHeight = 0.92;

Future<void> showVoiceChannelChatSheet(
  BuildContext context, {
  required String channelId,
  String? channelName,
  String? targetMessageId,
  bool useRootNavigator = false,
}) {
  final ProviderContainer container = ProviderScope.containerOf(context);
  final String previousChannelId = container
      .read(chatViewModelProvider)
      .channelId;
  return FluxerBottomSheet.show<void>(
    context,
    title: channelName,
    maxHeight: _kChatSheetMaxHeight,
    useRootNavigator: useRootNavigator,
    reserveBottomInset: false,
    manageKeyboardInset: false,
    builder: (BuildContext sheetContext, VoidCallback close) {
      return SizedBox(
        width: double.infinity,
        child: _VoiceChannelChatSheetBody(
          channelId: channelId,
          targetMessageId: targetMessageId,
          onClose: close,
        ),
      );
    },
  ).whenComplete(() {
    unawaited(
      Future<void>.microtask(() {
        final String? routeChannelId = container.read(activeChannelIdProvider);
        final String resumeChannelId = routeChannelId ?? previousChannelId;
        final String activeChatChannelId = container
            .read(chatViewModelProvider)
            .channelId;
        if (resumeChannelId.isNotEmpty &&
            activeChatChannelId != resumeChannelId) {
          unawaited(
            container
                .read(chatViewModelProvider.notifier)
                .switchChannel(resumeChannelId),
          );
        }
        reconcileShellPopupOverlayForContainer(container);
        container.read(expressionPanelProvider.notifier).close();
        container.read(attachmentPanelProvider.notifier).close();
        DrawerNavigationCoordinator.nudgeDrawerSync(container);
      }),
    );
  });
}

class _VoiceChannelChatSheetBody extends ConsumerStatefulWidget {
  const _VoiceChannelChatSheetBody({
    required this.channelId,
    required this.onClose,
    this.targetMessageId,
  });

  final String channelId;
  final String? targetMessageId;
  final VoidCallback onClose;

  @override
  ConsumerState<_VoiceChannelChatSheetBody> createState() =>
      _VoiceChannelChatSheetBodyState();
}

class _VoiceChannelChatSheetBodyState
    extends ConsumerState<_VoiceChannelChatSheetBody> {
  late final ExpressionPanel _expressionPanelNotifier;
  late final AttachmentPanel _attachmentPanelNotifier;
  late final String _backgroundChannelId;

  @override
  void initState() {
    super.initState();
    _backgroundChannelId = ref.read(chatViewModelProvider).channelId;
    _expressionPanelNotifier = ref.read(expressionPanelProvider.notifier);
    _attachmentPanelNotifier = ref.read(attachmentPanelProvider.notifier);
  }

  void _restoreBackgroundChannel() {
    final String? routeChannelId = ref.read(activeChannelIdProvider);
    final String resumeChannelId = routeChannelId ?? _backgroundChannelId;
    if (resumeChannelId.isEmpty) {
      return;
    }
    final String activeChatChannelId = ref
        .read(chatViewModelProvider)
        .channelId;
    if (activeChatChannelId == resumeChannelId) {
      return;
    }
    unawaited(
      ref.read(chatViewModelProvider.notifier).switchChannel(resumeChannelId),
    );
  }

  void _handleClose() {
    _expressionPanelNotifier.close();
    _attachmentPanelNotifier.close();
    _restoreBackgroundChannel();
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return VoiceChannelChatSurface(
      channelId: widget.channelId,
      targetMessageId: widget.targetMessageId,
      onClose: _handleClose,
    );
  }
}
