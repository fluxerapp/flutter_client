import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_controller.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_scope.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerUnsavedChangesGuard extends StatelessWidget {
  const FluxerUnsavedChangesGuard({
    required this.controller,
    required this.showsHeaderBanner,
    required this.child,
    super.key,
  });

  final FluxerUnsavedChangesController controller;
  final bool showsHeaderBanner;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FluxerUnsavedChangesScope(
      controller: controller,
      showsHeaderBanner: showsHeaderBanner,
      child: ListenableBuilder(
        listenable: controller,
        child: child,
        builder: (BuildContext context, Widget? child) => PopScope<Object?>(
          canPop: !controller.isDirty,
          onPopInvokedWithResult: (bool didPop, Object? result) {
            if (!didPop) {
              controller.flash();
            }
          },
          child: child!,
        ),
      ),
    );
  }
}
