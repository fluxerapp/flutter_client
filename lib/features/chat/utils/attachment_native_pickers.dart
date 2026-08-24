import 'package:file_picker/file_picker.dart';
import 'package:fluxer_app/features/chat/utils/composer_upload_file.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_constants.dart';
import 'package:image_picker/image_picker.dart';

Future<List<ComposerUploadFile>> pickNativeGalleryUploads({int? limit}) async {
  final int pickLimit = limit ?? kMaxAttachmentsPerMessage;
  if (pickLimit <= 0) {
    return const <ComposerUploadFile>[];
  }
  final ImagePicker picker = ImagePicker();
  final List<XFile> media = await picker.pickMultipleMedia(
    limit: pickLimit,
  );
  if (media.isEmpty) {
    return const <ComposerUploadFile>[];
  }
  return composerUploadFilesFromImagePicker(media);
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
