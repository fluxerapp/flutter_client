import 'dart:math' as math;
import 'dart:ui' show Rect;

import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_grid_layout.dart';

int voiceGridPageCount({required int tileCount, required int tilesPerPage}) {
  if (tileCount <= 0 || tilesPerPage <= 0) {
    return 0;
  }
  return (tileCount / tilesPerPage).ceil();
}

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

double? voiceVideoAspectRatio({required int width, required int height}) {
  if (width <= 0 || height <= 0) {
    return null;
  }
  return width / height;
}

double? voiceVideoAspectRatioFromSettings(Map<String, dynamic> settings) {
  return voiceVideoAspectRatio(
    width: _voiceVideoIntSetting(settings['width']),
    height: _voiceVideoIntSetting(settings['height']),
  );
}

int _voiceVideoIntSetting(Object? value) {
  if (value is int) {
    return value;
  }
  if (value is num && value.isFinite) {
    return value.round();
  }
  if (value is String) {
    return double.tryParse(value)?.round() ?? 0;
  }
  return 0;
}

Rect voiceHangoutCenteredAspectRect({
  required double width,
  required double height,
  double aspectRatio = voiceGridTileAspectRatio,
}) {
  if (width <= 0 || height <= 0 || aspectRatio <= 0) {
    return Rect.zero;
  }
  final double fittedWidth = math.min(width, height * aspectRatio);
  final double fittedHeight = fittedWidth / aspectRatio;
  return Rect.fromLTWH(
    (width - fittedWidth) / 2,
    (height - fittedHeight) / 2,
    fittedWidth,
    fittedHeight,
  );
}

double voiceHangoutFilmstripCrossAxis({required bool compact}) {
  return compact ? 96 : 112;
}

double voiceHangoutFloatingSelfWidth({required bool compact}) {
  return compact ? 108 : 132;
}

double voiceHangoutFloatingSelfHeight({required bool compact}) {
  return voiceHangoutFloatingSelfWidth(compact: compact) /
      voiceGridTileAspectRatio;
}
