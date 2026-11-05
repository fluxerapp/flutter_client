part of 'fluxer_desktop_surface.dart';

class FluxerDesktopHoverFlyout extends StatefulWidget {
  const FluxerDesktopHoverFlyout({
    required this.child,
    required this.flyoutBuilder,
    this.width = kFluxerDesktopMenuDefaultWidth,
    super.key,
  });

  final Widget child;
  final WidgetBuilder flyoutBuilder;
  final double width;

  @override
  State<FluxerDesktopHoverFlyout> createState() =>
      _FluxerDesktopHoverFlyoutState();
}

class _FluxerDesktopHoverFlyoutState extends State<FluxerDesktopHoverFlyout> {
  final OverlayPortalController _portal = OverlayPortalController();
  Timer? _closeTimer;
  Rect? _anchor;

  _FluxerDesktopHoverFlyoutState? get _parent =>
      context.getInheritedWidgetOfExactType<_FlyoutParentScope>()?.flyout;

  void _open() {
    _keepOpen();
    if (_portal.isShowing) {
      return;
    }
    final Rect? anchor = fluxerDesktopWidgetRectOf(
      context,
      navigator: Navigator.of(context),
    );
    if (anchor == null) {
      return;
    }
    _anchor = anchor;
    _portal.show();
  }

  void _keepOpen() {
    _closeTimer?.cancel();
    _parent?._keepOpen();
  }

  void _scheduleClose() {
    _closeTimer?.cancel();
    _closeTimer = Timer(_kFlyoutCloseDelay, () {
      if (mounted && _portal.isShowing) {
        _portal.hide();
      }
    });
    _parent?._scheduleClose();
  }

  @override
  void dispose() {
    _closeTimer?.cancel();
    super.dispose();
  }

  Widget _buildFlyout(BuildContext context) {
    return _FlyoutParentScope(
      flyout: this,
      child: CustomSingleChildLayout(
        delegate: FluxerDesktopAnchoredLayoutDelegate(
          posture: deviceFoldPostureOf(context),
          anchor: _anchor,
          placement: FluxerDesktopPlacement.rightStart,
        ),
        child: MouseRegion(
          onEnter: (_) => _keepOpen(),
          onExit: (_) => _scheduleClose(),
          child: FluxerDesktopMenuPanel(
            width: widget.width,
            child: Builder(builder: widget.flyoutBuilder),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _portal,
      overlayChildBuilder: _buildFlyout,
      child: MouseRegion(
        onEnter: (_) => _open(),
        onExit: (_) => _scheduleClose(),
        child: widget.child,
      ),
    );
  }
}

class _FlyoutParentScope extends InheritedWidget {
  const _FlyoutParentScope({required this.flyout, required super.child});

  final _FluxerDesktopHoverFlyoutState flyout;

  @override
  bool updateShouldNotify(_FlyoutParentScope oldWidget) =>
      flyout != oldWidget.flyout;
}
