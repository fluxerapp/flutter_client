import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';

const Duration fluxerToastAnimationDuration = FluxerMotionTheme.panelDuration;

enum FluxerToastVariant { info, success, warning, danger }

class FluxerToast {
  const FluxerToast({
    required this.message,
    this.variant = FluxerToastVariant.info,
    this.duration = const Duration(seconds: 4),
  });

  final String message;
  final FluxerToastVariant variant;
  final Duration duration;
}
