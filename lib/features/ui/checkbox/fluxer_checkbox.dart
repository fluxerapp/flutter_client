import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:material_ui/material_ui.dart';

/// A themed checkbox with an optional tappable label.
///
/// Visual styling is handled by the existing [CheckboxTheme]
/// in `buildFluxerTheme()`.
class FluxerCheckbox extends StatelessWidget {
  const FluxerCheckbox({
    required this.value,
    required this.onChanged,
    this.label,
    this.child,
    this.enabled = true,
    super.key,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;
  final Widget? child;
  final bool enabled;

  String? get _semanticsLabel {
    if (label != null) {
      return label;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return FluxerTappable(
      enabled: enabled,
      onTap: () => onChanged(!value),
      semanticLabel: _semanticsLabel,
      checked: value,
      excludeChildSemantics: _semanticsLabel != null,
      builder: (context, states) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: ExcludeSemantics(
                child: Checkbox(
                  value: value,
                  onChanged: enabled ? onChanged : null,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ),
            if (child != null || label != null) ...[
              const SizedBox(width: 8),
              Flexible(
                child:
                    child ??
                    Text(
                      label!,
                      style: textStyles.bodySmall.copyWith(
                        color: enabled
                            ? colors.textPrimary
                            : colors.textTertiary,
                      ),
                    ),
              ),
            ],
          ],
        );
      },
    );
  }
}

@FluxerWidgetPreview(name: 'Unchecked', group: 'FluxerCheckbox')
Widget fluxerCheckboxUncheckedPreview() {
  return FluxerCheckbox(
    value: false,
    onChanged: (_) {},
    label: 'Enable desktop notifications',
  );
}

@FluxerWidgetPreview(name: 'Checked', group: 'FluxerCheckbox')
Widget fluxerCheckboxCheckedPreview() {
  return FluxerCheckbox(
    value: true,
    onChanged: (_) {},
    label: 'Enable desktop notifications',
  );
}
