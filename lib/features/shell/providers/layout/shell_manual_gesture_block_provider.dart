import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shell_manual_gesture_block_provider.g.dart';

@Riverpod(keepAlive: true)
class ShellManualGestureBlock extends _$ShellManualGestureBlock {
  @override
  bool build() => false;

  void setBlocked({required bool value}) {
    if (state == value) {
      return;
    }
    state = value;
  }
}
