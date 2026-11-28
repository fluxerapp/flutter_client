import 'package:fluxer_app/material_ui.dart';

class FluxerRovingFocusItem extends InheritedWidget {
  const FluxerRovingFocusItem({required super.child, super.key});

  static Element? itemElementOf(BuildContext context) =>
      context.getElementForInheritedWidgetOfExactType<FluxerRovingFocusItem>();

  @override
  bool updateShouldNotify(FluxerRovingFocusItem oldWidget) => false;
}
