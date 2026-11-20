import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/platform/android_proc_info.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

const int kDesktopImageCacheMaxBytes = 100 << 20;
const int kMobileImageCacheMaxBytes = 40 << 20;
const int kLowMemoryImageCacheMaxBytes = 20 << 20;
const int kDesktopImageCacheMaxEntries = 4000;
const int kMobileImageCacheMaxEntries = 2000;
const int kLowMemoryImageCacheMaxEntries = 1000;
const int kAndroidSkiaResourceCacheMaxBytes = 64 << 20;
const int kAndroidLowMemorySkiaResourceCacheMaxBytes = 32 << 20;
const int kLowMemoryDeviceMaxTotalBytes = 4608 << 20;

bool isFluxerLowMemoryDevice([int? totalMemoryBytes]) {
  final int? total = totalMemoryBytes ?? androidTotalMemoryBytes();
  return total != null && total < kLowMemoryDeviceMaxTotalBytes;
}

const int kNetworkImageDiskCacheMaxObjects = 5000;
const Duration kNetworkImageDiskCacheStalePeriod = Duration(days: 30);

({int bytes, int entries}) fluxerImageCacheBudget({
  required bool isDesktop,
  required bool isLowMemory,
}) {
  if (isDesktop) {
    return (
      bytes: kDesktopImageCacheMaxBytes,
      entries: kDesktopImageCacheMaxEntries,
    );
  }
  if (isLowMemory) {
    return (
      bytes: kLowMemoryImageCacheMaxBytes,
      entries: kLowMemoryImageCacheMaxEntries,
    );
  }
  return (
    bytes: kMobileImageCacheMaxBytes,
    entries: kMobileImageCacheMaxEntries,
  );
}

void configureFluxerImageCache({int? totalMemoryBytes}) {
  final ({int bytes, int entries}) budget = fluxerImageCacheBudget(
    isDesktop: isFluxerDesktopOs,
    isLowMemory: isFluxerLowMemoryDevice(totalMemoryBytes),
  );
  PaintingBinding.instance.imageCache
    ..maximumSizeBytes = budget.bytes
    ..maximumSize = budget.entries;
  CachedNetworkImageProvider.defaultCacheManager = DefaultCacheManager(
    stalePeriod: kNetworkImageDiskCacheStalePeriod,
    maxNrOfCacheObjects: kNetworkImageDiskCacheMaxObjects,
  );
  FluxerAnimatedEmojiImage.onFirstFailure = (String url, Object error) {
    talker.warning('[Emoji] animated load failed for $url: $error');
  };
}

void configureFluxerGpuResourceCache({int? totalMemoryBytes}) {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
    return;
  }
  unawaited(
    SystemChannels.skia.invokeMethod<void>(
      'Skia.setResourceCacheMaxBytes',
      isFluxerLowMemoryDevice(totalMemoryBytes)
          ? kAndroidLowMemorySkiaResourceCacheMaxBytes
          : kAndroidSkiaResourceCacheMaxBytes,
    ),
  );
}

void clearFluxerImageCache() {
  PaintingBinding.instance.imageCache.clear();
}

Future<void> clearFluxerNetworkImageCaches() async {
  clearFluxerImageCache();
  await CachedNetworkImageProvider.defaultCacheManager.emptyCache();
}
