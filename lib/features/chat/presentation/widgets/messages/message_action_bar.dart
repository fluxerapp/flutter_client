import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

const double kMessageActionBarItemSize = 28;
const double kMessageActionBarIconSize = 20;
const double kMessageActionBarPadding = 2;
const double kMessageActionBarItemRadius = 6;
const double kMessageActionBarHoverScale = 1.035;
const double kMessageActionBarTopOffset = -24;
const double kMessageActionBarEndInset = 14;

Widget clipMessageActionBarToViewport({
  required BuildContext rowContext,
  required BuildContext overlayContext,
  required Widget child,
}) {
  final RenderObject? viewport = rowContext
      .findAncestorStateOfType<ScrollableState>()
      ?.context
      .findRenderObject();
  final RenderObject? overlay = Overlay.maybeOf(
    overlayContext,
  )?.context.findRenderObject();
  if (viewport is! RenderBox ||
      overlay is! RenderBox ||
      !viewport.hasSize ||
      !viewport.attached) {
    return child;
  }
  final Rect clip = MatrixUtils.transformRect(
    viewport.getTransformTo(overlay),
    Offset.zero & viewport.size,
  );
  return ClipRect(clipper: _FixedRectClipper(clip), child: child);
}

class _FixedRectClipper extends CustomClipper<Rect> {
  const _FixedRectClipper(this.rect);

  final Rect rect;

  @override
  Rect getClip(Size size) => rect;

  @override
  bool shouldReclip(_FixedRectClipper oldClipper) => rect != oldClipper.rect;
}

class MessageActionBar extends StatelessWidget {
  const MessageActionBar({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return DecoratedBox(
      decoration: fluxerDesktopFloatingDecoration(
        context,
        shadows: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.18 : 0.1),
            offset: const Offset(0, 6),
            blurRadius: 14,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(kMessageActionBarPadding),
        child: Row(mainAxisSize: MainAxisSize.min, children: children),
      ),
    );
  }
}

class MessageActionBarButton extends StatelessWidget {
  const MessageActionBarButton({
    required this.label,
    required this.child,
    this.onTap,
    this.onSelect,
    this.active = false,
    this.danger = false,
    this.disabled = false,
    super.key,
  });

  final String label;
  final Widget child;
  final VoidCallback? onTap;
  final FluxerSelectCallback? onSelect;
  final bool active;
  final bool danger;
  final bool disabled;

  void _activate() {
    final FluxerSelectCallback? onSelect = this.onSelect;
    if (onSelect != null) {
      onSelect(FluxerKeyModifiers.current());
      return;
    }
    onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerTooltip(
      message: label,
      child: FluxerTappable(
        enabled: !disabled && (onTap != null || onSelect != null),
        onTap: _activate,
        selected: active,
        semanticLabel: label,
        excludeChildSemantics: true,
        builder: (BuildContext context, Set<WidgetState> states) {
          final bool hovered = states.contains(WidgetState.hovered);
          final Color foreground;
          final Color background;
          if (danger) {
            foreground = fluxerDesktopMenuDangerText(colors);
            background = active || hovered
                ? fluxerDesktopMenuDangerBackground(colors)
                : Colors.transparent;
          } else if (active) {
            foreground = colors.textPrimary;
            background = colors.surfaceInteractiveSelectedBg;
          } else if (disabled) {
            foreground = colors.textChatMuted;
            background = Colors.transparent;
          } else if (hovered) {
            foreground = colors.textPrimary;
            background = colors.surfaceInteractiveHoverBg;
          } else {
            foreground = colors.textTertiary;
            background = Colors.transparent;
          }
          return Transform.scale(
            scale: hovered ? kMessageActionBarHoverScale : 1,
            child: Container(
              width: kMessageActionBarItemSize,
              height: kMessageActionBarItemSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(
                  kMessageActionBarItemRadius,
                ),
              ),
              child: IconTheme.merge(
                data: IconThemeData(
                  color: foreground,
                  size: kMessageActionBarIconSize,
                ),
                child: SizedBox.square(
                  dimension: kMessageActionBarIconSize,
                  child: Center(child: child),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
