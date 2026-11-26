import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_tile_keys.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_paginated_grid.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_stack.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_resolver.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_pinned_layout.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile_rects.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceTouchPinnedGrid extends StatelessWidget {
  const VoiceTouchPinnedGrid({
    required this.size,
    required this.pinned,
    required this.secondary,
    required this.compact,
    required this.tileKeys,
    required this.cardBuilder,
    super.key,
  });

  final Size size;
  final VoiceGridTile pinned;
  final List<VoiceGridTile> secondary;
  final bool compact;
  final VoiceGridTileKeys tileKeys;
  final VoiceGridCardBuilder cardBuilder;

  @override
  Widget build(BuildContext context) {
    if (secondary.isEmpty) {
      return _stack(
        voiceGridTileRects(
          metrics: resolveVoiceGridPackedLayoutMetrics(
            tileCount: 1,
            containerWidth: size.width,
            containerHeight: size.height,
            compact: compact,
          ).metrics,
          tiles: <VoiceGridTile>[pinned],
        ),
      );
    }
    final VoiceGridPinnedLayout layout = resolveVoiceGridPinnedLayout(
      container: size,
      pinned: pinned,
      secondary: secondary,
      compact: compact,
    );
    final bool paginate =
        layout.visibleTileCount > 0 &&
        layout.visibleTileCount < secondary.length;
    return paginate ? _paginated(layout) : _stack(layout.rects);
  }

  Widget _stack(List<Rect> rects) {
    return VoiceTouchTileStack(
      size: size,
      tiles: <VoiceGridTile>[pinned, ...secondary],
      rects: rects,
      tileKeys: tileKeys,
      cardBuilder: cardBuilder,
      mainTileId: pinned.tileId,
    );
  }

  Widget _paginated(VoiceGridPinnedLayout layout) {
    final Rect pinnedRect = layout.pinnedRect;
    return SizedBox.fromSize(
      size: size,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: size.width,
            height: layout.gridTop,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                pinnedRect.left,
                pinnedRect.top,
                size.width - pinnedRect.right,
                0,
              ),
              child: cardBuilder(
                pinned,
                VoiceGridCardSlot(isFocusMain: true, size: pinnedRect.size),
              ),
            ),
          ),
          Expanded(
            child: VoiceTouchPaginatedGrid(
              size: Size(size.width, layout.gridHeight),
              tiles: secondary,
              tilesPerPage: layout.visibleTileCount,
              compact: compact,
              tileKeys: tileKeys,
              cardBuilder: cardBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
