import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/slider/fluxer_slider.dart';
import 'package:fluxer_app/material_ui.dart';

class LookAndFeelStepSlider extends StatelessWidget {
  const LookAndFeelStepSlider({
    required this.label,
    required this.stops,
    required this.value,
    required this.defaultValue,
    required this.labelledStops,
    required this.formatValue,
    required this.semanticValue,
    required this.onChanged,
    super.key,
  });

  final String label;
  final List<int> stops;
  final int value;
  final int defaultValue;
  final List<int> labelledStops;
  final String Function(int value) formatValue;
  final String Function(int value) semanticValue;
  final ValueChanged<int> onChanged;

  int _indexOf(int stop) {
    final int index = stops.indexOf(stop);
    return index == -1 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final double valueIndex = _indexOf(value).toDouble();
    final int defaultIndex = _indexOf(defaultValue);
    final TextStyle headerStyle = textStyles.label.copyWith(
      color: colors.textSecondary,
      fontWeight: FontWeight.bold,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        ExcludeSemantics(
          child: Row(
            children: [
              Expanded(child: Text(label, style: headerStyle)),
              SizedBox(width: layout.s2),
              Text(
                formatValue(value),
                style: headerStyle.copyWith(
                  color: colors.textPrimary,
                  fontFeatures: const <FontFeature>[
                    FontFeature.tabularFigures(),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: layout.s2),
        FluxerSlider(
          defaultValue: valueIndex,
          value: valueIndex,
          factoryDefaultValue: defaultIndex.toDouble(),
          maxValue: (stops.length - 1).toDouble(),
          markers: <double>[
            for (int i = 0; i < stops.length; i++) i.toDouble(),
          ],
          equidistant: true,
          stickToMarkers: true,
          markerPosition: FluxerSliderMarkerPosition.below,
          markerLabelWidth: 40,
          markerAreaHeight: 26,
          shrinkMarkerLabels: false,
          semanticLabel: label,
          semanticValue: (double index) => semanticValue(stops[index.round()]),
          onMarkerRender: (double index) =>
              _markerLabel(context, index.round(), defaultIndex),
          onValueChange: (double index) {
            final int next = stops[index.round()];
            if (next != value) {
              onChanged(next);
            }
          },
        ),
      ],
    );
  }

  Widget _markerLabel(BuildContext context, int index, int defaultIndex) {
    final int stop = stops[index];
    if (!labelledStops.contains(stop)) {
      return const SizedBox.shrink();
    }
    final colors = context.colors;
    return Text(
      formatValue(stop),
      style: context.textStyles.smallText.copyWith(
        color: index == defaultIndex
            ? colors.textPositive
            : colors.textSecondary,
      ),
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }
}
