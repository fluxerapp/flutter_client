import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/nested_horizontal_scrollable.dart';

class PlaybackSeekGestureTarget extends StatelessWidget {
  const PlaybackSeekGestureTarget({
    required this.child,
    required this.onSeekFraction,
    this.enabled = true,
    super.key,
  });

  final Widget child;
  final ValueChanged<double> onSeekFraction;
  final bool enabled;

  void _seekFromLocalDx(double localDx, double width) {
    if (!enabled || width <= 0) {
      return;
    }
    onSeekFraction(localDx / width);
  }

  @override
  Widget build(BuildContext context) {
    final double touchTargetHeight = context.layout.touchTargetMin;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        return SizedBox(
          key: enabled ? kPlaybackSeekShellGestureBlockKey : null,
          height: touchTargetHeight,
          child: enabled
              ? FluxerGestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (TapDownDetails details) {
                    _seekFromLocalDx(details.localPosition.dx, width);
                  },
                  onHorizontalDragStart: (DragStartDetails details) {
                    _seekFromLocalDx(details.localPosition.dx, width);
                  },
                  onHorizontalDragUpdate: (DragUpdateDetails details) {
                    _seekFromLocalDx(details.localPosition.dx, width);
                  },
                  child: Center(child: child),
                )
              : Center(child: child),
        );
      },
    );
  }
}
