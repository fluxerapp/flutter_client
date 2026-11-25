import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_config.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceTouchFilmstrip extends StatelessWidget {
  const VoiceTouchFilmstrip({
    required this.axis,
    required this.crossAxisExtent,
    required this.gridColumns,
    required this.tiles,
    required this.cardBuilder,
    super.key,
  });

  final Axis axis;
  final double crossAxisExtent;
  final int? gridColumns;
  final List<VoiceGridTile> tiles;
  final VoiceGridCardBuilder cardBuilder;

  static const double _kGap = 8;
  static const ScrollCacheExtent _kCacheExtent = ScrollCacheExtent.pixels(0);

  @override
  Widget build(BuildContext context) {
    final int? columns = gridColumns;
    return columns == null ? _buildList() : _buildGrid(columns);
  }

  Widget _buildList() {
    final bool vertical = axis == Axis.vertical;
    return SizedBox(
      width: vertical ? crossAxisExtent : null,
      height: vertical ? null : crossAxisExtent,
      child: ListView.separated(
        scrollCacheExtent: _kCacheExtent,
        addAutomaticKeepAlives: false,
        scrollDirection: axis,
        padding: vertical
            ? const EdgeInsets.symmetric(vertical: voiceGridEdgePaddingPx)
            : const EdgeInsets.symmetric(horizontal: voiceGridEdgePaddingPx),
        itemCount: tiles.length,
        separatorBuilder: (BuildContext _, int _) =>
            const SizedBox.square(dimension: _kGap),
        itemBuilder: (BuildContext _, int index) => AspectRatio(
          aspectRatio: voiceGridTileAspectRatio,
          child: _tile(tiles[index]),
        ),
      ),
    );
  }

  Widget _buildGrid(int columns) {
    return GridView.builder(
      shrinkWrap: true,
      scrollCacheExtent: _kCacheExtent,
      addAutomaticKeepAlives: false,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: voiceGridEdgePaddingPx),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: _kGap,
        mainAxisSpacing: _kGap,
        childAspectRatio: voiceGridTileAspectRatio,
      ),
      itemCount: tiles.length,
      itemBuilder: (BuildContext _, int index) => _tile(tiles[index]),
    );
  }

  Widget _tile(VoiceGridTile tile) {
    return KeyedSubtree(
      key: ValueKey<String>(tile.tileId),
      child: RepaintBoundary(
        child: cardBuilder(tile, const VoiceGridCardSlot.filmstrip()),
      ),
    );
  }
}
