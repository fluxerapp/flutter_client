import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'obscuring_overlay_tracker_provider.g.dart';

@Riverpod(keepAlive: true)
class ObscuringOverlayTracker extends _$ObscuringOverlayTracker {
  @override
  int build() => 0;

  void push() {
    state = state + 1;
  }

  void pop() {
    if (state <= 0) {
      return;
    }
    state = state - 1;
  }
}

@Riverpod(keepAlive: true)
bool hasObscuringOverlay(Ref ref) {
  return ref.watch(obscuringOverlayTrackerProvider) > 0;
}
