import 'package:cross_file/cross_file.dart';
import 'package:fluxer_app/features/chat/utils/attachment_mime_utils.dart';
import 'package:path/path.dart' as path_lib;

final RegExp _genericImagePickerTempBasenamePattern = RegExp(
  r'^image_picker(?:[._][^./\\]+)?\.\w+$',
  caseSensitive: false,
);

bool isGenericImagePickerTempBasename(String basename) {
  final String trimmed = basename.trim();
  if (trimmed.isEmpty) {
    return false;
  }
  return _genericImagePickerTempBasenamePattern.hasMatch(trimmed);
}

String rawUploadFilenameForSanitization({
  required String name,
  required String path,
  String? explicitName,
}) {
  final String explicit = explicitName?.trim() ?? '';
  if (explicit.isNotEmpty) {
    return explicit;
  }
  final String fromName = name.trim();
  final String fromPath = path.trim().isNotEmpty
      ? path_lib.basename(path.trim())
      : '';
  if (fromPath.isNotEmpty && !isGenericImagePickerTempBasename(fromPath)) {
    return fromPath;
  }
  if (fromName.isNotEmpty && !isGenericImagePickerTempBasename(fromName)) {
    return fromName;
  }
  String candidate = fromName.isNotEmpty ? fromName : fromPath;
  final String lower = candidate.toLowerCase();
  final String pathLower = fromPath.toLowerCase();
  if (!lower.contains('image_picker') && pathLower.contains('image_picker')) {
    candidate = fromPath;
  }
  return candidate.isNotEmpty ? candidate : 'attachment.bin';
}

String resolveUploadFilename({required XFile file, String? explicitName}) {
  return sanitizeAttachmentFilename(
    rawUploadFilenameForSanitization(
      name: file.name,
      path: file.path,
      explicitName: explicitName,
    ),
    mimeType: file.mimeType,
  );
}

String? uploadFilenameOverrideFromPickerXFile(XFile file) {
  final String basename = path_lib.basename(file.path.trim());
  if (basename.isEmpty || isGenericImagePickerTempBasename(basename)) {
    return null;
  }
  return basename;
}

String sanitizeAttachmentFilename(String name, {String? mimeType}) {
  final String trimmed = name.trim();
  if (!isGenericImagePickerTempBasename(trimmed)) {
    return filenameForMimeType(trimmed, mimeType: mimeType);
  }
  final String ext = _extensionFromFilename(trimmed);
  final String fromMime = attachmentExtensionForMime(mimeType);
  final String effectiveExt = ext.isNotEmpty ? ext : fromMime;
  final bool asVideo =
      _isVideoMime(mimeType) || _isVideoExtension(effectiveExt);
  final String prefix = asVideo ? 'video' : 'image';
  final String resolved = effectiveExt.isNotEmpty
      ? '$prefix$effectiveExt'
      : (asVideo ? 'video.mp4' : 'image.jpg');
  return filenameForMimeType(resolved, mimeType: mimeType);
}

String filenameForMimeType(
  String name, {
  String? mimeType,
  String defaultStem = 'attachment',
}) {
  final String trimmed = name.trim();
  if (mimeType == null || mimeType.isEmpty) {
    return trimmed.isNotEmpty ? trimmed : '$defaultStem.bin';
  }
  final String dottedExt = attachmentExtensionForMime(mimeType);
  if (dottedExt.isEmpty) {
    return trimmed.isNotEmpty ? trimmed : defaultStem;
  }
  final String base = trimmed.isNotEmpty ? trimmed : defaultStem;
  final String currentExt = _extensionFromFilename(base);
  if (currentExt.isEmpty) {
    return '$base$dottedExt';
  }
  if (currentExt == '.bin') {
    final int dot = base.lastIndexOf('.');
    final String stem = dot > 0 ? base.substring(0, dot) : defaultStem;
    return '$stem$dottedExt';
  }
  return base;
}

String _extensionFromFilename(String name) {
  final int dot = name.lastIndexOf('.');
  if (dot <= 0 || dot >= name.length - 1) {
    return '';
  }
  final String ext = name.substring(dot).toLowerCase();
  if (ext.length > 12) {
    return '';
  }
  return ext;
}

bool _isVideoMime(String? mimeType) {
  if (mimeType == null) {
    return false;
  }
  return mimeType.toLowerCase().startsWith('video/');
}

bool _isVideoExtension(String extLower) {
  switch (extLower) {
    case '.mp4':
    case '.mov':
    case '.m4v':
    case '.webm':
    case '.mkv':
      return true;
    default:
      return false;
  }
}
