import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kBannerHeight = 184;

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    required this.bannerUrl,
    required this.bannerColor,
    super.key,
  });

  final String? bannerUrl;
  final Color bannerColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _kBannerHeight,
      width: double.infinity,
      child: bannerUrl != null
          ? CachedNetworkImage(
              imageUrl: bannerUrl!,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => ColoredBox(color: bannerColor),
            )
          : ColoredBox(color: bannerColor),
    );
  }
}
