import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/text/fluxer_field_label.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerCardAlignmentControls extends StatelessWidget {
  const FluxerCardAlignmentControls({
    required this.value,
    required this.onChanged,
    required this.semanticLabels,
    this.label,
    super.key,
    this.disabled = false,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final String? label;
  final bool disabled;
  final Map<int, String> semanticLabels;

  static const List<int> _optionOrder = <int>[1, 0, 2];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final Widget controls = DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary.withValues(alpha: 0.85),
        borderRadius: layout.radiusLg,
        border: Border.all(color: colors.borderColor.withValues(alpha: 0.7)),
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s1_5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (final int option in _optionOrder) ...<Widget>[
              _AlignmentButton(
                alignment: option,
                isSelected: value == option,
                disabled: disabled,
                semanticLabel: semanticLabels[option] ?? '',
                onPressed: () => onChanged(option),
              ),
              if (option != _optionOrder.last) SizedBox(width: layout.s1),
            ],
          ],
        ),
      ),
    );
    if (label == null) {
      return controls;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FluxerFieldLabel(label!),
        SizedBox(height: layout.s2),
        controls,
      ],
    );
  }
}

class _AlignmentButton extends StatelessWidget {
  const _AlignmentButton({
    required this.alignment,
    required this.isSelected,
    required this.disabled,
    required this.semanticLabel,
    required this.onPressed,
  });

  final int alignment;
  final bool isSelected;
  final bool disabled;
  final String semanticLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final IconData icon = switch (alignment) {
      1 => PhosphorIconsBold.textAlignLeft,
      2 => PhosphorIconsBold.textAlignRight,
      _ => PhosphorIconsBold.textAlignCenter,
    };
    return FluxerTappable(
      onTap: disabled ? null : onPressed,
      semanticLabel: semanticLabel,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool isHovered = states.contains(WidgetState.hovered);
        final Color backgroundColor = isSelected
            ? colors.backgroundModifierAccent
            : isHovered
            ? colors.backgroundModifierHover
            : Colors.transparent;
        final Color iconColor = isSelected
            ? colors.textPrimary
            : colors.textSecondary;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: layout.radiusMd,
          ),
          child: PhosphorIcon(
            icon,
            size: 18,
            color: disabled ? colors.textTertiary : iconColor,
          ),
        );
      },
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerCardAlignmentControls')
Widget fluxerCardAlignmentControlsPreview() {
  return FluxerCardAlignmentControls(
    label: 'Card alignment',
    value: 0,
    semanticLabels: const <int, String>{0: 'Center', 1: 'Left', 2: 'Right'},
    onChanged: (_) {},
  );
}
