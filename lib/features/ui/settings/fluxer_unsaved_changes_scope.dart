import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_controller.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerUnsavedChangesScope
    extends InheritedNotifier<FluxerUnsavedChangesController> {
  const FluxerUnsavedChangesScope({
    required FluxerUnsavedChangesController controller,
    required this.showsHeaderBanner,
    required super.child,
    super.key,
  }) : super(notifier: controller);

  final bool showsHeaderBanner;

  FluxerUnsavedChangesController get controller => notifier!;

  static FluxerUnsavedChangesScope? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FluxerUnsavedChangesScope>();
  }

  static FluxerUnsavedChangesScope? read(BuildContext context) {
    return context.getInheritedWidgetOfExactType<FluxerUnsavedChangesScope>();
  }

  @override
  bool updateShouldNotify(FluxerUnsavedChangesScope oldWidget) {
    return showsHeaderBanner != oldWidget.showsHeaderBanner ||
        super.updateShouldNotify(oldWidget);
  }
}
