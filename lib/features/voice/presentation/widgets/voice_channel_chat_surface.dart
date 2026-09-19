import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/upload_drop_overlay.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/utils/chat_route_sync_guard.dart';
import 'package:fluxer_app/material_ui.dart';

/// Message list and composer for voice-channel text chat, with jump sync.
class VoiceChannelChatSurface extends ConsumerStatefulWidget {
  const VoiceChannelChatSurface({
    required this.channelId,
    this.targetMessageId,
    this.applyWallpaper = true,
    this.onClose,
    super.key,
  });

  final String channelId;
  final String? targetMessageId;
  final bool applyWallpaper;
  final VoidCallback? onClose;

  @override
  ConsumerState<VoiceChannelChatSurface> createState() =>
      _VoiceChannelChatSurfaceState();
}

class _VoiceChannelChatSurfaceState
    extends ConsumerState<VoiceChannelChatSurface> {
  ({String channelId, String? targetMessageId, bool loadMessages})?
  _lastSwitchRequest;
  ({String channelId, String? targetMessageId})? _lastClosedPanelRequest;

  @override
  void initState() {
    super.initState();
    _scheduleSyncChannelIfNeeded();
  }

  @override
  void didUpdateWidget(covariant VoiceChannelChatSurface oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId == widget.channelId &&
        oldWidget.targetMessageId == widget.targetMessageId) {
      return;
    }
    _lastSwitchRequest = null;
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
    if (!chatRouteShouldSync(context)) {
      return;
    }
    final request = buildChannelChatSyncRequest(
      channelId: widget.channelId,
      routeTarget: widget.targetMessageId,
      consumption: ref.read(channelJumpTargetLedgerProvider),
    );
    if (shouldDedupChannelChatSwitchRequest(
      lastRequest: _lastSwitchRequest,
      request: request,
      state: ref.read(chatViewModelProvider),
    )) {
      return;
    }
    _lastSwitchRequest = request;
    unawaited(_runChannelSync(request));
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
      ref.read(attachmentPanelProvider.notifier).close();
    }
    await ref
        .read(chatViewModelProvider.notifier)
        .switchChannel(
          request.channelId,
          targetMessageId: request.targetMessageId,
          loadMessages: request.loadMessages,
        );
  }

  void _maybeConsumeSettledJumpTarget(
    (String, int)? previousSignal,
    (String, int)? nextSignal,
  ) {
    final String? target = widget.targetMessageId;
    if (!shouldConsumeChannelJumpTarget(
      channelId: widget.channelId,
      routeTarget: target,
      consumption: ref.read(channelJumpTargetLedgerProvider),
      previousSignal: previousSignal,
      nextSignal: nextSignal,
    )) {
      return;
    }
    ref
        .read(channelJumpTargetLedgerProvider.notifier)
        .markConsumed(channelId: widget.channelId, messageId: target!);
  }

  @override
  Widget build(BuildContext context) {
    listenChatViewModelErrors(ref);
    ref.listen<(String, int)?>(
      chatViewModelProvider.select(
        (ChatViewState state) => state.scrollToMessageSignal,
      ),
      _maybeConsumeSettledJumpTarget,
    );
    return UploadDropOverlay(
      channelId: widget.channelId,
      child: ChannelChatPanel(
        displayChannelId: widget.channelId,
        targetMessageId: widget.targetMessageId,
        applyWallpaper: widget.applyWallpaper,
        onClose: widget.onClose,
      ),
    );
  }
}
