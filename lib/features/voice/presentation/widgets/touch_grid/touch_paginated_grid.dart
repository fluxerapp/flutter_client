import 'dart:math' as math;

import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_tile_keys.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_page_dots.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_stack.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_resolver.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile_rects.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/hangout_layout.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceTouchPaginatedGrid extends StatefulWidget {
  const VoiceTouchPaginatedGrid({
    required this.size,
    required this.tiles,
    required this.tilesPerPage,
    required this.compact,
    required this.tileKeys,
    required this.cardBuilder,
    super.key,
  });

  final Size size;
  final List<VoiceGridTile> tiles;
  final int tilesPerPage;
  final bool compact;
  final VoiceGridTileKeys tileKeys;
  final VoiceGridCardBuilder cardBuilder;

  @override
  State<VoiceTouchPaginatedGrid> createState() =>
      _VoiceTouchPaginatedGridState();
}

class _VoiceTouchPaginatedGridState extends State<VoiceTouchPaginatedGrid> {
  static const double _kDotsHeight = 24;

  final PageController _controller = PageController();
  final ValueNotifier<int> _page = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onPageChanged)
      ..dispose();
    _page.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final int? page = _controller.page?.round();
    if (page != null) {
      _page.value = page;
    }
  }

  void _clampPage(int pageCount) {
    if (pageCount <= 0 || _page.value < pageCount) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _page.value = pageCount - 1;
      if (_controller.hasClients) {
        _controller.jumpToPage(pageCount - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<List<VoiceGridTile>> pages = voiceGridPaginateTiles(
      tiles: widget.tiles,
      tilesPerPage: math.max(1, widget.tilesPerPage),
    );
    _clampPage(pages.length);
    final Size pageSize = Size(
      widget.size.width,
      widget.size.height - _kDotsHeight,
    );
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            itemBuilder: (BuildContext _, int index) => VoiceTouchTileStack(
              key: ValueKey<int>(index),
              size: pageSize,
              tiles: pages[index],
              rects: voiceGridTileRects(
                metrics: resolveVoiceGridPackedLayoutMetrics(
                  tileCount: pages[index].length,
                  containerWidth: pageSize.width,
                  containerHeight: pageSize.height,
                  compact: widget.compact,
                ).metrics,
                tiles: pages[index],
              ),
              tileKeys: widget.tileKeys,
              cardBuilder: widget.cardBuilder,
            ),
          ),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _page,
          builder: (BuildContext _, int page, Widget? _) =>
              VoiceTouchPageDots(pageCount: pages.length, currentPage: page),
        ),
      ],
    );
  }
}
