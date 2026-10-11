part of 'guild_navbar.dart';

typedef _DashedGuildIconVisual = ({double fill, double shape, double border});

class _DashedGuildIconVisualTween extends Tween<_DashedGuildIconVisual> {
  _DashedGuildIconVisualTween(_DashedGuildIconVisual value)
    : super(begin: value, end: value);

  @override
  _DashedGuildIconVisual lerp(double t) => (
    fill: begin!.fill + (end!.fill - begin!.fill) * t,
    shape: begin!.shape + (end!.shape - begin!.shape) * t,
    border: begin!.border + (end!.border - begin!.border) * t,
  );
}

class _DashedGuildIcon extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  const _DashedGuildIcon({
    required this.label,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  State<_DashedGuildIcon> createState() => _DashedGuildIconState();
}

class _DashedGuildIconState extends State<_DashedGuildIcon> {
  bool _isHovered = false;
  bool _isPressed = false;

  void _setPressed(bool value) {
    if (_isPressed != value) {
      setState(() => _isPressed = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bool isEngaged = _isHovered || _isPressed;
    final _DashedGuildIconVisual target = (
      fill: widget.isSelected ? 1 : 0,
      shape: widget.isSelected || isEngaged ? 1 : 0,
      border: isEngaged ? 1 : 0,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: GuildNavbarIconShape.itemSpacing / 2,
      ),
      child: Center(
        child: _RightTooltip(
          content: _TooltipLabel(label: widget.label),
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: Semantics(
              button: true,
              selected: widget.isSelected,
              label: widget.label,
              child: FluxerGestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: widget.onTap,
                onTapDown: (_) => _setPressed(true),
                onTapUp: (_) => _setPressed(false),
                onTapCancel: () => _setPressed(false),
                child: TweenAnimationBuilder<_DashedGuildIconVisual>(
                  duration: context.motion.hover,
                  curve: Curves.easeOut,
                  tween: _DashedGuildIconVisualTween(target),
                  builder:
                      (
                        BuildContext context,
                        _DashedGuildIconVisual visual,
                        Widget? _,
                      ) {
                        final double radius =
                            GuildNavbarIconShape.idleRadius +
                            (GuildNavbarIconShape.activeRadius -
                                    GuildNavbarIconShape.idleRadius) *
                                visual.shape;
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: colors.brandPrimary.withValues(
                              alpha: colors.brandPrimary.a * visual.fill,
                            ),
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          child: CustomPaint(
                            foregroundPainter: DashedBorderPainter(
                              shape: DashedBorderShape.roundedRectangle,
                              borderRadius: radius,
                              color: Color.lerp(
                                colors.backgroundModifierAccent,
                                colors.textPrimary,
                                visual.border,
                              )!,
                            ),
                            child: SizedBox.square(
                              dimension: GuildNavbarIconShape.size,
                              child: Center(
                                child: PhosphorIcon(
                                  widget.icon,
                                  color: Color.lerp(
                                    colors.textPrimary,
                                    colors.textOnBrandPrimary,
                                    visual.fill,
                                  ),
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
