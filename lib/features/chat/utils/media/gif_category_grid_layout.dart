import 'dart:math' as math;

List<int> visibleGifCategoryIndexes({
  required int itemCount,
  required int columnCount,
  required double tileHeight,
  required double gap,
  required double scrollOffset,
  required double viewportHeight,
}) {
  if (itemCount <= 0 ||
      columnCount <= 0 ||
      tileHeight <= 0 ||
      viewportHeight <= 0) {
    return const <int>[];
  }

  final rowStride = tileHeight + gap;
  if (rowStride <= 0) {
    return const <int>[];
  }

  final rowCount = (itemCount / columnCount).ceil();
  final startRow = (scrollOffset / rowStride).floor().clamp(0, rowCount - 1);
  final endRow = ((scrollOffset + viewportHeight) / rowStride).floor().clamp(
    0,
    rowCount - 1,
  );
  final indexes = <int>[];
  for (var row = startRow; row <= endRow; row++) {
    final rowStart = row * columnCount;
    final rowEnd = math.min(rowStart + columnCount, itemCount);
    for (var index = rowStart; index < rowEnd; index++) {
      indexes.add(index);
    }
  }
  return indexes;
}

double gifCategoryGridContentHeight({
  required int itemCount,
  required int columnCount,
  required double tileHeight,
  required double gap,
  required double bottomPadding,
}) {
  if (itemCount <= 0 || columnCount <= 0 || tileHeight <= 0) {
    return bottomPadding;
  }

  final rowCount = (itemCount / columnCount).ceil();
  return rowCount * tileHeight +
      math.max(0, rowCount - 1) * gap +
      bottomPadding;
}
