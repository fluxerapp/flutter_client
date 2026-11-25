import 'dart:math' as math;

import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_tile_keys.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_placed_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_compact_layout.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/material_ui.dart';

typedef _PlacedTile = ({VoiceGridTile tile, Rect rect});

class VoiceTouchCompactGrid extends StatefulWidget {
  const VoiceTouchCompactGrid({
    required this.size,
    required this.layout,
    required this.tiles,
    required this.tileKeys,
    required this.cardBuilder,
    super.key,
  });

  final Size size;
  final VoiceGridCompactLayout layout;
  final List<VoiceGridTile> tiles;
  final VoiceGridTileKeys tileKeys;
  final VoiceGridCardBuilder cardBuilder;

  @override
  State<VoiceTouchCompactGrid> createState() => _VoiceTouchCompactGridState();
}

class _VoiceTouchCompactGridState extends State<VoiceTouchCompactGrid> {
  static const double _kScrollTolerance = 0.5;

  Map<String, _PlacedTile> _placed = <String, _PlacedTile>{};
  final Map<String, _PlacedTile> _departing = <String, _PlacedTile>{};

  @override
  void initState() {
    super.initState();
    _placeTiles();
  }

  @override
  void didUpdateWidget(VoiceTouchCompactGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    _placeTiles();
  }

  void _placeTiles() {
    final List<Rect> rects = widget.layout.rects;
    final Map<String, _PlacedTile> next = <String, _PlacedTile>{
      for (int i = 0; i < math.min(widget.tiles.length, rects.length); i++)
        widget.tiles[i].tileId: (tile: widget.tiles[i], rect: rects[i]),
    };
    if (rects.length == widget.tiles.length) {
      _departing
        ..addAll(_placed)
        ..removeWhere((String tileId, _) => next.containsKey(tileId));
    }
    _placed = next;
  }

  void _finishDeparting(String tileId) {
    if (!mounted || !_departing.containsKey(tileId)) {
      return;
    }
    setState(() {
      _departing.remove(tileId);
      widget.tileKeys.release(tileId);
    });
  }

  Widget _tile(_PlacedTile placed, {bool departing = false}) {
    final String tileId = placed.tile.tileId;
    return VoiceTouchPlacedTile(
      key: widget.tileKeys.of(tileId),
      rect: placed.rect,
      departing: departing,
      onDeparted: () => _finishDeparting(tileId),
      child: widget.cardBuilder(
        placed.tile,
        VoiceGridCardSlot(size: placed.rect.size),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = widget.size;
    final Widget stack = Stack(
      children: <Widget>[
        for (final _PlacedTile placed in _placed.values) _tile(placed),
        for (final _PlacedTile placed in _departing.values)
          _tile(placed, departing: true),
      ],
    );
    double extent = math.max(size.height, widget.layout.contentHeight);
    for (final _PlacedTile placed in _departing.values) {
      extent = math.max(extent, placed.rect.bottom);
    }
    if (extent <= size.height + _kScrollTolerance) {
      return SizedBox.fromSize(size: size, child: stack);
    }
    return SingleChildScrollView(
      primary: false,
      physics: const ClampingScrollPhysics(),
      child: SizedBox(width: size.width, height: extent, child: stack),
    );
  }
}
