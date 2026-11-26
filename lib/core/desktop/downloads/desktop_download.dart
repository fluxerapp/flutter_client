import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

enum DesktopDownloadState { started, progressing, completed, canceled, failed }

@immutable
class DesktopDownload {
  const DesktopDownload({
    required this.id,
    required this.filePath,
    this.state = DesktopDownloadState.started,
    this.receivedBytes = 0,
    this.totalBytes,
    this.fileExists = false,
  });

  final int id;
  final String filePath;
  final DesktopDownloadState state;
  final int receivedBytes;
  final int? totalBytes;
  final bool fileExists;

  String get fileName => p.basename(filePath);

  bool get isInProgress =>
      state == DesktopDownloadState.started ||
      state == DesktopDownloadState.progressing;

  bool get canOpen => state == DesktopDownloadState.completed && fileExists;

  DesktopDownload copyWith({
    DesktopDownloadState? state,
    int? receivedBytes,
    int? totalBytes,
    bool? fileExists,
  }) {
    return DesktopDownload(
      id: id,
      filePath: filePath,
      state: state ?? this.state,
      receivedBytes: receivedBytes ?? this.receivedBytes,
      totalBytes: totalBytes ?? this.totalBytes,
      fileExists: fileExists ?? this.fileExists,
    );
  }
}
