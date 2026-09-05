part of 'guild_navbar.dart';

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

class _DashedGuildIconState extends State<_DashedGuildIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _radiusAnim;
  late Animation<Color?> _colorAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.hoverDuration,
    );
    _radiusAnim = Tween<double>(
      begin: 22,
      end: 13,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.duration = context.motion.hover;
    _colorAnim = ColorTween(
      begin: context.colors.interactiveMuted,
      end: context.colors.textPrimary,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter() => _controller.forward();

  void _onExit() => _controller.reverse();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      children: [
        const SizedBox(width: 12),
        _RightTooltip(
          content: _TooltipLabel(label: widget.label),
          child: MouseRegion(
            onEnter: (_) => _onEnter(),
            onExit: (_) => _onExit(),
            child: Semantics(
              button: true,
              selected: widget.isSelected,
              label: widget.label,
              child: FluxerGestureDetector(
                onTap: widget.onTap,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    final Color activeColor = widget.isSelected
                        ? context.colors.brandPrimary
                        : (_colorAnim.value ?? context.colors.interactiveMuted);
                    return SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: SizedBox(
                          width: 44,
                          height: 44,
                          child: CustomPaint(
                            painter: DashedBorderPainter(
                              shape: DashedBorderShape.roundedRectangle,
                              borderRadius: widget.isSelected
                                  ? 13
                                  : _radiusAnim.value,
                              color: activeColor,
                              isSolid: widget.isSelected,
                            ),
                            child: Center(
                              child: PhosphorIcon(
                                widget.icon,
                                color: activeColor,
                                size: 20,
                              ),
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
      ],
    ),
  );
}
