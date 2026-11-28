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
    this.autofocus = true,
    this.focusFirstOnOpen,
    this.onDismiss,
    this.navigatorKey,
    super.key,
  }) : fitContent = false;

  const FluxerDesktopMenuPanel.fitContent({
    required this.child,
    this.autofocus = true,
    this.focusFirstOnOpen,
    this.onDismiss,
    this.navigatorKey,
    super.key,
  }) : width = null,
       fitContent = true;

  final Widget child;
  final double? width;
  final bool fitContent;
  final bool autofocus;
  final bool? focusFirstOnOpen;
  final VoidCallback? onDismiss;
  final GlobalKey<FluxerDesktopMenuNavigatorState>? navigatorKey;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final BorderRadius radius = BorderRadius.circular(8);

    final Widget panel = FluxerDesktopMenuContent(
      autofocus: autofocus,
      focusFirstOnOpen: focusFirstOnOpen,
      onDismiss: onDismiss,
      navigatorKey: navigatorKey,
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
  const FluxerDesktopMenuContent({
    required this.child,
    this.autofocus = true,
    this.focusFirstOnOpen,
    this.onDismiss,
    this.navigatorKey,
    super.key,
  });

  final Widget child;
  final bool autofocus;
  final bool? focusFirstOnOpen;
  final VoidCallback? onDismiss;
  final GlobalKey<FluxerDesktopMenuNavigatorState>? navigatorKey;

  @override
  Widget build(BuildContext context) {
    return FluxerDesktopSurfaceScope(
      surface: FluxerDesktopSurface.menu,
      child: FluxerDesktopMenuNavigator(
        key: navigatorKey,
        autofocus: autofocus,
        focusFirstOnOpen: focusFirstOnOpen,
        onDismiss: onDismiss,
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: child,
        ),
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

class FluxerDesktopMenuRow extends StatefulWidget {
  const FluxerDesktopMenuRow({
    required this.label,
    this.onTap,
    this.onSelect,
    this.onKeyboardActivate,
    this.hint,
    this.leading,
    this.trailing,
    this.trailingBuilder,
    this.isDanger = false,
    this.enabled = true,
    this.selected = false,
    this.toggled,
    this.checked,
    this.expanded,
    this.labelColor,
    this.hintColor,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.semanticLabel,
    this.shortcut,
    this.focusNode,
    this.highlighted = false,
    this.submenu,
    this.onHoverChange,
    super.key,
  });

  final String label;
  final VoidCallback? onTap;
  final FluxerSelectCallback? onSelect;
  final VoidCallback? onKeyboardActivate;
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
  final bool? expanded;
  final Color? labelColor;
  final Color? hintColor;
  final CrossAxisAlignment crossAxisAlignment;
  final String? semanticLabel;
  final String? shortcut;
  final FocusNode? focusNode;
  final bool highlighted;
  final FluxerDesktopSubmenuHandle? submenu;
  final ValueChanged<bool>? onHoverChange;

  @override
  State<FluxerDesktopMenuRow> createState() => _FluxerDesktopMenuRowState();
}

class _FluxerDesktopMenuRowState extends State<FluxerDesktopMenuRow>
    with _FluxerDesktopMenuEntryState<FluxerDesktopMenuRow> {
  FocusNode? _ownedNode;

  bool get _hasAction =>
      widget.onTap != null ||
      widget.onSelect != null ||
      widget.onKeyboardActivate != null;

  @override
  FocusNode get menuFocusNode =>
      widget.focusNode ??
      (_ownedNode ??= FocusNode(debugLabel: 'FluxerDesktopMenuRow'));

  @override
  String get menuLabel => widget.label;

  @override
  String? get menuShortcut => widget.shortcut;

  @override
  bool get menuEnabled => widget.enabled && _hasAction;

  @override
  FluxerDesktopSubmenuHandle? get menuSubmenu => widget.submenu;

  @override
  void menuActivate() => _activate();

  @override
  void dispose() {
    super.dispose();
    _ownedNode?.dispose();
  }

  void _handleHoverChange(bool hovered) {
    handleMenuHover(hovered: hovered);
    widget.onHoverChange?.call(hovered);
  }

  void _activate() {
    if (!widget.enabled) {
      return;
    }
    final FluxerSelectCallback? onSelect = widget.onSelect;
    if (onSelect != null) {
      onSelect(FluxerKeyModifiers.current());
      return;
    }
    widget.onTap?.call();
  }

  void _keyboardActivate() {
    final VoidCallback? onKeyboardActivate = widget.onKeyboardActivate;
    if (onKeyboardActivate != null) {
      onKeyboardActivate();
      return;
    }
    _activate();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bool enabled = widget.enabled;
    final Color foreground =
        widget.labelColor ??
        (!enabled
            ? colors.interactiveMuted
            : widget.isDanger
            ? fluxerDesktopMenuDangerText(colors)
            : colors.textPrimary);
    final Color hoverColor = widget.isDanger
        ? fluxerDesktopMenuDangerBackground(colors)
        : colors.surfaceInteractiveHoverBg;
    final String? hint = widget.hint;
    final bool tracksFocus = tracksMenuFocus;

    return FluxerTappable(
      enabled: enabled,
      onTap: _hasAction ? _activate : null,
      onKeyboardActivate: _hasAction ? _keyboardActivate : null,
      focusNode: menuFocusNode,
      onHoverChange: _handleHoverChange,
      selected: widget.selected,
      toggled: widget.toggled,
      checked: widget.checked,
      expanded: widget.expanded,
      semanticLabel:
          widget.semanticLabel ??
          (hint != null ? '${widget.label}. $hint' : widget.label),
      excludeChildSemantics: true,
      showFocusRing: false,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool highlighted =
            enabled &&
            (widget.highlighted ||
                states.contains(WidgetState.focused) ||
                ((!tracksFocus || _hoverWithoutFocus) &&
                    states.contains(WidgetState.hovered)));
        final Widget? trailingWidget =
            widget.trailingBuilder?.call(context, highlighted: highlighted) ??
            widget.trailing;

        return Container(
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
                crossAxisAlignment: widget.crossAxisAlignment,
                children: [
                  if (widget.leading != null) ...[
                    widget.leading!,
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.label,
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
                                hint,
                                style: fluxerDesktopMenuLabelStyle(context)
                                    .copyWith(
                                      fontSize: 12,
                                      height: 16 / 12,
                                      color:
                                          widget.hintColor ??
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
        );
      },
    );
  }
}

class FluxerDesktopSubmenuRow extends StatefulWidget {
  const FluxerDesktopSubmenuRow({
    required this.label,
    required this.builder,
    this.hint,
    this.leading,
    this.isDanger = false,
    this.enabled = true,
    this.onTriggerSelect,
    this.width,
    super.key,
  });

  final String label;
  final WidgetBuilder builder;
  final String? hint;
  final Widget? leading;
  final bool isDanger;
  final bool enabled;
  final FluxerSelectCallback? onTriggerSelect;
  final double? width;

  @override
  State<FluxerDesktopSubmenuRow> createState() =>
      _FluxerDesktopSubmenuRowState();
}

class _FluxerDesktopSubmenuRowState extends State<FluxerDesktopSubmenuRow> {
  final FocusNode _node = FocusNode(debugLabel: 'FluxerDesktopSubmenuRow');

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  void _handlePointerSelect(
    FluxerDesktopSubmenuHandle submenu,
    FluxerKeyModifiers modifiers,
  ) {
    final FluxerSelectCallback? onTriggerSelect = widget.onTriggerSelect;
    if (onTriggerSelect != null && usesDesktopPointerUi(context)) {
      onTriggerSelect(modifiers);
      return;
    }
    submenu.open();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerDesktopSubmenu(
      builder: widget.builder,
      width: widget.width,
      enabled: widget.enabled,
      triggerFocusNode: _node,
      triggerBuilder:
          (BuildContext context, FluxerDesktopSubmenuHandle submenu) {
            final Widget caret = PhosphorIcon(
              PhosphorIconsBold.caretRight,
              size: kFluxerDesktopMenuCaretSize,
              color: widget.enabled
                  ? colors.textTertiary
                  : colors.interactiveMuted,
            );
            return FluxerDesktopMenuRow(
              label: widget.label,
              hint: widget.hint,
              leading: widget.leading,
              isDanger: widget.isDanger,
              enabled: widget.enabled,
              focusNode: _node,
              submenu: submenu,
              highlighted: submenu.isOpen,
              expanded: submenu.isOpen,
              onHoverChange: (bool inside) =>
                  submenu.hoverTrigger(inside: inside),
              onSelect: (FluxerKeyModifiers modifiers) =>
                  _handlePointerSelect(submenu, modifiers),
              onKeyboardActivate: () => submenu.open(focusFirst: true),
              trailing: widget.onTriggerSelect == null
                  ? caret
                  : GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: widget.enabled ? submenu.open : null,
                      child: caret,
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

class FluxerDesktopMenuRadio extends StatelessWidget {
  const FluxerDesktopMenuRadio({required this.selected, super.key});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      width: 18,
      height: 18,
      child: Center(
        child: Container(
          width: 16,
          height: 16,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected
                ? colors.brandPrimary
                : fluxerFormSurfaceBackground(context),
            border: Border.all(
              color: selected
                  ? colors.brandPrimary
                  : colors.backgroundModifierAccent,
            ),
          ),
          child: selected
              ? Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.brandPrimaryFill,
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
        label,
        style: context.textStyles.label.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          height: 16 / 12,
          letterSpacing: 0,
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
