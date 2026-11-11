import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/participant_tile_id.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';

const Color _kOverlayStrong = Color(0xC7000000);
const Color _kOverlayLight = Color(0x1FFFFFFF);
const Color _kTextStrong = Color(0xFFFFFFFF);

class VoicePipDesktopChrome extends StatefulWidget {
  const VoicePipDesktopChrome({
    required this.tileId,
    required this.visible,
    required this.onReturnToCall,
    super.key,
  });

  final String tileId;
  final bool visible;
  final VoidCallback onReturnToCall;

  @override
  State<VoicePipDesktopChrome> createState() => _VoicePipDesktopChromeState();
}

class _VoicePipDesktopChromeState extends State<VoicePipDesktopChrome> {
  late bool _showContent = widget.visible;

  @override
  void didUpdateWidget(VoicePipDesktopChrome oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible) {
      _showContent = true;
    }
  }

  void _handleFadeEnd() {
    if (!widget.visible && _showContent) {
      setState(() => _showContent = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.visible,
      child: AnimatedOpacity(
        opacity: widget.visible ? 1 : 0,
        duration: context.motion.panel,
        curve: Curves.ease,
        onEnd: _handleFadeEnd,
        child: _showContent
            ? _PipChromeContent(
                tileId: widget.tileId,
                onReturnToCall: widget.onReturnToCall,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class _PipChromeContent extends ConsumerWidget {
  const _PipChromeContent({required this.tileId, required this.onReturnToCall});

  final String tileId;
  final VoidCallback onReturnToCall;

  String _channelName(WidgetRef ref, String? channelId) {
    if (channelId == null) {
      return '';
    }
    final Channel? channel = ref.watch(channelByIdProvider(channelId)).value;
    if (channel != null && channel.name.isNotEmpty) {
      return channel.name;
    }
    final List<DmConversation> conversations = ref.watch(
      dmViewModelProvider.select((DmViewState s) => s.conversations),
    );
    final DmConversation? dm = findDmById(conversations, channelId);
    return dm == null ? '' : dm.recipientName;
  }

  String _displayName(
    WidgetRef ref, {
    required String? participantsKey,
    required String? guildId,
  }) {
    final ({String identity, VoiceParticipantTileSource source})? parsed =
        parseVoiceParticipantTileId(tileId);
    if (participantsKey == null || parsed == null) {
      return '';
    }
    for (final VoiceChannelParticipantData participant in ref.watch(
      voiceChannelParticipantsProvider(participantsKey),
    )) {
      if (voiceParticipantTileId(
            voice: participant.voice,
            userId: participant.userId,
            source: parsed.source,
          ) !=
          tileId) {
        continue;
      }
      final GuildUserDisplay? display = watchGuildScopedUserDisplay(
        ref: ref,
        userId: participant.userId,
        guildId: guildId,
        currentUserId: ref.watch(currentUserIdProvider),
      );
      return display?.displayName ?? participant.user?.username ?? '';
    }
    return '';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? channelId = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.channelId),
    );
    final String? guildId = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.guildId),
    );
    final String? participantsKey = ref.watch(
      voiceSessionProvider.select(voiceSessionParticipantsKey),
    );
    final bool isScreenShare =
        parseVoiceParticipantTileId(tileId)?.source ==
        VoiceParticipantTileSource.screenShare;
    final TextStyle base = context.textStyles.bodyMedium.copyWith(
      color: _kTextStrong,
      letterSpacing: 0,
    );
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: 48,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[_kOverlayStrong, Color(0x00000000)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: _PipReturnToCallButton(
                  label: _channelName(ref, channelId),
                  semanticLabel: l10n.voicePipReturnToCallLabel,
                  textStyle: base,
                  onPressed: onReturnToCall,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 48,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[_kOverlayStrong, Color(0x00000000)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _displayName(
                          ref,
                          participantsKey: participantsKey,
                          guildId: guildId,
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: base.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (!isScreenShare)
                      FluxerButton.desktop(
                        icon: PhosphorIconsFill.phoneX,
                        semanticLabel: l10n.voiceControlDisconnect,
                        showTooltip: true,
                        extent: 28,
                        borderRadius: 6,
                        color: _kTextStrong,
                        hoverColor: _kTextStrong,
                        hoverBackground: _kOverlayLight,
                        duration: context.motion.normal,
                        onPressed: () => unawaited(
                          ref.read(voiceSessionProvider.notifier).leaveVoice(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PipReturnToCallButton extends StatelessWidget {
  const _PipReturnToCallButton({
    required this.label,
    required this.semanticLabel,
    required this.textStyle,
    required this.onPressed,
  });

  final String label;
  final String semanticLabel;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Duration duration = context.motion.normal;
    return FluxerTappable(
      onTap: onPressed,
      button: true,
      semanticLabel: semanticLabel,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool hovered = states.contains(WidgetState.hovered);
        return AnimatedContainer(
          duration: duration,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: hovered ? _kTextStrong : const Color(0x00FFFFFF),
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: <Widget>[
              const PhosphorIcon(
                PhosphorIconsBold.arrowLeft,
                size: 14,
                color: _kTextStrong,
              ),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
