import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

class GuildLongPressMenuHost extends ConsumerStatefulWidget {
  const GuildLongPressMenuHost({
    required this.itemId,
    required this.onLongPressMenu,
    required this.child,
    super.key,
  });

  final String itemId;
  final Future<void> Function() onLongPressMenu;
  final Widget child;

  @override
  ConsumerState<GuildLongPressMenuHost> createState() =>
      _GuildLongPressMenuHostState();
}

class _GuildLongPressMenuHostState
    extends ConsumerState<GuildLongPressMenuHost> {
  Timer? _holdTimer;
  Offset? _pointerDownPosition;
  int? _activePointer;
  bool _suppressMenuForSession = false;
  bool _holdThresholdReached = false;

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }

  void _handlePointerDown(PointerDownEvent event) {
    if (event.buttons != kPrimaryButton) {
      return;
    }
    _activePointer = event.pointer;
    _pointerDownPosition = event.position;
    _suppressMenuForSession = false;
    _holdThresholdReached = false;
    _holdTimer?.cancel();
    _holdTimer = Timer(kGuildPeekHoldDelay, () {
      if (!mounted || _activePointer != event.pointer) {
        return;
      }
      if (_suppressMenuForSession) {
        return;
      }
      _holdThresholdReached = true;
      FluxerHaptics.medium();
    });
  }

  void _handlePointerMove(PointerMoveEvent event) {
    if (_activePointer != event.pointer) {
      return;
    }
    if (shouldCancelGuildPeekHold(
      pointerDownPosition: _pointerDownPosition,
      currentPosition: event.position,
    )) {
      _suppressMenuForSession = true;
      _holdTimer?.cancel();
      _holdThresholdReached = false;
    }
  }

  Future<void> _openMenuIfNeeded() async {
    if (!_holdThresholdReached || _suppressMenuForSession) {
      return;
    }
    await widget.onLongPressMenu();
  }

  void _resetPointerSession() {
    _holdTimer?.cancel();
    _activePointer = null;
    _pointerDownPosition = null;
    _suppressMenuForSession = false;
    _holdThresholdReached = false;
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_activePointer != event.pointer) {
      return;
    }
    unawaited(_openMenuIfNeeded());
    _resetPointerSession();
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    if (_activePointer != event.pointer) {
      return;
    }
    _resetPointerSession();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<DragState>(guildDragProvider, (
      DragState? previous,
      DragState next,
    ) {
      if (next.dragItemId == widget.itemId && next.hasMovedFromHoldPoint) {
        _suppressMenuForSession = true;
        _holdTimer?.cancel();
        _holdThresholdReached = false;
      }
    });

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _handlePointerDown,
      onPointerMove: _handlePointerMove,
      onPointerUp: _handlePointerUp,
      onPointerCancel: _handlePointerCancel,
      child: widget.child,
    );
  }
}
