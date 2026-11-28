import 'dart:math' as math;

enum PickerGridMetrics {
  gif(padding: 8, gap: 8, top: 0),
  media(padding: 10, gap: 8, top: 0),
  popout(padding: 14, gap: 12, top: 14);

  const PickerGridMetrics({
    required this.padding,
    required this.gap,
    required this.top,
  });

  static const double minColumnWidth = 227;

  final double padding;
  final double gap;
  final double top;

  int columnsFor(double width, {int? maxColumns}) {
    final int columns = math.max(
      2,
      ((width - padding * 2) / minColumnWidth).floor(),
    );
    return maxColumns == null ? columns : math.min(columns, maxColumns);
  }

  double laneWidth(double width, int columns) =>
      (width - padding * 2 - gap * (columns - 1)) / columns;

  double laneLeft(int column, double laneWidth) =>
      padding + column * (laneWidth + gap);
}
