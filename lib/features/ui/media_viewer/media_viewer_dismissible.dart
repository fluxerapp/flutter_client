import 'package:fluxer_app/features/ui/media_viewer/media_viewer_dismiss.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:material_ui/material_ui.dart';

class MediaViewerDismissible extends StatefulWidget {
  const MediaViewerDismissible({
    required this.child,
    required this.onDismissProgress,
    required this.onClose,
    this.enabled = true,
    this.onDismissAnimatingChanged,
    super.key,
  });

  final Widget child;
  final bool enabled;
  final ValueChanged<double> onDismissProgress;
  final VoidCallback onClose;
  final ValueChanged<bool>? onDismissAnimatingChanged;

  @override
  State<MediaViewerDismissible> createState() => _MediaViewerDismissibleState();
}

class _MediaViewerDismissibleState extends State<MediaViewerDismissible>
    with TickerProviderStateMixin {
  static const Duration _snapBackDuration = Duration(milliseconds: 220);
  static const Duration _dismissDuration = Duration(milliseconds: 180);

  double _dragOffset = 0;
  bool _isDismissAnimating = false;
  AnimationController? _offsetController;
  Animation<double>? _offsetAnimation;
  VoidCallback? _offsetListener;

  @override
  void didUpdateWidget(MediaViewerDismissible oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.enabled && oldWidget.enabled) {
      _resetDismissState();
    }
  }

  @override
  void dispose() {
    _stopOffsetAnimation();
    super.dispose();
  }

  void _stopOffsetAnimation() {
    final Animation<double>? animation = _offsetAnimation;
    final VoidCallback? listener = _offsetListener;
    if (animation != null && listener != null) {
      animation.removeListener(listener);
    }
    _offsetController?.dispose();
    _offsetController = null;
    _offsetAnimation = null;
    _offsetListener = null;
  }

  void _resetDismissState() {
    if (_dragOffset == 0 && !_isDismissAnimating) {
      return;
    }
    _stopOffsetAnimation();
    setState(() {
      _dragOffset = 0;
      _isDismissAnimating = false;
    });
    widget.onDismissProgress(0);
    widget.onDismissAnimatingChanged?.call(false);
  }

  void _reportDismissProgress() {
    widget.onDismissProgress(
      mediaViewerDismissProgress(
        dragOffset: _dragOffset,
        viewportHeight: MediaQuery.sizeOf(context).height,
      ),
    );
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    if (!widget.enabled || _isDismissAnimating) {
      return;
    }
    setState(() {
      _dragOffset += details.delta.dy;
    });
    _reportDismissProgress();
  }

  Future<void> _handleVerticalDragEnd(DragEndDetails details) async {
    if (!widget.enabled || _isDismissAnimating) {
      return;
    }
    final double viewportHeight = MediaQuery.sizeOf(context).height;
    if (mediaViewerShouldDismissAfterDrag(
      dragOffset: _dragOffset,
      velocity: details.velocity.pixelsPerSecond.dy,
      viewportHeight: viewportHeight,
    )) {
      await _animateDismiss();
      return;
    }
    await _animateSnapBack();
  }

  Future<void> _animateOffset({
    required double end,
    required Duration duration,
    required Curve curve,
  }) async {
    final double begin = _dragOffset;
    if (begin == end) {
      return;
    }
    _stopOffsetAnimation();
    final AnimationController controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: curve,
    );
    void listener() {
      setState(() {
        _dragOffset = begin + ((end - begin) * animation.value);
      });
      _reportDismissProgress();
    }

    _offsetController = controller;
    _offsetAnimation = animation;
    _offsetListener = listener;
    animation.addListener(listener);
    try {
      await controller.forward();
    } on TickerCanceled {
      return;
    }
    if (!identical(_offsetController, controller)) {
      return;
    }
    _stopOffsetAnimation();
  }

  Future<void> _animateSnapBack() async {
    if (_dragOffset == 0) {
      return;
    }
    await _animateOffset(
      end: 0,
      duration: _snapBackDuration,
      curve: Curves.easeOutCubic,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _dragOffset = 0;
    });
    _reportDismissProgress();
  }

  Future<void> _animateDismiss() async {
    if (_isDismissAnimating) {
      return;
    }
    setState(() {
      _isDismissAnimating = true;
    });
    widget.onDismissAnimatingChanged?.call(true);
    await _animateOffset(
      end: mediaViewerDismissExitOffset(
        dragOffset: _dragOffset,
        viewportHeight: MediaQuery.sizeOf(context).height,
      ),
      duration: _dismissDuration,
      curve: Curves.easeInCubic,
    );
    if (!mounted) {
      return;
    }
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    final double dismissProgress = mediaViewerDismissProgress(
      dragOffset: _dragOffset,
      viewportHeight: MediaQuery.sizeOf(context).height,
    );
    final double contentScale = mediaViewerDismissContentScale(
      dismissProgress: dismissProgress,
    );
    final bool gesturesEnabled = widget.enabled && !_isDismissAnimating;
    return FluxerGestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: gesturesEnabled ? _handleVerticalDragUpdate : null,
      onVerticalDragEnd: gesturesEnabled ? _handleVerticalDragEnd : null,
      child: Transform.translate(
        offset: Offset(0, _dragOffset),
        child: Transform.scale(scale: contentScale, child: widget.child),
      ),
    );
  }
}
