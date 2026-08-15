import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:material_ui/material_ui.dart';

class VolumePopoutControl extends StatefulWidget {
  const VolumePopoutControl({
    required this.volume,
    required this.isMuted,
    required this.onVolumeChanged,
    required this.onToggleMute,
    this.iconSize = 18,
    this.buttonSize = 28,
    this.popoutHeight = 80,
    super.key,
  });

  final double volume;
  final bool isMuted;
  final ValueChanged<double> onVolumeChanged;
  final VoidCallback onToggleMute;
  final double iconSize;
  final double buttonSize;
  final double popoutHeight;

  @override
  State<VolumePopoutControl> createState() => _VolumePopoutControlState();
}

class _VolumePopoutControlState extends State<VolumePopoutControl> {
  static const double _kPopoutWidth = 20;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  double get _effectiveVolume => widget.isMuted ? 0 : widget.volume;

  void _toggleOpen() {
    if (_isOpen) {
      _close();
      return;
    }
    _open();
  }

  void _open() {
    if (_isOpen) {
      return;
    }
    final OverlayState overlay = Overlay.of(context, rootOverlay: true);
    _overlayEntry = OverlayEntry(builder: _buildOverlayEntry);
    setState(() {
      _isOpen = true;
    });
    overlay.insert(_overlayEntry!);
  }

  void _close({bool silently = false}) {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (silently || !mounted || !_isOpen) {
      return;
    }
    setState(() {
      _isOpen = false;
    });
  }

  void _handleTrackInteraction({
    required double globalDy,
    required RenderBox renderBox,
  }) {
    final Offset local = renderBox.globalToLocal(Offset(0, globalDy));
    final double relative =
        ((renderBox.size.height - local.dy) / renderBox.size.height).clamp(
          0,
          1,
        );
    widget.onVolumeChanged(relative);
  }

  @override
  void dispose() {
    _close(silently: true);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VolumePopoutControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isOpen &&
        (oldWidget.volume != widget.volume ||
            oldWidget.isMuted != widget.isMuted)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_isOpen) {
          return;
        }
        _overlayEntry?.markNeedsBuild();
      });
    }
  }

  Widget _buildOverlayEntry(BuildContext context) {
    final colors = context.colors;
    return Positioned.fill(
      child: Stack(
        children: [
          FluxerGestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _close,
          ),
          CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(
              (widget.buttonSize - _kPopoutWidth) / 2,
              -(widget.popoutHeight + 8),
            ),
            child: Material(
              color: Colors.transparent,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.backgroundSecondary,
                  border: Border.all(color: colors.backgroundModifierAccent),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x4D000000),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: _kPopoutWidth,
                  height: widget.popoutHeight,
                  child: Builder(
                    builder: (BuildContext sliderContext) {
                      return Listener(
                        behavior: HitTestBehavior.opaque,
                        onPointerDown: (PointerDownEvent event) {
                          final RenderObject? renderObject = sliderContext
                              .findRenderObject();
                          if (renderObject is! RenderBox) {
                            return;
                          }
                          _handleTrackInteraction(
                            globalDy: event.position.dy,
                            renderBox: renderObject,
                          );
                        },
                        onPointerMove: (PointerMoveEvent event) {
                          final RenderObject? renderObject = sliderContext
                              .findRenderObject();
                          if (renderObject is! RenderBox) {
                            return;
                          }
                          _handleTrackInteraction(
                            globalDy: event.position.dy,
                            renderBox: renderObject,
                          );
                        },
                        child: Center(
                          child: SizedBox(
                            width: 12,
                            height: widget.popoutHeight - 10,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Align(
                                    child: Container(
                                      width: 4,
                                      decoration: BoxDecoration(
                                        color: colors.backgroundModifierAccent,
                                        borderRadius: BorderRadius.circular(99),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 4,
                                  right: 4,
                                  bottom: 0,
                                  height:
                                      (widget.popoutHeight - 10) *
                                      _effectiveVolume,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: colors.brandPrimary,
                                      borderRadius: BorderRadius.circular(99),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom:
                                      (((widget.popoutHeight - 10) *
                                                  _effectiveVolume) -
                                              6)
                                          .clamp(0, widget.popoutHeight - 22),
                                  child: Center(
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: colors.brandPrimary,
                                        shape: BoxShape.circle,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x4D000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        width: widget.buttonSize,
        height: widget.buttonSize,
        child: IconButton(
          constraints: BoxConstraints.tightFor(
            width: widget.buttonSize,
            height: widget.buttonSize,
          ),
          padding: EdgeInsets.zero,
          onPressed: _toggleOpen,
          icon: Icon(
            widget.isMuted
                ? Icons.volume_off_rounded
                : _effectiveVolume < 0.67
                ? Icons.volume_down_rounded
                : Icons.volume_up_rounded,
            color: colors.textOnBrandPrimary,
            size: widget.iconSize,
          ),
        ),
      ),
    );
  }
}
