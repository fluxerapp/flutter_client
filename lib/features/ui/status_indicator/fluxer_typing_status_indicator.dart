import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_typing_dots.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kDotSizeRatio = 0.25;
const double _kDotGapRatio = 0.12;

Color resolveStatusColor(BuildContext context, String status) {
  final colors = context.colors;
  return switch (status) {
    'online' => colors.statusOnline,
    'idle' => colors.statusIdle,
    'dnd' => colors.statusDnd,
    _ => colors.statusOffline,
  };
}

class FluxerTypingStatusIndicator extends StatelessWidget {
  const FluxerTypingStatusIndicator({
    required this.status,
    required this.width,
    required this.height,
    this.borderColor,
    super.key,
  });

  final String status;
  final double width;
  final double height;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = resolveStatusColor(context, status);
    final Color border = borderColor ?? context.colors.backgroundSecondary;
    final double borderWidth = height * 0.05;
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
            border: Border.all(color: border, width: borderWidth),
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
