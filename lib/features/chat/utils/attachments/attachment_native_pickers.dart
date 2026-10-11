import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/attachments/gallery_attachment_selection.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:image_picker/image_picker.dart';

const MethodChannel _attachmentMediaChannel = MethodChannel(
  'fluxer_app/attachment_media',
);

const GallerySelectionChange _noGalleryChange = (
  added: <ComposerUploadFile>[],
  removedAssetIds: <String>{},
);

Future<List<ComposerUploadFile>> pickNativeGalleryUploads({int? limit}) async {
  final int pickLimit = limit ?? kMaxAttachmentsPerMessage;
  if (pickLimit <= 0) {
    return const <ComposerUploadFile>[];
  }
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    final GallerySelectionChange change = await _pickIosPhotos(
      limit: pickLimit,
      selected: const <String>[],
    );
    return change.added;
  }
  final ImagePicker picker = ImagePicker();
  final List<XFile> media = await picker.pickMultipleMedia(limit: pickLimit);
  if (media.isEmpty) {
    return const <ComposerUploadFile>[];
  }
  return composerUploadFilesFromImagePicker(media);
}

Future<GallerySelectionChange> pickNativeGallerySelection({
  required List<PendingAttachment> attachments,
}) async {
  if (defaultTargetPlatform != TargetPlatform.iOS) {
    return (
      added: await pickNativeGalleryUploads(
        limit: remainingAttachmentPickLimit(attachments.length),
      ),
      removedAssetIds: const <String>{},
    );
  }
  final List<String> selected = selectedGalleryAssetIds(attachments).toList();
  return _pickIosPhotos(
    limit: remainingAttachmentPickLimit(attachments.length) + selected.length,
    selected: selected,
  );
}

Future<GallerySelectionChange> _pickIosPhotos({
  required int limit,
  required List<String> selected,
}) async {
  if (limit <= 0) {
    return _noGalleryChange;
  }
  final List<Map<Object?, Object?>>? picks = await _attachmentMediaChannel
      .invokeListMethod<Map<Object?, Object?>>('pick', <String, Object>{
        'limit': limit,
        'selected': selected,
      });
  if (picks == null || picks.isEmpty) {
    return _noGalleryChange;
  }
  final Set<String> kept = <String>{};
  final List<ComposerUploadFile> added = <ComposerUploadFile>[];
  for (final Map<Object?, Object?> pick in picks) {
    final String? assetId = pick['assetId'] as String?;
    final String? path = pick['path'] as String?;
    if (path == null) {
      if (assetId != null) {
        kept.add(assetId);
      }
      continue;
    }
    added.add(
      composerUploadFile(
        XFile(path),
        displayFilename: pick['name'] as String?,
        galleryAssetId: assetId,
      ),
    );
  }
  return (added: added, removedAssetIds: selected.toSet().difference(kept));
}

Future<List<ComposerUploadFile>> pickNativeCameraUpload() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.camera);
  if (image == null) {
    return const <ComposerUploadFile>[];
  }
  return <ComposerUploadFile>[composerUploadFileFromImagePicker(image)];
}

Future<List<ComposerUploadFile>> pickNativeFileUploads() async {
  final List<PlatformFile> result = await FilePicker.pickFiles();
  if (result.isEmpty) {
    return const <ComposerUploadFile>[];
  }
  return composerUploadFilesFromPlatformFiles(result);
}

int remainingAttachmentPickLimit(int currentCount) {
  return kMaxAttachmentsPerMessage - currentCount;
}
