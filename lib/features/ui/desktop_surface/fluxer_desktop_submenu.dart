part of 'fluxer_desktop_surface.dart';

const double kFluxerDesktopSubmenuSideOffset = 10;
const Duration _kSubmenuOpenDelay = Duration(milliseconds: 100);
const Duration _kSubmenuCloseDelay = Duration(milliseconds: 150);

abstract interface class FluxerDesktopSubmenuHandle {
  bool get isOpen;
  void open({bool focusFirst = false});
  void close();
  void hoverTrigger({required bool inside});
}

typedef FluxerDesktopSubmenuTriggerBuilder =
    Widget Function(BuildContext context, FluxerDesktopSubmenuHandle submenu);

class FluxerDesktopSubmenu extends StatefulWidget {
  const FluxerDesktopSubmenu({
    required this.builder,
    required this.triggerBuilder,
    this.width,
    this.enabled = true,
    this.triggerFocusNode,
    super.key,
  });

  FluxerDesktopSubmenu.hover({
    required Widget child,
    required this.builder,
    this.width,
    this.enabled = true,
    super.key,
  }) : triggerFocusNode = null,
       triggerBuilder = ((BuildContext _, FluxerDesktopSubmenuHandle submenu) =>
           MouseRegion(
             onEnter: (_) => submenu.hoverTrigger(inside: true),
             onExit: (_) => submenu.hoverTrigger(inside: false),
             child: child,
           ));

  final WidgetBuilder builder;
  final FluxerDesktopSubmenuTriggerBuilder triggerBuilder;
  final double? width;
  final bool enabled;
  final FocusNode? triggerFocusNode;

  @override
  State<FluxerDesktopSubmenu> createState() => _FluxerDesktopSubmenuState();
}

class _FluxerDesktopSubmenuState extends State<FluxerDesktopSubmenu>
    implements FluxerDesktopSubmenuHandle {
  final OverlayPortalController _portal = OverlayPortalController();
  final GlobalKey<FluxerDesktopMenuNavigatorState> _panelNavigator =
      GlobalKey<FluxerDesktopMenuNavigatorState>();
  Timer? _openTimer;
  Timer? _closeTimer;
  bool _focusFirstOnOpen = false;
  FluxerDesktopMenuNavigatorState? _navigator;

  _FluxerDesktopSubmenuState? get _parent => context
      .getInheritedWidgetOfExactType<_FluxerDesktopSubmenuParentScope>()
      ?.submenu;

  @override
  bool get isOpen => _portal.isShowing;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _navigator = FluxerDesktopMenuNavigator.maybeOf(context);
  }

  @override
  void didUpdateWidget(FluxerDesktopSubmenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.enabled && isOpen) {
      close();
    }
  }

  @override
  void dispose() {
    _openTimer?.cancel();
    _closeTimer?.cancel();
    _navigator?.didCloseSubmenu(this);
    super.dispose();
  }

  @override
  void open({bool focusFirst = false}) {
    if (!widget.enabled || !mounted) {
      return;
    }
    _openTimer?.cancel();
    _keepOpen();
    if (_portal.isShowing) {
      if (focusFirst) {
        _panelNavigator.currentState?.focusFirst();
      }
      return;
    }
    _focusFirstOnOpen = focusFirst;
    _navigator?.didOpenSubmenu(this);
    setState(_portal.show);
  }

  @override
  void close() {
    _openTimer?.cancel();
    _closeTimer?.cancel();
    if (!mounted || !_portal.isShowing) {
      return;
    }
    final bool hadFocus = _panelNavigator.currentState?._root.hasFocus ?? false;
    _navigator?.didCloseSubmenu(this);
    setState(_portal.hide);
    if (hadFocus) {
      _navigator?.focusRoot();
    }
  }

  @override
  void hoverTrigger({required bool inside}) {
    if (inside) {
      _closeTimer?.cancel();
      _parent?._keepOpen();
      if (_portal.isShowing || !widget.enabled) {
        return;
      }
      _openTimer?.cancel();
      _openTimer = Timer(_kSubmenuOpenDelay, open);
      return;
    }
    _openTimer?.cancel();
    if (_portal.isShowing) {
      _closeTimer?.cancel();
      _closeTimer = Timer(_kSubmenuCloseDelay, close);
    }
  }

  void _keepOpen() {
    _closeTimer?.cancel();
    _parent?._keepOpen();
  }

  void _scheduleClose() {
    _openTimer?.cancel();
    _closeTimer?.cancel();
    _closeTimer = Timer(_kSubmenuCloseDelay, close);
    _parent?._scheduleClose();
  }

  void _dismissToTrigger() {
    close();
    final FocusNode? trigger = widget.triggerFocusNode;
    if (trigger != null && trigger.canRequestFocus) {
      trigger.requestFocus();
    }
  }

  Rect? _anchorRect() {
    final RenderObject? anchor = context.findRenderObject();
    final RenderObject? overlay = Overlay.maybeOf(
      context,
    )?.context.findRenderObject();
    if (anchor is! RenderBox ||
        overlay is! RenderBox ||
        !anchor.attached ||
        !anchor.hasSize) {
      return null;
    }
    return anchor.localToGlobal(Offset.zero, ancestor: overlay) & anchor.size;
  }

  Widget _buildOverlay(BuildContext overlayContext) {
    final Rect? anchor = _anchorRect();
    if (anchor == null) {
      return const SizedBox.shrink();
    }
    final Widget content = SingleChildScrollView(
      child: Builder(builder: widget.builder),
    );
    final double? width = widget.width;
    return _FluxerDesktopSubmenuParentScope(
      submenu: this,
      child: CustomSingleChildLayout(
        delegate: FluxerDesktopSubmenuLayoutDelegate(
          anchor: anchor,
          textDirection:
              Directionality.maybeOf(overlayContext) ?? TextDirection.ltr,
        ),
        child: MouseRegion(
          onEnter: (_) => _keepOpen(),
          onExit: (_) => _scheduleClose(),
          child: width == null
              ? FluxerDesktopMenuPanel.fitContent(
                  autofocus: false,
                  focusFirstOnOpen: _focusFirstOnOpen,
                  onDismiss: _dismissToTrigger,
                  navigatorKey: _panelNavigator,
                  child: content,
                )
              : FluxerDesktopMenuPanel(
                  width: width,
                  autofocus: false,
                  focusFirstOnOpen: _focusFirstOnOpen,
                  onDismiss: _dismissToTrigger,
                  navigatorKey: _panelNavigator,
                  child: content,
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _portal,
      overlayChildBuilder: _buildOverlay,
      child: widget.triggerBuilder(context, this),
    );
  }
}

class _FluxerDesktopSubmenuParentScope extends InheritedWidget {
  const _FluxerDesktopSubmenuParentScope({
    required this.submenu,
    required super.child,
  });

  final _FluxerDesktopSubmenuState submenu;

  @override
  bool updateShouldNotify(_FluxerDesktopSubmenuParentScope oldWidget) =>
      submenu != oldWidget.submenu;
}

class FluxerDesktopSubmenuLayoutDelegate extends SingleChildLayoutDelegate {
  FluxerDesktopSubmenuLayoutDelegate({
    required this.anchor,
    required this.textDirection,
    this.sideOffset = kFluxerDesktopSubmenuSideOffset,
  });

  final Rect anchor;
  final TextDirection textDirection;
  final double sideOffset;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.deflate(const EdgeInsets.all(_kEdgePadding)).loosen();
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    const double edge = _kEdgePadding;
    final double after = anchor.right + sideOffset;
    final double before = anchor.left - sideOffset - childSize.width;
    final bool fitsAfter = after + childSize.width <= size.width - edge;
    final bool fitsBefore = before >= edge;
    final double x;
    if (textDirection == TextDirection.rtl) {
      x = fitsBefore || !fitsAfter ? before : after;
    } else {
      x = fitsAfter || !fitsBefore ? after : before;
    }
    final double maxX = math.max(edge, size.width - edge - childSize.width);
    final double maxY = math.max(edge, size.height - edge - childSize.height);
    return Offset(x.clamp(edge, maxX), anchor.top.clamp(edge, maxY));
  }

  @override
  bool shouldRelayout(FluxerDesktopSubmenuLayoutDelegate oldDelegate) {
    return anchor != oldDelegate.anchor ||
        textDirection != oldDelegate.textDirection ||
        sideOffset != oldDelegate.sideOffset;
  }
}
