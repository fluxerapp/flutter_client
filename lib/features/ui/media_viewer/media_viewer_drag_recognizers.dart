import 'package:flutter/gestures.dart';

mixin _YieldsToPinch on OneSequenceGestureRecognizer {
  final Set<int> _trackedPointers = <int>{};
  bool _accepted = false;

  @override
  void addAllowedPointer(PointerDownEvent event) {
    super.addAllowedPointer(event);
    _trackedPointers.add(event.pointer);
    if (_trackedPointers.length > 1 && !_accepted) {
      resolve(GestureDisposition.rejected);
    }
  }

  @override
  void acceptGesture(int pointer) {
    _accepted = true;
    super.acceptGesture(pointer);
  }

  @override
  void stopTrackingPointer(int pointer) {
    _trackedPointers.remove(pointer);
    super.stopTrackingPointer(pointer);
  }

  @override
  void didStopTrackingLastPointer(int pointer) {
    _trackedPointers.clear();
    _accepted = false;
    super.didStopTrackingLastPointer(pointer);
  }
}

class MediaViewerVerticalDragGestureRecognizer
    extends VerticalDragGestureRecognizer
    with _YieldsToPinch {
  MediaViewerVerticalDragGestureRecognizer({super.debugOwner});
}

class MediaViewerHorizontalDragGestureRecognizer
    extends HorizontalDragGestureRecognizer
    with _YieldsToPinch {
  MediaViewerHorizontalDragGestureRecognizer({
    super.debugOwner,
    super.supportedDevices,
  });
}
