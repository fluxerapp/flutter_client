import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/text/fluxer_field_label.dart';

class FluxerRadioItem<T> {
  const FluxerRadioItem({
    required this.value,
    required this.label,
    this.description,
    this.labelColor,
    this.leading,
    this.enabled = true,
  });

  final T value;
  final String label;
  final String? description;
  final Color? labelColor;
  final Widget? leading;
  final bool enabled;
}

class FluxerRadioGroup<T> extends StatelessWidget {
  const FluxerRadioGroup({
    required this.value,
    required this.items,
    required this._onChanged,
    this.label,
    this.direction = Axis.vertical,
    this.itemSpacing,
    this.dense = false,
    super.key,
  });

  // The generic callback keeps radio values strongly typed for callers.
  // ignore: unsafe_variance
  final ValueChanged<T> _onChanged;

  final T? value;
  final List<FluxerRadioItem<T>> items;
  final String? label;
  final Axis direction;
  final double? itemSpacing;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    final group = Flex(
      direction: direction,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: itemSpacing ?? layout.s1_5,
      children: [for (final item in items) _buildOption(context, item)],
    );

    if (label == null) {
      return group;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FluxerFieldLabel(label!),
        SizedBox(height: layout.s2),
        Semantics(container: true, label: label, child: group),
      ],
    );
  }

  Widget _buildOption(BuildContext context, FluxerRadioItem<T> item) {
    final isSelected = value == item.value;
    final crossAxisAlignment = dense || item.leading != null
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;

    final Widget option = Semantics(
      enabled: item.enabled,
      checked: isSelected,
      inMutuallyExclusiveGroup: true,
      label: item.label,
      onTap: item.enabled ? () => _onChanged(item.value) : null,
      child: ExcludeSemantics(
        child: FluxerGestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: item.enabled ? () => _onChanged(item.value) : null,
          child: Row(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: dense || item.leading != null ? 0 : 2,
                ),
                child: _RadioIndicator(isSelected: isSelected),
              ),
              const SizedBox(width: 8),
              if (item.leading != null) ...[
                item.leading!,
                const SizedBox(width: 10),
              ],
              if (direction == Axis.vertical)
                Expanded(child: _buildLabel(context, item, isSelected))
              else
                _buildLabel(context, item, isSelected),
            ],
          ),
        ),
      ),
    );

    if (item.enabled) {
      return option;
    }

    return IgnorePointer(child: Opacity(opacity: 0.45, child: option));
  }

  Widget _buildLabel(
    BuildContext context,
    FluxerRadioItem<T> item,
    bool isSelected,
  ) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: layout.s1,
      children: [
        Text(
          item.label,
          style: textStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            color:
                item.labelColor ??
                (isSelected ? colors.textPrimary : colors.textSecondary),
          ),
        ),
        if (item.description != null)
          Text(
            item.description!,
            style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
          ),
      ],
    );
  }
}

class _RadioIndicator extends StatelessWidget {
  const _RadioIndicator({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final borderDerived = Color.lerp(colors.borderColor, Colors.white, 0.3)!;
    final unselectedFill = Color.lerp(
      colors.backgroundPrimary,
      borderDerived,
      0.45,
    )!;

    return AnimatedContainer(
      duration: context.motion.normal,
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? colors.brandPrimary : unselectedFill,
        border: Border.all(
          color: isSelected ? colors.brandPrimary : borderDerived,
          width: 1.5,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            )
          : null,
    );
  }
}

@FluxerWidgetPreview(name: 'Vertical', group: 'FluxerRadioGroup')
Widget fluxerRadioGroupPreview() {
  return FluxerRadioGroup<String>(
    value: 'standard',
    items: const [
      FluxerRadioItem(
        value: 'standard',
        label: 'Standard',
        description: 'Balanced quality and performance.',
      ),
      FluxerRadioItem(
        value: 'high',
        label: 'High fidelity',
        description: 'Sharper media at the cost of bandwidth.',
      ),
    ],
    onChanged: (_) {},
  );
}

@FluxerWidgetPreview(name: 'With label', group: 'FluxerRadioGroup')
Widget fluxerRadioGroupLabeledPreview() {
  return FluxerRadioGroup<String>(
    label: 'Media from links (embeds)',
    value: 'large',
    items: const [
      FluxerRadioItem(value: 'small', label: 'Compact'),
      FluxerRadioItem(value: 'large', label: 'Comfortable'),
    ],
    onChanged: (_) {},
  );
}
