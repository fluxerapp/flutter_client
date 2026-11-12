part of 'fluxer_desktop_surface.dart';

TextStyle fluxerDesktopMenuLabelStyle(BuildContext context) => context
    .textStyles
    .label
    .copyWith(fontSize: 13, fontWeight: FontWeight.w500, height: 18 / 13);

Color fluxerDesktopMenuDangerText(FluxerColorTheme colors) =>
    fluxerCssColorMix(colors.statusDanger, colors.textPrimary, 0.78);

Color fluxerDesktopMenuDangerBackground(FluxerColorTheme colors) =>
    fluxerCssColorMix(
      colors.statusDanger,
      colors.surfaceInteractiveHoverBg,
      0.06,
    );

class FluxerDesktopMenuPanel extends StatelessWidget {
  const FluxerDesktopMenuPanel({
    required this.child,
    this.width = kFluxerDesktopMenuDefaultWidth,
    super.key,
  }) : fitContent = false;

  const FluxerDesktopMenuPanel.fitContent({required this.child, super.key})
    : width = null,
      fitContent = true;

  final Widget child;
  final double? width;
  final bool fitContent;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final BorderRadius radius = BorderRadius.circular(8);

    final Widget panel = FluxerDesktopMenuContent(
      child: Container(
        width: width,
        constraints: fitContent
            ? const BoxConstraints(
                minWidth: kFluxerDesktopMenuMinWidth,
                maxWidth: kFluxerDesktopMenuMaxWidth,
              )
            : null,
        decoration: BoxDecoration(
          borderRadius: radius,
          boxShadow: fluxerDesktopPanelShadow(context),
        ),
        child: Material(
          color: fluxerFormSurfaceBackground(context),
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
    return fitContent ? IntrinsicWidth(child: panel) : panel;
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
          minVerticalPadding: 6,
          minLeadingWidth: kFluxerDesktopMenuIconSize,
          horizontalTitleGap: 8,
          contentPadding: const EdgeInsets.symmetric(horizontal: 9),
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
    this.borderRadius = 8,
    super.key,
  });

  final Widget child;
  final double width;
  final bool showBorder;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final BorderRadius radius = BorderRadius.circular(borderRadius);
    return FluxerDesktopSurfaceScope(
      surface: FluxerDesktopSurface.popout,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: radius,
          boxShadow: fluxerDesktopPanelShadow(context),
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
    this.trailingBuilder,
    this.isDanger = false,
    this.enabled = true,
    this.selected = false,
    this.toggled,
    this.checked,
    this.labelColor,
    this.hintColor,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.semanticLabel,
    super.key,
  });

  final String label;
  final VoidCallback onTap;
  final String? hint;
  final Widget? leading;
  final Widget? trailing;
  final Widget Function(BuildContext context, {required bool highlighted})?
  trailingBuilder;
  final bool isDanger;
  final bool enabled;
  final bool selected;
  final bool? toggled;
  final bool? checked;
  final Color? labelColor;
  final Color? hintColor;
  final CrossAxisAlignment crossAxisAlignment;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color foreground =
        labelColor ??
        (!enabled
            ? colors.interactiveMuted
            : isDanger
            ? fluxerDesktopMenuDangerText(colors)
            : colors.textPrimary);
    final Color hoverColor = isDanger
        ? fluxerDesktopMenuDangerBackground(colors)
        : colors.surfaceInteractiveHoverBg;

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
            enabled &&
            (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.focused));
        final Widget? trailingWidget =
            trailingBuilder?.call(context, highlighted: highlighted) ??
            trailing;

        return Opacity(
          opacity: enabled ? 1 : 0.5,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: kFluxerDesktopMenuRowMinHeight,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
            decoration: BoxDecoration(
              color: highlighted ? hoverColor : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: DefaultTextStyle.merge(
              style: TextStyle(color: foreground),
              child: IconTheme.merge(
                data: IconThemeData(
                  color: foreground,
                  size: kFluxerDesktopMenuIconSize,
                ),
                child: Row(
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    if (leading != null) ...[
                      leading!,
                      const SizedBox(width: 8),
                    ],
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
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: kFluxerDesktopMenuHintMaxWidth,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 1),
                                child: Text(
                                  hint!,
                                  style: fluxerDesktopMenuLabelStyle(context)
                                      .copyWith(
                                        fontSize: 12,
                                        height: 16 / 12,
                                        color:
                                            hintColor ??
                                            colors.textTertiaryMuted,
                                      ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (trailingWidget != null) ...[
                      const SizedBox(width: 8),
                      trailingWidget,
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FluxerDesktopMenuCheckbox extends StatelessWidget {
  const FluxerDesktopMenuCheckbox({
    required this.isChecked,
    this.dangerHighlighted = false,
    super.key,
  });

  final bool isChecked;
  final bool dangerHighlighted;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color fill = isChecked
        ? (dangerHighlighted ? colors.statusDanger : colors.brandPrimary)
        : fluxerFormSurfaceBackground(context);
    final Color border = isChecked
        ? (dangerHighlighted ? colors.statusDanger : colors.brandPrimary)
        : dangerHighlighted
        ? fluxerCssColorMix(colors.statusDanger, Colors.transparent, 0.46)
        : colors.backgroundModifierAccent;
    final Color check = dangerHighlighted
        ? Colors.white
        : colors.brandPrimaryFill;
    return SizedBox(
      width: 18,
      height: 18,
      child: Center(
        child: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: fill,
            border: Border.all(color: border),
            borderRadius: BorderRadius.circular(4),
          ),
          child: isChecked
              ? Center(
                  child: FractionalTranslation(
                    translation: const Offset(0, -0.1),
                    child: Transform.rotate(
                      angle: math.pi / 4,
                      child: Container(
                        width: 4,
                        height: 9,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: check, width: 2.5),
                            bottom: BorderSide(color: check, width: 2.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : null,
        ),
      ),
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
      color: context.colors.backgroundModifierAccent.withValues(
        alpha: context.colors.backgroundModifierAccent.a * 0.55,
      ),
    );
  }
}
