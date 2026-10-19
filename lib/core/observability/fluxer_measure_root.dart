import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:measure_flutter/measure_flutter.dart';

class FluxerMeasureRoot extends StatelessWidget {
  const FluxerMeasureRoot({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!AppBuildConfig.hasObservabilityConfig) {
      return child;
    }
    return MeasureWidget(child: child);
  }
}
