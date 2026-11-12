import 'dart:io';

const int _kLinuxClockTicksPerSecond = 100;

Duration? androidProcessAge() {
  if (!Platform.isAndroid) {
    return null;
  }
  try {
    final String stat = File('/proc/self/stat').readAsStringSync();
    final List<String> fields = stat
        .substring(stat.lastIndexOf(')') + 2)
        .split(' ');
    final int startTicks = int.parse(fields[19]);
    final double uptimeSeconds = double.parse(
      File('/proc/uptime').readAsStringSync().split(' ').first,
    );
    final double ageSeconds =
        uptimeSeconds - startTicks / _kLinuxClockTicksPerSecond;
    if (ageSeconds < 0) {
      return null;
    }
    return Duration(milliseconds: (ageSeconds * 1000).round());
  } on Object {
    return null;
  }
}

int? androidTotalMemoryBytes() {
  if (!Platform.isAndroid) {
    return null;
  }
  try {
    for (final String line in File('/proc/meminfo').readAsLinesSync()) {
      if (!line.startsWith('MemTotal:')) {
        continue;
      }
      final String kilobytes = line
          .substring('MemTotal:'.length)
          .trim()
          .split(RegExp(r'\s+'))
          .first;
      return int.parse(kilobytes) * 1024;
    }
  } on Object {
    return null;
  }
  return null;
}
