import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kMessageStickerSize = 160;
const int kMessageStickerRequestSize = 320;

class MessageStickerImage extends StatelessWidget {
  const MessageStickerImage({
    required this.sticker,
    required this.visibilityKey,
    super.key,
  });

  final MessageSticker sticker;
  final String visibilityKey;

  @override
  Widget build(BuildContext context) {
    final Widget stickerImage;
    if (sticker.animated) {
      stickerImage = SizedBox(
        width: kMessageStickerSize,
        height: kMessageStickerSize,
        child: EmbedAnimatedImage(
          animatedUrl: sticker.urlForSize(kMessageStickerRequestSize),
          staticUrl: FluxerMediaUrl.sticker(id: sticker.id),
          visibilityKey: visibilityKey,
          useStickerAnimationPreference: true,
          fit: BoxFit.contain,
          placeholder: const SizedBox(
            width: kMessageStickerSize,
            height: kMessageStickerSize,
          ),
        ),
      );
    } else {
      stickerImage = CachedNetworkImage(
        imageUrl: sticker.urlForSize(kMessageStickerRequestSize),
        cacheKey: sticker.cacheKeyForSize(kMessageStickerRequestSize),
        width: kMessageStickerSize,
        height: kMessageStickerSize,
        memCacheWidth: kMessageStickerSize.toInt(),
        fadeInDuration: Duration.zero,
        fadeOutDuration: Duration.zero,
        fit: BoxFit.contain,
        placeholder: (_, _) => const SizedBox(
          width: kMessageStickerSize,
          height: kMessageStickerSize,
        ),
        errorBuilder: (_, _, _) => SizedBox(
          width: kMessageStickerSize,
          height: kMessageStickerSize,
          child: Center(
            child: PhosphorIcon(
              PhosphorIconsDuotone.sticker,
              size: 48,
              color: context.colors.textTertiaryMuted,
            ),
          ),
        ),
      );
    }
    return Semantics(label: sticker.name, image: true, child: stickerImage);
  }
}
