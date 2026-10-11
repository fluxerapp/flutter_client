import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/features/chat/data/attachment_gallery_source.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/media/media_dimension_utils.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod/misc.dart' show FutureProviderFamily;

const MethodChannel _attachmentMediaChannel = MethodChannel(
  'fluxer_app/attachment_media',
);

final FutureProviderFamily<Uint8List?, String>
pendingAttachmentThumbnailProvider = FutureProvider.autoDispose
    .family<Uint8List?, String>(
      (Ref ref, String galleryAssetId) => ref
          .read(attachmentGallerySourceProvider)
          .loadThumbnail(galleryAssetId, size: 300),
    );

final FutureProviderFamily<Uint8List?, String> pendingVideoFrameProvider =
    FutureProvider.autoDispose.family<Uint8List?, String>((
      Ref ref,
      String path,
    ) async {
      try {
        return await _attachmentMediaChannel.invokeMethod<Uint8List>(
          'videoThumbnail',
          <String, Object>{'path': path, 'size': 300},
        );
      } on MissingPluginException {
        return null;
      } on PlatformException {
        return null;
      }
    });

class PendingAttachmentPreview extends ConsumerWidget {
  static const Key thumbnailKey = Key('pending-attachment-thumbnail');
  static const Key playBadgeKey = Key('pending-attachment-play-badge');

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
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final ({int? width, int? height}) cache = coverDecodeCacheSize(
            cellWidth: constraints.maxWidth,
            cellHeight: constraints.maxHeight,
            devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
          );
          return Image.file(
            File(path),
            fit: BoxFit.cover,
            cacheWidth: cache.width,
            cacheHeight: cache.height,
          );
        },
      );
    }
    final String? galleryAssetId = attachment.galleryAssetId;
    final bool isVideo = isVideoAttachment(
      filename: attachment.filename,
      contentType: attachment.contentType,
    );
    Uint8List? bytes = galleryAssetId == null
        ? null
        : ref.watch(pendingAttachmentThumbnailProvider(galleryAssetId)).value;
    if ((bytes == null || bytes.isEmpty) && isVideo && path.isNotEmpty) {
      bytes = ref.watch(pendingVideoFrameProvider(path)).value;
    }
    if (bytes == null || bytes.isEmpty) {
      return fallback;
    }
    final Widget thumbnail = Image.memory(
      bytes,
      key: thumbnailKey,
      fit: BoxFit.cover,
      gaplessPlayback: true,
    );
    if (!isVideo) {
      return thumbnail;
    }
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        thumbnail,
        const Center(
          child: DecoratedBox(
            key: playBadgeKey,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.55),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: PhosphorIcon(
                PhosphorIconsFill.play,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
