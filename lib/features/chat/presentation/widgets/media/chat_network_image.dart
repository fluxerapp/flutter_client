import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/media_thumb_hash_placeholder.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/retrying_network_image.dart';
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

  @override
  Widget build(BuildContext context) {
    final Widget? placeholder = this.placeholder;
    final Widget? boxedPlaceholder = placeholder == null
        ? null
        : SizedBox(width: width, height: height, child: placeholder);
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
        placeholderBuilder: boxedPlaceholder == null
            ? null
            : (_) => boxedPlaceholder,
        errorBuilder: (_, _, _) => errorPlaceholder,
      );
    }
    return RetryingNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      fit: fit,
      fadeOutDuration: boxedPlaceholder == null
          ? Duration.zero
          : mediaPlaceholderFadeOutOf(context),
      disablePlaceholderOnCacheHit: boxedPlaceholder == null,
      placeholder: boxedPlaceholder,
      errorPlaceholder: errorPlaceholder,
    );
  }
}
