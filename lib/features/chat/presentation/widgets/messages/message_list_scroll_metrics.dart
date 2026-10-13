const double kMessageListMetricsEpsilon = 0.5;

bool _stable(double current, double last) =>
    (current - last).abs() <= kMessageListMetricsEpsilon;

bool isPixelOnlyScrollMetricsChange({
  required double viewportDimension,
  required double minScrollExtent,
  required double maxScrollExtent,
  required double? lastViewportDimension,
  required double? lastMinScrollExtent,
  required double? lastMaxScrollExtent,
}) {
  if (lastViewportDimension == null ||
      lastMinScrollExtent == null ||
      lastMaxScrollExtent == null) {
    return false;
  }
  return _stable(viewportDimension, lastViewportDimension) &&
      _stable(minScrollExtent, lastMinScrollExtent) &&
      _stable(maxScrollExtent, lastMaxScrollExtent);
}
