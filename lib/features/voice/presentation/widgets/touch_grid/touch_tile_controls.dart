import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_tile_actions.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/participant_card_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_button.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceTouchTileControls extends ConsumerWidget {
  const VoiceTouchTileControls({
    required this.data,
    required this.actions,
    super.key,
  });

  final VoiceParticipantCardData data;
  final VoiceGridTileActions actions;

  static const double _kGap = 8;

  static double widthFor(VoiceParticipantCardData data) {
    if (data.slot.isFilmstrip) {
      return 0;
    }
    return data.tapOpensFullscreen
        ? VoiceTouchTileButton.extent * 2 + _kGap
        : VoiceTouchTileButton.extent;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool pinned = ref.watch(
      voiceCallLayoutProvider.select(
        (VoiceCallLayoutState state) => state.pinnedTileId == data.tile.tileId,
      ),
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: _kGap,
      children: <Widget>[
        VoiceTouchTileButton(
          tooltip: pinned
              ? l10n.voiceParticipantMenuUnfocus
              : l10n.voiceParticipantMenuFocus,
          icon: pinned ? PhosphorIconsFill.pushPin : PhosphorIconsBold.pushPin,
          onPressed: () => actions.togglePin(data.tile),
        ),
        if (data.tapOpensFullscreen)
          VoiceTouchTileButton(
            tooltip: data.isFullscreen
                ? l10n.voiceScreenShareExitFullscreenTooltip
                : l10n.voiceScreenShareEnterFullscreenTooltip,
            icon: data.isFullscreen
                ? Icons.fullscreen_exit_rounded
                : Icons.fullscreen_rounded,
            onPressed: data.isFullscreen
                ? actions.exitFullscreen
                : () => actions.openFullscreen(data.tile, data.slot),
          ),
      ],
    );
  }
}
