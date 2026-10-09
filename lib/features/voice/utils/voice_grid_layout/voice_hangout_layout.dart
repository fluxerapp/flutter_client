import 'dart:math' as math;

List<List<T>> voiceGridPaginateTiles<T>({
  required List<T> tiles,
  required int tilesPerPage,
}) {
  if (tiles.isEmpty || tilesPerPage <= 0) {
    return <List<T>>[];
  }
  final List<List<T>> pages = <List<T>>[];
  for (int i = 0; i < tiles.length; i += tilesPerPage) {
    final int end = math.min(i + tilesPerPage, tiles.length);
    pages.add(tiles.sublist(i, end));
  }
  return pages;
}

double voiceHangoutFilmstripCrossAxis({required bool compact}) {
  return compact ? 96 : 112;
}
