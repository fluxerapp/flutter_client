import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slowmode_rate_limited_alert_provider.g.dart';

@Riverpod(keepAlive: true)
class SlowmodeRateLimitedAlert extends _$SlowmodeRateLimitedAlert {
  @override
  Duration? build() => null;

  void show(Duration remaining) {
    state = remaining;
  }

  void clear() {
    state = null;
  }
}
