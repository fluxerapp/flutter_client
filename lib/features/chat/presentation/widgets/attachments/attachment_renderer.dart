import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_audio.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_expiry_footnote.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_file.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_render_state.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/voice_message_player.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_upload_progress.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/utils/uploading_attachment_utils.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_attachment.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_media_overlay.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

class AttachmentRenderer extends ConsumerWidget {
  const AttachmentRenderer({
    required this.attachment,
    required this.inlineAttachmentMedia,
    required this.dimensionSize,
    required this.revealSpoilers,
    this.imageGallery,
    this.imageGalleryIndex = 0,
    this.messageId,
    this.messageNonce,
    this.channelId,
    this.messageFlags = 0,
    this.mediaActionScope,
    super.key,
  });

  final Attachment attachment;
  final bool inlineAttachmentMedia;
  final MediaDimensionSize dimensionSize;
  final bool revealSpoilers;
  final List<Attachment>? imageGallery;
  final int imageGalleryIndex;
  final String? messageId;
  final String? messageNonce;
  final String? channelId;
  final int messageFlags;
  final MessageMediaActionScope? mediaActionScope;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AdvancedPreferencesState advanced = ref.watch(
      advancedPreferencesProvider,
    );
    final AttachmentRenderState renderState = buildAttachmentRenderState(
      attachment: attachment,
      inlineAttachmentMedia: inlineAttachmentMedia,
    );
    final Widget content = _buildContent(renderState, advanced: advanced);
    final DateTime? expiresAt = attachment.expiresAt;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? expiryFootnoteText = expiresAt == null
        ? null
        : l10n.chatAttachmentExpiresOn(
            DateFormat('dd MMM, yyyy', l10n.localeName).format(expiresAt),
          );
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SpoilerOverlay(
            isSpoiler: attachment.isSpoiler,
            initiallyRevealed: revealSpoilers,
            child: _wrapMatureMedia(content),
          ),
          if (expiryFootnoteText != null &&
              advanced.showAttachmentExpiryIndicator)
            AttachmentExpiryFootnote(text: expiryFootnoteText),
        ],
      ),
    );
  }

  Widget _wrapMatureMedia(Widget child) {
    if (!attachment.isMatureMedia || channelId == null) {
      return child;
    }
    return MatureMediaOverlay(
      channelId: channelId,
      isMatureMedia: true,
      child: child,
    );
  }

  Widget _buildContent(
    AttachmentRenderState renderState, {
    required AdvancedPreferencesState advanced,
  }) {
    if (isUploadingPlaceholderAttachment(attachment) &&
        messageId != null &&
        messageNonce != null &&
        channelId != null) {
      return MessageUploadProgress(
        attachment: attachment,
        messageId: messageId!,
        messageNonce: messageNonce!,
        channelId: channelId!,
      );
    }
    if (renderState.shouldRenderAsFile) {
      return AttachmentFile(attachment: attachment);
    }
    return switch (renderState.type) {
      AttachmentRenderType.image => AttachmentImage(
        attachment: attachment,
        dimensionSize: dimensionSize,
        revealSpoiler: revealSpoilers,
        wrapWithSpoiler: false,
        imageGallery: imageGallery,
        imageGalleryIndex: imageGalleryIndex,
        channelId: channelId,
        messageId: messageId,
        mediaActionScope: mediaActionScope,
        showGifIndicator: advanced.showGifIndicator,
      ),
      AttachmentRenderType.video => AttachmentVideo(
        attachment: attachment,
        dimensionSize: dimensionSize,
        videoActionScope: mediaActionScope,
      ),
      AttachmentRenderType.audio =>
        isVoiceMessageAttachment(
              messageFlags: messageFlags,
              attachment: attachment,
            )
            ? VoiceMessagePlayer(attachment: attachment)
            : AttachmentAudio(attachment: attachment),
      AttachmentRenderType.file => AttachmentFile(attachment: attachment),
    };
  }
}
