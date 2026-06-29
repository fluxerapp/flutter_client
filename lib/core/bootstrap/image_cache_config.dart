import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

const int kDesktopImageCacheMaxBytes = 100 << 20;
const int kMobileImageCacheMaxBytes = 40 << 20;

void configureFluxerImageCache() {
  final bool isDesktop =
      !kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows);
  PaintingBinding.instance.imageCache.maximumSizeBytes = isDesktop
      ? kDesktopImageCacheMaxBytes
      : kMobileImageCacheMaxBytes;
}

void clearFluxerImageCache() {
  PaintingBinding.instance.imageCache.clear();
}
