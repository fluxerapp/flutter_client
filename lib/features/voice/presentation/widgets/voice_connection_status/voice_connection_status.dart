import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/user_panel_widgets.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/popout/fluxer_popout.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_audio_processing_modal.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_connection_status/voice_connection_avatar_stack.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_connection_status/voice_connection_details_popout.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_connection_status/voice_connection_local_controls.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_connection_status/voice_signal_strength_icon.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_connection_stats_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_noise_filter_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_processing_profile.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceConnectionStatus extends ConsumerWidget {
  const VoiceConnectionStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    if (voice.connectFailed) {
      return const _FailedVoiceConnectionStatus();
    }
    if (!voice.isInVoice || voice.channelId == null) {
      return const SizedBox.shrink();
    }
    return _ResolvedVoiceConnectionStatus(voice: voice);
  }
}

class _FailedVoiceConnectionStatus extends ConsumerWidget {
  const _FailedVoiceConnectionStatus();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4, vertical: layout.s2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                foregroundColor: context.colors.statusDanger,
              ),
              onPressed: () {
                unawaited(
                  ref
                      .read(voiceSessionProvider.notifier)
                      .retryFailedVoiceConnection(),
                );
              },
              child: Text(
                l10n.voiceConnectionFailed,
                style: context.textStyles.categoryName.copyWith(
                  height: 18 / 14,
                  color: context.colors.statusDanger,
                ),
              ),
            ),
          ),
          UserPanelControlButton(
            icon: const PhosphorIcon(PhosphorIconsBold.arrowClockwise),
            tooltip: l10n.voiceConnectionRetry,
            onPressed: () {
              unawaited(
                ref
                    .read(voiceSessionProvider.notifier)
                    .retryFailedVoiceConnection(),
              );
            },
          ),
          SizedBox(width: layout.s2),
          UserPanelControlButton(
            icon: const PhosphorIcon(PhosphorIconsBold.x),
            tooltip: l10n.voiceConnectionDismiss,
            onPressed: () {
              ref
                  .read(voiceSessionProvider.notifier)
                  .dismissFailedVoiceConnection();
            },
          ),
        ],
      ),
    );
  }
}

class _ResolvedVoiceConnectionStatus extends ConsumerWidget {
  const _ResolvedVoiceConnectionStatus({required this.voice});

  final VoiceSessionState voice;

  bool get _isGuildVoice => voice.guildId != null && voice.guildId!.isNotEmpty;

  String _guildChannelKey() {
    if (_isGuildVoice) {
      return voiceChannelParticipantsFamilyKey(
        voice.guildId!,
        voice.channelId!,
      );
    }
    return voiceDmChannelParticipantsFamilyKey(voice.channelId!);
  }

  void _navigateToChannel(BuildContext context) {
    final String? channelId = voice.channelId;
    if (channelId == null || channelId.isEmpty) {
      return;
    }
    if (_isGuildVoice) {
      final String? guildId = voice.guildId;
      if (guildId == null || guildId.isEmpty) {
        return;
      }
      navigateToContent(context, RoutePaths.guildChannel(guildId, channelId));
      return;
    }
    unawaited(context.push(RoutePaths.dmChannelCall(channelId)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final VoiceSettingsState settings = ref.watch(voiceSettingsProvider);
    final VoiceConnectionStats stats = ref.watch(voiceConnectionStatsProvider);
    final VoiceLatencySignalTone tone = voiceLatencySignalTone(
      latencyMs: stats.currentLatencyMs,
      history: stats.latencyHistory,
    );
    final String? connectionId = voice.activeConnectionId;
    final VoiceState? selfVs = connectionId == null
        ? null
        : ref.watch(voiceStateForConnectionProvider(connectionId));

    final String channelLabel;
    final String guildLabel;
    if (_isGuildVoice) {
      final ChannelListState channelState = ref.watch(
        channelListViewModelProvider,
      );
      final Channel? channel = voice.channelId == null
          ? null
          : findChannelById(channelState, voice.channelId!);
      channelLabel = channel?.name ?? voice.channelId ?? '';
      final List<Guild> guilds = ref.watch(
        guildListViewModelProvider.select((s) => s.guilds),
      );
      guildLabel =
          guilds.where((Guild g) => g.id == voice.guildId).firstOrNull?.name ??
          '';
    } else {
      final List<DmConversation> conversations = ref.watch(
        dmViewModelProvider.select((s) => s.conversations),
      );
      final DmConversation? dm = voice.channelId == null
          ? null
          : findDmById(conversations, voice.channelId!);
      channelLabel = dm?.displayName ?? voice.channelId ?? '';
      guildLabel = '';
    }

    final String statusText;
    final Color statusColor;
    if (voice.isConnected) {
      statusText = l10n.voiceInChat;
      statusColor = colors.statusOnline;
    } else if (voice.isConnecting || voice.isReconnecting) {
      statusText = l10n.voiceChannelStatusConnecting;
      statusColor = colors.statusIdle;
    } else {
      statusText = l10n.voiceConnectionDisconnected;
      statusColor = colors.statusDanger;
    }

    final bool noiseFilterSupported = ref
        .watch(voiceNoiseFilterProvider)
        .maybeWhen(
          data: (VoiceNoiseFilterState value) => value.isSupported,
          orElse: () => false,
        );
    final ResolvedVoiceProcessing processing = resolveVoiceProcessing(
      settings: settings,
      noiseFilterSupported: noiseFilterSupported,
    );
    final bool processingActive =
        processing.useNoiseFilter || processing.noiseSuppression;

    final bool showAvatars =
        settings.showVoiceConnectionAvatarStack && voice.isConnected;
    final bool showConnectionId =
        settings.showVoiceConnectionId && connectionId != null;

    final String channelSourceLabel = _isGuildVoice
        ? '$channelLabel / $guildLabel'
        : channelLabel;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4, vertical: layout.s2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              if (voice.isConnected) ...<Widget>[
                Tooltip(
                  message: stats.currentLatencyMs == null
                      ? l10n.voiceMeasuringLatency
                      : l10n.voicePingMs(stats.currentLatencyMs!),
                  child: VoiceSignalStrengthIcon(
                    latencyMs: stats.currentLatencyMs,
                    tone: tone,
                  ),
                ),
                SizedBox(width: layout.s2),
              ],
              Expanded(
                child: FluxerPopout(
                  position: FluxerPopoutPosition.above,
                  anchorBuilder: (BuildContext context, VoidCallback toggle) {
                    return FluxerGestureDetector(
                      onLongPressStart: (LongPressStartDetails details) {
                        unawaited(
                          _showDisplayOptions(
                            context,
                            ref,
                            details.globalPosition,
                          ),
                        );
                      },
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft,
                          foregroundColor: statusColor,
                        ),
                        onPressed: toggle,
                        child: Text(
                          statusText,
                          style: context.textStyles.categoryName.copyWith(
                            height: 18 / 14,
                            color: statusColor,
                          ),
                        ),
                      ),
                    );
                  },
                  contentBuilder: (BuildContext context, VoidCallback close) {
                    return VoiceConnectionDetailsPopout(onClose: close);
                  },
                ),
              ),
              UserPanelControlButton(
                icon: const PhosphorIcon(PhosphorIconsFill.waveform),
                isSelected: processingActive,
                tooltip: l10n.voiceAudioProcessing,
                onPressed: () {
                  unawaited(showVoiceAudioProcessingModal(context));
                },
              ),
              SizedBox(width: layout.s2),
              UserPanelControlButton(
                icon: const PhosphorIcon(PhosphorIconsFill.phoneX),
                tooltip: l10n.voiceControlDisconnect,
                onPressed: () {
                  unawaited(
                    ref.read(voiceSessionProvider.notifier).leaveVoice(),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: layout.s3),
          Tooltip(
            message: l10n.voiceJumpToChannel(channelSourceLabel),
            child: InkWell(
              onTap: () => _navigateToChannel(context),
              child: Text.rich(
                TextSpan(
                  style: context.textStyles.timestamp.copyWith(
                    color: colors.textSecondary,
                    height: 16 / 12,
                  ),
                  children: _isGuildVoice
                      ? <InlineSpan>[
                          TextSpan(text: channelLabel),
                          const TextSpan(text: ' / '),
                          TextSpan(text: guildLabel),
                        ]
                      : <InlineSpan>[TextSpan(text: channelLabel)],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          if (showConnectionId) ...<Widget>[
            SizedBox(height: layout.s2),
            Row(
              children: <Widget>[
                PhosphorIcon(
                  (selfVs?.isMobile ?? false)
                      ? PhosphorIconsRegular.deviceMobile
                      : PhosphorIconsRegular.desktop,
                  size: 16,
                  color: colors.textTertiary,
                ),
                SizedBox(width: layout.s2),
                Expanded(
                  child: Tooltip(
                    message: connectionId,
                    child: Text(
                      connectionId,
                      style: context.textStyles.timestamp.copyWith(
                        color: colors.textSecondary,
                        height: 16 / 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
          if (showAvatars) ...<Widget>[
            SizedBox(height: layout.s2),
            VoiceConnectionAvatarStack(guildChannelKey: _guildChannelKey()),
          ],
          const VoiceConnectionLocalControls(),
        ],
      ),
    );
  }

  Future<void> _showDisplayOptions(
    BuildContext context,
    WidgetRef ref,
    Offset position,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceSettingsState settings = ref.read(voiceSettingsProvider);
    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) {
        return <Widget>[
          FluxerMenuRadioItem(
            label: l10n.voiceShowCallAvatars,
            isSelected: settings.showVoiceConnectionAvatarStack,
            onPressed: () {
              close();
              unawaited(
                ref
                    .read(voiceSettingsProvider.notifier)
                    .setShowVoiceConnectionAvatarStack(
                      value: !settings.showVoiceConnectionAvatarStack,
                    ),
              );
            },
          ),
          FluxerMenuRadioItem(
            label: l10n.voiceShowConnectionId,
            isSelected: settings.showVoiceConnectionId,
            onPressed: () {
              close();
              unawaited(
                ref
                    .read(voiceSettingsProvider.notifier)
                    .setShowVoiceConnectionId(
                      value: !settings.showVoiceConnectionId,
                    ),
              );
            },
          ),
        ];
      },
    );
  }
}
