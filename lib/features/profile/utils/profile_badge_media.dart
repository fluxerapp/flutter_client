import 'package:fluxer_app/core/media/fluxer_media_cdn.dart';
import 'package:fluxer_dart/export.dart';

const double kProfileBadgeSmallAssetMaxHeight = 20;

String profileBadgeImageUrl(HexString16Type hash) {
  return '$fluxerStaticCdn/badges/$hash.webp';
}

HexString16Type? profileBadgeImageHash(
  ProfileBadgeResponse badge, {
  required double displayHeight,
}) {
  if (displayHeight <= kProfileBadgeSmallAssetMaxHeight &&
      badge.smallAsset != null) {
    return badge.smallAsset;
  }
  return badge.asset;
}
