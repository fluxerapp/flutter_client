import 'package:cupertino_ui/cupertino_ui.dart' show ScrollMetricsNotification;
import 'package:flutter/cupertino.dart' show ScrollMetricsNotification;
import 'package:flutter/material.dart' show ScrollMetricsNotification;
import 'package:flutter/widgets.dart' show ScrollMetricsNotification;
import 'package:fluxer_app/material_ui.dart' show ScrollMetricsNotification;
import 'package:material_ui/material_ui.dart' show ScrollMetricsNotification;

/// Pixel-only [ScrollMetricsNotification]s fire every scrolling frame because
/// extentBefore/extentAfter move with pixels. Those are not layout changes.
const double kMessageListMetricsEpsilon = 0.5;

bool _stable(double current, double last) =>
    (current - last).abs() <= kMessageListMetricsEpsilon;

/// True when only the scroll offset moved: viewport size and both extents
/// are unchanged. A first attach (null last values) is never pixel-only.
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
