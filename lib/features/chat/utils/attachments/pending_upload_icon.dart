import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

final RegExp _kAudioExtension = RegExp(r'\.(mp3|wav|ogg|m4a|flac)$');
final RegExp _kCodeExtension = RegExp(
  r'\.(js|ts|tsx|jsx|dart|py|rs|go|html|css|json|md)$',
);

IconData pendingUploadFileIcon(String filename) {
  final String lower = filename.toLowerCase();
  if (lower.endsWith('.pdf')) {
    return PhosphorIconsFill.filePdf;
  }
  if (lower.endsWith('.zip') ||
      lower.endsWith('.rar') ||
      lower.endsWith('.7z')) {
    return PhosphorIconsFill.fileZip;
  }
  if (_kAudioExtension.hasMatch(lower)) {
    return PhosphorIconsFill.fileAudio;
  }
  if (_kCodeExtension.hasMatch(lower)) {
    return PhosphorIconsFill.fileCode;
  }
  return PhosphorIconsFill.file;
}

String? pendingUploadExtension(String filename) {
  final int dot = filename.lastIndexOf('.');
  if (dot <= 0 || dot == filename.length - 1) {
    return null;
  }
  return filename.substring(dot + 1).toUpperCase();
}
