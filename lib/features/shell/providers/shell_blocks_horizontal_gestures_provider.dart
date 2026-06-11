import 'package:fluxer_app/features/shell/providers/shell_manual_gesture_block_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shell_blocks_horizontal_gestures_provider.g.dart';

// True when a modal route or a manual block (recording overlay) owns the gesture.
@Riverpod(keepAlive: true)
bool shellBlocksHorizontalGestures(Ref ref) {
  return ref.watch(shellHasPopupOverlayProvider) ||
      ref.watch(shellManualGestureBlockProvider);
}
