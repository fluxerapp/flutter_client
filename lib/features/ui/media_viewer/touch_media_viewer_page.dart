import 'dart:async';
import 'dart:typed_data';

import 'package:fluxer_app/features/ui/media_viewer/media_viewer_dismissible.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:material_ui/material_ui.dart';

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

  void _handleDismissProgress(double progress) {
    if (!widget.isCurrentPage) {
      return;
    }
    widget.onDismissProgress(progress);
  }

  void _handleDismissAnimatingChanged(bool isAnimating) {
    if (_isDismissAnimating == isAnimating) {
      return;
    }
    setState(() {
      _isDismissAnimating = isAnimating;
    });
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
    return FluxerGestureDetector(
      behavior: HitTestBehavior.translucent,
      onDoubleTapDown: _handleDoubleTapDown,
      child: MediaViewerDismissible(
        enabled: widget.isCurrentPage && !_isZoomed,
        onDismissProgress: _handleDismissProgress,
        onDismissAnimatingChanged: _handleDismissAnimatingChanged,
        onClose: widget.onClose,
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
