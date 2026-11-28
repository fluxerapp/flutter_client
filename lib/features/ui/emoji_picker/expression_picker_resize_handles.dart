import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/ui/emoji_picker/domain/expression_picker_resize_edge.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kEdgeThickness = 8;
const double _kCornerSize = 20;

class ExpressionPickerResizeHandles extends StatelessWidget {
  const ExpressionPickerResizeHandles({
    required this.onResizeStart,
    required this.onResizeUpdate,
    required this.onResizeEnd,
    required this.onReset,
    super.key,
  });

  final ValueChanged<ExpressionPickerResizeEdge> onResizeStart;
  final ValueChanged<Offset> onResizeUpdate;
  final VoidCallback onResizeEnd;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        for (final ExpressionPickerResizeEdge edge
            in ExpressionPickerResizeEdge.values)
          _handle(edge),
      ],
    );
  }

  Widget _handle(ExpressionPickerResizeEdge edge) {
    final bool corner =
        (edge.movesTop || edge.movesBottom) &&
        (edge.movesLeft || edge.movesRight);
    final bool horizontalEdge = edge.movesTop || edge.movesBottom;
    final bool verticalEdge = edge.movesLeft || edge.movesRight;
    return Positioned(
      top: edge.movesBottom ? null : 0,
      bottom: edge.movesTop ? null : 0,
      left: edge.movesRight ? null : 0,
      right: edge.movesLeft ? null : 0,
      width: corner
          ? _kCornerSize
          : verticalEdge
          ? _kEdgeThickness
          : null,
      height: corner
          ? _kCornerSize
          : horizontalEdge
          ? _kEdgeThickness
          : null,
      child: MouseRegion(
        cursor: _cursorFor(edge),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanStart: (_) => onResizeStart(edge),
          onPanUpdate: (DragUpdateDetails details) =>
              onResizeUpdate(details.delta),
          onPanEnd: (_) => onResizeEnd(),
          onPanCancel: onResizeEnd,
          onDoubleTap: onReset,
        ),
      ),
    );
  }

  static MouseCursor _cursorFor(ExpressionPickerResizeEdge edge) {
    final bool diagonalSupported =
        defaultTargetPlatform != TargetPlatform.macOS;
    return switch (edge) {
      ExpressionPickerResizeEdge.top => SystemMouseCursors.resizeUp,
      ExpressionPickerResizeEdge.bottom => SystemMouseCursors.resizeDown,
      ExpressionPickerResizeEdge.left => SystemMouseCursors.resizeLeft,
      ExpressionPickerResizeEdge.right => SystemMouseCursors.resizeRight,
      ExpressionPickerResizeEdge.topLeft ||
      ExpressionPickerResizeEdge.bottomRight =>
        diagonalSupported
            ? SystemMouseCursors.resizeUpLeftDownRight
            : SystemMouseCursors.precise,
      ExpressionPickerResizeEdge.topRight ||
      ExpressionPickerResizeEdge.bottomLeft =>
        diagonalSupported
            ? SystemMouseCursors.resizeUpRightDownLeft
            : SystemMouseCursors.precise,
    };
  }
}
