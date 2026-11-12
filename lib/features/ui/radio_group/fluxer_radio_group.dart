import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/text/fluxer_field_label.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

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

    final Widget group = isMobileLayout(context) && direction == Axis.vertical
        ? FluxerMenuGroup(
            children: [
              for (final item in items)
                Semantics(
                  enabled: item.enabled,
                  checked: value == item.value,
                  selected: value == item.value,
                  inMutuallyExclusiveGroup: true,
                  label: item.description != null
                      ? '${item.label}. ${item.description}'
                      : item.label,
                  onTap: item.enabled ? () => _onChanged(item.value) : null,
                  child: ExcludeSemantics(
                    child: FluxerBottomSheetMenuItem(
                      label: item.label,
                      labelColor: item.labelColor,
                      hint: item.description,
                      leading: item.leading,
                      enabled: item.enabled,
                      isSelected: value == item.value,
                      onTap: () => _onChanged(item.value),
                    ),
                  ),
                ),
            ],
          )
        : Flex(
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
    if (usesDesktopPointerUi(context)) {
      return _FluxerDesktopRadioOption(
        selected: isSelected,
        enabled: item.enabled,
        centered: dense || item.leading != null,
        expand: direction == Axis.vertical,
        label: item.label,
        description: item.description,
        labelColor: item.labelColor,
        leading: item.leading,
        onTap: () => _onChanged(item.value),
      );
    }
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
                child: FluxerRadioIndicator(selected: isSelected),
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

Color fluxerRadioRingColor(BuildContext context) {
  final colors = context.colors;
  return Theme.of(context).brightness == Brightness.light
      ? fluxerCssColorMix(colors.textSecondary, Colors.black, 0.7)
      : fluxerCssColorMix(colors.borderColor, Colors.white, 0.7);
}

class FluxerRadioIndicator extends StatelessWidget {
  const FluxerRadioIndicator({required this.selected, super.key});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color ring = fluxerRadioRingColor(context);
    if (usesDesktopPointerUi(context)) {
      final bool isLight = Theme.of(context).brightness == Brightness.light;
      final Color selectedBorder = isLight
          ? fluxerCssColorMix(colors.brandPrimary, colors.textPrimary, 0.85)
          : colors.brandPrimary;
      return AnimatedContainer(
        duration: context.motion.normal,
        curve: Curves.ease,
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected
              ? colors.brandPrimary
              : fluxerCssColorMix(colors.backgroundPrimary, ring, 0.55),
          border: Border.all(
            color: selected ? selectedBorder : ring,
            width: 0.9,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: selected ? 0.2 : 0.15),
              offset: const Offset(0, 1),
              blurRadius: selected ? 3 : 2,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: AnimatedOpacity(
          opacity: selected ? 1 : 0,
          duration: context.motion.normal,
          curve: Curves.ease,
          child: Container(
            width: 7.2,
            height: 7.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.brandPrimaryFill,
            ),
          ),
        ),
      );
    }

    return AnimatedContainer(
      duration: context.motion.normal,
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected
            ? colors.brandPrimary
            : fluxerCssColorMix(colors.backgroundPrimary, ring, 0.55),
        border: Border.all(
          color: selected ? colors.brandPrimary : ring,
          width: 2,
        ),
      ),
      child: selected
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

class _FluxerDesktopRadioOption extends StatefulWidget {
  const _FluxerDesktopRadioOption({
    required this.selected,
    required this.enabled,
    required this.centered,
    required this.expand,
    required this.label,
    required this.onTap,
    this.description,
    this.labelColor,
    this.leading,
  });

  final bool selected;
  final bool enabled;
  final bool centered;
  final bool expand;
  final String label;
  final String? description;
  final Color? labelColor;
  final Widget? leading;
  final VoidCallback onTap;

  @override
  State<_FluxerDesktopRadioOption> createState() =>
      _FluxerDesktopRadioOptionState();
}

class _FluxerDesktopRadioOptionState extends State<_FluxerDesktopRadioOption> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final bool active = widget.enabled && (widget.selected || _hovered);
    final Widget labelColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Text(
          widget.label,
          style: textStyles.bodyMedium.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 1.4,
            color:
                widget.labelColor ??
                (active ? colors.textPrimary : colors.textSecondary),
          ),
        ),
        if (widget.description != null)
          Text(
            widget.description!,
            style: textStyles.bodySmall.copyWith(
              fontSize: 14,
              height: 1.4,
              color: widget.enabled && _hovered
                  ? colors.textPrimary
                  : colors.textSecondary,
            ),
          ),
      ],
    );

    final Widget option = Semantics(
      enabled: widget.enabled,
      checked: widget.selected,
      inMutuallyExclusiveGroup: true,
      label: widget.label,
      onTap: widget.enabled ? widget.onTap : null,
      child: ExcludeSemantics(
        child: MouseRegion(
          cursor: widget.enabled
              ? SystemMouseCursors.click
              : SystemMouseCursors.forbidden,
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: FluxerGestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.enabled ? widget.onTap : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: widget.centered
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: widget.centered ? 0 : 2),
                    child: FluxerRadioIndicator(selected: widget.selected),
                  ),
                  ?widget.leading,
                  if (widget.expand)
                    Expanded(child: labelColumn)
                  else
                    Flexible(child: labelColumn),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.enabled) {
      return option;
    }
    return Opacity(opacity: 0.55, child: option);
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
