import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_call_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_filmstrip.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/focus_layout_metrics.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_config.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/media/watched_video_tile.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceTouchFocusView extends StatelessWidget {
  const VoiceTouchFocusView({
    required this.size,
    required this.main,
    required this.secondary,
    required this.compact,
    required this.call,
    required this.cardBuilder,
    super.key,
  });

  final Size size;
  final VoiceGridTile main;
  final List<VoiceGridTile> secondary;
  final bool compact;
  final VoiceGridCallData call;
  final VoiceGridCardBuilder cardBuilder;

  static const double _kFilmstripGap = 10;

  bool get _landscape => size.width > size.height;

  @override
  Widget build(BuildContext context) {
    final bool showsVideo = voiceFocusMainSupportsVideoFullscreen(
      source: main.source,
      voice: main.data.voice,
      isWatching: call.isWatching(main),
    );
    if (showsVideo && call.screenShareExpanded) {
      return SizedBox.fromSize(
        size: size,
        child: cardBuilder(
          main,
          VoiceGridCardSlot(isFocusMain: true, edgeToEdge: true, size: size),
        ),
      );
    }
    final Widget stage = _buildStage();
    if (showsVideo) {
      return SizedBox.fromSize(
        size: size,
        child: secondary.isEmpty ? stage : _overlayFilmstrip(stage),
      );
    }
    return Flex(
      direction: _landscape ? Axis.horizontal : Axis.vertical,
      spacing: _kFilmstripGap,
      children: <Widget>[
        Expanded(child: stage),
        if (secondary.isNotEmpty)
          Padding(
            padding: _landscape
                ? const EdgeInsetsDirectional.only(end: voiceGridEdgePaddingPx)
                : const EdgeInsets.only(bottom: voiceGridEdgePaddingPx),
            child: _buildFilmstrip(),
          ),
      ],
    );
  }

  Widget _buildStage() {
    final bool hasSecondary = secondary.isNotEmpty;
    final double sidePadding = main.isScreenShare && !_landscape
        ? 0
        : voiceGridEdgePaddingPx;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        sidePadding,
        voiceGridEdgePaddingPx,
        _landscape && hasSecondary ? 0 : sidePadding,
        !_landscape && hasSecondary ? 0 : voiceGridEdgePaddingPx,
      ),
      child: Center(
        child: AspectRatio(
          aspectRatio: voiceGridTileAspectRatio,
          child: RepaintBoundary(
            child: cardBuilder(
              main,
              VoiceGridCardSlot(
                isFocusMain: true,
                edgeToEdge: sidePadding == 0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _overlayFilmstrip(Widget stage) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: stage),
        if (_landscape)
          PositionedDirectional(
            top: voiceGridEdgePaddingPx,
            bottom: voiceGridEdgePaddingPx,
            end: voiceGridEdgePaddingPx,
            child: _buildFilmstrip(),
          )
        else
          Positioned(
            left: 0,
            right: 0,
            bottom: voiceGridEdgePaddingPx,
            child: _buildFilmstrip(),
          ),
      ],
    );
  }

  Widget _buildFilmstrip() {
    return VoiceTouchFilmstrip(
      axis: _landscape ? Axis.vertical : Axis.horizontal,
      crossAxisExtent: voiceFocusFilmstripCrossAxis(
        compact: compact,
        landscape: _landscape,
      ),
      gridColumns:
          !_landscape &&
              voiceFocusShouldUseMiniGrid(
                compact: compact,
                containerWidth: size.width,
                secondaryCount: secondary.length,
              )
          ? voiceFocusMiniGridColumnCount(size.width)
          : null,
      tiles: secondary,
      cardBuilder: cardBuilder,
    );
  }
}
