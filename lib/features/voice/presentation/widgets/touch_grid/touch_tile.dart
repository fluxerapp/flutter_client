import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/voice/voice_speaking_ring.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_tile_actions.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/participant_card_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_hud.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_watch_overlay.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class VoiceTouchTile extends ConsumerWidget {
  const VoiceTouchTile({
    required this.data,
    required this.actions,
    required this.media,
    required this.surfaceColor,
    this.overlay,
    super.key,
  });

  final VoiceParticipantCardData data;
  final VoiceGridTileActions actions;
  final Widget media;
  final Color surfaceColor;
  final Widget? overlay;

  static const double _kRadius = 12;

  static double radius(VoiceGridCardSlot slot) =>
      slot.edgeToEdge ? 0 : _kRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BorderRadius borderRadius = BorderRadius.circular(radius(data.slot));
    void openMenu(Offset position) => actions.openMenu(data.tile, position);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: FluxerGestureDetector(
          onTap: () => actions.tap(data.tile, data.slot),
          onSecondaryTapUp: (TapUpDetails details) =>
              openMenu(details.globalPosition),
          onLongPressStart: isTouchPrimaryInput(ref)
              ? (LongPressStartDetails details) =>
                    openMenu(details.globalPosition)
              : null,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              media,
              VoiceSpeakingRingLayer(
                enabled: data.speakingRingEnabled,
                identity: data.speakingIdentity,
                aroundAvatar: data.ringAroundAvatar,
              ),
              ?overlay,
              if (data.canWatch && !data.slot.isFilmstrip)
                VoiceTouchTileWatchOverlay(
                  onWatch: () => actions.watch(data.tile, data.slot),
                ),
              VoiceTouchTileHud(data: data, actions: actions),
            ],
          ),
        ),
      ),
    );
  }
}
