import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluxer_app/features/ui/media_viewer/media_viewer_dismiss.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';

class TouchMediaViewerPage extends StatefulWidget {
  const TouchMediaViewerPage({
    required this.child,
    required this.transformationController,
    required this.isCurrentPage,
    required this.onDismissProgress,
    required this.onClose,
    required this.onZoomChanged,
    this.maxScale = 5,
    super.key,
  });

  final Widget child;
  final TransformationController transformationController;
  final bool isCurrentPage;
  final ValueChanged<double> onDismissProgress;
  final VoidCallback onClose;
  final ValueChanged<bool> onZoomChanged;
  final double maxScale;

  @override
  State<TouchMediaViewerPage> createState() => _TouchMediaViewerPageState();
}

class _TouchMediaViewerPageState extends State<TouchMediaViewerPage>
    with TickerProviderStateMixin {
  static const double _zoomThreshold = 1.01;
  static const double _snapBackScale = 1.05;
  static const double _doubleTapScale = 2.5;
  static const Duration _snapBackDuration = Duration(milliseconds: 220);
  static const Duration _dismissDuration = Duration(milliseconds: 180);

  double _dragOffset = 0;
  bool _isZoomed = false;
  bool _isDismissAnimating = false;
  AnimationController? _matrixAnimationController;
  Animation<double>? _matrixAnimation;
  VoidCallback? _matrixAnimationListener;

  @override
  void initState() {
    super.initState();
    widget.transformationController.addListener(_handleTransformationChanged);
    _syncZoomState(shouldNotifyParent: false);
  }

  @override
  void didUpdateWidget(TouchMediaViewerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isCurrentPage && oldWidget.isCurrentPage) {
      _resetDismissState(shouldNotifyParent: true);
    }
    if (widget.isCurrentPage && !oldWidget.isCurrentPage) {
      _syncZoomState(shouldNotifyParent: true);
    }
  }

  @override
  void dispose() {
    widget.transformationController.removeListener(
      _handleTransformationChanged,
    );
    _stopMatrixAnimation();
    super.dispose();
  }

  double _readScale() {
    return widget.transformationController.value.getMaxScaleOnAxis();
  }

  void _handleTransformationChanged() {
    _syncZoomState(shouldNotifyParent: widget.isCurrentPage);
  }

  void _syncZoomState({required bool shouldNotifyParent}) {
    final bool isZoomed = _readScale() > _zoomThreshold;
    if (isZoomed == _isZoomed) {
      return;
    }
    setState(() {
      _isZoomed = isZoomed;
    });
    if (shouldNotifyParent) {
      widget.onZoomChanged(isZoomed);
    }
  }

  void _resetDismissState({required bool shouldNotifyParent}) {
    if (_dragOffset == 0 && !_isDismissAnimating) {
      return;
    }
    setState(() {
      _dragOffset = 0;
      _isDismissAnimating = false;
    });
    if (shouldNotifyParent) {
      widget.onDismissProgress(0);
    }
  }

  void _reportDismissProgress() {
    if (!widget.isCurrentPage) {
      return;
    }
    widget.onDismissProgress(
      mediaViewerDismissProgress(
        dragOffset: _dragOffset,
        viewportHeight: MediaQuery.sizeOf(context).height,
      ),
    );
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    if (_isZoomed || _isDismissAnimating) {
      return;
    }
    setState(() {
      _dragOffset += details.delta.dy;
    });
    _reportDismissProgress();
  }

  Future<void> _handleVerticalDragEnd(DragEndDetails details) async {
    if (_isZoomed || _isDismissAnimating) {
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

    animation.addListener(listener);
    await controller.forward();
    animation.removeListener(listener);
    controller.dispose();
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

  void _handleInteractionEnd(ScaleEndDetails details) {
    if (_readScale() < _snapBackScale) {
      unawaited(_animateToMatrix(Matrix4.identity()));
    }
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    if (_isDismissAnimating) {
      return;
    }
    if (_readScale() > _zoomThreshold) {
      unawaited(_animateToMatrix(Matrix4.identity()));
      return;
    }
    final Offset focalPoint = details.localPosition;
    final Matrix4 targetMatrix = Matrix4.identity()
      ..translateByDouble(focalPoint.dx, focalPoint.dy, 0, 1)
      ..scaleByDouble(_doubleTapScale, _doubleTapScale, 1, 1)
      ..translateByDouble(-focalPoint.dx, -focalPoint.dy, 0, 1);
    unawaited(_animateToMatrix(targetMatrix));
  }

  Future<void> _animateToMatrix(Matrix4 targetMatrix) async {
    _stopMatrixAnimation();
    final Matrix4 begin = widget.transformationController.value;
    if (begin == targetMatrix) {
      return;
    }
    final AnimationController controller = AnimationController(
      vsync: this,
      duration: _snapBackDuration,
    );
    final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    );
    void listener() {
      widget.transformationController.value = _lerpMatrix(
        begin,
        targetMatrix,
        animation.value,
      );
    }

    _matrixAnimationController = controller;
    _matrixAnimation = animation;
    _matrixAnimationListener = listener;
    animation.addListener(listener);
    await controller.forward();
    _stopMatrixAnimation();
  }

  void _stopMatrixAnimation() {
    final Animation<double>? animation = _matrixAnimation;
    final VoidCallback? listener = _matrixAnimationListener;
    if (animation != null && listener != null) {
      animation.removeListener(listener);
    }
    _matrixAnimationController?.dispose();
    _matrixAnimationController = null;
    _matrixAnimation = null;
    _matrixAnimationListener = null;
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
    return FluxerGestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: _isZoomed || _isDismissAnimating
          ? null
          : _handleVerticalDragUpdate,
      onVerticalDragEnd: _isZoomed || _isDismissAnimating
          ? null
          : _handleVerticalDragEnd,
      onDoubleTapDown: _handleDoubleTapDown,
      child: Transform.translate(
        offset: Offset(0, _dragOffset),
        child: Transform.scale(
          scale: contentScale,
          child: InteractiveViewer(
            transformationController: widget.transformationController,
            minScale: 1,
            maxScale: widget.maxScale,
            panEnabled: _isZoomed,
            scaleEnabled: !_isDismissAnimating,
            boundaryMargin: _isZoomed
                ? const EdgeInsets.all(80)
                : EdgeInsets.zero,
            clipBehavior: Clip.none,
            onInteractionEnd: _handleInteractionEnd,
            child: Center(child: widget.child),
          ),
        ),
      ),
    );
  }
}

Matrix4 _lerpMatrix(Matrix4 begin, Matrix4 end, double t) {
  final Float64List beginStorage = begin.storage;
  final Float64List endStorage = end.storage;
  final Float64List result = Float64List(16);
  for (int i = 0; i < 16; i++) {
    result[i] = beginStorage[i] + ((endStorage[i] - beginStorage[i]) * t);
  }
  return Matrix4.fromFloat64List(result);
}
