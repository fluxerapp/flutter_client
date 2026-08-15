import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_inline_video_player.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:material_ui/material_ui.dart';

typedef AttachmentVideoControlsBuilder = ChatVideoControlsBuilder;

class AttachmentVideo extends StatelessWidget {
  const AttachmentVideo({
    required this.attachment,
    this.dimensionSize = MediaDimensionSize.small,
    this.controlsBuilder,
    this.videoActionScope,
    super.key,
  });

  final Attachment attachment;
  final MediaDimensionSize dimensionSize;
  final AttachmentVideoControlsBuilder? controlsBuilder;
  final MessageMediaActionScope? videoActionScope;

  @override
  Widget build(BuildContext context) {
    final FluxerMediaDimensions dimensions = mediaDimensionsForSize(
      dimensionSize,
    );
    final ChatFullscreenVideoLaunchContext launchContext =
        ChatFullscreenVideoLaunchContext.fromAttachment(
          attachment: attachment,
          layoutDimensions: dimensions,
          actionScope: videoActionScope,
        );
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 3),
      constraints: BoxConstraints(
        maxWidth: dimensions.maxWidth,
        maxHeight: dimensions.maxHeight,
      ),
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondaryAlt,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ChatInlineVideoPlayer(
          source: launchContext.source,
          launchContext: launchContext,
          dimensionSize: dimensionSize,
          controlsBuilder: controlsBuilder,
        ),
      ),
    );
  }
}
