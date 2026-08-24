import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';

Set<String> selectedGalleryAssetIds(Iterable<PendingAttachment> attachments) {
  return attachments
      .map((PendingAttachment attachment) => attachment.galleryAssetId)
      .whereType<String>()
      .toSet();
}

PendingAttachment? pendingAttachmentForGalleryAsset({
  required Iterable<PendingAttachment> attachments,
  required String galleryAssetId,
}) {
  for (final PendingAttachment attachment in attachments) {
    if (attachment.galleryAssetId == galleryAssetId) {
      return attachment;
    }
  }
  return null;
}

String formatGalleryVideoDuration(Duration duration) {
  final int totalSeconds = duration.inSeconds;
  final int minutes = totalSeconds ~/ 60;
  final int seconds = totalSeconds % 60;
  return '$minutes:${seconds.toString().padLeft(2, '0')}';
}
