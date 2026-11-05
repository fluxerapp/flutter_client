part of 'fluxer_desktop_surface.dart';

TextStyle fluxerDesktopMenuLabelStyle(BuildContext context) => context
    .textStyles
    .label
    .copyWith(fontSize: 13, fontWeight: FontWeight.w500, height: 18 / 13);

List<BoxShadow> _panelShadow(BuildContext context) {
  final bool isDark = Theme.of(context).brightness == Brightness.dark;
  return <BoxShadow>[
    BoxShadow(
      color: Colors.black.withValues(alpha: isDark ? 0.24 : 0.14),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];
}

class FluxerDesktopMenuPanel extends StatelessWidget {
  const FluxerDesktopMenuPanel({
    required this.child,
    this.width = kFluxerDesktopMenuDefaultWidth,
    super.key,
  });

  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final BorderRadius radius = BorderRadius.circular(8);

    return FluxerDesktopMenuContent(
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: radius,
          boxShadow: _panelShadow(context),
        ),
        child: Material(
          color: isDark ? colors.backgroundTertiary : colors.backgroundPrimary,
          surfaceTintColor: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: radius,
            side: BorderSide(color: colors.backgroundModifierAccent),
          ),
          child: Padding(
            padding: const EdgeInsets.all(kFluxerDesktopMenuPadding),
            child: child,
          ),
        ),
      ),
    );
  }
}

class FluxerDesktopMenuContent extends StatelessWidget {
  const FluxerDesktopMenuContent({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FluxerDesktopSurfaceScope(
      surface: FluxerDesktopSurface.menu,
      child: ListTileTheme(
        data: ListTileThemeData(
          dense: true,
          minTileHeight: kFluxerDesktopMenuRowMinHeight,
          minVerticalPadding: 5,
          minLeadingWidth: kFluxerDesktopMenuIconSize,
          horizontalTitleGap: 8,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          iconColor: context.colors.textPrimary,
          textColor: context.colors.textPrimary,
          titleTextStyle: fluxerDesktopMenuLabelStyle(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: child,
      ),
    );
  }
}

class FluxerDesktopPopoutPanel extends StatelessWidget {
  const FluxerDesktopPopoutPanel({
    required this.child,
    required this.width,
    this.showBorder = true,
    super.key,
  });

  final Widget child;
  final double width;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final BorderRadius radius = BorderRadius.circular(8);
    return FluxerDesktopSurfaceScope(
      surface: FluxerDesktopSurface.popout,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: radius,
          boxShadow: _panelShadow(context),
        ),
        child: Material(
          color: colors.backgroundSecondary,
          surfaceTintColor: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: radius,
            side: showBorder
                ? BorderSide(color: colors.backgroundHeaderSecondary)
                : BorderSide.none,
          ),
          child: child,
        ),
      ),
    );
  }
}

class FluxerDesktopMenuRow extends StatelessWidget {
  const FluxerDesktopMenuRow({
    required this.label,
    required this.onTap,
    this.hint,
    this.leading,
    this.trailing,
    this.isDanger = false,
    this.enabled = true,
    this.selected = false,
    this.toggled,
    this.checked,
    this.labelColor,
    this.semanticLabel,
    super.key,
  });

  final String label;
  final VoidCallback onTap;
  final String? hint;
  final Widget? leading;
  final Widget? trailing;
  final bool isDanger;
  final bool enabled;
  final bool selected;
  final bool? toggled;
  final bool? checked;
  final Color? labelColor;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color foreground =
        labelColor ?? (isDanger ? colors.menuDangerText : colors.textPrimary);
    final Color hoverColor = isDanger
        ? Color.alphaBlend(
            colors.statusDanger.withValues(alpha: 0.06),
            colors.backgroundModifierHover,
          )
        : colors.backgroundModifierHover;

    return FluxerTappable(
      enabled: enabled,
      onTap: onTap,
      selected: selected,
      toggled: toggled,
      checked: checked,
      semanticLabel: semanticLabel ?? (hint != null ? '$label. $hint' : label),
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool highlighted =
            states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.focused);

        return Opacity(
          opacity: enabled ? 1 : 0.5,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: kFluxerDesktopMenuRowMinHeight,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: highlighted ? hoverColor : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: IconTheme.merge(
              data: IconThemeData(
                color: foreground,
                size: kFluxerDesktopMenuIconSize,
              ),
              child: Row(
                children: [
                  if (leading != null) ...[leading!, const SizedBox(width: 8)],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          label,
                          style: fluxerDesktopMenuLabelStyle(
                            context,
                          ).copyWith(color: foreground),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (hint != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: Text(
                              hint!,
                              style: context.textStyles.timestamp.copyWith(
                                fontSize: 12,
                                height: 16 / 12,
                                color: colors.textTertiary,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (trailing != null) ...[
                    const SizedBox(width: 8),
                    trailing!,
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class FluxerDesktopMenuGroupLabel extends StatelessWidget {
  const FluxerDesktopMenuGroupLabel({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 2),
      child: Text(
        label.toUpperCase(),
        style: context.textStyles.label.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          height: 16 / 11,
          letterSpacing: 0.22,
          color: context.colors.textTertiary,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class FluxerDesktopMenuSeparator extends StatelessWidget {
  const FluxerDesktopMenuSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      color: context.colors.backgroundModifierAccent.withValues(alpha: 0.55),
    );
  }
}
