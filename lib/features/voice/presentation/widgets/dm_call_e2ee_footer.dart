import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_e2ee_indicator.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_e2ee_display.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';

/// Pre-join E2EE status for an ongoing DM/GDM call, matching desktop placement
/// in the compact call control footer when not in the call.
class DmCallE2eeFooter extends ConsumerWidget {
  const DmCallE2eeFooter({required this.channelId, super.key});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isInVoiceOnChannel = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) =>
            s.isInVoice &&
            s.channelId == channelId &&
            (s.guildId == null || s.guildId!.isEmpty),
      ),
    );
    final List<VoiceState> voiceStates = ref.watch(
      voiceStatesInPrivateChannelProvider(channelId),
    );
    if (!hasDmOngoingCallNotJoined(
      voiceStates: {for (final vs in voiceStates) vs.userId: vs},
      channelId: channelId,
      isInVoiceOnChannel: isInVoiceOnChannel,
    )) {
      return const SizedBox.shrink();
    }
    return ColoredBox(
      color: context.colors.backgroundSecondary,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.layout.s3,
          context.layout.s2,
          context.layout.s3,
          context.layout.s3,
        ),
        child: Center(
          child: VoiceE2eeIndicator(
            guildId: null,
            channelId: channelId,
            variant: VoiceE2eeIndicatorVariant.call,
          ),
        ),
      ),
    );
  }
}
