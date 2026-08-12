import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_chat_unread_badge.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_e2ee_indicator.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_join_eligibility_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kLobbyActionSize = 56;
const double _kLobbyActionGap = 20;

sealed class VoiceChannelJoinSheetResult {
  const VoiceChannelJoinSheetResult();
}

class VoiceChannelJoinConnectResult extends VoiceChannelJoinSheetResult {
  const VoiceChannelJoinConnectResult({
    required this.initialSelfMute,
    required this.initialSelfDeaf,
  });

  final bool initialSelfMute;
  final bool initialSelfDeaf;
}

class VoiceChannelJoinOpenChat extends VoiceChannelJoinSheetResult {
  const VoiceChannelJoinOpenChat();
}

Future<VoiceChannelJoinSheetResult?> showVoiceChannelJoinBottomSheet(
  BuildContext context, {
  required String channelName,
  required String guildId,
  required String channelId,
}) {
  return FluxerBottomSheet.show<VoiceChannelJoinSheetResult?>(
    context,
    title: channelName,
    builder: (BuildContext sheetContext, VoidCallback _) {
      return _VoiceChannelJoinSheetContent(
        guildId: guildId,
        channelId: channelId,
      );
    },
  );
}

class _VoiceChannelJoinSheetContent extends ConsumerStatefulWidget {
  const _VoiceChannelJoinSheetContent({
    required this.guildId,
    required this.channelId,
  });

  final String guildId;
  final String channelId;

  @override
  ConsumerState<_VoiceChannelJoinSheetContent> createState() =>
      _VoiceChannelJoinSheetContentState();
}

class _VoiceChannelJoinSheetContentState
    extends ConsumerState<_VoiceChannelJoinSheetContent> {
  bool _lobbyMute = false;
  bool _lobbyDeaf = false;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final double horizontalPadding = context.layout.s4;
    final (
      bool isInVoiceSession,
      String? sessionChannelId,
      String? connectionId,
    ) = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) =>
            (s.isInVoice, s.channelId, s.activeConnectionId),
      ),
    );
    final bool inVoice = isInVoiceSession && sessionChannelId != null;
    final VoiceState? selfVs = connectionId == null
        ? null
        : ref.watch(voiceStateForConnectionProvider(connectionId));
    final bool isMuted = inVoice ? (selfVs?.selfMute ?? false) : _lobbyMute;
    final bool isDeafened = inVoice ? (selfVs?.selfDeaf ?? false) : _lobbyDeaf;
    final AsyncValue<bool> textChatSupportedAsync = ref.watch(
      voiceChannelTextChatSupportedProvider(widget.channelId),
    );
    final bool showChatButton = textChatSupportedAsync.value ?? false;
    final bool canJoinVoice =
        ref
            .watch(voiceJoinEligibilityProvider(widget.channelId))
            .value
            ?.canJoin ??
        true;
    final UnreadState? unread = ref
        .watch(channelUnreadProvider(widget.channelId))
        .value;
    final String chatSemanticsLabel = voiceChatAccessibilityLabel(
      l10n: l10n,
      unread: unread,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: context.layout.s3),
        const Divider(),
        SizedBox(height: context.layout.s3),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: canJoinVoice
              ? FluxerButton.primary(
                  label: l10n.voiceChannelJoinConnect,
                  onPressed: () => _onConnect(inVoice: inVoice, selfVs: selfVs),
                )
              : Tooltip(
                  message: l10n.voiceChannelNoConnectPermission,
                  child: FluxerButton.primary(
                    label: l10n.voiceChannelJoinConnect,
                  ),
                ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: VoiceE2eeIndicator(
            guildId: widget.guildId,
            channelId: widget.channelId,
            variant: VoiceE2eeIndicatorVariant.voiceChannel,
          ),
        ),
        SizedBox(height: context.layout.s4),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _LobbyActionTile(
                isActive: isMuted,
                activeIsDanger: true,
                primaryWhenNotActive: true,
                label: isMuted
                    ? l10n.voiceControlUnmute
                    : l10n.voiceControlMute,
                icon: isMuted
                    ? PhosphorIconsFill.microphoneSlash
                    : PhosphorIconsFill.microphone,
                onPressed: inVoice
                    ? () {
                        unawaited(
                          ref
                              .read(voiceSessionProvider.notifier)
                              .toggleSelfMute(),
                        );
                      }
                    : () {
                        setState(() {
                          if (_lobbyDeaf) {
                            _lobbyDeaf = false;
                            _lobbyMute = false;
                          } else {
                            _lobbyMute = !_lobbyMute;
                          }
                        });
                      },
              ),
              const SizedBox(width: _kLobbyActionGap),
              _LobbyActionTile(
                isActive: isDeafened,
                activeIsDanger: true,
                primaryWhenNotActive: false,
                label: isDeafened
                    ? l10n.voiceControlUndeafen
                    : l10n.voiceControlDeafen,
                icon: isDeafened
                    ? PhosphorIconsFill.speakerSlash
                    : PhosphorIconsFill.speakerHigh,
                onPressed: inVoice
                    ? () {
                        unawaited(
                          ref
                              .read(voiceSessionProvider.notifier)
                              .toggleSelfDeafen(),
                        );
                      }
                    : () {
                        setState(() {
                          if (_lobbyDeaf) {
                            _lobbyDeaf = false;
                            _lobbyMute = false;
                          } else {
                            _lobbyDeaf = true;
                            _lobbyMute = true;
                          }
                        });
                      },
              ),
              if (showChatButton) ...<Widget>[
                const SizedBox(width: _kLobbyActionGap),
                Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    _LobbyActionTile(
                      isActive: false,
                      activeIsDanger: false,
                      primaryWhenNotActive: true,
                      label: l10n.voiceControlChat,
                      icon: PhosphorIconsFill.chatTeardrop,
                      semanticsLabel: chatSemanticsLabel,
                      onPressed: () {
                        if (context.mounted) {
                          Navigator.of(
                            context,
                          ).pop(const VoiceChannelJoinOpenChat());
                        }
                      },
                    ),
                    VoiceChatUnreadBadge(channelId: widget.channelId),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  void _onConnect({required bool inVoice, required VoiceState? selfVs}) {
    final VoiceChannelJoinConnectResult outcome;
    if (inVoice) {
      outcome = VoiceChannelJoinConnectResult(
        initialSelfMute: selfVs?.selfMute ?? false,
        initialSelfDeaf: selfVs?.selfDeaf ?? false,
      );
    } else {
      final bool selfDeaf = _lobbyDeaf;
      final bool selfMute = selfDeaf || _lobbyMute;
      outcome = VoiceChannelJoinConnectResult(
        initialSelfMute: selfMute,
        initialSelfDeaf: selfDeaf,
      );
    }
    if (context.mounted) {
      Navigator.of(context).pop(outcome);
    }
  }
}

class _LobbyActionTile extends StatelessWidget {
  const _LobbyActionTile({
    required this.isActive,
    required this.activeIsDanger,
    required this.primaryWhenNotActive,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.semanticsLabel,
  });

  final bool isActive;
  final bool activeIsDanger;
  final bool primaryWhenNotActive;
  final String label;
  final PhosphorIconData icon;
  final VoidCallback? onPressed;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final bool isEmphasis =
        (activeIsDanger && isActive) || primaryWhenNotActive;
    final Color baseColor = activeIsDanger && isActive
        ? colors.statusDanger
        : primaryWhenNotActive
        ? colors.brandPrimary
        : colors.backgroundTertiary;
    final Color iconColor = isEmphasis
        ? colors.textOnBrandPrimary
        : colors.textPrimary;
    return Semantics(
      button: true,
      enabled: onPressed != null,
      label: semanticsLabel ?? label,
      child: FluxerGestureDetector(
        onTap: onPressed,
        child: Material(
          color: colors.buttonSecondaryFill,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Material(
                  color: baseColor,
                  shape: const CircleBorder(),
                  child: SizedBox(
                    width: _kLobbyActionSize,
                    height: _kLobbyActionSize,
                    child: PhosphorIcon(
                      icon,
                      size: 24,
                      color: iconColor.withValues(
                        alpha: onPressed == null ? 0.45 : 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.layout.s2),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: context.textStyles.bodySmall.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
