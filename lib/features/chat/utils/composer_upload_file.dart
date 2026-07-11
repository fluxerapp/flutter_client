import 'package:cross_file/cross_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluxer_app/features/chat/utils/attachment_filename_utils.dart';

typedef ComposerUploadFile = ({XFile file, String? displayFilename});

ComposerUploadFile composerUploadFile(XFile file, {String? displayFilename}) {
  return (file: file, displayFilename: displayFilename);
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
  final String? path = file.path?.trim();
  if (path == null || path.isEmpty) {
    return null;
  }
  return composerUploadFile(
    XFile(path, name: file.name),
    displayFilename: file.name,
  );
}

List<ComposerUploadFile> composerUploadFilesFromPlatformFiles(
  Iterable<PlatformFile> files,
) {
  return files
      .map(composerUploadFileFromPlatformFile)
      .whereType<ComposerUploadFile>()
      .toList(growable: false);
}
