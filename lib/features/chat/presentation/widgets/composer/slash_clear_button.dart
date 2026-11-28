import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/material_ui.dart';

class ComposerSlashClearButton extends StatelessWidget {
  const ComposerSlashClearButton({
    required this.tooltip,
    required this.onPressed,
    super.key,
  });

  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null;
    return FluxerTooltip(
      message: tooltip,
      child: FluxerTappable(
        onTap: onPressed,
        enabled: enabled,
        semanticLabel: tooltip,
        excludeChildSemantics: true,
        focusRingRadius: BorderRadius.circular(
          WideComposerLayout.mouseButtonRadius,
        ),
        builder: (BuildContext context, Set<WidgetState> states) {
          final bool hovered = enabled && states.contains(WidgetState.hovered);
          return AnimatedContainer(
            duration: context.motion.fast,
            curve: Curves.ease,
            width: WideComposerLayout.actionButtonExtent,
            height: WideComposerLayout.actionButtonExtent,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: hovered
                  ? context.colors.backgroundModifierHover
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(
                WideComposerLayout.mouseButtonRadius,
              ),
            ),
            child: CustomPaint(
              size: const Size.square(WideComposerLayout.mouseButtonIconSize),
              painter: _SlashGlyphPainter(
                color: hovered
                    ? context.colors.textPrimary
                    : context.colors.textPrimaryMuted,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SlashGlyphPainter extends CustomPainter {
  const _SlashGlyphPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double unit = size.width / 24;
    final Path square = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(4 * unit, 4 * unit, 16 * unit, 16 * unit),
          Radius.circular(3 * unit),
        ),
      );
    final Path slash = Path()
      ..moveTo(14.05 * unit, 6.75 * unit)
      ..lineTo(15.95 * unit, 6.75 * unit)
      ..lineTo(9.95 * unit, 17.25 * unit)
      ..lineTo(8.05 * unit, 17.25 * unit)
      ..close();
    canvas.drawPath(
      Path.combine(PathOperation.difference, square, slash),
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(_SlashGlyphPainter oldDelegate) =>
      oldDelegate.color != color;
}
