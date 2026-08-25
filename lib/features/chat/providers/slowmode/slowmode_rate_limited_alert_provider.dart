import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slowmode_rate_limited_alert_provider.g.dart';

@Riverpod(keepAlive: true)
class SlowmodeRateLimitedAlert extends _$SlowmodeRateLimitedAlert {
  @override
  Duration? build() => null;

  Duration? get remaining => state;

  set remaining(Duration value) {
    state = value;
  }

  void clear() {
    state = null;
  }
}
