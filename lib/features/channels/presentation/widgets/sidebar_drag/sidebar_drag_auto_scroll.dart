import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_drag_controller.dart';
import 'package:fluxer_app/material_ui.dart';

class SidebarDragAutoScroll extends StatefulWidget {
  const SidebarDragAutoScroll({
    required this.controller,
    required this.scrollController,
    required this.child,
    this.topInset = 0,
    super.key,
  });

  final SidebarDragController controller;
  final ScrollController scrollController;
  final double topInset;
  final Widget child;

  @override
  State<SidebarDragAutoScroll> createState() => _SidebarDragAutoScrollState();
}

class _SidebarDragAutoScrollState extends State<SidebarDragAutoScroll>
    with SingleTickerProviderStateMixin {
  static const double _kEdgeSize = 72;
  static const double _kOutsideTolerance = 24;
  static const double _kMinSpeed = 120;
  static const double _kMaxSpeed = 960;
  static const Duration _kMaxFrameDelta = Duration(milliseconds: 32);

  late final Ticker _ticker = createTicker(_handleTick);
  Duration? _lastTick;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleDragChanged);
  }

  @override
  void didUpdateWidget(SidebarDragAutoScroll oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_handleDragChanged);
      widget.controller.addListener(_handleDragChanged);
      _handleDragChanged();
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleDragChanged);
    _ticker.dispose();
    super.dispose();
  }

  void _handleDragChanged() {
    _lastTick = null;
    if (!widget.controller.isDragging) {
      _ticker.stop();
      return;
    }
    if (!_ticker.isActive) {
      _ticker.start();
    }
  }

  double _velocity() {
    final Offset? pointer = widget.controller.pointer;
    final RenderObject? renderObject = context.findRenderObject();
    if (pointer == null ||
        renderObject is! RenderBox ||
        !renderObject.hasSize) {
      return 0;
    }
    final double origin = renderObject.localToGlobal(Offset.zero).dy;
    final double start = origin + widget.topInset;
    final double end = origin + renderObject.size.height;
    final double y = pointer.dy;
    if (y < start - _kOutsideTolerance || y > end + _kOutsideTolerance) {
      return 0;
    }
    final double edgeSize = math.min(_kEdgeSize, (end - start) / 3);
    if (edgeSize <= 0) {
      return 0;
    }
    if (y < start + edgeSize) {
      final double intensity = math.min(1, (start + edgeSize - y) / edgeSize);
      return -math.max(_kMinSpeed, _kMaxSpeed * intensity * intensity);
    }
    if (y > end - edgeSize) {
      final double intensity = math.min(1, (y - (end - edgeSize)) / edgeSize);
      return math.max(_kMinSpeed, _kMaxSpeed * intensity * intensity);
    }
    return 0;
  }

  void _handleTick(Duration elapsed) {
    final Duration? lastTick = _lastTick;
    _lastTick = elapsed;
    final ScrollController scrollController = widget.scrollController;
    if (lastTick == null || !scrollController.hasClients) {
      return;
    }
    final double velocity = _velocity();
    if (velocity == 0) {
      return;
    }
    final Duration delta = elapsed - lastTick;
    final double seconds =
        (delta > _kMaxFrameDelta ? _kMaxFrameDelta : delta).inMicroseconds /
        Duration.microsecondsPerSecond;
    final ScrollPosition position = scrollController.position;
    final double next = (position.pixels + velocity * seconds).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    if (next != position.pixels) {
      position.jumpTo(next);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerMove: (PointerMoveEvent event) =>
          widget.controller.updatePointer(event.position),
      child: widget.child,
    );
  }
}
