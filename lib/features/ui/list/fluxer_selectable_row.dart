import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

const EdgeInsetsGeometry kFluxerDesktopSidebarRowMargin =
    EdgeInsetsDirectional.only(start: 8, end: 8);
const EdgeInsetsGeometry kFluxerDesktopSidebarRowPadding = EdgeInsets.symmetric(
  horizontal: 8,
  vertical: 6,
);

class FluxerSelectableRow extends StatefulWidget {
  const FluxerSelectableRow({
    required this.isSelected,
    required this.selectedColor,
    required this.borderRadius,
    this.child,
    this.childBuilder,
    this.selectedBorderColor,
    this.isActive = false,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.height,
    this.hoverColor,
    this.pressedColor,
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    this.onSecondaryTapUp,
    this.onContextMenuRequested,
    this.desktopSidebar = false,
    this.desktopMargin = kFluxerDesktopSidebarRowMargin,
    super.key,
  }) : assert(
         child != null || childBuilder != null,
         'Provide child or childBuilder.',
       );

  final bool isSelected;
  final Color selectedColor;
  final Color? selectedBorderColor;
  final bool isActive;
  final BorderRadius borderRadius;
  final Widget? child;
  final Widget Function(BuildContext context, Set<WidgetState> states)?
  childBuilder;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double? height;
  final Color? hoverColor;
  final Color? pressedColor;
  final String? semanticLabel;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final GestureTapUpCallback? onSecondaryTapUp;
  final Future<void> Function(TapUpDetails details)? onContextMenuRequested;
  final bool desktopSidebar;
  final EdgeInsetsGeometry desktopMargin;

  @override
  State<FluxerSelectableRow> createState() => _FluxerSelectableRowState();
}

class _FluxerSelectableRowState extends State<FluxerSelectableRow> {
  bool _pressed = false;
  bool _hovered = false;
  bool _focused = false;
  bool _contextMenuOpen = false;

  Future<void> _handleContextMenuRequested(TapUpDetails details) async {
    setState(() => _contextMenuOpen = true);
    try {
      await widget.onContextMenuRequested!(details);
    } finally {
      if (mounted) {
        setState(() => _contextMenuOpen = false);
      }
    }
  }

  void _setHovered(bool value) {
    if (_hovered != value) {
      setState(() => _hovered = value);
    }
  }

  void _setFocused(bool value) {
    if (_focused != value) {
      setState(() => _focused = value);
    }
  }

  void _setPressed(bool value) {
    if (_pressed != value) {
      setState(() => _pressed = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isInteractive =
        widget.onTap != null ||
        widget.onLongPress != null ||
        widget.onSecondaryTapUp != null ||
        widget.onContextMenuRequested != null;
    final colors = context.colors;
    final bool desktop = widget.desktopSidebar;
    final Color? hoverColor = desktop
        ? colors.surfaceInteractiveHoverBg
        : widget.hoverColor;
    final Color effectiveHoverColor =
        hoverColor ?? colors.backgroundModifierHover;
    final BorderRadius borderRadius = desktop
        ? context.layout.radiusMd
        : widget.borderRadius;
    final Color? fill = widget.isSelected
        ? (desktop ? colors.surfaceInteractiveSelectedBg : widget.selectedColor)
        : _contextMenuOpen
        ? effectiveHoverColor
        : (_pressed || widget.isActive)
        ? (desktop ? colors.surfaceInteractiveHoverBg : widget.pressedColor) ??
              colors.listItemPressedBg
        : null;
    final bool showHoverState =
        !widget.isSelected && (_hovered || _contextMenuOpen || _pressed);
    final Color? borderColor = widget.isSelected && !isFluxerMobileOs
        ? widget.selectedBorderColor
        : null;
    final Widget row = Padding(
      padding: desktop ? widget.desktopMargin : widget.margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          hoverDuration: Duration.zero,
          hoverColor: widget.isSelected
              ? Colors.transparent
              : hoverColor ?? (isInteractive ? effectiveHoverColor : null),
          onHover: widget.childBuilder == null ? null : _setHovered,
          onFocusChange: widget.childBuilder == null ? null : _setFocused,
          mouseCursor: isInteractive
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          onHighlightChanged: isInteractive ? _setPressed : null,
          onTap: widget.onTap,
          onLongPress: widget.onLongPress,
          onSecondaryTapUp: widget.onContextMenuRequested != null
              ? _handleContextMenuRequested
              : widget.onSecondaryTapUp,
          child: Container(
            height: widget.height,
            padding: desktop ? kFluxerDesktopSidebarRowPadding : widget.padding,
            decoration: fill == null
                ? null
                : BoxDecoration(color: fill, borderRadius: borderRadius),
            foregroundDecoration: borderColor == null
                ? null
                : BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: borderRadius,
                  ),
            child:
                widget.childBuilder?.call(context, <WidgetState>{
                  if (showHoverState) WidgetState.hovered,
                  if (_focused) WidgetState.focused,
                }) ??
                widget.child,
          ),
        ),
      ),
    );

    if (widget.semanticLabel == null) {
      if (widget.onTap == null) {
        return row;
      }
      return Semantics(
        container: true,
        button: true,
        selected: widget.isSelected,
        child: row,
      );
    }

    return Semantics(
      button: true,
      selected: widget.isSelected,
      label: widget.semanticLabel,
      child: ExcludeSemantics(child: row),
    );
  }
}
