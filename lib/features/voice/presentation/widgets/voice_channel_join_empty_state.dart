import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_join_button.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_e2ee_indicator.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_join_empty_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_e2ee_status_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_join_eligibility_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/channel_e2ee_status.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class VoiceChannelJoinEmptyState extends ConsumerWidget {
  const VoiceChannelJoinEmptyState({
    required this.guildId,
    required this.channelId,
    required this.channel,
    super.key,
  });

  final String guildId;
  final String channelId;
  final Channel? channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<VoiceJoinEligibility> joinEligibilityAsync = ref.watch(
      voiceJoinEligibilityProvider(channelId),
    );
    final bool canJoinVoice = joinEligibilityAsync.value?.canJoin ?? true;
    final bool joinInProgress = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) => s.isConnecting && s.channelId == channelId,
      ),
    );
    final String? joinError = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.errorMessage),
    );
    final int? effectivePermissionBits = channel == null
        ? null
        : ref.watch(
            channelPermissionCacheProvider.select((m) => m[channel!.id]),
          );
    final ChannelE2eeStatus e2eeStatus = ref.watch(
      voiceChannelE2eeStatusProvider(
        guildId: guildId,
        channelId: channelId,
        emptyChannelStatus: ChannelE2eeStatus.encrypted,
      ),
    );
    final bool showE2eeIcon =
        channel != null && e2eeStatus == ChannelE2eeStatus.encrypted;
    final String channelName = channel?.name ?? '';

    return VoiceJoinEmptyState(
      childBuilder: (VoiceJoinEmptyLayout layout) => <Widget>[
        VoiceJoinEmptyMark(
          layout: layout,
          child: channel == null
              ? ChannelIcon(
                  type: ChannelType.guildVoice,
                  size: layout.iconSize,
                  color: context.colors.textPrimary,
                )
              : ChannelIcon(
                  type: channel!.type,
                  channel: channel,
                  effectivePermissionBits: effectivePermissionBits,
                  size: layout.iconSize,
                  color: context.colors.textPrimary,
                  e2eeEncrypted: showE2eeIcon,
                ),
        ),
        VoiceJoinEmptyTitle(title: channelName, layout: layout),
        if (joinError != null) VoiceJoinErrorBanner(message: joinError),
        VoiceChannelJoinButton(
          isLoading: joinInProgress,
          disabledTooltip: canJoinVoice
              ? (joinInProgress ? l10n.voiceChannelStatusConnecting : null)
              : l10n.voiceChannelNoConnectPermission,
          onPressed: canJoinVoice && !joinInProgress
              ? () {
                  unawaited(
                    joinVoiceChannelWithConfirmation(
                      ref: ref,
                      context: context,
                      guildId: guildId,
                      channelId: channelId,
                    ),
                  );
                }
              : null,
        ),
        VoiceE2eeIndicator(
          guildId: guildId,
          channelId: channelId,
          variant: VoiceE2eeIndicatorVariant.voiceChannel,
          includeTopPadding: false,
        ),
      ],
    );
  }
}
