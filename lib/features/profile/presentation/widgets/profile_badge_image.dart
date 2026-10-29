import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class ProfileBadgeImage extends StatelessWidget {
  const ProfileBadgeImage({
    required this.height,
    this.hash,
    this.imageUrl,
    this.aspectRatio,
    super.key,
  }) : assert(hash != null || imageUrl != null, 'hash or imageUrl is required');

  final HexString16Type? hash;
  final String? imageUrl;
  final double height;
  final num? aspectRatio;

  factory ProfileBadgeImage.fromBadge(
    ProfileBadgeResponse badge, {
    required double height,
  }) {
    return ProfileBadgeImage(
      hash: profileBadgeImageHash(badge, displayHeight: height),
      imageUrl: profileBadgeDisplayImageUrl(badge, displayHeight: height),
      height: height,
      aspectRatio: badge.aspectRatio,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = aspectRatio != null && aspectRatio! > 0
        ? height * aspectRatio!.toDouble()
        : height;
    final String url = imageUrl ?? profileBadgeImageUrl(hash!);
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: BoxFit.contain,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
    );
  }
}
