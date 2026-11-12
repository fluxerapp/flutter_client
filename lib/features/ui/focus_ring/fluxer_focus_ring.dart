import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class FluxerFocusRing extends StatelessWidget {
  const FluxerFocusRing({
    required this.focused,
    required this.child,
    this.borderRadius,
    super.key,
  });

  final bool focused;
  final Widget child;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final motion = context.motion;
    final resolvedRadius = borderRadius ?? layout.radiusMd;

    if (usesDesktopPointerUi(context)) {
      return AnimatedContainer(
        duration: Duration.zero,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? layout.radiusSm,
          boxShadow: focused
              ? [BoxShadow(color: colors.focusPrimary, spreadRadius: 4)]
              : const [],
        ),
        child: child,
      );
    }

    return AnimatedContainer(
      duration: motion.fast,
      curve: motion.curve,
      decoration: BoxDecoration(
        borderRadius: resolvedRadius,
        boxShadow: focused
            ? [
                BoxShadow(
                  color: colors.focusPrimary.withValues(alpha: 0.45),
                  spreadRadius: 2,
                ),
              ]
            : const [],
      ),
      child: child,
    );
  }
}

@FluxerWidgetPreview(name: 'Unfocused', group: 'FluxerFocusRing')
Widget fluxerFocusRingOffPreview() {
  return FluxerFocusRing(
    focused: false,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: const Text('Focus target'),
    ),
  );
}

@FluxerWidgetPreview(name: 'Focused', group: 'FluxerFocusRing')
Widget fluxerFocusRingOnPreview() {
  return FluxerFocusRing(
    focused: true,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: const Text('Focus target'),
    ),
  );
}
