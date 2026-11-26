import 'dart:math' as math;

import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_motion.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile_presence.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceTouchPlacedTile extends StatelessWidget {
  const VoiceTouchPlacedTile({
    required this.rect,
    required this.child,
    this.departing = false,
    this.onDeparted,
    super.key,
  });

  final Rect rect;
  final Widget child;
  final bool departing;
  final VoidCallback? onDeparted;

  @override
  Widget build(BuildContext context) {
    final Duration duration = voiceGridMoveDuration(context);
    return AnimatedPositioned(
      duration: duration,
      curve: kVoiceGridMoveCurve,
      left: rect.left,
      top: rect.top,
      width: math.max(rect.width, 0),
      height: math.max(rect.height, 0),
      child: VoiceTouchTilePresence(
        departing: departing,
        duration: duration,
        onDeparted: onDeparted,
        child: RepaintBoundary(child: child),
      ),
    );
  }
}
