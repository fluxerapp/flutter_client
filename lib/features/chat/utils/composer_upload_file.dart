import 'package:cross_file/cross_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluxer_app/features/chat/utils/attachment_filename_utils.dart';

typedef ComposerUploadFile = ({
  XFile file,
  String? displayFilename,
  String? galleryAssetId,
});

ComposerUploadFile composerUploadFile(
  XFile file, {
  String? displayFilename,
  String? galleryAssetId,
}) {
  return (
    file: file,
    displayFilename: displayFilename,
    galleryAssetId: galleryAssetId,
  );
}

List<ComposerUploadFile> composerUploadFiles(Iterable<XFile> files) {
  return files.map(composerUploadFile).toList(growable: false);
}

ComposerUploadFile composerUploadFileFromImagePicker(XFile file) {
  return composerUploadFile(
    file,
    displayFilename: uploadFilenameOverrideFromPickerXFile(file),
  );
}

List<ComposerUploadFile> composerUploadFilesFromImagePicker(
  Iterable<XFile> files,
) {
  return files.map(composerUploadFileFromImagePicker).toList(growable: false);
}

ComposerUploadFile? composerUploadFileFromPlatformFile(PlatformFile file) {
  return composerUploadFile(file.xFile, displayFilename: file.name);
}

List<ComposerUploadFile> composerUploadFilesFromPlatformFiles(
  Iterable<PlatformFile> files,
) {
  return files
      .map(composerUploadFileFromPlatformFile)
      .whereType<ComposerUploadFile>()
      .toList(growable: false);
}
