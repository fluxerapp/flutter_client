import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

const double _kSelectWidth = 160;

class FluxerSettingsSelectRow<T> extends StatelessWidget {
  const FluxerSettingsSelectRow({
    required this.label,
    required this.value,
    required this.items,
    required this._onChanged,
    this.description,
    super.key,
  });

  final String label;
  final String? description;
  final T value;
  final List<FluxerSelectItem<T>> items;

  // The generic callback keeps select values strongly typed for callers.
  // ignore: unsafe_variance
  final ValueChanged<T> _onChanged;

  @override
  Widget build(BuildContext context) {
    if (isMobileLayout(context)) {
      return FluxerSelect<T>(
        label: label,
        description: description,
        value: value,
        items: items,
        enableSearch: false,
        stretch: true,
        onChanged: _onChanged,
      );
    }
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final bool desktop = usesDesktopPointerUi(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: layout.s1),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w500,
                    height: desktop ? 20 / 14 : 1.4,
                  ),
                ),
                if (description != null) ...[
                  SizedBox(height: layout.s1),
                  Text(
                    description!,
                    style: textStyles.bodySmall.copyWith(
                      color: colors.textPrimaryMuted,
                      height: desktop ? 20 / 14 : 1.4,
                    ),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(width: layout.s4),
          SizedBox(
            width: _kSelectWidth,
            child: FluxerSelect<T>(
              hint: label,
              sheetTitle: label,
              value: value,
              items: items,
              enableSearch: false,
              stretch: true,
              onChanged: _onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerSettingsSelectRow')
Widget fluxerSettingsSelectRowPreview() {
  return FluxerSettingsSelectRow<String>(
    label: 'Noise suppression',
    value: 'rnnoise',
    items: const [
      FluxerSelectItem(value: 'none', label: 'None'),
      FluxerSelectItem(value: 'rnnoise', label: 'RNNoise'),
    ],
    onChanged: (_) {},
  );
}
