import 'package:clock/clock.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_day_provider.g.dart';

const Duration kLocalDayRecheckInterval = Duration(minutes: 1);

DateTime localDayOf(DateTime now) => DateTime(now.year, now.month, now.day);

Duration nextLocalDayCheckDelay(DateTime now) {
  final Duration untilMidnight = DateTime(
    now.year,
    now.month,
    now.day + 1,
  ).difference(now);
  return untilMidnight < kLocalDayRecheckInterval
      ? untilMidnight
      : kLocalDayRecheckInterval;
}

@Riverpod(keepAlive: true)
class LocalDay extends _$LocalDay {
  @override
  DateTime build() => localDayOf(clock.now());

  void sync() {
    final DateTime day = localDayOf(clock.now());
    if (day != state) {
      state = day;
    }
  }
}
