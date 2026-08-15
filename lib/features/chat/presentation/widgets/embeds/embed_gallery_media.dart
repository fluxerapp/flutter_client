import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_media_grid.dart';
import 'package:fluxer_app/features/chat/utils/embed_gallery_utils.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:material_ui/material_ui.dart';

class EmbedGalleryMedia extends StatelessWidget {
  const EmbedGalleryMedia({
    required this.embed,
    required this.galleryImages,
    required this.dimensionSize,
    required this.revealSpoilers,
    this.embedIndex,
    this.channelId,
    this.messageId,
    super.key,
  });

  final Embed embed;
  final List<EmbedMedia> galleryImages;
  final MediaDimensionSize dimensionSize;
  final bool revealSpoilers;
  final int? embedIndex;
  final String? channelId;
  final String? messageId;

  @override
  Widget build(BuildContext context) {
    return AttachmentMediaGrid(
      attachments: buildGalleryAttachments(
        images: galleryImages,
        embed: embed,
        embedIndex: embedIndex,
      ),
      revealSpoilers: revealSpoilers,
      dimensionSize: dimensionSize,
      channelId: channelId,
      messageId: messageId,
    );
  }
}
