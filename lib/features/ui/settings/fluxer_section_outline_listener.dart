import 'package:fluxer_app/features/ui/settings/fluxer_section_outline_controller.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_section_outline_scope.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerSectionOutlineListener extends StatelessWidget {
  const FluxerSectionOutlineListener({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final FluxerSectionOutlineController? controller =
        FluxerSectionOutlineScope.read(context);
    if (controller == null) {
      return child;
    }
    return NotificationListener<Notification>(
      onNotification: (Notification notification) {
        if ((notification is ScrollNotification &&
                notification.metrics.axis == Axis.vertical) ||
            notification is ScrollMetricsNotification) {
          controller.handleScroll();
        }
        return false;
      },
      child: child,
    );
  }
}
