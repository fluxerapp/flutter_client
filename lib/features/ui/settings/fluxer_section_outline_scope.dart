import 'package:fluxer_app/features/ui/settings/fluxer_section_outline_controller.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerSectionOutlineScope
    extends InheritedNotifier<FluxerSectionOutlineController> {
  const FluxerSectionOutlineScope({
    required FluxerSectionOutlineController controller,
    required super.child,
    super.key,
  }) : super(notifier: controller);

  static FluxerSectionOutlineController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FluxerSectionOutlineScope>()
        ?.notifier;
  }

  static FluxerSectionOutlineController? read(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<FluxerSectionOutlineScope>()
        ?.notifier;
  }
}
