import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

class AccessibilitySaturationSlider extends ConsumerWidget {
  const AccessibilitySaturationSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double saturationPercent = ref.watch(
      themePreferenceProvider.select((s) => s.saturationFactor * 100),
    );
    return FluxerSlider(
      value: saturationPercent,
      defaultValue: saturationPercent,
      factoryDefaultValue: 100,
      step: 1,
      markers: const <double>[0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
      onMarkerRender: (value) {
        final textStyles = context.textStyles;
        final colors = context.colors;
        final isFactoryDefault = value == 100;
        return FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '${value.round()}%',
            style: textStyles.smallText.copyWith(
              color: isFactoryDefault
                  ? colors.textPositive
                  : colors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
      onValueRender: (value) => Text('${value.round()}%'),
      asValueChanges: (value) {
        ref
            .read(themePreferenceProvider.notifier)
            .previewSaturationFactor(value / 100);
      },
      onValueChange: (value) => unawaited(
        ref
            .read(themePreferenceProvider.notifier)
            .setSaturationFactor(value / 100),
      ),
    );
  }
}
