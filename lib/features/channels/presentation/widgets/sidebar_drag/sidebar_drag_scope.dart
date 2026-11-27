import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_drag_controller.dart';
import 'package:fluxer_app/material_ui.dart';

class SidebarDragScope extends InheritedNotifier<SidebarDragController> {
  const SidebarDragScope({
    required SidebarDragController controller,
    required super.child,
    super.key,
  }) : super(notifier: controller);

  static SidebarDragController? maybeRead(BuildContext context) {
    return context.getInheritedWidgetOfExactType<SidebarDragScope>()?.notifier;
  }

  static Object? activeItemOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SidebarDragScope>()
        ?.notifier
        ?.activeItem;
  }
}
