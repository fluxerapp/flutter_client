import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

class GuildIconPeekGestureHost extends ConsumerStatefulWidget {
  const GuildIconPeekGestureHost({
    required this.itemId,
    required this.content,
    required this.child,
    this.onPeekOpened,
    super.key,
  });

  final String itemId;
  final SidebarPeekContent content;
  final Widget child;
  final VoidCallback? onPeekOpened;

  @override
  ConsumerState<GuildIconPeekGestureHost> createState() =>
      _GuildIconPeekGestureHostState();
}

class _GuildIconPeekGestureHostState
    extends ConsumerState<GuildIconPeekGestureHost> {
  final LayerLink _layerLink = LayerLink();
  Timer? _holdTimer;
  OverlayEntry? _peekOverlay;
  Offset? _pointerDownPosition;
  int? _activePointer;
  bool _suppressPeekForSession = false;
  bool _peekVisible = false;
  bool _selectingPeekItem = false;

  @override
  void dispose() {
    _holdTimer?.cancel();
    _removePeekOverlay();
    super.dispose();
  }

  void _removePeekOverlay() {
    _peekOverlay?.remove();
    _peekOverlay = null;
    _peekVisible = false;
    _selectingPeekItem = false;
  }

  Widget _buildPeekMenuOverlay() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: Listener(
            behavior: HitTestBehavior.translucent,
            onPointerDown: _handleOverlayPointerDown,
            child: const ColoredBox(color: Colors.transparent),
          ),
        ),
        CompositedTransformFollower(
          link: _layerLink,
          targetAnchor: Alignment.centerRight,
          followerAnchor: Alignment.centerLeft,
          offset: const Offset(8, 0),
          showWhenUnlinked: false,
          child: ContextMenuEntranceAnimationHost(
            alignment: Alignment.centerLeft,
            child: widget.content.buildPanel(
              context: context,
              onSelect: (Object action) {
                unawaited(_handleItemTap(action));
              },
            ),
          ),
        ),
      ],
    );
  }

  void _handleOverlayPointerDown(PointerDownEvent event) {
    final Object? action = widget.content.hitTestAction(event.position);
    if (action != null) {
      unawaited(_handleItemTap(action));
      return;
    }
    _dismissPeekOverlay();
  }

  Future<void> _handleItemTap(Object action) async {
    if (!mounted) {
      return;
    }
    _dismissPeekOverlay();
    final PeekSelection result = await widget.content.handleSelection(
      context,
      action,
    );
    if (!mounted) {
      return;
    }
    if (result == PeekSelection.keepOpen) {
      _restorePeekOverlay();
    }
  }

  void _showPeekOverlay({bool playHaptic = true}) {
    if (_peekVisible || _suppressPeekForSession || !mounted) {
      return;
    }
    if (playHaptic) {
      FluxerHaptics.medium();
    }
    _peekOverlay = OverlayEntry(
      builder: (BuildContext overlayContext) =>
          Positioned.fill(child: _buildPeekMenuOverlay()),
    );
    Overlay.of(context, rootOverlay: true).insert(_peekOverlay!);
    setState(() => _peekVisible = true);
    if (playHaptic) {
      widget.onPeekOpened?.call();
    }
  }

  void _dismissPeekOverlay({bool suppressSession = false}) {
    if (suppressSession) {
      _suppressPeekForSession = true;
    }
    _removePeekOverlay();
    if (mounted) {
      setState(() {});
    }
  }

  void _restorePeekOverlay() {
    _suppressPeekForSession = false;
    _showPeekOverlay(playHaptic: false);
  }

  void _handlePointerDown(PointerDownEvent event) {
    if (_peekVisible) {
      return;
    }
    if (event.buttons != kPrimaryButton) {
      return;
    }
    _activePointer = event.pointer;
    _pointerDownPosition = event.position;
    _suppressPeekForSession = false;
    _selectingPeekItem = false;
    _holdTimer?.cancel();
    _holdTimer = Timer(kGuildPeekHoldDelay, () {
      if (!mounted || _activePointer != event.pointer) {
        return;
      }
      if (_suppressPeekForSession) {
        return;
      }
      _showPeekOverlay();
    });
  }

  void _handlePointerMove(PointerMoveEvent event) {
    if (_activePointer != event.pointer) {
      return;
    }
    if (_peekVisible) {
      if (widget.content.hitTestAction(event.position) != null) {
        _selectingPeekItem = true;
        return;
      }
      if (_selectingPeekItem) {
        return;
      }
      if (shouldSuppressPeekForDrag(
        pointerDownPosition: _pointerDownPosition,
        currentPosition: event.position,
      )) {
        _dismissPeekOverlay(suppressSession: true);
      }
      return;
    }
    if (shouldCancelGuildPeekHold(
      pointerDownPosition: _pointerDownPosition,
      currentPosition: event.position,
    )) {
      _suppressPeekForSession = true;
      _holdTimer?.cancel();
    }
  }

  Future<void> _handlePointerUp(PointerUpEvent event) async {
    if (_activePointer != event.pointer) {
      return;
    }
    _holdTimer?.cancel();
    if (_peekVisible && !_suppressPeekForSession) {
      final Object? action = widget.content.hitTestAction(event.position);
      if (action != null && mounted) {
        await _handleItemTap(action);
      }
    }
    _activePointer = null;
    _pointerDownPosition = null;
    _suppressPeekForSession = false;
    _selectingPeekItem = false;
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    if (_activePointer != event.pointer) {
      return;
    }
    _holdTimer?.cancel();
    _dismissPeekOverlay();
    _activePointer = null;
    _pointerDownPosition = null;
    _suppressPeekForSession = false;
    _selectingPeekItem = false;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<DragState>(guildDragProvider, (
      DragState? previous,
      DragState next,
    ) {
      if (!_peekVisible) {
        return;
      }
      if (next.dragItemId == widget.itemId && next.hasMovedFromHoldPoint) {
        _dismissPeekOverlay(suppressSession: true);
      }
    });

    return CompositedTransformTarget(
      link: _layerLink,
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: _handlePointerDown,
        onPointerMove: _handlePointerMove,
        onPointerUp: _handlePointerUp,
        onPointerCancel: _handlePointerCancel,
        child: widget.child,
      ),
    );
  }
}
