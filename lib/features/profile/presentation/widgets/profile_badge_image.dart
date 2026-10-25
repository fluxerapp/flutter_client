import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class ProfileBadgeImage extends StatelessWidget {
  const ProfileBadgeImage({
    required this.hash,
    required this.height,
    this.aspectRatio,
    super.key,
  });

  final HexString16Type hash;
  final double height;
  final num? aspectRatio;

  @override
  Widget build(BuildContext context) {
    final double width = aspectRatio != null && aspectRatio! > 0
        ? height * aspectRatio!.toDouble()
        : height;
    return CachedNetworkImage(
      imageUrl: profileBadgeImageUrl(hash),
      height: height,
      width: width,
      fit: BoxFit.contain,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
    );
  }
}
