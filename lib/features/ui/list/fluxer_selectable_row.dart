import 'package:material_ui/material_ui.dart';

class FluxerSelectableRow extends StatelessWidget {
  const FluxerSelectableRow({
    required this.isSelected,
    required this.selectedColor,
    required this.borderRadius,
    required this.child,
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
  Widget build(BuildContext context) {
    final Widget row = Padding(
      padding: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          hoverColor: hoverColor,
          onTap: onTap,
          onLongPress: onLongPress,
          onSecondaryTapUp: onSecondaryTapUp,
          child: Container(
            height: height,
            padding: padding,
            decoration: isSelected
                ? BoxDecoration(
                    color: selectedColor,
                    borderRadius: borderRadius,
                  )
                : null,
            child: child,
          ),
        ),
      ),
    );

    if (semanticLabel == null) {
      return row;
    }

    return Semantics(
      button: true,
      selected: isSelected,
      label: semanticLabel,
      child: ExcludeSemantics(child: row),
    );
  }
}
