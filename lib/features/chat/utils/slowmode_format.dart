const int _kSecondsPerMinute = 60;
const int _kSecondsPerHour = 3600;

/// Formats [remaining] as a `MM:SS` (or `HH:MM:SS` past an hour) countdown
/// clock, matching the slowmode indicator pill and the web client's
/// `formatSlowmodeTime`. Seconds are rounded up so the clock never reads
/// `00:00` while time still remains.
String formatSlowmodeCountdown(Duration remaining) {
  final int totalSeconds = (remaining.inMilliseconds / 1000).ceil();
  final int hours = totalSeconds ~/ _kSecondsPerHour;
  final int minutes = (totalSeconds % _kSecondsPerHour) ~/ _kSecondsPerMinute;
  final int seconds = totalSeconds % _kSecondsPerMinute;
  final String mm = minutes.toString().padLeft(2, '0');
  final String ss = seconds.toString().padLeft(2, '0');
  if (hours > 0) {
    final String hh = hours.toString().padLeft(2, '0');
    return '$hh:$mm:$ss';
  }
  return '$mm:$ss';
}

String formatSlowmodeDurationLabel(int totalSeconds) {
  final int seconds = totalSeconds.clamp(1, totalSeconds);
  if (seconds >= _kSecondsPerHour) {
    final double hours = seconds / _kSecondsPerHour;
    return '${_trimSlowmodeUnit(hours)}h';
  }
  if (seconds >= _kSecondsPerMinute) {
    final double minutes = seconds / _kSecondsPerMinute;
    return '${_trimSlowmodeUnit(minutes)}m';
  }
  return '${seconds}s';
}

String _trimSlowmodeUnit(double value) {
  if (value == value.roundToDouble()) {
    return value.toInt().toString();
  }
  return value.toStringAsFixed(1);
}
