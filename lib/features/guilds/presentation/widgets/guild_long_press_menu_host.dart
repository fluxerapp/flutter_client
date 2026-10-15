import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

abstract interface class GuildLongPressMenu {
  void prepareMenu();

  void openMenu();

  void dismissMenu();
}

class GuildLongPressMenuHost extends ConsumerStatefulWidget {
  const GuildLongPressMenuHost({
    required this.itemId,
    required this.menu,
    required this.child,
    super.key,
  });

  final String itemId;
  final ValueGetter<GuildLongPressMenu?> menu;
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
  bool _menuOpened = false;

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
    _menuOpened = false;
    _holdTimer?.cancel();
    widget.menu()?.prepareMenu();
    _holdTimer = Timer(kGuildPeekHoldDelay, () {
      if (!mounted || _activePointer != event.pointer) {
        return;
      }
      if (_suppressMenuForSession) {
        return;
      }
      _menuOpened = true;
      FluxerHaptics.medium();
      widget.menu()?.openMenu();
    });
  }

  void _handlePointerMove(PointerMoveEvent event) {
    if (_activePointer != event.pointer) {
      return;
    }
    if (!_menuOpened &&
        shouldCancelGuildPeekHold(
          pointerDownPosition: _pointerDownPosition,
          currentPosition: event.position,
        )) {
      _suppressMenuForSession = true;
      _holdTimer?.cancel();
    }
  }

  void _dismissOpenedMenu() {
    _suppressMenuForSession = true;
    _holdTimer?.cancel();
    if (_menuOpened) {
      _menuOpened = false;
      widget.menu()?.dismissMenu();
    }
  }

  void _resetPointerSession() {
    _holdTimer?.cancel();
    _activePointer = null;
    _pointerDownPosition = null;
    _suppressMenuForSession = false;
    _menuOpened = false;
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_activePointer != event.pointer) {
      return;
    }
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
        _dismissOpenedMenu();
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
