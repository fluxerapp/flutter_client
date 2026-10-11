import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_typing_dots.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kDotSizeRatio = 0.25;
const double _kDotGapRatio = 0.12;

class FluxerTypingStatusIndicator extends StatelessWidget {
  const FluxerTypingStatusIndicator({
    required this.status,
    required this.width,
    required this.height,
    this.color,
    super.key,
  });

  final String status;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = color ?? resolveStatusColor(context, status);
    final double dotSize = height * _kDotSizeRatio;
    final double dotSpacing = height * _kDotGapRatio;

    return ExcludeSemantics(
      child: SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
          child: Center(
            child: FluxerTypingDots(
              color: Colors.white,
              dotSize: dotSize,
              dotSpacing: dotSpacing,
            ),
          ),
        ),
      ),
    );
  }
}

@FluxerWidgetPreview(
  name: 'Online typing',
  group: 'FluxerTypingStatusIndicator',
)
Widget fluxerTypingStatusOnlinePreview() {
  return const FluxerTypingStatusIndicator(
    status: 'online',
    width: 22,
    height: 12,
  );
}

@FluxerWidgetPreview(name: 'Idle typing', group: 'FluxerTypingStatusIndicator')
Widget fluxerTypingStatusIdlePreview() {
  return const FluxerTypingStatusIndicator(
    status: 'idle',
    width: 22,
    height: 12,
  );
}
