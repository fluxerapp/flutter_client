import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_audio.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/wallpaper/chat_wallpaper_text_theme.dart';
import 'package:fluxer_app/features/chat/utils/embeds/embed_gallery_utils.dart';
import 'package:fluxer_app/features/chat/utils/embeds/embed_render_utils.dart';
import 'package:fluxer_app/features/chat/utils/media/media_dimension_utils.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_media_overlay.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class EmbedAudio extends StatelessWidget {
  const EmbedAudio({
    required this.embed,
    this.dimensionSize = MediaDimensionSize.small,
    this.channelId,
    this.embedIndex,
    super.key,
  });

  final Embed embed;
  final MediaDimensionSize dimensionSize;
  final String? channelId;
  final int? embedIndex;

  @override
  Widget build(BuildContext context) {
    return ChatSurfaceTheme(
      builder: (BuildContext context) {
        if (!shouldRenderMediaOnlyAudioEmbed(embed)) {
          return const SizedBox.shrink();
        }

        final EmbedMedia audio = embed.audio!;
        final dimensions = mediaDimensionsForSize(dimensionSize);
        final Attachment attachment = attachmentFromEmbedAudio(
          embed: embed,
          audio: audio,
          embedIndex: embedIndex,
        );
        return Container(
          margin: const EdgeInsets.only(top: 4, bottom: 3),
          constraints: BoxConstraints(maxWidth: dimensions.maxWidth),
          child: MatureMediaOverlay(
            channelId: channelId,
            isMatureMedia: embed.isMatureMedia,
            borderRadius: BorderRadius.circular(8),
            child: AttachmentAudio(attachment: attachment),
          ),
        );
      },
    );
  }
}
