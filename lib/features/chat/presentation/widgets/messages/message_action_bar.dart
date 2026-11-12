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
    required this.onTap,
    this.active = false,
    this.danger = false,
    this.disabled = false,
    super.key,
  });

  final String label;
  final Widget child;
  final VoidCallback? onTap;
  final bool active;
  final bool danger;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerTooltip(
      message: label,
      child: FluxerTappable(
        enabled: !disabled && onTap != null,
        onTap: onTap,
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
