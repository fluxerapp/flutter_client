import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';

bool pendingAttachmentIsSpoiler(PendingAttachment attachment) =>
    (attachment.flags & attachmentFlagIsSpoiler) != 0;

CloudUploadController _uploads(WidgetRef ref, String channelId) => ref.read(
  cloudUploadControllerProvider(readAccountUserId(ref), channelId).notifier,
);

void togglePendingAttachmentSpoiler(
  WidgetRef ref, {
  required String channelId,
  required PendingAttachment attachment,
}) {
  _uploads(ref, channelId).updateAttachment(
    attachment.id,
    filename: attachment.filename,
    description: attachment.description,
    flags: pendingAttachmentIsSpoiler(attachment)
        ? attachment.flags & ~attachmentFlagIsSpoiler
        : attachment.flags | attachmentFlagIsSpoiler,
  );
}

Future<void> removePendingAttachment(
  WidgetRef ref, {
  required String channelId,
  required PendingAttachment attachment,
}) => _uploads(ref, channelId).removeAttachment(attachment.id);
