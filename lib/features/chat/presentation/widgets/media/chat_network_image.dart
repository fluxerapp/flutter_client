import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/material_ui.dart';

class ChatNetworkImage extends StatelessWidget {
  const ChatNetworkImage({
    required this.imageUrl,
    this.filename,
    this.contentType,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.memCacheWidth,
    this.memCacheHeight,
    this.placeholder,
    this.errorPlaceholder = const SizedBox.shrink(),
    this.fadeInDuration = Duration.zero,
    this.fadeOutDuration = Duration.zero,
    super.key,
  });

  final String imageUrl;
  final String? filename;
  final String? contentType;
  final double? width;
  final double? height;
  final BoxFit fit;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final Widget? placeholder;
  final Widget errorPlaceholder;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;

  @override
  Widget build(BuildContext context) {
    if (isSvgImageMedia(
      url: imageUrl,
      filename: filename,
      contentType: contentType,
    )) {
      return SvgPicture.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: placeholder == null ? null : (_) => placeholder!,
        errorBuilder: (_, _, _) => errorPlaceholder,
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      fit: fit,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      placeholder: placeholder == null
          ? null
          : (BuildContext _, String _) => placeholder!,
      errorBuilder: (_, _, _) => errorPlaceholder,
    );
  }
}
