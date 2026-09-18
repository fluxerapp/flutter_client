import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/chat_route_sync_guard.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/voice/local_camera_orientation_sync.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_bar.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_expandable_sheet.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_participant_grid.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_channel_chat_sheet.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_channel_chat_surface.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_channel_join_empty_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_chat_unread_badge.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_channel_chat_jump.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceChannelPageView extends ConsumerStatefulWidget {
  const VoiceChannelPageView({
    required this.guildId,
    required this.channelId,
    this.messageId,
    super.key,
  });

  final String guildId;
  final String channelId;
  final String? messageId;

  @override
  ConsumerState<VoiceChannelPageView> createState() =>
      _VoiceChannelPageViewState();
}

const double _kDesktopChatPanelWidth = 360;

class _VoiceChannelPageViewState extends ConsumerState<VoiceChannelPageView> {
  bool _isChatPanelOpen = false;
  bool _jumpSheetOpen = false;
  String? _openedUnconsumedJumpTarget;
  String? _chatJumpTarget;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _switchOverviewChannelIfNeeded();
    });
  }

  @override
  void didUpdateWidget(covariant VoiceChannelPageView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId) {
      _openedUnconsumedJumpTarget = null;
      _chatJumpTarget = null;
      _isChatPanelOpen = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _switchOverviewChannelIfNeeded();
      });
    }
  }

  void _switchOverviewChannelIfNeeded() {
    if (!mounted || !chatRouteShouldSync(context)) {
      return;
    }
    if (_resolvedJumpTarget(ref.read(channelJumpTargetLedgerProvider)) !=
        null) {
      return;
    }
    unawaited(
      ref
          .read(chatViewModelProvider.notifier)
          .switchChannel(widget.channelId, loadMessages: false),
    );
  }

  String? _resolvedJumpTarget(ChannelJumpTargetConsumption consumption) {
    return resolveVoiceChannelChatJumpTarget(
      channelId: widget.channelId,
      routeTarget: widget.messageId,
      consumption: consumption,
    );
  }

  void _closeDesktopChat() {
    _isChatPanelOpen = false;
    _chatJumpTarget = null;
  }

  void _openChatForJumpIfNeeded({
    required String? jumpTarget,
    required bool textChatSupported,
    required bool usePhoneVoiceOverlay,
    String? channelName,
  }) {
    if (jumpTarget == null) {
      _openedUnconsumedJumpTarget = null;
      return;
    }
    if (!textChatSupported || _openedUnconsumedJumpTarget == jumpTarget) {
      return;
    }
    _openedUnconsumedJumpTarget = jumpTarget;
    _chatJumpTarget = jumpTarget;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      if (usePhoneVoiceOverlay) {
        if (_jumpSheetOpen) {
          return;
        }
        _jumpSheetOpen = true;
        unawaited(
          showVoiceChannelChatSheet(
            context,
            channelId: widget.channelId,
            channelName: channelName,
            targetMessageId: jumpTarget,
          ).whenComplete(() {
            _jumpSheetOpen = false;
          }),
        );
        return;
      }
      if (!_isChatPanelOpen) {
        setState(() => _isChatPanelOpen = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Channel? channel =
        ref.watch(channelByIdProvider(widget.channelId)).value ??
        findChannelById(
          ref.read(channelListViewModelProvider),
          widget.channelId,
        );
    final String name = channel?.name ?? '';
    final bool inThisChannel = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) => s.isInVoice && s.channelId == widget.channelId,
      ),
    );
    final bool usePhoneVoiceOverlay = isPhoneVoiceOverlay(context);
    final bool textChatSupported =
        ref
            .watch(voiceChannelTextChatSupportedProvider(widget.channelId))
            .value ??
        false;
    final String? jumpTarget = ref.watch(
      channelJumpTargetLedgerProvider.select(_resolvedJumpTarget),
    );
    _openChatForJumpIfNeeded(
      jumpTarget: jumpTarget,
      textChatSupported: textChatSupported,
      usePhoneVoiceOverlay: usePhoneVoiceOverlay,
      channelName: name,
    );
    final Widget content = inThisChannel
        ? _buildConnected(context, usePhoneVoiceOverlay: usePhoneVoiceOverlay)
        : _buildEmpty(channel: channel);
    if (usePhoneVoiceOverlay) {
      return content;
    }
    return _wrapWithDesktopChat(
      context,
      content: content,
      channelName: name,
      textChatSupported: textChatSupported,
      jumpTarget: jumpTarget,
    );
  }

  Widget _wrapWithDesktopChat(
    BuildContext context, {
    required Widget content,
    required String channelName,
    required bool textChatSupported,
    required String? jumpTarget,
  }) {
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
                  onTap: () {
                    setState(() {
                      if (_isChatPanelOpen) {
                        _closeDesktopChat();
                      } else {
                        _isChatPanelOpen = true;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        if (_isChatPanelOpen)
          _DesktopVoiceChatDock(
            channelId: widget.channelId,
            channelName: channelName,
            targetMessageId: jumpTarget ?? _chatJumpTarget,
            onClose: () => setState(_closeDesktopChat),
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

  Widget _buildConnected(
    BuildContext context, {
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

class _DesktopVoiceChatDock extends StatelessWidget {
  const _DesktopVoiceChatDock({
    required this.channelId,
    required this.channelName,
    required this.onClose,
    this.targetMessageId,
  });

  final String channelId;
  final String channelName;
  final String? targetMessageId;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
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
                    channelName.isNotEmpty
                        ? channelName
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
                  onPressed: onClose,
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
            child: VoiceChannelChatSurface(
              channelId: channelId,
              targetMessageId: targetMessageId,
              onClose: onClose,
            ),
          ),
        ],
      ),
    );
  }
}
