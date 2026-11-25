import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/voice/voice_tile_metrics.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_visibility.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_tile_actions.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/hud_stream_status_badge.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/participant_card_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/stream_status_badge.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_aspect_host.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_button.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_controls.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_devices_chip.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_nameplate.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceTouchTileHud extends StatelessWidget {
  const VoiceTouchTileHud({
    required this.data,
    required this.actions,
    super.key,
  });

  final VoiceParticipantCardData data;
  final VoiceGridTileActions actions;

  static const double _kNameplateInset = 8;

  @override
  Widget build(BuildContext context) {
    return VoiceTouchTileAspectHost(
      participant: data.participant,
      enabled:
          data.slot.fillContainer &&
          (data.isScreenShare || data.voice.selfVideo),
      useStreamAspectRatio: data.isFullscreen && data.isScreenShare,
      refreshStats: data.isWatching,
      builder: (BuildContext _, double? aspectRatio) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size size = constraints.biggest;
          final Rect frame = aspectRatio != null && aspectRatio > 0
              ? voiceTileContainContentRect(
                  containerSize: size,
                  contentAspectRatio: aspectRatio,
                )
              : Offset.zero & size;
          return Stack(
            children: <Widget>[
              Positioned.fromRect(
                rect: frame,
                child: _buildHud(
                  context,
                  inset: voiceTileMetricsForSize(frame.size).inset,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHud(BuildContext context, {required double inset}) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        if (data.isScreenShare)
          PositionedDirectional(
            top: inset,
            end: inset,
            child: data.isFullscreen
                ? VoiceHudVisibility(
                    child: VoiceHudStreamStatusBadge(
                      participant: data.participant,
                      collectQuality: data.isWatching,
                    ),
                  )
                : VoiceStreamStatusBadge(
                    participant: data.participant,
                    collectQuality: data.isWatching,
                  ),
          ),
        Positioned.fill(
          child: VoiceHudVisibility(
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                if (data.canStopWatching)
                  PositionedDirectional(
                    top: inset,
                    start: inset,
                    child: VoiceTouchTileButton(
                      tooltip: l10n.voiceStopWatchingCurrentStreamTooltip,
                      icon: PhosphorIconsFill.eyeSlash,
                      label: l10n.voiceStopWatching,
                      onPressed: () => actions.stopWatching(data.tile),
                    ),
                  ),
                if (data.tile.extraDeviceCount > 0)
                  PositionedDirectional(
                    top: inset,
                    start: inset,
                    child: FluxerGestureDetector(
                      onTap: () => actions.toggleDevices(data.tile),
                      child: VoiceTouchTileDevicesChip(
                        count: data.tile.extraDeviceCount,
                      ),
                    ),
                  ),
                PositionedDirectional(
                  start: _kNameplateInset,
                  end: _kNameplateInset + VoiceTouchTileControls.widthFor(data),
                  bottom: _kNameplateInset,
                  child: VoiceTouchTileNameplate(
                    voice: data.voice,
                    display: data.display,
                  ),
                ),
                if (!data.slot.isFilmstrip)
                  PositionedDirectional(
                    end: inset,
                    bottom: inset,
                    child: VoiceTouchTileControls(data: data, actions: actions),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
