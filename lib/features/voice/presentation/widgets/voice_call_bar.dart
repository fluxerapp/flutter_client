import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Compact controls when a voice session is active.
///
/// This is just a temporary design for testing, need to work on a final design.
class VoiceCallBar extends ConsumerWidget {
  const VoiceCallBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    if (!voice.isInVoice && voice.errorMessage == null) {
      return const SizedBox.shrink();
    }
    final String serverName = _resolveServerName(
      guilds: ref.watch(guildListViewModelProvider.select((s) => s.guilds)),
      guildId: voice.guildId,
    );
    final String channelName = _resolveChannelName(
      state: ref.watch(channelListViewModelProvider),
      channelId: voice.channelId,
    );
    final String? connectionId = voice.activeConnectionId;
    final VoiceState? selfVoiceState = connectionId == null
        ? null
        : ref.watch(voiceStatesMapProvider)[connectionId];
    final bool isMuted = selfVoiceState?.selfMute ?? false;
    final bool isDeafened = selfVoiceState?.selfDeaf ?? false;
    final String? activeGuildId = voice.guildId;
    final String? activeChannelId = voice.channelId;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Divider(height: 1, color: context.colors.borderColor),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
          child: Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(12),
            color: context.colors.backgroundSecondary,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (activeGuildId == null || activeChannelId == null) {
                  return;
                }
                navigateToContent(
                  context,
                  RoutePaths.guildChannel(activeGuildId, activeChannelId),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                children: <Widget>[
                  _buildStatusIcon(context),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          _buildStatusText(voice: voice, serverName: serverName),
                          style: context.textStyles.channelName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (channelName.isNotEmpty) ...<Widget>[
                          const SizedBox(height: 2),
                          Text(
                            channelName,
                            style: context.textStyles.categoryName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        if (voice.errorMessage != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            voice.errorMessage!,
                            style: context.textStyles.categoryName.copyWith(
                              color: context.colors.statusDanger,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (voice.errorMessage == null && voice.isInVoice) ...<Widget>[
                    const SizedBox(width: 8),
                    _ControlIconButton(
                      icon: isMuted
                          ? PhosphorIconsFill.microphoneSlash
                          : PhosphorIconsFill.microphone,
                      color: isMuted
                          ? context.colors.statusDanger
                          : context.colors.backgroundTertiary,
                      onPressed: () {
                        unawaited(
                          ref.read(voiceSessionProvider.notifier).toggleSelfMute(),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    _ControlIconButton(
                      icon: isDeafened
                          ? PhosphorIconsFill.speakerSlash
                          : PhosphorIconsFill.speakerHigh,
                      color: isDeafened
                          ? context.colors.statusDanger
                          : context.colors.backgroundTertiary,
                      onPressed: () {
                        unawaited(
                          ref
                              .read(voiceSessionProvider.notifier)
                              .toggleSelfDeafen(),
                        );
                      },
                    ),
                  ],
                  const SizedBox(width: 6),
                  if (voice.errorMessage != null)
                    TextButton(
                      onPressed: () {
                        ref.read(voiceSessionProvider.notifier).clearError();
                      },
                      child: const Text('Dismiss'),
                    )
                  else if (voice.isConnected)
                    FilledButton.tonal(
                      onPressed: () {
                        unawaited(
                          ref.read(voiceSessionProvider.notifier).leaveVoice(),
                        );
                      },
                      child: const Text('Leave'),
                    ),
                ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _resolveServerName({
    required List<Guild> guilds,
    required String? guildId,
  }) {
    if (guildId == null || guildId.isEmpty) {
      return '';
    }
    final Guild? guild = guilds.where((Guild g) => g.id == guildId).firstOrNull;
    return guild?.name ?? '';
  }

  String _resolveChannelName({
    required ChannelListState state,
    required String? channelId,
  }) {
    if (channelId == null || channelId.isEmpty) {
      return '';
    }
    final Channel? channel = findChannelById(state, channelId);
    return channel?.name ?? channelId;
  }

  Widget _buildStatusIcon(BuildContext context) {
    return PhosphorIcon(
      PhosphorIconsRegular.phone,
      color: context.colors.textSecondary,
      size: 22,
    );
  }

  String _buildStatusText({
    required VoiceSessionState voice,
    required String serverName,
  }) {
    if (voice.errorMessage != null) {
      return serverName.isEmpty ? 'Voice issue' : serverName;
    }
    if (voice.isConnected) {
      return serverName.isEmpty ? 'Voice connected' : serverName;
    }
    return serverName.isEmpty ? 'Connecting…' : '$serverName (connecting…)';
  }
}

class _ControlIconButton extends StatelessWidget {
  const _ControlIconButton({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final PhosphorIconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Center(
            child: PhosphorIcon(
              icon,
              size: 18,
              color: context.colors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
