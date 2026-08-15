import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kGuildChannelSettingsDragTouchSize = 44;
const Duration kGuildChannelSettingsMobileDragDelay = Duration(
  milliseconds: 200,
);

class GuildChannelSettingsDraggable extends StatelessWidget {
  const GuildChannelSettingsDraggable({
    required this.dragItem,
    required this.isMobile,
    required this.rowWidth,
    required this.feedback,
    required this.onDragStarted,
    required this.onDragEnded,
    required this.onDragMove,
    required this.child,
    super.key,
  });

  final ChannelReorderDragItem dragItem;
  final bool isMobile;
  final double rowWidth;
  final Widget feedback;
  final VoidCallback onDragStarted;
  final VoidCallback onDragEnded;
  final ValueChanged<Offset> onDragMove;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    void handleDragStarted() {
      FluxerHaptics.medium();
      onDragStarted();
    }

    void handleDragEnded() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onDragEnded();
      });
    }

    if (isMobile) {
      return LongPressDraggable<ChannelReorderDragItem>(
        data: dragItem,
        delay: kGuildChannelSettingsMobileDragDelay,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        hitTestBehavior: HitTestBehavior.opaque,
        onDragStarted: handleDragStarted,
        onDragUpdate: (DragUpdateDetails details) {
          onDragMove(details.globalPosition);
        },
        onDragEnd: (_) => handleDragEnded(),
        onDraggableCanceled: (_, _) => handleDragEnded(),
        feedback: feedback,
        childWhenDragging: Opacity(opacity: 0, child: child),
        child: child,
      );
    }
    return Draggable<ChannelReorderDragItem>(
      data: dragItem,
      dragAnchorStrategy:
          (Draggable<Object> draggable, BuildContext context, Offset position) {
            return _desktopDragAnchor(
              rowWidth: rowWidth,
              globalPosition: position,
              context: context,
            );
          },
      onDragStarted: handleDragStarted,
      onDragUpdate: (DragUpdateDetails details) {
        onDragMove(details.globalPosition);
      },
      onDragEnd: (_) => handleDragEnded(),
      onDraggableCanceled: (_, _) => handleDragEnded(),
      feedback: feedback,
      childWhenDragging: const SizedBox.shrink(),
      child: child,
    );
  }
}

Widget buildGuildChannelSettingsDragHandle({required Color color}) {
  return SizedBox(
    width: kGuildChannelSettingsDragTouchSize,
    height: kGuildChannelSettingsDragTouchSize,
    child: Center(
      child: PhosphorIcon(
        PhosphorIconsBold.dotsSixVertical,
        size: 18,
        color: color,
      ),
    ),
  );
}

Offset _desktopDragAnchor({
  required double rowWidth,
  required Offset globalPosition,
  required BuildContext context,
}) {
  final RenderBox? box = context.findRenderObject() as RenderBox?;
  if (box == null) {
    return Offset(
      rowWidth - (kGuildChannelSettingsDragTouchSize / 2),
      kGuildChannelSettingsDragTouchSize / 2,
    );
  }
  final Offset localPress = box.globalToLocal(globalPosition);
  return Offset(
    rowWidth - kGuildChannelSettingsDragTouchSize + localPress.dx,
    localPress.dy,
  );
}
