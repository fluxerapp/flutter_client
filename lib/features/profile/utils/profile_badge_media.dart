import 'package:fluxer_app/core/media/fluxer_media_cdn.dart';
import 'package:fluxer_dart/export.dart';

const double kProfileBadgeSmallAssetMaxHeight = 20;

String profileBadgeImageUrl(HexString16Type hash) {
  return '$fluxerStaticCdn/badges/$hash.webp';
}

String customBadgeImageUrl(String assetUrl) {
  return '$assetUrl?size=96';
}

String? profileBadgeDisplayImageUrl(
  ProfileBadgeResponse badge, {
  required double displayHeight,
}) {
  final HexString16Type? hash = profileBadgeImageHash(
    badge,
    displayHeight: displayHeight,
  );
  if (hash != null) {
    return profileBadgeImageUrl(hash);
  }
  final String? assetUrl = badge.assetUrl?.trim();
  if (assetUrl == null || assetUrl.isEmpty) {
    return null;
  }
  return customBadgeImageUrl(assetUrl);
}

String? ownProfileBadgeDisplayImageUrl(
  OwnProfileBadgeResponse badge, {
  required double displayHeight,
}) {
  if (displayHeight <= kProfileBadgeSmallAssetMaxHeight &&
      badge.smallAsset != null) {
    return profileBadgeImageUrl(badge.smallAsset!);
  }
  if (badge.asset != null) {
    return profileBadgeImageUrl(badge.asset!);
  }
  final String? assetUrl = badge.assetUrl?.trim();
  if (assetUrl == null || assetUrl.isEmpty) {
    return null;
  }
  return customBadgeImageUrl(assetUrl);
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
