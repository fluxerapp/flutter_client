import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/painting.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';

const int kDesktopImageCacheMaxBytes = 100 << 20;
const int kMobileImageCacheMaxBytes = 40 << 20;

const int kNetworkImageDiskCacheMaxObjects = 5000;
const Duration kNetworkImageDiskCacheStalePeriod = Duration(days: 30);

void configureFluxerImageCache() {
  final bool isDesktop = isFluxerDesktopOs;
  PaintingBinding.instance.imageCache.maximumSizeBytes = isDesktop
      ? kDesktopImageCacheMaxBytes
      : kMobileImageCacheMaxBytes;
  CachedNetworkImageProvider.defaultCacheManager = DefaultCacheManager(
    stalePeriod: kNetworkImageDiskCacheStalePeriod,
    maxNrOfCacheObjects: kNetworkImageDiskCacheMaxObjects,
  );
}

void clearFluxerImageCache() {
  PaintingBinding.instance.imageCache.clear();
}
