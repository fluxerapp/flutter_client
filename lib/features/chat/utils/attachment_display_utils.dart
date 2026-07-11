import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Set<String> kImageAttachmentExtensions = <String>{
  'png',
  'jpg',
  'jpeg',
  'gif',
  'webp',
};

bool isImageAttachment({required String filename, String? contentType}) {
  final List<String> segments = filename.split('.');
  if (segments.length > 1) {
    final String ext = segments.last.toLowerCase();
    if (kImageAttachmentExtensions.contains(ext)) {
      return true;
    }
  }
  final String? normalizedType = contentType?.toLowerCase();
  if (normalizedType != null &&
      normalizedType.startsWith('image/') &&
      normalizedType != 'image/svg+xml') {
    return true;
  }
  return false;
}

IconData phosphorFillIconForChatAttachmentFilename(String filename) {
  final List<String> segments = filename.split('.');
  final String fileExt = segments.length > 1 ? segments.last.toLowerCase() : '';
  const Set<String> imageTypes = <String>{
    'jpg',
    'jpeg',
    'png',
    'gif',
    'webp',
    'svg',
    'bmp',
    'ico',
  };
  const Set<String> textTypes = <String>{'txt', 'rtf', 'md', 'log'};
  const Set<String> archiveTypes = <String>{
    'zip',
    'rar',
    '7z',
    'tar',
    'gz',
    'bz2',
    'xz',
  };
  const Set<String> audioTypes = <String>{
    'mp3',
    'wav',
    'ogg',
    'flac',
    'm4a',
    'aac',
    'wma',
  };
  const Set<String> videoTypes = <String>{
    'mp4',
    'webm',
    'mov',
    'avi',
    'mkv',
    'flv',
    'wmv',
  };
  const Set<String> codeTypes = <String>{
    'js',
    'jsx',
    'ts',
    'tsx',
    'py',
    'java',
    'c',
    'cpp',
    'h',
    'css',
    'html',
    'json',
    'xml',
    'yml',
    'yaml',
    'sh',
    'go',
    'rs',
    'rb',
    'php',
  };
  const Set<String> excelTypes = <String>{'xls', 'xlsx', 'csv'};
  const Set<String> presentationTypes = <String>{'ppt', 'pptx'};
  const Set<String> documentTypes = <String>{'doc', 'docx'};
  if (imageTypes.contains(fileExt)) {
    return PhosphorIconsFill.fileImage;
  }
  if (fileExt == 'pdf') {
    return PhosphorIconsFill.filePdf;
  }
  if (textTypes.contains(fileExt)) {
    return PhosphorIconsFill.fileText;
  }
  if (documentTypes.contains(fileExt)) {
    return PhosphorIconsFill.fileDoc;
  }
  if (archiveTypes.contains(fileExt)) {
    return PhosphorIconsFill.fileArchive;
  }
  if (audioTypes.contains(fileExt)) {
    return PhosphorIconsFill.fileAudio;
  }
  if (videoTypes.contains(fileExt)) {
    return PhosphorIconsFill.fileVideo;
  }
  if (codeTypes.contains(fileExt)) {
    return PhosphorIconsFill.fileCode;
  }
  if (excelTypes.contains(fileExt)) {
    return PhosphorIconsFill.fileXls;
  }
  if (presentationTypes.contains(fileExt)) {
    return PhosphorIconsFill.filePpt;
  }
  return PhosphorIconsFill.file;
}

String? attachmentEffectiveDownloadUrl({
  required String url,
  required bool isExpired,
  String? proxyUrl,
}) {
  if (isExpired) {
    return null;
  }
  final String? trimmedProxy = proxyUrl?.trim();
  if (trimmedProxy != null && trimmedProxy.isNotEmpty) {
    return trimmedProxy;
  }
  final String trimmedUrl = url.trim();
  if (trimmedUrl.isEmpty) {
    return null;
  }
  return trimmedUrl;
}

(String, String) splitAttachmentFilenameStemAndExtension(String filename) {
  final int lastDot = filename.lastIndexOf('.');
  if (lastDot <= 0) {
    return (filename, '');
  }
  return (filename.substring(0, lastDot), filename.substring(lastDot));
}

String? formatAttachmentByteSize(int? bytes) {
  if (bytes == null || bytes <= 0) {
    return null;
  }
  const List<String> units = <String>['B', 'KB', 'MB', 'GB'];
  double value = bytes.toDouble();
  int unit = 0;
  while (value >= 1024 && unit < units.length - 1) {
    value /= 1024;
    unit++;
  }
  final int precision = unit == 0 || value >= 10 ? 0 : 1;
  return '${value.toStringAsFixed(precision)} ${units[unit]}';
}

String formatAttachmentDurationMmSs(Duration duration) {
  final int totalSeconds = duration.inSeconds;
  final int minutes = totalSeconds ~/ 60;
  final int seconds = totalSeconds % 60;
  return '$minutes:${seconds.toString().padLeft(2, '0')}';
}

String formatAttachmentElapsedTotalMmSs({
  required Duration elapsed,
  required Duration total,
}) {
  return '${formatAttachmentDurationMmSs(elapsed)} / ${formatAttachmentDurationMmSs(total)}';
}

String buildAttachmentSizeDurationMetaLine({
  required int? fileSize,
  required Duration duration,
}) {
  final String? sizeLabel = formatAttachmentByteSize(fileSize);
  final String durationLabel = formatAttachmentDurationMmSs(duration);
  if (sizeLabel == null) {
    if (duration == Duration.zero) {
      return '';
    }
    return durationLabel;
  }
  if (duration == Duration.zero) {
    return sizeLabel;
  }
  return '$sizeLabel · $durationLabel';
}
