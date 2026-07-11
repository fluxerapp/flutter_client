import 'package:cross_file/cross_file.dart';
import 'package:path/path.dart' as path_lib;

final RegExp _genericImagePickerTempBasenamePattern = RegExp(
  r'^image_picker(?:[._][^./\\]+)?\.\w+$',
  caseSensitive: false,
);

/// True for plugin temp names like `image_picker.jpg` or `image_picker_<guid>.jpg`.
bool isGenericImagePickerTempBasename(String basename) {
  final String trimmed = basename.trim();
  if (trimmed.isEmpty) {
    return false;
  }
  return _genericImagePickerTempBasenamePattern.hasMatch(trimmed);
}

/// Picker plugins often put a generic or empty cross file name while the real
/// temp path still contains `image_picker`.
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

/// Resolves the upload filename for an [XFile], preferring an explicit picker
/// name when the platform only exposes a temp path basename.
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

/// Returns a non generic filename from an image picker result when available.
String? uploadFilenameOverrideFromPickerXFile(XFile file) {
  final String basename = path_lib.basename(file.path.trim());
  if (basename.isEmpty || isGenericImagePickerTempBasename(basename)) {
    return null;
  }
  return basename;
}

String sanitizeAttachmentFilename(String name, {String? mimeType}) {
  final String trimmed = name.trim();
  final bool tainted = isGenericImagePickerTempBasename(trimmed);
  final String resolved;
  if (!tainted) {
    resolved = trimmed.isNotEmpty ? trimmed : _fallbackBasename(mimeType);
  } else {
    final String ext = _extensionFromFilename(trimmed);
    final String fromMime = _extensionForMime(mimeType);
    final String effectiveExt = ext.isNotEmpty ? ext : fromMime;
    final bool asVideo =
        _isVideoMime(mimeType) || _isVideoExtension(effectiveExt);
    final String prefix = asVideo ? 'video' : 'image';
    if (effectiveExt.isNotEmpty) {
      resolved = '$prefix$effectiveExt';
    } else {
      resolved = asVideo ? 'video.mp4' : 'image.jpg';
    }
  }
  return _ensureExtensionFromMime(resolved, mimeType);
}

String _ensureExtensionFromMime(String name, String? mimeType) {
  if (_extensionFromFilename(name).isNotEmpty) {
    return name;
  }
  final String fromMime = _extensionForMime(mimeType);
  if (fromMime.isNotEmpty) {
    return '$name$fromMime';
  }
  return name;
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

String _extensionForMime(String? mimeType) {
  if (mimeType == null) {
    return '';
  }
  switch (mimeType.toLowerCase()) {
    case 'image/jpeg':
    case 'image/jpg':
      return '.jpg';
    case 'image/png':
      return '.png';
    case 'image/gif':
      return '.gif';
    case 'image/webp':
      return '.webp';
    case 'image/heic':
    case 'image/heif':
      return '.heic';
    case 'video/mp4':
      return '.mp4';
    case 'video/quicktime':
      return '.mov';
    default:
      return '';
  }
}

String _fallbackBasename(String? mimeType) {
  final String fromMime = _extensionForMime(mimeType);
  if (fromMime.isNotEmpty) {
    final String prefix = _isVideoMime(mimeType) ? 'video' : 'image';
    return '$prefix$fromMime';
  }
  return 'attachment.bin';
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
