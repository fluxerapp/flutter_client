import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/utils/connection/session_navigation.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceDirectConnectionFailedOverlay extends ConsumerWidget {
  const VoiceDirectConnectionFailedOverlay({
    required this.participant,
    required this.display,
    required this.channelId,
    super.key,
  });

  final VoiceMediaParticipant participant;
  final String display;
  final String channelId;

  static const Color _kScrim = Color(0xCC000000);
  static const Color _kMutedText = Color(0xCCFFFFFF);
  static const double _kActionsGap = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool pinned =
        ref.watch(channelByIdProvider(channelId)).value?.rtcP2p ?? false;
    return ListenableBuilder(
      listenable: participant,
      builder: (BuildContext context, Widget? _) {
        if (!participant.directConnectionFailed) {
          return const SizedBox.shrink();
        }
        return ColoredBox(
          color: _kScrim,
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(context.layout.s3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    l10n.voiceP2pPeerFailedTitle(display),
                    textAlign: TextAlign.center,
                    style: context.textStyles.channelName.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: context.layout.s1),
                  Text(
                    l10n.voiceP2pPeerFailedDescription,
                    textAlign: TextAlign.center,
                    style: context.textStyles.timestamp.copyWith(
                      color: _kMutedText,
                    ),
                  ),
                  const SizedBox(height: _kActionsGap),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: context.layout.s2,
                    runSpacing: context.layout.s2,
                    children: <Widget>[
                      FluxerButton.dangerPrimary(
                        size: FluxerButtonSize.compact,
                        fitContent: true,
                        label: l10n.voiceChannelLeave,
                        onPressed: () => unawaited(
                          leaveVoiceFromCallView(context: context, ref: ref),
                        ),
                      ),
                      if (!pinned)
                        FluxerButton.secondary(
                          size: FluxerButtonSize.compact,
                          fitContent: true,
                          label: l10n.voiceP2pSwitchToStandard,
                          onPressed: () => ref
                              .read(voiceSessionProvider.notifier)
                              .switchToStandardCall(),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
