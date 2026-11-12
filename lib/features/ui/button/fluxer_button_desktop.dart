part of 'fluxer_button.dart';

class _FluxerDesktopIconStyle {
  const _FluxerDesktopIconStyle({
    required this.showTooltip,
    required this.extent,
    required this.borderRadius,
    required this.circle,
    required this.active,
    this.color,
    this.hoverColor,
    this.background,
    this.hoverBackground,
    this.border,
    this.hoverBorder,
    this.shadows,
    this.duration,
  });

  final bool showTooltip;
  final double extent;
  final double borderRadius;
  final bool circle;
  final bool active;
  final Color? color;
  final Color? hoverColor;
  final Color? background;
  final Color? hoverBackground;
  final Color? border;
  final Color? hoverBorder;
  final List<BoxShadow>? shadows;
  final Duration? duration;
}

Widget _buildFluxerDesktopIconButton(
  BuildContext context,
  FluxerButton widget,
  _FluxerDesktopIconStyle style,
) {
  final colors = context.colors;
  final VoidCallback? onPressed = widget.onPressed;
  final String label = widget.semanticLabel!;
  final Duration duration = MediaQuery.disableAnimationsOf(context)
      ? Duration.zero
      : style.duration ?? context.motion.fast;
  final Widget button = FluxerTappable(
    onTap: onPressed,
    enabled: onPressed != null,
    semanticLabel: label,
    excludeChildSemantics: true,
    builder: (BuildContext context, Set<WidgetState> states) {
      final bool hovered =
          style.active ||
          (onPressed != null &&
              (states.contains(WidgetState.hovered) ||
                  states.contains(WidgetState.focused)));
      final Color? borderColor = hovered
          ? style.hoverBorder ?? style.border
          : style.border;
      return AnimatedContainer(
        duration: duration,
        curve: Curves.ease,
        width: style.extent,
        height: style.extent,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: hovered
              ? style.hoverBackground ?? colors.backgroundModifierHover
              : style.background ?? Colors.transparent,
          shape: style.circle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: style.circle
              ? null
              : BorderRadius.circular(style.borderRadius),
          border: borderColor == null ? null : Border.all(color: borderColor),
          boxShadow: style.shadows,
        ),
        child: PhosphorIcon(
          widget.icon!,
          size: widget._iconSizeOverride,
          color: hovered
              ? style.hoverColor ?? colors.textPrimary
              : style.color ?? colors.textPrimaryMuted,
        ),
      );
    },
  );
  if (!style.showTooltip) {
    return button;
  }
  return FluxerTooltip(message: label, child: button);
}
