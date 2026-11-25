import 'dart:math' as math;

import 'package:fluxer_app/features/voice/domain/desktop_tile_presentation.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_focus_view.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_grid_view.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/desktop_stage_insets.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/call_status_overlay.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_call_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_motion.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_tile_keys.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/call_grid_stage_insets.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_desktop_layout.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_memo.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_main_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceDesktopLayout extends StatefulWidget {
  const VoiceDesktopLayout({
    required this.size,
    required this.compact,
    required this.tiles,
    required this.layout,
    required this.call,
    required this.cardBuilder,
    super.key,
  });

  final Size size;
  final bool compact;
  final List<VoiceGridTile> tiles;
  final VoiceCallLayoutState layout;
  final VoiceGridCallData call;
  final VoiceGridCardBuilder cardBuilder;

  @override
  State<VoiceDesktopLayout> createState() => _VoiceDesktopLayoutState();
}

class _VoiceDesktopLayoutState extends State<VoiceDesktopLayout> {
  final VoiceGridTileKeys _tileKeys = VoiceGridTileKeys();
  final VoiceGridLayoutMemo<(int, Size, bool), VoiceGridDesktopLayout> _memo =
      VoiceGridLayoutMemo<(int, Size, bool), VoiceGridDesktopLayout>();

  VoiceGridDesktopLayout _resolveGrid(Size container) {
    final int tileCount = widget.tiles.length;
    return _memo.resolve(
      (tileCount, container, widget.compact),
      () => resolveVoiceGridDesktopLayout(
        tileCount: tileCount,
        container: container,
        compact: widget.compact,
      ),
    );
  }

  VoiceGridTile? _mainTile(VoiceGridDesktopLayout grid) {
    final List<VoiceGridTile> tiles = widget.tiles;
    if (tiles.isEmpty) {
      return null;
    }
    final VoiceGridTile? pinned = tiles.byId(widget.layout.pinnedTileId);
    if (pinned != null) {
      return pinned;
    }
    if (widget.layout.mode == VoiceCallLayoutMode.focus ||
        grid.visibleTileCount < tiles.length) {
      return autoMainVoiceGridTile(
        tiles,
        watchedTileIds: widget.call.watchedTileIds,
        currentUserId: widget.call.currentUserId,
      );
    }
    return null;
  }

  Widget _card(
    VoiceGridTile tile,
    VoiceDesktopTilePresentation presentation, {
    Size size = Size.zero,
  }) {
    return KeyedSubtree(
      key: _tileKeys.of(tile.tileId),
      child: RepaintBoundary(
        child: widget.cardBuilder(
          tile,
          VoiceGridCardSlot.desktop(presentation, size: size),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ({double header, double footer}) hud = VoiceDesktopStageInsets.of(
      context,
    );
    final EdgeInsets systemInsets = voiceStageSystemInsets(context);
    final Size stage = Size(
      math.max(0, widget.size.width - systemInsets.horizontal),
      math.max(0, widget.size.height - systemInsets.vertical),
    );
    return SizedBox.fromSize(
      size: widget.size,
      child: Padding(
        padding: systemInsets,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _buildContent(stage, hud),
            Padding(
              padding: EdgeInsets.only(top: hud.header),
              child: VoiceCallStatusOverlay(
                channelId: widget.call.channelId,
                guildId: widget.call.guildId,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(Size stage, ({double header, double footer}) hud) {
    final List<VoiceGridTile> tiles = widget.tiles;
    final ({double top, double bottom}) padding = voiceGridDesktopStagePadding(
      containerHeight: stage.height,
      compact: widget.compact,
    );
    final double gridTop = hud.header + padding.top;
    final VoiceGridDesktopLayout grid = _resolveGrid(
      Size(
        stage.width,
        math.max(0, stage.height - gridTop - padding.bottom - hud.footer),
      ),
    );
    final VoiceGridTile? main = _mainTile(grid);
    if (main == null) {
      return VoiceDesktopGridView(
        layout: grid,
        top: gridTop,
        tileIds: <String>[for (final VoiceGridTile tile in tiles) tile.tileId],
        moveDuration: voiceGridMoveDuration(context),
        moveCurve: kVoiceGridMoveCurve,
        tileBuilder: (BuildContext _, int index) => _card(
          tiles[index],
          VoiceDesktopTilePresentation.grid,
          size: grid.tileSize,
        ),
      );
    }
    final List<VoiceGridTile> members = tiles.without(main.tileId);
    return VoiceDesktopFocusView(
      size: stage,
      headerHeight: hud.header,
      footerHeight: hud.footer,
      compact: widget.compact,
      main: _card(main, VoiceDesktopTilePresentation.focusMain),
      memberCount: members.length,
      memberBuilder: (BuildContext _, int index) =>
          _card(members[index], VoiceDesktopTilePresentation.focusSecondary),
    );
  }
}
