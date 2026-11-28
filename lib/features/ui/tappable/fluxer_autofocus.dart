import 'package:fluxer_app/material_ui.dart';

class FluxerAutofocus extends InheritedWidget {
  const FluxerAutofocus({required super.child, this.enabled = true, super.key});

  final bool enabled;

  static bool of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<FluxerAutofocus>()?.enabled ??
      false;

  @override
  bool updateShouldNotify(FluxerAutofocus oldWidget) =>
      enabled != oldWidget.enabled;
}
