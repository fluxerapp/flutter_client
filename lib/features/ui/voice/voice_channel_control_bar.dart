import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kControlSize = 56;
const double _kControlGap = 12;

class VoiceChannelControlBar extends ConsumerWidget {
  const VoiceChannelControlBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceSessionState session = ref.watch(voiceSessionProvider);
    if (!session.isInVoice) {
      return const SizedBox.shrink();
    }
    final String? connectionId = session.activeConnectionId;
    final VoiceState? selfVs = connectionId == null
        ? null
        : ref.watch(voiceStatesMapProvider)[connectionId];
    final bool isMuted = selfVs?.selfMute ?? false;
    final bool isDeafened = selfVs?.selfDeaf ?? false;
    final bool isVideoOn = selfVs?.selfVideo ?? false;
    return Material(
      color: const Color(0xFF000000),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.sizeOf(context).width - 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: _kControlGap,
                children: <Widget>[
                  _VoiceControlCircle(
                    size: _kControlSize,
                    color: isMuted
                        ? context.colors.statusDanger
                        : context.colors.backgroundTertiary,
                    tooltip: isMuted
                        ? l10n.voiceControlUnmute
                        : l10n.voiceControlMute,
                    icon: isMuted
                        ? PhosphorIconsFill.microphoneSlash
                        : PhosphorIconsFill.microphone,
                    onPressed: () {
                      unawaited(
                        ref
                            .read(voiceSessionProvider.notifier)
                            .toggleSelfMute(),
                      );
                    },
                  ),
                  _VoiceControlCircle(
                    size: _kControlSize,
                    color: isDeafened
                        ? context.colors.statusDanger
                        : context.colors.backgroundTertiary,
                    tooltip: isDeafened
                        ? l10n.voiceControlUndeafen
                        : l10n.voiceControlDeafen,
                    icon: isDeafened
                        ? PhosphorIconsFill.speakerSlash
                        : PhosphorIconsFill.speakerHigh,
                    onPressed: () {
                      unawaited(
                        ref
                            .read(voiceSessionProvider.notifier)
                            .toggleSelfDeafen(),
                      );
                    },
                  ),
                  _VoiceControlCircle(
                    size: _kControlSize,
                    color: isVideoOn
                        ? context.colors.brandPrimary
                        : context.colors.backgroundTertiary,
                    tooltip: l10n.voiceControlVideo,
                    icon: PhosphorIconsFill.videoCamera,
                    onPressed: session.isConnected
                        ? () {
                            unawaited(
                              ref
                                  .read(voiceSessionProvider.notifier)
                                  .toggleSelfVideo(),
                            );
                          }
                        : null,
                  ),
                  _VoiceControlCircle(
                    size: _kControlSize,
                    color: context.colors.backgroundTertiary.withValues(
                      alpha: 0.4,
                    ),
                    tooltip: l10n.voiceControlScreenShare,
                    icon: PhosphorIconsFill.monitor,
                    onPressed: null,
                  ),
                  _VoiceControlCircle(
                    size: _kControlSize,
                    color: context.colors.statusDanger,
                    tooltip: l10n.voiceControlDisconnect,
                    icon: PhosphorIconsFill.phoneDisconnect,
                    onPressed: () {
                      if (context.mounted) {
                        if (isMobileLayout(context)) {
                          context.pop();
                        }
                      }
                       unawaited(ref
                          .read(voiceSessionProvider.notifier)
                          .leaveVoice());
                      
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VoiceControlCircle extends StatelessWidget {
  const _VoiceControlCircle({
    required this.size,
    required this.color,
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final double size;
  final Color color;
  final String tooltip;
  final PhosphorIconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final Widget child = Material(
      color: color,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: size,
          height: size,
          child: PhosphorIcon(
            icon,
            size: 24,
            color: context.colors.textPrimary.withValues(
              alpha: onPressed == null ? 0.45 : 1,
            ),
          ),
        ),
      ),
    );
    return Tooltip(message: tooltip, child: child);
  }
}
