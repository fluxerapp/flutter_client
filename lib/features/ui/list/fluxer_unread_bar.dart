import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';

enum FluxerUnreadBarEdge { left, right, top, bottom }

/// Small animated indicator that hugs one edge of its parent and optionally
/// bleeds off it. Designed to sit inside a [Stack] with
/// `clipBehavior: Clip.none` so the bleed is visible.
class FluxerUnreadBar extends StatelessWidget {
  const FluxerUnreadBar({
    required this.visible,
    this.edge = FluxerUnreadBarEdge.left,
    this.thickness = 8,
    this.length = 8,
    this.alignment = 0.5,
    this.bleed = 0,
    this.color,
    this.faded = false,
    this.duration,
    super.key,
  });

  /// Whether the indicator is shown. Animates fade/scale in and out.
  final bool visible;

  /// Which edge the indicator hugs.
  final FluxerUnreadBarEdge edge;

  /// Dimension perpendicular to [edge] (width for left/right, height for
  /// top/bottom).
  final double thickness;

  /// Dimension along [edge] (height for left/right, width for top/bottom).
  final double length;

  /// Position along [edge] from 0 (start) to 1 (end). 0.5 = centered.
  final double alignment;

  /// How far the bar overhangs past [edge]. Requires the parent [Stack] to use
  /// `clipBehavior: Clip.none`.
  final double bleed;

  /// Bar color. Defaults to `context.colors.textPrimary`.
  final Color? color;

  /// Apply 0.5 opacity for the muted-with-accessibility-opt-in mode.
  final bool faded;

  final Duration? duration;

  bool get _isHorizontal =>
      edge == FluxerUnreadBarEdge.top || edge == FluxerUnreadBarEdge.bottom;

  Alignment get _alignment {
    final along = alignment * 2 - 1;
    return switch (edge) {
      FluxerUnreadBarEdge.left => Alignment(-1, along),
      FluxerUnreadBarEdge.right => Alignment(1, along),
      FluxerUnreadBarEdge.top => Alignment(along, -1),
      FluxerUnreadBarEdge.bottom => Alignment(along, 1),
    };
  }

  Offset get _bleedOffset {
    return switch (edge) {
      FluxerUnreadBarEdge.left => Offset(-bleed, 0),
      FluxerUnreadBarEdge.right => Offset(bleed, 0),
      FluxerUnreadBarEdge.top => Offset(0, -bleed),
      FluxerUnreadBarEdge.bottom => Offset(0, bleed),
    };
  }

  BorderRadius _borderRadius() {
    final r = Radius.circular(thickness);
    return switch (edge) {
      FluxerUnreadBarEdge.left => BorderRadius.only(
        topRight: r,
        bottomRight: r,
      ),
      FluxerUnreadBarEdge.right => BorderRadius.only(topLeft: r, bottomLeft: r),
      FluxerUnreadBarEdge.top => BorderRadius.only(
        bottomLeft: r,
        bottomRight: r,
      ),
      FluxerUnreadBarEdge.bottom => BorderRadius.only(topLeft: r, topRight: r),
    };
  }

  @override
  Widget build(BuildContext context) {
    final resolvedColor = (color ?? context.colors.textPrimary).withValues(
      alpha: faded ? 0.5 : 1.0,
    );

    final targetLength = visible ? length : 0.0;
    final width = _isHorizontal ? targetLength : thickness;
    final height = _isHorizontal ? thickness : targetLength;

    return ExcludeSemantics(
      child: Positioned.fill(
        child: IgnorePointer(
          child: Align(
            alignment: _alignment,
            child: Transform.translate(
              offset: _bleedOffset,
              child: AnimatedContainer(
                duration: duration ?? context.motion.panel,
                curve: context.motion.curve,
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: resolvedColor,
                  borderRadius: _borderRadius(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Left edge, centered', group: 'FluxerUnreadBar')
Widget fluxerUnreadBarLeftPreview() {
  return const SizedBox(
    width: 240,
    height: 64,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        ColoredBox(color: Color(0xFF1E1E22)),
        FluxerUnreadBar(visible: true, bleed: 4),
      ],
    ),
  );
}

@FluxerWidgetPreview(
  name: 'Left edge, bottom aligned, bleed',
  group: 'FluxerUnreadBar',
)
Widget fluxerUnreadBarLeftBottomPreview() {
  return const SizedBox(
    width: 240,
    height: 64,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        ColoredBox(color: Color(0xFF1E1E22)),
        FluxerUnreadBar(visible: true, alignment: 1, bleed: 4),
      ],
    ),
  );
}

@FluxerWidgetPreview(name: 'Faded', group: 'FluxerUnreadBar')
Widget fluxerUnreadBarFadedPreview() {
  return const SizedBox(
    width: 240,
    height: 64,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        ColoredBox(color: Color(0xFF1E1E22)),
        FluxerUnreadBar(visible: true, faded: true, bleed: 4),
      ],
    ),
  );
}
