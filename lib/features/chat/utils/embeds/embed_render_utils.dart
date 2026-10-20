import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/embeds/embed_media_viewer_utils.dart';

bool shouldRenderMediaOnlyAudioEmbed(Embed embed) {
  return embed.type == EmbedType.audio &&
      !embed.hasRichEmbedContent &&
      isPlayableEmbedAudio(embed.audio);
}
