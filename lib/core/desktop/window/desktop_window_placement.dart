import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:screen_retriever/screen_retriever.dart';

const Size kDesktopWindowMinimumSize = Size(480, 560);
const double _kMaxWorkAreaFraction = 0.9;
const double _kMinVisibleTitlebarWidth = 120;
const double _kMinVisibleTitlebarHeight = 24;

Future<List<Rect>> displayWorkAreas() async {
  try {
    final List<Display> displays = await screenRetriever.getAllDisplays();
    return [
      for (final Display display in displays)
        (display.visiblePosition ?? Offset.zero) &
            (display.visibleSize ?? display.size),
    ];
  } on Object {
    return const [];
  }
}

Future<Rect?> primaryWorkArea() async {
  try {
    final Display display = await screenRetriever.getPrimaryDisplay();
    final Rect area =
        (display.visiblePosition ?? Offset.zero) &
        (display.visibleSize ?? display.size);
    return area.isEmpty ? null : area;
  } on Object {
    return null;
  }
}

Size fitToWorkArea(Size size, Rect? workArea) {
  double width = math.max(size.width, kDesktopWindowMinimumSize.width);
  double height = math.max(size.height, kDesktopWindowMinimumSize.height);
  if (workArea != null) {
    width = math.min(
      width,
      math.max(
        kDesktopWindowMinimumSize.width,
        workArea.width * _kMaxWorkAreaFraction,
      ),
    );
    height = math.min(
      height,
      math.max(
        kDesktopWindowMinimumSize.height,
        workArea.height * _kMaxWorkAreaFraction,
      ),
    );
  }
  return Size(width.floorToDouble(), height.floorToDouble());
}

Rect? workAreaShowingTitlebar(Rect bounds, List<Rect> workAreas) {
  final Rect titlebar = Rect.fromLTWH(
    bounds.left,
    bounds.top,
    bounds.width,
    _kMinVisibleTitlebarHeight,
  );
  for (final Rect area in workAreas) {
    final Rect overlap = titlebar.intersect(area);
    if (overlap.width >= _kMinVisibleTitlebarWidth &&
        overlap.height >= _kMinVisibleTitlebarHeight / 2) {
      return area;
    }
  }
  return null;
}

Offset clampIntoWorkArea(Offset position, Size size, Rect area) {
  return Offset(
    position.dx.clamp(area.left, math.max(area.left, area.right - size.width)),
    position.dy.clamp(area.top, math.max(area.top, area.bottom - size.height)),
  );
}
