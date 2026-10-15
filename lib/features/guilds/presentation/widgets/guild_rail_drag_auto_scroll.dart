import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

class GuildRailDragAutoScroll extends ConsumerStatefulWidget {
  const GuildRailDragAutoScroll({
    required this.controller,
    required this.topInset,
    required this.child,
    super.key,
  });

  final ScrollController controller;
  final double topInset;
  final Widget child;

  @override
  ConsumerState<GuildRailDragAutoScroll> createState() =>
      _GuildRailDragAutoScrollState();
}

class _GuildRailDragAutoScrollState
    extends ConsumerState<GuildRailDragAutoScroll>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker = createTicker(_handleTick);
  late final GuildDrag _drag;
  Duration? _lastTick;
  bool _scrolledLastTick = false;

  @override
  void initState() {
    super.initState();
    _drag = ref.read(guildDragProvider.notifier);
  }

  @override
  void dispose() {
    _ticker.dispose();
    _drag.clearVerticalBounds();
    super.dispose();
  }

  void _syncBounds() {
    final RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) {
      return;
    }
    final Offset topLeft = box.localToGlobal(Offset.zero);
    _drag.updateVerticalBounds(
      top: topLeft.dy + widget.topInset,
      bottom: topLeft.dy + box.size.height,
    );
  }

  void _setActive(bool active) {
    _lastTick = null;
    _scrolledLastTick = false;
    if (!active) {
      _ticker.stop();
      return;
    }
    _syncBounds();
    if (!_ticker.isActive) {
      _ticker.start();
    }
  }

  void _handleTick(Duration elapsed) {
    if (_scrolledLastTick && _drag.refreshHoverAfterAutoScroll()) {
      FluxerHaptics.selection();
    }
    _scrolledLastTick = false;
    final Duration? lastTick = _lastTick;
    _lastTick = elapsed;
    final double velocity = _drag.autoScrollVelocity();
    if (lastTick == null || velocity == 0 || !widget.controller.hasClients) {
      return;
    }
    final ScrollPosition position = widget.controller.position;
    final double seconds =
        (elapsed - lastTick).inMicroseconds / Duration.microsecondsPerSecond;
    final double target = (position.pixels + velocity * seconds).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    if (target == position.pixels) {
      return;
    }
    position.jumpTo(target);
    _scrolledLastTick = true;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(
      guildDragProvider.select(
        (DragState state) => state.isDragging && state.hasMovedFromHoldPoint,
      ),
      (bool? previous, bool next) => _setActive(next),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _syncBounds();
      }
    });
    return widget.child;
  }
}
