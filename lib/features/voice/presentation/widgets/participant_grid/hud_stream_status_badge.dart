import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/stream_status_badge.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceHudStreamStatusBadge extends ConsumerWidget {
  const VoiceHudStreamStatusBadge({
    required this.participant,
    required this.collectQuality,
    super.key,
  });

  final VoiceMediaParticipant? participant;
  final bool collectQuality;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VoiceStreamStatusBadge(
      participant: participant,
      collectQuality: collectQuality,
      pollStats: ref.watch(
        voiceCallOverlayProvider.select(
          (VoiceCallOverlayState state) => state.showsOverlay,
        ),
      ),
    );
  }
}
