import 'package:flutter/material.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_mobile_fullscreen_video.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';

export 'package:fluxer_app/features/chat/presentation/widgets/media/chat_mobile_fullscreen_video.dart'
    show showChatMobileFullscreenVideo;

Future<void> showAttachmentMobileFullscreenVideo(
  BuildContext context, {
  required Attachment attachment,
  MessageMediaActionScope? videoActionScope,
}) async {
  if (attachment.url.isEmpty) {
    return;
  }
  final FluxerMediaDimensions dimensions = mediaDimensionsForSize(
    MediaDimensionSize.small,
  );
  await showChatMobileFullscreenVideo(
    context,
    launchContext: ChatFullscreenVideoLaunchContext.fromAttachment(
      attachment: attachment,
      layoutDimensions: dimensions,
      actionScope: videoActionScope,
    ),
  );
}
