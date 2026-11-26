import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/call_status_overlay.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_call_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_tile_keys.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_compact_grid.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_focus_view.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_paginated_grid.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_pinned_grid.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_stack.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_fullscreen_provider.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/call_grid_stage_insets.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/call_visual_layout.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_compact_layout.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_memo.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_metrics.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_resolver.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_main_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile_rects.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_fullscreen.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceTouchLayout extends ConsumerStatefulWidget {
  const VoiceTouchLayout({
    required this.size,
    required this.tiles,
    required this.layout,
    required this.call,
    required this.cardBuilder,
    required this.onBackgroundTap,
    super.key,
  });

  final Size size;
  final List<VoiceGridTile> tiles;
  final VoiceCallLayoutState layout;
  final VoiceGridCallData call;
  final VoiceGridCardBuilder cardBuilder;
  final VoidCallback onBackgroundTap;

  @override
  ConsumerState<VoiceTouchLayout> createState() => _VoiceTouchLayoutState();
}

class _VoiceTouchLayoutState extends ConsumerState<VoiceTouchLayout> {
  static const double _kCompactWidth = 520;
  static const double _kCompactHeight = 360;

  final VoiceGridTileKeys _tileKeys = VoiceGridTileKeys();
  final VoiceGridLayoutMemo<(int, Size, bool), VoiceGridPackedLayoutMetrics>
  _packedMemo =
      VoiceGridLayoutMemo<(int, Size, bool), VoiceGridPackedLayoutMetrics>();
  final VoiceGridLayoutMemo<(int, int, Size), VoiceGridCompactLayout>
  _compactMemo =
      VoiceGridLayoutMemo<(int, int, Size), VoiceGridCompactLayout>();

  bool get _focusMode => widget.layout.mode == VoiceCallLayoutMode.focus;

  EdgeInsets _watchStageInsets() {
    final bool expanded = widget.call.screenShareExpanded;
    return voiceCallGridStageInsets(
      context,
      screenShareExpanded: expanded,
      reserveHandheldControls: voiceCallReserveHandheldControls(
        context,
        showsOverlay:
            !expanded &&
            ref.watch(
              voiceCallOverlayProvider.select(
                (VoiceCallOverlayState state) => state.showsOverlay,
              ),
            ),
        screenShareExpanded: expanded,
      ),
    );
  }

  VoiceGridTile? _watchFullscreenTile(VoiceGridTile? pinned) {
    if (!widget.call.screenShareExpanded) {
      return null;
    }
    return fullscreenVoiceGridTile(
      widget.tiles,
      watchedTileIds: widget.call.watchedTileIds,
      currentUserId: widget.call.currentUserId,
      expandedTileId: ref.watch(
        voiceScreenShareFullscreenProvider.select(
          (VoiceScreenShareFullscreenPrefs prefs) => prefs.expandedTileId,
        ),
      ),
      pinnedTileId: pinned?.tileId,
      focusMode: _focusMode,
    );
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets insets = _watchStageInsets();
    final Size stage = Size(
      math.max(0, widget.size.width - insets.horizontal),
      math.max(0, widget.size.height - insets.vertical),
    );
    return SizedBox.fromSize(
      size: widget.size,
      child: FluxerGestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onBackgroundTap,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(padding: insets, child: _buildStage(stage)),
            VoiceCallStatusOverlay(
              channelId: widget.call.channelId,
              guildId: widget.call.guildId,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStage(Size stage) {
    final List<VoiceGridTile> tiles = widget.tiles;
    final bool compact =
        stage.width < _kCompactWidth || stage.height < _kCompactHeight;
    final VoiceGridTile? pinned = tiles.byId(widget.layout.pinnedTileId);
    final VoiceGridTile? fullscreen = _watchFullscreenTile(pinned);
    if (fullscreen != null) {
      return _buildFocus(stage, fullscreen, compact: compact);
    }
    if (compact && !_focusMode && pinned == null) {
      return _buildCompactGrid(stage);
    }
    final VoiceGridPackedLayoutMetrics packed = _packedMemo.resolve(
      (tiles.length, stage, compact),
      () => resolveVoiceGridPackedLayoutMetrics(
        tileCount: tiles.length,
        containerWidth: stage.width,
        containerHeight: stage.height,
        compact: compact,
      ),
    );
    switch (resolveVoiceCallVisualLayout(
      isFocusMode: _focusMode,
      pinnedTileId: pinned?.tileId,
      tileCount: tiles.length,
      visibleTileCount: packed.visibleTileCount,
    )) {
      case VoiceCallVisualLayout.packedGrid:
        return VoiceTouchTileStack(
          size: stage,
          tiles: tiles,
          rects: voiceGridTileRects(metrics: packed.metrics, tiles: tiles),
          tileKeys: _tileKeys,
          cardBuilder: widget.cardBuilder,
        );
      case VoiceCallVisualLayout.paginatedGrid:
        return VoiceTouchPaginatedGrid(
          size: stage,
          tiles: tiles,
          tilesPerPage: packed.visibleTileCount,
          compact: compact,
          tileKeys: _tileKeys,
          cardBuilder: widget.cardBuilder,
        );
      case VoiceCallVisualLayout.pinnedGrid:
        return VoiceTouchPinnedGrid(
          size: stage,
          pinned: pinned!,
          secondary: tiles.without(pinned.tileId),
          compact: compact,
          tileKeys: _tileKeys,
          cardBuilder: widget.cardBuilder,
        );
      case VoiceCallVisualLayout.focus:
        if (tiles.isEmpty) {
          return const SizedBox.expand();
        }
        return _buildFocus(
          stage,
          pinned ??
              autoMainVoiceGridTile(
                tiles,
                watchedTileIds: widget.call.watchedTileIds,
                currentUserId: widget.call.currentUserId,
              ),
          compact: compact,
        );
    }
  }

  Widget _buildCompactGrid(Size stage) {
    final List<VoiceGridTile> cameras = <VoiceGridTile>[];
    final List<VoiceGridTile> shares = <VoiceGridTile>[];
    for (final VoiceGridTile tile in widget.tiles) {
      (tile.isScreenShare ? shares : cameras).add(tile);
    }
    final VoiceGridCompactLayout layout = _compactMemo.resolve(
      (cameras.length, shares.length, stage),
      () => resolveVoiceGridCompactLayout(
        cameraCount: cameras.length,
        screenShareCount: shares.length,
        containerWidth: stage.width,
        containerHeight: stage.height,
      ),
    );
    return VoiceTouchCompactGrid(
      size: stage,
      layout: layout,
      tiles: <VoiceGridTile>[...cameras, ...shares],
      tileKeys: _tileKeys,
      cardBuilder: widget.cardBuilder,
    );
  }

  Widget _buildFocus(Size stage, VoiceGridTile main, {required bool compact}) {
    return VoiceTouchFocusView(
      size: stage,
      main: main,
      secondary: widget.tiles.without(main.tileId),
      compact: compact,
      call: widget.call,
      cardBuilder: widget.cardBuilder,
    );
  }
}
