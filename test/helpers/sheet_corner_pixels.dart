import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

class ScreenPixels {
  ScreenPixels._(this._bytes, this._width, this._height, this._ratio);

  final ByteData _bytes;
  final int _width;
  final int _height;
  final double _ratio;

  static Future<ScreenPixels> capture(WidgetTester tester) async {
    final RenderView view = tester.binding.renderViews.first;
    final OffsetLayer layer = view.debugLayer! as OffsetLayer;
    final double ratio = tester.view.devicePixelRatio;
    final ({ByteData bytes, int width, int height}) image = (await tester
        .runAsync(() async {
          final ui.Image image = await layer.toImage(view.paintBounds);
          final ByteData bytes = (await image.toByteData())!;
          final int width = image.width;
          final int height = image.height;
          image.dispose();
          return (bytes: bytes, width: width, height: height);
        }))!;
    return ScreenPixels._(image.bytes, image.width, image.height, ratio);
  }

  Color at(Offset logical) {
    final int x = (logical.dx * _ratio).floor().clamp(0, _width - 1);
    final int y = (logical.dy * _ratio).floor().clamp(0, _height - 1);
    final int offset = (y * _width + x) * 4;
    return Color.fromARGB(
      _bytes.getUint8(offset + 3),
      _bytes.getUint8(offset),
      _bytes.getUint8(offset + 1),
      _bytes.getUint8(offset + 2),
    );
  }
}

String _hex(Color color) =>
    '0x${color.toARGB32().toRadixString(16).padLeft(8, '0')}';

bool _sameColor(Color a, Color b) {
  int channel(double v) => (v * 255).round();
  return (channel(a.r) - channel(b.r)).abs() <= 1 &&
      (channel(a.g) - channel(b.g)).abs() <= 1 &&
      (channel(a.b) - channel(b.b)).abs() <= 1 &&
      (channel(a.a) - channel(b.a)).abs() <= 1;
}

List<String> sheetCornerColorMismatches({
  required ScreenPixels pixels,
  required Rect sheet,
  required double radius,
  required Color surface,
  double edgeBand = 1.5,
}) {
  final List<String> mismatches = <String>[];
  final List<double> centersX = <double>[
    sheet.left + radius,
    sheet.right - radius,
  ];
  for (final double centerX in centersX) {
    final bool leftCorner = centerX < sheet.center.dx;
    final double cornerLeft = leftCorner ? sheet.left : sheet.right - radius;
    final Offset center = Offset(centerX, sheet.top + radius);
    for (int dy = 0; dy < radius.ceil(); dy++) {
      for (int dx = 0; dx < radius.ceil(); dx++) {
        final Offset point = Offset(
          cornerLeft + dx + 0.5,
          sheet.top + dy + 0.5,
        );
        final double distance = (point - center).distance;
        final Color actual = pixels.at(point);
        if (distance <= radius - edgeBand) {
          if (!_sameColor(actual, surface)) {
            mismatches.add(
              'inside $point: ${_hex(actual)} != surface ${_hex(surface)}',
            );
          }
        } else if (distance >= radius + edgeBand) {
          final Color backdrop = pixels.at(
            Offset(point.dx, math.max(0, sheet.top - 3)),
          );
          if (!_sameColor(actual, backdrop)) {
            mismatches.add(
              'outside $point: ${_hex(actual)} != backdrop ${_hex(backdrop)}',
            );
          }
        }
      }
    }
    for (int dy = radius.ceil(); dy < radius.ceil() + 16; dy++) {
      for (int dx = 1; dx < 4; dx++) {
        final Offset point = Offset(
          leftCorner ? sheet.left + dx + 0.5 : sheet.right - dx - 0.5,
          sheet.top + dy + 0.5,
        );
        final Color actual = pixels.at(point);
        if (!_sameColor(actual, surface)) {
          mismatches.add(
            'edge $point: ${_hex(actual)} != surface ${_hex(surface)}',
          );
        }
      }
    }
  }
  return mismatches;
}
