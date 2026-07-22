import 'package:cross_file/cross_file.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

/// Normalized payload received from the OS share sheet.
class SharedMediaPayload {
  const SharedMediaPayload({required this.files, this.message});

  final List<SharedMediaFile> files;
  final String? message;

  /// Supported media files as [XFile] instances for the upload pipeline.
  List<XFile> toXFiles() {
    return files
        .where(
          (SharedMediaFile file) =>
              file.type == SharedMediaType.image ||
              file.type == SharedMediaType.video,
        )
        .map((SharedMediaFile file) => XFile(file.path))
        .toList(growable: false);
  }

  bool get hasMedia => toXFiles().isNotEmpty;

  /// Plain text or URLs shared from another app.
  String? get sharedText {
    final StringBuffer buffer = StringBuffer();
    for (final SharedMediaFile file in files) {
      if (file.type != SharedMediaType.text &&
          file.type != SharedMediaType.url) {
        continue;
      }
      final String content = file.path.trim();
      if (content.isEmpty) {
        continue;
      }
      if (buffer.isNotEmpty) {
        buffer.writeln();
      }
      buffer.write(content);
    }
    final String result = buffer.toString().trim();
    return result.isEmpty ? null : result;
  }

  /// Message to pre-fill in the share sheet composer.
  String? get initialMessage {
    final String? caption = message?.trim();
    if (caption != null && caption.isNotEmpty) {
      return caption;
    }
    return sharedText;
  }

  bool get hasContent => hasMedia || sharedText != null;
}
