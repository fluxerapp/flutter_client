import 'dart:convert';
import 'dart:typed_data';

import 'package:fluxer_app/shared/utils/image_utils.dart';
import 'package:image/image.dart' as img;

enum ExpressionImageOptimizationReason { animated, processed, svg }

class ExpressionImageOptimizationException implements Exception {
  ExpressionImageOptimizationException({
    required this.reason,
    required this.actualSizeBytes,
    required this.maxSizeBytes,
  });

  final ExpressionImageOptimizationReason reason;
  final int actualSizeBytes;
  final int maxSizeBytes;

  @override
  String toString() {
    return 'ExpressionImageOptimizationException($reason, $actualSizeBytes, $maxSizeBytes)';
  }
}

bool isSvgBytes(Uint8List bytes) {
  if (bytes.length < 5) {
    return false;
  }
  final String prefix = String.fromCharCodes(bytes.take(64)).toLowerCase();
  return prefix.contains('<svg') || prefix.contains('<?xml');
}

Future<String> optimizeGuildEmojiImage({
  required Uint8List bytes,
  required int maxSizeBytes,
}) {
  return _optimizeExpressionImage(
    bytes: bytes,
    maxSizeBytes: maxSizeBytes,
    targetSize: 128,
  );
}

Future<String> optimizeGuildStickerImage({
  required Uint8List bytes,
  required int maxSizeBytes,
}) {
  return _optimizeExpressionImage(
    bytes: bytes,
    maxSizeBytes: maxSizeBytes,
    targetSize: 320,
  );
}

Future<String> _optimizeExpressionImage({
  required Uint8List bytes,
  required int maxSizeBytes,
  required int targetSize,
}) async {
  if (isSvgBytes(bytes)) {
    if (bytes.length <= maxSizeBytes) {
      return base64Encode(bytes);
    }
    throw ExpressionImageOptimizationException(
      reason: ExpressionImageOptimizationReason.svg,
      actualSizeBytes: bytes.length,
      maxSizeBytes: maxSizeBytes,
    );
  }
  final AnimationCheckResult animation = ImageUtils.checkAnimated(bytes);
  if (animation.isAnimated) {
    if (bytes.length <= maxSizeBytes) {
      return base64Encode(bytes);
    }
    throw ExpressionImageOptimizationException(
      reason: ExpressionImageOptimizationReason.animated,
      actualSizeBytes: bytes.length,
      maxSizeBytes: maxSizeBytes,
    );
  }
  final img.Image? decoded = img.decodeImage(bytes);
  if (decoded == null) {
    throw ExpressionImageOptimizationException(
      reason: ExpressionImageOptimizationReason.processed,
      actualSizeBytes: bytes.length,
      maxSizeBytes: maxSizeBytes,
    );
  }
  final double scale = targetSize / decoded.width < targetSize / decoded.height
      ? targetSize / decoded.width
      : targetSize / decoded.height;
  final int scaledWidth = (decoded.width * scale).round().clamp(1, targetSize);
  final int scaledHeight = (decoded.height * scale).round().clamp(
    1,
    targetSize,
  );
  final img.Image resized = img.copyResize(
    decoded,
    width: scaledWidth,
    height: scaledHeight,
    interpolation: img.Interpolation.cubic,
  );
  final img.Image canvas = img.Image(width: targetSize, height: targetSize);
  final int offsetX = ((targetSize - resized.width) / 2).floor();
  final int offsetY = ((targetSize - resized.height) / 2).floor();
  img.compositeImage(canvas, resized, dstX: offsetX, dstY: offsetY);
  Uint8List? smallest;
  for (final int level in <int>[1, 3, 6, 9]) {
    final Uint8List encoded = Uint8List.fromList(
      img.encodePng(canvas, level: level),
    );
    if (smallest == null || encoded.length < smallest.length) {
      smallest = encoded;
    }
    if (encoded.length <= maxSizeBytes) {
      return base64Encode(encoded);
    }
  }
  throw ExpressionImageOptimizationException(
    reason: ExpressionImageOptimizationReason.processed,
    actualSizeBytes: smallest?.length ?? bytes.length,
    maxSizeBytes: maxSizeBytes,
  );
}
