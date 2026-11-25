import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_tile_keys.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_placed_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceTouchTileStack extends StatelessWidget {
  const VoiceTouchTileStack({
    required this.size,
    required this.tiles,
    required this.rects,
    required this.tileKeys,
    required this.cardBuilder,
    this.mainTileId,
    super.key,
  });

  final Size size;
  final List<VoiceGridTile> tiles;
  final List<Rect> rects;
  final VoiceGridTileKeys tileKeys;
  final VoiceGridCardBuilder cardBuilder;
  final String? mainTileId;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Stack(
        children: <Widget>[
          for (int i = 0; i < tiles.length; i++)
            VoiceTouchPlacedTile(
              key: tileKeys.of(tiles[i].tileId),
              rect: rects[i],
              child: cardBuilder(
                tiles[i],
                VoiceGridCardSlot(
                  isFocusMain: tiles[i].tileId == mainTileId,
                  size: rects[i].size,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
