import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/input/providers/keyboard_mode_provider.dart';
import 'package:fluxer_app/features/ui/focus_ring/fluxer_focus_ring_painter.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerFocusRing extends StatelessWidget {
  const FluxerFocusRing({
    required this.focused,
    required this.child,
    this.borderRadius,
    this.outset = 0,
    super.key,
  });

  final bool focused;
  final Widget child;
  final BorderRadius? borderRadius;
  final double outset;

  static bool _hasProviderScope(BuildContext context) {
    try {
      ProviderScope.containerOf(context, listen: false);
      return true;
    } on Object {
      return false;
    }
  }

  Widget _buildRing(
    BuildContext context, {
    required bool keyboardMode,
    required Widget child,
  }) {
    return CustomPaint(
      foregroundPainter: FluxerFocusRingPainter(
        color: context.colors.focusPrimary,
        borderRadius: borderRadius ?? context.layout.radiusSm,
        visible: focused && keyboardMode,
        outset: outset,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasProviderScope(context)) {
      return _buildRing(context, keyboardMode: false, child: child);
    }
    return Consumer(
      child: child,
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          _buildRing(
            context,
            keyboardMode: focused && ref.watch(keyboardModeProvider),
            child: child!,
          ),
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
