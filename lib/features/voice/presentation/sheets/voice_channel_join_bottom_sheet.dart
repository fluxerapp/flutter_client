import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kLobbyActionSize = 56;
const double _kLobbyActionGap = 20;

class VoiceChannelJoinOutcome {
  const VoiceChannelJoinOutcome({
    required this.initialSelfMute,
    required this.initialSelfDeaf,
  });

  final bool initialSelfMute;
  final bool initialSelfDeaf;
}

Future<VoiceChannelJoinOutcome?> showVoiceChannelJoinBottomSheet(
  BuildContext context, {
  required String channelName,
}) {
  return FluxerBottomSheet.show<VoiceChannelJoinOutcome?>(
    context,
    title: channelName,
    builder: (BuildContext sheetContext, VoidCallback _) {
      return const _VoiceChannelJoinSheetContent();
    },
  );
}

class _VoiceChannelJoinSheetContent extends ConsumerStatefulWidget {
  const _VoiceChannelJoinSheetContent();

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
    final VoiceSessionState session = ref.watch(voiceSessionProvider);
    final bool inVoice = session.isInVoice && session.channelId != null;
    final String? connectionId = session.activeConnectionId;
    final Map<String, VoiceState> voiceMap = ref.watch(voiceStatesMapProvider);
    final VoiceState? selfVs = connectionId == null
        ? null
        : voiceMap[connectionId];
    final bool isMuted = inVoice ? (selfVs?.selfMute ?? false) : _lobbyMute;
    final bool isDeafened = inVoice ? (selfVs?.selfDeaf ?? false) : _lobbyDeaf;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: context.layout.s3),
        const Divider(),
        SizedBox(height: context.layout.s3),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: FluxerButton.primary(
            label: l10n.voiceChannelJoinConnect,
            onPressed: () => _onConnect(inVoice: inVoice, selfVs: selfVs),
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
            ],
          ),
        ),
      ],
    );
  }

  void _onConnect({required bool inVoice, required VoiceState? selfVs}) {
    final VoiceChannelJoinOutcome outcome;
    if (inVoice) {
      outcome = VoiceChannelJoinOutcome(
        initialSelfMute: selfVs?.selfMute ?? false,
        initialSelfDeaf: selfVs?.selfDeaf ?? false,
      );
    } else {
      final bool selfDeaf = _lobbyDeaf;
      final bool selfMute = selfDeaf || _lobbyMute;
      outcome = VoiceChannelJoinOutcome(
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
  });

  final bool isActive;
  final bool activeIsDanger;
  final bool primaryWhenNotActive;
  final String label;
  final PhosphorIconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final Color baseColor = activeIsDanger && isActive
        ? colors.statusDanger
        : primaryWhenNotActive
        ? colors.brandPrimary
        : colors.backgroundTertiary;
    return Semantics(
      button: true,
      label: label,
      child: GestureDetector(
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
                      color: colors.textPrimary,
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
