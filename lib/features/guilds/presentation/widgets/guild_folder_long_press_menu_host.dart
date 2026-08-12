import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

typedef FolderLongPressMenuCallback =
    Future<void> Function(Offset globalPosition);

class GuildFolderLongPressMenuHost extends ConsumerStatefulWidget {
  const GuildFolderLongPressMenuHost({
    required this.itemId,
    required this.menuAnchorKey,
    required this.onLongPressMenu,
    required this.child,
    super.key,
  });

  final String itemId;
  final GlobalKey menuAnchorKey;
  final FolderLongPressMenuCallback onLongPressMenu;
  final Widget child;

  @override
  ConsumerState<GuildFolderLongPressMenuHost> createState() =>
      _GuildFolderLongPressMenuHostState();
}

class _GuildFolderLongPressMenuHostState
    extends ConsumerState<GuildFolderLongPressMenuHost> {
  Timer? _holdTimer;
  Offset? _pointerDownPosition;
  int? _activePointer;
  bool _suppressMenuForSession = false;
  bool _menuTriggeredForSession = false;

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
    _menuTriggeredForSession = false;
    _holdTimer?.cancel();
    _holdTimer = Timer(kGuildPeekHoldDelay, () {
      if (!mounted || _activePointer != event.pointer) {
        return;
      }
      if (_suppressMenuForSession) {
        return;
      }
      _menuTriggeredForSession = true;
      FluxerHaptics.medium();
      final BuildContext? anchorContext = widget.menuAnchorKey.currentContext;
      final RenderBox? box = anchorContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) {
        return;
      }
      unawaited(widget.onLongPressMenu(sidebarPeekMenuAnchorPosition(box)));
    });
  }

  void _handlePointerMove(PointerMoveEvent event) {
    if (_activePointer != event.pointer) {
      return;
    }
    if (_menuTriggeredForSession) {
      return;
    }
    if (shouldCancelGuildPeekHold(
      pointerDownPosition: _pointerDownPosition,
      currentPosition: event.position,
    )) {
      _suppressMenuForSession = true;
      _holdTimer?.cancel();
    }
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_activePointer != event.pointer) {
      return;
    }
    _holdTimer?.cancel();
    _activePointer = null;
    _pointerDownPosition = null;
    _suppressMenuForSession = false;
    _menuTriggeredForSession = false;
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    if (_activePointer != event.pointer) {
      return;
    }
    _holdTimer?.cancel();
    _activePointer = null;
    _pointerDownPosition = null;
    _suppressMenuForSession = false;
    _menuTriggeredForSession = false;
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
