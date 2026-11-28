import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_media_kind.dart';
import 'package:fluxer_app/features/chat/domain/message_media_menu_target.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/material_ui.dart';

class MessageMediaMenuRegion extends StatelessWidget {
  const MessageMediaMenuRegion({
    required this.target,
    required this.child,
    super.key,
  });

  final MessageMediaMenuTarget? target;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MessageMediaMenuTarget? target = this.target;
    return MetaData(
      metaData: target != null && target.url.trim().isNotEmpty ? target : null,
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}

MessageMediaMenuTarget messageMediaMenuTargetForAttachment(
  Attachment attachment,
) {
  return MessageMediaMenuTarget(
    kind: _attachmentKind(attachment),
    url: attachment.url.trim().isNotEmpty
        ? attachment.url
        : attachmentEffectiveUrl(attachment),
    downloadUrl: attachmentEffectiveDownloadUrl(
      url: attachment.url,
      isExpired: attachment.expired ?? false,
      proxyUrl: attachment.proxyUrl,
    ),
    filename: attachment.filename,
    attachment: attachment,
    contentHash: attachment.contentHash,
    isMatureMedia: attachment.isMatureMedia,
  );
}

MessageMediaMenuTarget messageMediaMenuTargetForEmbed({
  required Embed embed,
  required EmbedMedia media,
  int? embedIndex,
}) {
  final MessageMediaKind kind = embed.type == EmbedType.gifv
      ? MessageMediaKind.gifv
      : media.isAnimated
      ? MessageMediaKind.gif
      : (media.contentType?.toLowerCase().startsWith('video/') ?? false)
      ? MessageMediaKind.video
      : MessageMediaKind.image;
  return MessageMediaMenuTarget(
    kind: kind,
    url: media.url,
    downloadUrl: media.proxyUrl ?? media.url,
    embedIndex: embedIndex,
    contentHash: media.contentHash,
    isMatureMedia: embed.isMatureMedia,
  );
}

MessageMediaKind _attachmentKind(Attachment attachment) {
  if (attachment.isVideo) {
    return MessageMediaKind.video;
  }
  if (attachment.isAnimated) {
    return MessageMediaKind.gif;
  }
  if (attachment.isImage) {
    return MessageMediaKind.image;
  }
  if (attachment.isAudio) {
    return MessageMediaKind.audio;
  }
  return MessageMediaKind.file;
}

MessageMediaMenuTarget? messageMediaMenuTargetAt(
  RenderBox root,
  Offset globalPosition,
) {
  if (!root.attached || !root.hasSize) {
    return null;
  }
  final BoxHitTestResult result = BoxHitTestResult();
  root.hitTest(result, position: root.globalToLocal(globalPosition));
  for (final HitTestEntry<HitTestTarget> entry in result.path) {
    final HitTestTarget target = entry.target;
    if (target is RenderMetaData) {
      final Object? data = target.metaData;
      if (data is MessageMediaMenuTarget) {
        return data;
      }
    }
  }
  return null;
}
