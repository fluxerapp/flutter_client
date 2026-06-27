import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/text/fluxer_field_label.dart';

class FluxerRadioItem<T> {
  const FluxerRadioItem({
    required this.value,
    required this.label,
    this.description,
  });

  final T value;
  final String label;
  final String? description;
}

class FluxerRadioGroup<T> extends StatelessWidget {
  const FluxerRadioGroup({
    required this.value,
    required this.items,
    required ValueChanged<T> onChanged,
    this.label,
    this.direction = Axis.vertical,
    super.key,
  }) : _onChanged = onChanged;

  // The generic callback keeps radio values strongly typed for callers.
  // ignore: unsafe_variance
  final ValueChanged<T> _onChanged;

  final T? value;
  final List<FluxerRadioItem<T>> items;
  final String? label;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    final group = Flex(
      direction: direction,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: layout.s1_5,
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

    return Semantics(
      checked: isSelected,
      inMutuallyExclusiveGroup: true,
      label: item.label,
      onTap: () => _onChanged(item.value),
      child: ExcludeSemantics(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onChanged(item.value),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: _RadioIndicator(isSelected: isSelected),
              ),
              const SizedBox(width: 8),
              if (direction == Axis.vertical)
                Expanded(child: _buildLabel(context, item, isSelected))
              else
                _buildLabel(context, item, isSelected),
            ],
          ),
        ),
      ),
    );
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
            color: isSelected ? colors.textPrimary : colors.textSecondary,
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
      duration: const Duration(milliseconds: 150),
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
