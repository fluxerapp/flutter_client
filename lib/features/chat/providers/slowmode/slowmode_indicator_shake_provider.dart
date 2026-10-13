import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slowmode_indicator_shake_provider.g.dart';

@Riverpod(keepAlive: true)
class SlowmodeIndicatorShake extends _$SlowmodeIndicatorShake {
  @override
  int build() => 0;

  void requestShake() {
    state = state + 1;
  }
}
