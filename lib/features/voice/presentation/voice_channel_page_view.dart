import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/upload_drop_overlay.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/chat_route_sync_guard.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/voice/local_camera_orientation_sync.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_bar.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_expandable_sheet.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_participant_grid.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_channel_join_empty_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_chat_unread_badge.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_join_empty_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceChannelPageView extends ConsumerStatefulWidget {
  const VoiceChannelPageView({
    required this.guildId,
    required this.channelId,
    super.key,
  });

  final String guildId;
  final String channelId;

  @override
  ConsumerState<VoiceChannelPageView> createState() =>
      _VoiceChannelPageViewState();
}

const double _kDesktopChatPanelWidth = 360;

class _VoiceChannelPageViewState extends ConsumerState<VoiceChannelPageView> {
  bool _isChatPanelOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !chatRouteShouldSync(context)) {
        return;
      }
      unawaited(
        ref
            .read(chatViewModelProvider.notifier)
            .switchChannel(widget.channelId, loadMessages: false),
      );
    });
  }

  @override
  void didUpdateWidget(covariant VoiceChannelPageView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !chatRouteShouldSync(context)) {
          return;
        }
        unawaited(
          ref
              .read(chatViewModelProvider.notifier)
              .switchChannel(widget.channelId, loadMessages: false),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ChannelListState listState = ref.watch(
      channelListViewModelProvider.select((s) => s),
    );
    final Channel? channel =
        findChannelById(listState, widget.channelId) ??
        ref.watch(channelByIdProvider(widget.channelId)).value;
    final String name = channel?.name ?? '';
    final (bool inThisChannel, bool isConnecting, bool isConnected) = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) => (
          s.isInVoice && s.channelId == widget.channelId,
          s.isConnecting && s.channelId == widget.channelId,
          s.isConnected && s.channelId == widget.channelId,
        ),
      ),
    );
    final bool usePhoneVoiceOverlay = isPhoneVoiceOverlay(context);
    final Widget content = inThisChannel
        ? isConnected
              ? _buildConnected(
                  context,
                  channelName: name,
                  usePhoneVoiceOverlay: usePhoneVoiceOverlay,
                )
              : _buildConnecting(
                  context,
                  channelName: name,
                  usePhoneVoiceOverlay: usePhoneVoiceOverlay,
                )
        : _buildEmpty(channel: channel);
    if (usePhoneVoiceOverlay) {
      return content;
    }
    return _wrapWithDesktopChat(context, content: content, channelName: name);
  }

  Widget _wrapWithDesktopChat(
    BuildContext context, {
    required Widget content,
    required String channelName,
  }) {
    final bool textChatSupported =
        ref
            .watch(voiceChannelTextChatSupportedProvider(widget.channelId))
            .value ??
        false;
    if (!textChatSupported) {
      return content;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              content,
              Positioned(
                top: 12,
                right: 12,
                child: _DesktopVoiceChatToggle(
                  channelId: widget.channelId,
                  isOpen: _isChatPanelOpen,
                  onTap: () =>
                      setState(() => _isChatPanelOpen = !_isChatPanelOpen),
                ),
              ),
            ],
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          child: _isChatPanelOpen
              ? _DesktopVoiceChatDock(
                  channelId: widget.channelId,
                  channelName: channelName,
                  onClose: () => setState(() => _isChatPanelOpen = false),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildEmpty({required Channel? channel}) {
    return VoiceChannelJoinEmptyState(
      guildId: widget.guildId,
      channelId: widget.channelId,
      channel: channel,
    );
  }

  Widget _buildConnecting(
    BuildContext context, {
    required String channelName,
    required bool usePhoneVoiceOverlay,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? joinError = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.errorMessage),
    );
    final Widget connectingBody = Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (channelName.isNotEmpty) ...<Widget>[
              Text(
                channelName,
                textAlign: TextAlign.center,
                style: context.textStyles.channelName.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: context.colors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
            ],
            const FluxerLoadingSpinner(),
            const SizedBox(height: 12),
            if (joinError != null) ...<Widget>[
              VoiceJoinErrorBanner(message: joinError),
              const SizedBox(height: 12),
            ],
            Text(
              l10n.voiceChannelStatusConnecting,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
    return ColoredBox(
      color: context.colors.chatBackground,
      child: SafeArea(
        top: false,
        child: usePhoneVoiceOverlay
            ? VoiceCallMobilePageLayout(
                channelId: widget.channelId,
                guildId: widget.guildId,
                child: connectingBody,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(child: connectingBody),
                  VoiceChannelControlBar(channelId: widget.channelId),
                ],
              ),
      ),
    );
  }

  Widget _buildConnected(
    BuildContext context, {
    required String channelName,
    required bool usePhoneVoiceOverlay,
  }) {
    return LocalCameraOrientationSync(
      child: ColoredBox(
        color: context.colors.chatBackground,
        child: usePhoneVoiceOverlay
            ? VoiceCallMobilePageLayout(
                channelId: widget.channelId,
                guildId: widget.guildId,
                child: RepaintBoundary(
                  child: VoiceChannelParticipantGrid(
                    key: const ValueKey<String>('voice-participant-grid'),
                    guildId: widget.guildId,
                    channelId: widget.channelId,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: RepaintBoundary(
                      child: VoiceChannelParticipantGrid(
                        key: const ValueKey<String>('voice-participant-grid'),
                        guildId: widget.guildId,
                        channelId: widget.channelId,
                      ),
                    ),
                  ),
                  RepaintBoundary(
                    child: VoiceChannelControlBar(channelId: widget.channelId),
                  ),
                ],
              ),
      ),
    );
  }
}

/// Desktop only button that toggles the docked voice text-chat panel.
class _DesktopVoiceChatToggle extends StatelessWidget {
  const _DesktopVoiceChatToggle({
    required this.channelId,
    required this.isOpen,
    required this.onTap,
  });

  final String channelId;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Semantics(
      button: true,
      label: l10n.voiceControlChat,
      toggled: isOpen,
      child: Tooltip(
        message: l10n.voiceControlChat,
        child: Material(
          color: isOpen
              ? context.colors.brandPrimary
              : context.colors.backgroundFloating.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: PhosphorIcon(
                      PhosphorIconsFill.chatTeardrop,
                      size: 20,
                      color: context.colors.textPrimary,
                    ),
                  ),
                ),
                VoiceChatUnreadBadge(channelId: channelId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DesktopVoiceChatDock extends ConsumerStatefulWidget {
  const _DesktopVoiceChatDock({
    required this.channelId,
    required this.channelName,
    required this.onClose,
  });

  final String channelId;
  final String channelName;
  final VoidCallback onClose;

  @override
  ConsumerState<_DesktopVoiceChatDock> createState() =>
      _DesktopVoiceChatDockState();
}

class _DesktopVoiceChatDockState extends ConsumerState<_DesktopVoiceChatDock> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !chatRouteShouldSync(context)) {
        return;
      }
      unawaited(
        ref
            .read(chatViewModelProvider.notifier)
            .switchChannel(widget.channelId),
      );
    });
  }

  @override
  void didUpdateWidget(covariant _DesktopVoiceChatDock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId == widget.channelId) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !chatRouteShouldSync(context)) {
        return;
      }
      unawaited(
        ref
            .read(chatViewModelProvider.notifier)
            .switchChannel(widget.channelId),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    listenChatViewModelErrors(ref);
    return Container(
      width: _kDesktopChatPanelWidth,
      decoration: BoxDecoration(
        color: context.colors.chatBackground,
        border: Border(left: BorderSide(color: context.colors.borderColor)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 8, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.channelName.isNotEmpty
                        ? widget.channelName
                        : FluxerLocalizations.of(context).voiceControlChat,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.channelName.copyWith(
                      color: context.colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                  onPressed: widget.onClose,
                  icon: PhosphorIcon(
                    PhosphorIconsBold.x,
                    size: 18,
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: UploadDropOverlay(
              channelId: widget.channelId,
              child: ChannelChatPanel(displayChannelId: widget.channelId),
            ),
          ),
        ],
      ),
    );
  }
}
