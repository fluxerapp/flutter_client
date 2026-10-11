import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/features/chat/data/attachment_gallery_source.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/misc.dart' show FutureProviderFamily;

final FutureProviderFamily<Uint8List?, String>
pendingAttachmentThumbnailProvider = FutureProvider.autoDispose
    .family<Uint8List?, String>(
      (Ref ref, String galleryAssetId) => ref
          .read(attachmentGallerySourceProvider)
          .loadThumbnail(galleryAssetId, size: 300),
    );

class PendingAttachmentPreview extends ConsumerWidget {
  static const Key thumbnailKey = Key('pending-attachment-thumbnail');

  const PendingAttachmentPreview({
    required this.attachment,
    required this.fallback,
    super.key,
  });

  final PendingAttachment attachment;
  final Widget fallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String path = attachment.file.path;
    final bool isImage = isImageAttachment(
      filename: attachment.filename,
      contentType: attachment.contentType,
    );
    if (isImage && path.isNotEmpty) {
      if (isSvgImageMedia(
        url: path,
        filename: attachment.filename,
        contentType: attachment.contentType,
      )) {
        return SvgPicture.file(File(path), fit: BoxFit.cover);
      }
      return Image.file(File(path), fit: BoxFit.cover);
    }
    final String? galleryAssetId = attachment.galleryAssetId;
    if (galleryAssetId == null) {
      return fallback;
    }
    final Uint8List? bytes = ref
        .watch(pendingAttachmentThumbnailProvider(galleryAssetId))
        .value;
    if (bytes == null || bytes.isEmpty) {
      return fallback;
    }
    return Image.memory(
      bytes,
      key: thumbnailKey,
      fit: BoxFit.cover,
      gaplessPlayback: true,
    );
  }
}
