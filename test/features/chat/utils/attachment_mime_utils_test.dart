import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/attachment_mime_utils.dart';

void main() {
  group('detectSupportedUploadMimeType', () {
    test('detects PNG', () {
      final Uint8List bytes = Uint8List.fromList(<int>[
        0x89,
        0x50,
        0x4E,
        0x47,
        0x0D,
        0x0A,
        0x1A,
        0x0A,
      ]);
      expect(detectSupportedUploadMimeType(bytes), 'image/png');
    });

    test('detects PDF', () {
      final Uint8List bytes = Uint8List.fromList(<int>[
        0x25,
        0x50,
        0x44,
        0x46,
        0x2D,
      ]);
      expect(detectSupportedUploadMimeType(bytes), 'application/pdf');
    });

    test('detects ZIP', () {
      final Uint8List bytes = Uint8List.fromList(<int>[0x50, 0x4B, 0x03, 0x04]);
      expect(detectSupportedUploadMimeType(bytes), 'application/zip');
    });

    test('returns null for unsupported bytes', () {
      final Uint8List bytes = Uint8List.fromList(<int>[0x4D, 0x5A]);
      expect(detectSupportedUploadMimeType(bytes), isNull);
    });
  });

  group('attachmentExtensionForMime', () {
    test('maps supported mime types', () {
      expect(attachmentExtensionForMime('image/png'), '.png');
      expect(attachmentExtensionForMime('application/pdf'), '.pdf');
      expect(attachmentExtensionForMime('audio/mpeg'), '.mp3');
    });

    test('returns empty for unsupported mime types', () {
      expect(attachmentExtensionForMime('application/x-msdownload'), '');
      expect(attachmentExtensionForMime('text/plain'), '');
    });
  });
}
