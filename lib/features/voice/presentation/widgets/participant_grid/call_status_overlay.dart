import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/call_status_pill.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_join_empty_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceCallStatusOverlay extends ConsumerWidget {
  const VoiceCallStatusOverlay({
    required this.channelId,
    this.guildId,
    super.key,
  });

  final String channelId;
  final String? guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (bool connecting, bool reconnecting, String? joinError) = ref.watch(
      voiceSessionProvider.select((VoiceSessionState session) {
        final bool here = session.isInCall(
          channelId: channelId,
          guildId: guildId,
        );
        return (
          here && session.isConnecting,
          here && session.isReconnecting,
          here ? session.errorMessage : null,
        );
      }),
    );
    if (!connecting && !reconnecting && joinError == null) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            context.layout.s3,
            context.layout.s3,
            context.layout.s3,
            0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: context.layout.s2,
            children: <Widget>[
              if (reconnecting || connecting)
                VoiceCallStatusPill(
                  label: reconnecting
                      ? l10n.gatewayReconnectingToast
                      : l10n.voiceChannelStatusConnecting,
                ),
              if (joinError != null) VoiceJoinErrorBanner(message: joinError),
            ],
          ),
        ),
      ),
    );
  }
}
