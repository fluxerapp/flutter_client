import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerSelectableRow extends StatefulWidget {
  const FluxerSelectableRow({
    required this.isSelected,
    required this.selectedColor,
    required this.borderRadius,
    required this.child,
    this.selectedBorderColor,
    this.isActive = false,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.height,
    this.hoverColor,
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    this.onSecondaryTapUp,
    super.key,
  });

  final bool isSelected;
  final Color selectedColor;
  final Color? selectedBorderColor;
  final bool isActive;
  final BorderRadius borderRadius;
  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double? height;
  final Color? hoverColor;
  final String? semanticLabel;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final GestureTapUpCallback? onSecondaryTapUp;

  @override
  State<FluxerSelectableRow> createState() => _FluxerSelectableRowState();
}

class _FluxerSelectableRowState extends State<FluxerSelectableRow> {
  bool _pressed = false;

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
        widget.onSecondaryTapUp != null;
    final Color? fill = widget.isSelected
        ? widget.selectedColor
        : (_pressed || widget.isActive)
        ? context.colors.listItemPressedBg
        : null;
    final Color? borderColor = widget.isSelected && !isFluxerMobileOs
        ? widget.selectedBorderColor
        : null;
    final Widget row = Padding(
      padding: widget.margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: widget.borderRadius,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          hoverColor:
              widget.hoverColor ??
              (isInteractive ? context.colors.backgroundModifierHover : null),
          mouseCursor: isInteractive
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          onHighlightChanged: isInteractive ? _setPressed : null,
          onTap: widget.onTap,
          onLongPress: widget.onLongPress,
          onSecondaryTapUp: widget.onSecondaryTapUp,
          child: Container(
            height: widget.height,
            padding: widget.padding,
            decoration: fill == null
                ? null
                : BoxDecoration(color: fill, borderRadius: widget.borderRadius),
            foregroundDecoration: borderColor == null
                ? null
                : BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: widget.borderRadius,
                  ),
            child: widget.child,
          ),
        ),
      ),
    );

    if (widget.semanticLabel == null) {
      return row;
    }

    return Semantics(
      button: true,
      selected: widget.isSelected,
      label: widget.semanticLabel,
      child: ExcludeSemantics(child: row),
    );
  }
}
