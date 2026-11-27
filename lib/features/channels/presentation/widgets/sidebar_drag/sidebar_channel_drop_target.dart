import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/channels/domain/voice_participant_drag_item.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_drop_indicator.dart';
import 'package:fluxer_app/material_ui.dart';

typedef SidebarDropTargetBuilder =
    Widget Function(BuildContext context, bool isOver);

typedef SidebarChannelDropCallback =
    void Function(ChannelReorderDragItem item, ChannelReorderDropResult result);

class SidebarChannelDropTarget extends StatefulWidget {
  const SidebarChannelDropTarget({
    required this.target,
    required this.onChannelDrop,
    required this.builder,
    this.onParticipantDrop,
    super.key,
  });

  final ChannelReorderTarget target;
  final SidebarChannelDropCallback onChannelDrop;
  final ValueChanged<VoiceParticipantDragItem>? onParticipantDrop;
  final SidebarDropTargetBuilder builder;

  @override
  State<SidebarChannelDropTarget> createState() =>
      _SidebarChannelDropTargetState();
}

class _SidebarChannelDropTargetState extends State<SidebarChannelDropTarget> {
  ChannelReorderIndicator? _indicator;
  bool _isOver = false;

  bool _canAccept(Object? data) {
    if (data is ChannelReorderDragItem) {
      return canChannelDropOnTarget(item: data, target: widget.target);
    }
    if (data is VoiceParticipantDragItem) {
      return widget.onParticipantDrop != null;
    }
    return false;
  }

  ({double localY, double height})? _localPoint(Offset globalPosition) {
    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return null;
    }
    return (
      localY: renderObject.globalToLocal(globalPosition).dy,
      height: renderObject.size.height,
    );
  }

  ChannelReorderIntent? _resolveIntent(
    ChannelReorderDragItem item,
    Offset globalPosition,
  ) {
    final ({double localY, double height})? point = _localPoint(globalPosition);
    if (point == null) {
      return null;
    }
    return resolveChannelReorderHover(
      item: item,
      target: widget.target,
      localY: point.localY,
      height: point.height,
    );
  }

  ChannelReorderIndicator? _resolveIndicator(
    Object data,
    Offset globalPosition,
  ) {
    if (data is VoiceParticipantDragItem && widget.onParticipantDrop != null) {
      return null;
    }
    if (data is ChannelReorderDragItem && _canAccept(data)) {
      return _resolveIntent(data, globalPosition)?.indicator;
    }
    final ({double localY, double height})? point = _localPoint(globalPosition);
    if (point == null || point.height <= 0) {
      return null;
    }
    return ChannelReorderIndicator(
      position: resolveChannelReorderIndicatorPosition(
        localY: point.localY,
        height: point.height,
      ),
      isValid: false,
    );
  }

  void _update({required bool isOver, ChannelReorderIndicator? indicator}) {
    if (_isOver == isOver &&
        _indicator?.position == indicator?.position &&
        _indicator?.isValid == indicator?.isValid) {
      return;
    }
    setState(() {
      _isOver = isOver;
      _indicator = indicator;
    });
  }

  void _handleMove(DragTargetDetails<Object> details) {
    _update(
      isOver: true,
      indicator: _resolveIndicator(details.data, details.offset),
    );
  }

  void _handleAccept(DragTargetDetails<Object> details) {
    final Object data = details.data;
    _update(isOver: false);
    if (data is VoiceParticipantDragItem) {
      widget.onParticipantDrop?.call(data);
      return;
    }
    if (data is ChannelReorderDragItem) {
      final ChannelReorderDropResult? result = _resolveIntent(
        data,
        details.offset,
      )?.result;
      if (result != null) {
        widget.onChannelDrop(data, result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ChannelReorderIndicator? indicator = _indicator;
    return DragTarget<Object>(
      onWillAcceptWithDetails: (DragTargetDetails<Object> details) =>
          _canAccept(details.data),
      onMove: _handleMove,
      onLeave: (_) => _update(isOver: false),
      onAcceptWithDetails: _handleAccept,
      builder:
          (
            BuildContext context,
            List<Object?> candidateData,
            List<dynamic> rejectedData,
          ) {
            return Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                widget.builder(context, _isOver),
                if (indicator != null)
                  SidebarDropIndicator(indicator: indicator),
              ],
            );
          },
    );
  }
}
