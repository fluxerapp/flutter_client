import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_drag_controller.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_drag_scope.dart';
import 'package:fluxer_app/material_ui.dart';

class SidebarDraggable<T extends Object> extends StatelessWidget {
  const SidebarDraggable({
    required this.data,
    required this.enabled,
    required this.child,
    this.feedback = const SizedBox.shrink(),
    super.key,
  });

  final T data;
  final bool enabled;
  final Widget feedback;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final SidebarDragController? controller = SidebarDragScope.maybeRead(
      context,
    );
    final bool canDrag = enabled && controller != null;
    return Draggable<T>(
      data: data,
      maxSimultaneousDrags: canDrag ? null : 0,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: feedback,
      onDragStarted: () => controller?.start(data),
      onDragCompleted: () => controller?.end(),
      onDraggableCanceled: (_, _) => controller?.end(),
      child: child,
    );
  }
}
