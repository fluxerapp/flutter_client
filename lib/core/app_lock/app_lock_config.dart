enum AppLockTimeout {
  immediately(Duration.zero),
  thirtySeconds(Duration(seconds: 30)),
  oneMinute(Duration(minutes: 1)),
  fiveMinutes(Duration(minutes: 5)),
  fifteenMinutes(Duration(minutes: 15)),
  oneHour(Duration(hours: 1));

  const AppLockTimeout(this.duration);

  final Duration duration;
}

const int appLockPinLength = 6;
