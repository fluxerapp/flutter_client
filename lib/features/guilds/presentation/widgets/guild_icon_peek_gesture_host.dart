import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

class GuildIconPeekGestureHost extends ConsumerStatefulWidget {
  const GuildIconPeekGestureHost({
    required this.itemId,
    required this.peekMenu,
    required this.child,
    super.key,
  });

  final String itemId;
  final GuildIconPeekMenuConfig peekMenu;
  final Widget child;

  @override
  ConsumerState<GuildIconPeekGestureHost> createState() =>
      _GuildIconPeekGestureHostState();
}

class _GuildIconPeekGestureHostState
    extends ConsumerState<GuildIconPeekGestureHost> {
  final LayerLink _layerLink = LayerLink();
  final Map<GuildIconPeekAction, GlobalKey> _itemKeys =
      <GuildIconPeekAction, GlobalKey>{
        for (final GuildIconPeekAction action in GuildIconPeekAction.values)
          action: GlobalKey(),
      };
  Timer? _holdTimer;
  OverlayEntry? _peekOverlay;
  Offset? _pointerDownPosition;
  int? _activePointer;
  bool _suppressPeekForSession = false;
  bool _peekVisible = false;

  @override
  void dispose() {
    _holdTimer?.cancel();
    _removePeekOverlay();
    super.dispose();
  }

  List<GuildIconPeekAction> get _visibleActions =>
      visibleGuildIconPeekActions(hasUnread: widget.peekMenu.hasUnread);

  void _removePeekOverlay() {
    _peekOverlay?.remove();
    _peekOverlay = null;
    _peekVisible = false;
  }

  Widget _buildPeekMenuOverlay() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IgnorePointer(
          child: UnconstrainedBox(
            child: CompositedTransformFollower(
              link: _layerLink,
              targetAnchor: Alignment.centerRight,
              followerAnchor: Alignment.centerLeft,
              offset: const Offset(8, 0),
              showWhenUnlinked: false,
              child: ContextMenuEntranceAnimationHost(
                alignment: Alignment.centerLeft,
                child: GuildIconPeekMenuPanel(
                  guildName: widget.peekMenu.guildName,
                  hasUnread: widget.peekMenu.hasUnread,
                  itemKeys: _itemKeys,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Listener(
            behavior: HitTestBehavior.translucent,
            onPointerDown: _handleOverlayPointerDown,
            child: const ColoredBox(color: Colors.transparent),
          ),
        ),
      ],
    );
  }

  void _handleOverlayPointerDown(PointerDownEvent event) {
    final GuildIconPeekAction? action = hitTestPeekAction(
      globalPosition: event.position,
      itemKeys: _itemKeys,
      visibleActions: _visibleActions,
    );
    if (action != null) {
      unawaited(_handleItemTap(action));
      return;
    }
    _dismissPeekOverlay();
  }

  Future<void> _handleItemTap(GuildIconPeekAction action) async {
    if (!mounted) {
      return;
    }
    _dismissPeekOverlay();
    await widget.peekMenu.onAction(context, action);
  }

  void _showPeekOverlay() {
    if (_peekVisible || _suppressPeekForSession || !mounted) {
      return;
    }
    FluxerHaptics.medium();
    _peekOverlay = OverlayEntry(
      builder: (BuildContext overlayContext) =>
          Positioned.fill(child: _buildPeekMenuOverlay()),
    );
    Overlay.of(context, rootOverlay: true).insert(_peekOverlay!);
    setState(() => _peekVisible = true);
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
      final GuildIconPeekAction? action = hitTestPeekAction(
        globalPosition: event.position,
        itemKeys: _itemKeys,
        visibleActions: _visibleActions,
      );
      if (action != null && mounted) {
        await _handleItemTap(action);
      }
    }
    _activePointer = null;
    _pointerDownPosition = null;
    _suppressPeekForSession = false;
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
