import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration fluxerToastAnimationDuration = FluxerMotionTheme.panelDuration;

enum FluxerToastVariant { info, success, warning, danger }

class FluxerToastAction {
  const FluxerToastAction({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;
}

class FluxerToast {
  const FluxerToast({
    required this.message,
    this.variant = FluxerToastVariant.info,
    this.duration,
    this.action,
    this.leading,
  });

  final String message;
  final FluxerToastVariant variant;
  final Duration? duration;
  final FluxerToastAction? action;
  final Widget? leading;

  static const Duration minimumDuration = Duration(milliseconds: 1500);

  Duration get displayDuration {
    final Duration resolved =
        duration ??
        switch (variant) {
          FluxerToastVariant.success => const Duration(seconds: 3),
          FluxerToastVariant.danger ||
          FluxerToastVariant.warning => const Duration(seconds: 5),
          FluxerToastVariant.info =>
            action == null ? minimumDuration : const Duration(seconds: 5),
        };
    return resolved < minimumDuration ? minimumDuration : resolved;
  }
}
