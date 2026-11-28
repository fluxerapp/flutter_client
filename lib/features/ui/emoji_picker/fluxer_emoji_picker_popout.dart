import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_size_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/ui/emoji_picker/domain/expression_picker_resize_edge.dart';
import 'package:fluxer_app/features/ui/emoji_picker/expression_picker_geometry.dart';
import 'package:fluxer_app/features/ui/emoji_picker/expression_picker_resize_handles.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_layer.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_layer_stack.dart';
import 'package:fluxer_app/material_ui.dart';

enum FluxerEmojiPickerPlacement { verticalEnd, leftStart, rightStart }

class FluxerEmojiPickerPopout extends ConsumerStatefulWidget {
  const FluxerEmojiPickerPopout({
    required this.child,
    this.onOpenChanged,
    this.onTabChanged,
    this.onEmojiSelected,
    this.onGifSelected,
    this.onStickerSelected,
    this.onFavoriteMemeSelected,
    this.closeOnEmojiSelect = true,
    this.visibleTabs = const [
      ExpressionPickerTab.gifs,
      ExpressionPickerTab.memes,
      ExpressionPickerTab.stickers,
      ExpressionPickerTab.emojis,
    ],
    this.initialTab = ExpressionPickerTab.emojis,
    this.channelId,
    this.placement = FluxerEmojiPickerPlacement.verticalEnd,
    this.crossAxisOffset = 0,
    this.resizable = true,
    this.returnFocusNode,
    super.key,
  });

  final Widget child;
  final ValueChanged<bool>? onOpenChanged;
  final ValueChanged<ExpressionPickerTab>? onTabChanged;
  final ValueChanged<FluxerSelectedEmoji>? onEmojiSelected;
  final ValueChanged<FluxerSelectedGif>? onGifSelected;
  final ValueChanged<StickerEntry>? onStickerSelected;
  final ValueChanged<FavoriteMemeSelection>? onFavoriteMemeSelected;
  final bool closeOnEmojiSelect;
  final List<ExpressionPickerTab> visibleTabs;
  final ExpressionPickerTab initialTab;
  final String? channelId;
  final FluxerEmojiPickerPlacement placement;
  final double crossAxisOffset;
  final bool resizable;
  final FocusNode? returnFocusNode;

  @override
  ConsumerState<FluxerEmojiPickerPopout> createState() =>
      FluxerEmojiPickerPopoutState();
}

class FluxerEmojiPickerPopoutState
    extends ConsumerState<FluxerEmojiPickerPopout>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  final OverlayPortalController _overlayController = OverlayPortalController();
  final Object _tapRegionGroup = Object();
  final FocusNode _panelFocus = FocusNode(
    canRequestFocus: false,
    skipTraversal: true,
  );
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late ExpressionPickerTab _tab = widget.initialTab;

  bool _closing = false;
  Size _storedSize = kExpressionPickerDefaultSize;
  Offset _shift = Offset.zero;
  _ResizeSession? _drag;
  Rect? _lastRect;
  Rect _lastAnchor = Rect.zero;
  Size _lastViewport = Size.zero;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.normalDuration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.duration = context.motion.normal;
  }

  @override
  void didUpdateWidget(FluxerEmojiPickerPopout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.visibleTabs.contains(_tab) && widget.visibleTabs.isNotEmpty) {
      _tab = widget.visibleTabs.contains(widget.initialTab)
          ? widget.initialTab
          : widget.visibleTabs.last;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _panelFocus.dispose();
    super.dispose();
  }

  bool get isOpen => _overlayController.isShowing && !_closing;

  ExpressionPickerTab get selectedTab => _tab;

  bool get _isSidePlacement =>
      widget.placement == FluxerEmojiPickerPlacement.leftStart ||
      widget.placement == FluxerEmojiPickerPlacement.rightStart;

  bool get _animates =>
      !_isSidePlacement && !MediaQuery.disableAnimationsOf(context);

  void toggle() => toggleTab(_tab);

  bool toggleTab(ExpressionPickerTab tab) {
    if (!widget.visibleTabs.contains(tab)) {
      return false;
    }
    if (!isOpen) {
      open(tab: tab);
    } else if (_tab == tab) {
      close();
    } else {
      _selectTab(tab);
    }
    return true;
  }

  void open({ExpressionPickerTab? tab}) {
    if (tab != null && widget.visibleTabs.contains(tab)) {
      _selectTab(tab);
    }
    if (isOpen) {
      return;
    }
    _closing = false;
    _shift = Offset.zero;
    _drag = null;
    if (!_overlayController.isShowing) {
      _overlayController.show();
    }
    if (_animates) {
      _animationController.forward();
    } else {
      _animationController.value = 1;
    }
    widget.onOpenChanged?.call(true);
  }

  void close() {
    if (!_overlayController.isShowing || _closing) {
      return;
    }
    _closing = true;
    _drag = null;
    final bool restoreFocus = _panelFocus.hasFocus;
    widget.onOpenChanged?.call(false);
    if (restoreFocus) {
      widget.returnFocusNode?.requestFocus();
    }
    if (!_animates) {
      _hideOverlay();
      return;
    }
    unawaited(_animationController.reverse().then((_) => _hideOverlay()));
  }

  void _hideOverlay() {
    if (!mounted || !_closing) {
      return;
    }
    _closing = false;
    _animationController.value = 0;
    if (_overlayController.isShowing) {
      _overlayController.hide();
    }
  }

  void _selectTab(ExpressionPickerTab tab) {
    if (_tab == tab) {
      return;
    }
    setState(() => _tab = tab);
    widget.onTabChanged?.call(tab);
  }

  bool get _multiPick => HardwareKeyboard.instance.isShiftPressed;

  void _handleEmojiSelect(String name, String surrogates) {
    widget.onEmojiSelected?.call(
      FluxerSelectedEmoji.fromSelection(name, surrogates),
    );
    if (widget.closeOnEmojiSelect && !_multiPick) {
      close();
    }
  }

  void _handleStickerSelect(StickerEntry sticker) {
    widget.onStickerSelected?.call(sticker);
    if (!_multiPick) {
      close();
    }
  }

  void _handleTapOutside(PointerDownEvent event) {
    if (_drag != null || !FluxerLayerStack.isTopmost(context)) {
      return;
    }
    close();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.escape &&
        isOpen) {
      close();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  Rect? _anchorRect(BuildContext overlayContext) {
    final RenderBox? anchor = context.findRenderObject() as RenderBox?;
    final RenderBox? overlay =
        Overlay.maybeOf(
              overlayContext,
              rootOverlay: true,
            )?.context.findRenderObject()
            as RenderBox?;
    if (anchor == null || !anchor.hasSize || !anchor.attached) {
      return null;
    }
    final Offset origin = anchor.localToGlobal(Offset.zero, ancestor: overlay);
    return origin & anchor.size;
  }

  Rect _placementRect(Rect anchor, Size size, Size viewport) {
    const double pad = kExpressionPickerViewportPadding;
    const double gap = kExpressionPickerAnchorGap;
    final bool ltr = Directionality.of(context) == TextDirection.ltr;
    if (_isSidePlacement) {
      final double spaceRight = viewport.width - anchor.right;
      final double spaceLeft = anchor.left;
      final double spaceEnd = ltr ? spaceRight : spaceLeft;
      final double spaceStart = ltr ? spaceLeft : spaceRight;
      final double needed = size.width + gap + pad;
      final bool openEnd =
          widget.placement == FluxerEmojiPickerPlacement.rightStart
          ? spaceEnd >= needed || spaceEnd >= spaceStart
          : spaceStart < needed && spaceEnd > spaceStart;
      final bool openRight = ltr ? openEnd : !openEnd;
      final double left = openRight
          ? anchor.right + gap
          : anchor.left - gap - size.width;
      return Rect.fromLTWH(left, anchor.top, size.width, size.height);
    }
    final double left = ltr
        ? anchor.right + widget.crossAxisOffset - size.width
        : anchor.left - widget.crossAxisOffset;
    final double above = anchor.top - gap - size.height;
    final double spaceAbove = anchor.top - pad;
    final double spaceBelow = viewport.height - pad - anchor.bottom;
    final double top = above >= pad || spaceAbove >= spaceBelow
        ? above
        : anchor.bottom + gap;
    return Rect.fromLTWH(left, top, size.width, size.height);
  }

  Size _resolvedSize(Rect anchor, Size viewport) {
    final Size available = expressionPickerAvailableSize(viewport);
    return clampExpressionPickerSize(
      widget.resizable ? _storedSize : kExpressionPickerDefaultSize,
      _isSidePlacement
          ? available
          : Size(
              available.width,
              expressionPickerVerticalSpace(anchor: anchor, viewport: viewport),
            ),
    );
  }

  Rect _resolveRect(Rect anchor, Size viewport) {
    final Rect placed = _placementRect(
      anchor,
      _resolvedSize(anchor, viewport),
      viewport,
    );
    return clampExpressionPickerRect(placed.shift(_shift), viewport);
  }

  void _handleResizeStart(ExpressionPickerResizeEdge edge) {
    final Rect? rect = _lastRect;
    if (rect != null) {
      setState(() => _drag = _ResizeSession(edge, rect));
    }
  }

  void _handleResizeUpdate(Offset delta) {
    final _ResizeSession? drag = _drag;
    if (drag == null) {
      return;
    }
    drag.delta += delta;
    setState(() {
      drag.rect = resizeExpressionPickerRect(
        edge: drag.edge,
        startRect: drag.startRect,
        delta: drag.delta,
        viewport: _lastViewport,
      );
    });
  }

  void _handleResizeEnd() {
    final Rect? rect = _drag?.rect;
    if (rect == null) {
      return;
    }
    final Rect placed = _placementRect(_lastAnchor, rect.size, _lastViewport);
    setState(() {
      _shift = rect.topLeft - placed.topLeft;
      _storedSize = rect.size;
      _drag = null;
    });
    ref
        .read(expressionPickerSizeProvider.notifier)
        .setSize(rect.size, persist: true);
  }

  void _handleResizeReset() {
    setState(() {
      _drag = null;
      _shift = Offset.zero;
    });
    ref.read(expressionPickerSizeProvider.notifier).reset();
  }

  Widget _buildPanel(BuildContext context) {
    const double border = kExpressionPickerBorderWidth;
    const Radius radius = Radius.circular(8);
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: expressionPickerSurfaceColor(context),
              borderRadius: const BorderRadius.all(radius),
              border: Border.all(
                color: context.colors.backgroundModifierAccent,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.24),
                  blurRadius: 16,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(border),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  radius - const Radius.circular(border),
                ),
                child: ExpressionPicker(
                  onClose: close,
                  onEmojiSelect: _handleEmojiSelect,
                  onGifSelect: widget.onGifSelected,
                  onStickerSelect: widget.onStickerSelected == null
                      ? null
                      : _handleStickerSelect,
                  onFavoriteMemeSelect: widget.onFavoriteMemeSelected,
                  visibleTabs: widget.visibleTabs,
                  initialTab: _tab,
                  onTabChanged: _selectTab,
                  channelId: widget.channelId,
                  autofocusSearch: true,
                  desktopPopout: true,
                ),
              ),
            ),
          ),
        ),
        if (widget.resizable)
          Positioned.fill(
            child: ExpressionPickerResizeHandles(
              onResizeStart: _handleResizeStart,
              onResizeUpdate: _handleResizeUpdate,
              onResizeEnd: _handleResizeEnd,
              onReset: _handleResizeReset,
            ),
          ),
      ],
    );
  }

  Widget _buildOverlay(BuildContext overlayContext) {
    return LayoutBuilder(
      builder: (BuildContext layoutContext, BoxConstraints constraints) {
        final Size viewport = constraints.biggest;
        final Rect anchor = _anchorRect(layoutContext) ?? _lastAnchor;
        final Rect rect = _drag?.rect ?? _resolveRect(anchor, viewport);
        _lastAnchor = anchor;
        _lastViewport = viewport;
        _lastRect = rect;
        return Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: rect.topLeft - anchor.topLeft,
                child: TapRegion(
                  groupId: _tapRegionGroup,
                  onTapOutside: _handleTapOutside,
                  child: Focus(
                    focusNode: _panelFocus,
                    onKeyEvent: _handleKeyEvent,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SizedBox.fromSize(
                        size: rect.size,
                        child: _buildPanel(layoutContext),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size watchedSize = ref.watch(expressionPickerSizeProvider);
    if (_drag == null) {
      _storedSize = watchedSize;
    }
    return OverlayPortal(
      controller: _overlayController,
      overlayLocation: OverlayChildLocation.rootOverlay,
      overlayChildBuilder: (BuildContext overlayContext) =>
          FluxerLayer(onClose: close, child: _buildOverlay(overlayContext)),
      child: TapRegion(
        groupId: _tapRegionGroup,
        child: CompositedTransformTarget(link: _layerLink, child: widget.child),
      ),
    );
  }
}

class _ResizeSession {
  _ResizeSession(this.edge, this.startRect) : rect = startRect;

  final ExpressionPickerResizeEdge edge;
  final Rect startRect;
  Rect rect;
  Offset delta = Offset.zero;
}
