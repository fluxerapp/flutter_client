import 'package:cross_file/cross_file.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/attachments/clipboard_attachment_reader.dart';
import 'package:fluxer_clipboard/fluxer_clipboard.dart';
import 'package:image/image.dart' as img;

void main() {
  group('extensionForClipboardMime', () {
    test('maps common image formats', () {
      expect(extensionForClipboardMime('image/png'), 'png');
      expect(extensionForClipboardMime('image/jpeg'), 'jpg');
      expect(extensionForClipboardMime('image/gif'), 'gif');
      expect(extensionForClipboardMime('image/webp'), 'webp');
      expect(extensionForClipboardMime('IMAGE/PNG'), 'png');
    });

    test('maps document and extra formats', () {
      expect(extensionForClipboardMime('application/pdf'), 'pdf');
      expect(extensionForClipboardMime('application/zip'), 'zip');
      expect(extensionForClipboardMime('image/svg+xml'), 'svg');
      expect(extensionForClipboardMime('image/tiff'), 'tif');
    });

    test('falls back to bin for unknown formats', () {
      expect(extensionForClipboardMime(null), 'bin');
      expect(extensionForClipboardMime(''), 'bin');
      expect(extensionForClipboardMime('application/x-unknown'), 'bin');
    });
  });

  group('resolveClipboardAttachmentMetadata', () {
    final Uint8List pngBytes = Uint8List.fromList(<int>[
      0x89,
      0x50,
      0x4E,
      0x47,
      0x0D,
      0x0A,
      0x1A,
      0x0A,
    ]);

    final Uint8List jpegBytes = Uint8List.fromList(<int>[
      0xFF,
      0xD8,
      0xFF,
      0xE0,
    ]);

    test('sniffs PNG bytes without a mime into clipboard.png', () {
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: pngBytes,
            mimeType: null,
            name: 'clipboard.bin',
          );
      expect(metadata.name, 'clipboard.png');
      expect(metadata.mime, 'image/png');
    });

    test('sniffs PNG bytes with suggested name into Screenshot.png', () {
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: pngBytes,
            mimeType: null,
            name: 'Screenshot',
          );
      expect(metadata.name, 'Screenshot.png');
      expect(metadata.mime, 'image/png');
    });

    test('sniffs JPEG bytes without a mime', () {
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: jpegBytes,
            mimeType: null,
            name: 'clipboard.bin',
          );
      expect(metadata.name, 'clipboard.jpg');
      expect(metadata.mime, 'image/jpeg');
    });

    test('keeps known mime metadata unchanged', () {
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: pngBytes,
            mimeType: 'image/png',
            name: 'screenshot.png',
          );
      expect(metadata.name, 'screenshot.png');
      expect(metadata.mime, 'image/png');
    });

    test('fixes bin extension when known mime is image', () {
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: pngBytes,
            mimeType: 'image/png',
            name: 'clipboard.bin',
          );
      expect(metadata.name, 'clipboard.png');
      expect(metadata.mime, 'image/png');
    });

    test('returns clipboard.bin with null mime for unidentifiable bytes', () {
      final Uint8List randomBytes = Uint8List.fromList(<int>[0x00, 0x01, 0x02]);
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: randomBytes,
            mimeType: null,
            name: 'clipboard.bin',
          );
      expect(metadata.name, 'clipboard.bin');
      expect(metadata.mime, isNull);
    });

    test('sniffs PDF bytes without a mime', () {
      final Uint8List pdfBytes = Uint8List.fromList(<int>[
        0x25,
        0x50,
        0x44,
        0x46,
        0x2D,
      ]);
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: pdfBytes,
            mimeType: null,
            name: 'clipboard.bin',
          );
      expect(metadata.name, 'clipboard.pdf');
      expect(metadata.mime, 'application/pdf');
    });
  });

  group('resolveClipboardFilename', () {
    test('falls back to clipboard extension', () {
      expect(resolveClipboardFilename(mimeType: 'image/gif'), 'clipboard.gif');
      expect(
        resolveClipboardFilename(
          mimeType:
              'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        ),
        'clipboard.docx',
      );
      expect(resolveClipboardFilename(mimeType: 'text/csv'), 'clipboard.csv');
    });

    test('ignores blank file names', () {
      expect(
        resolveClipboardFilename(mimeType: 'image/png', fileName: '  '),
        'clipboard.png',
      );
    });

    test('appends extension when file name has none', () {
      expect(
        resolveClipboardFilename(
          mimeType: 'image/jpeg',
          fileName: 'Screenshot',
        ),
        'Screenshot.jpg',
      );
    });

    test('keeps filename when extension is already present', () {
      expect(
        resolveClipboardFilename(
          mimeType: 'image/png',
          fileName: 'screenshot.png',
        ),
        'screenshot.png',
      );
    });
  });

  group('clipboardAttachmentMimeTypes', () {
    test('keeps every previously supported file format', () {
      expect(
        clipboardAttachmentMimeTypes,
        containsAll(<String>[
          'text/plain',
          'text/html',
          'text/markdown',
          'text/csv',
          'application/json',
          'application/rtf',
          'application/msword',
          'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
          'application/vnd.ms-excel',
          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
          'application/vnd.ms-powerpoint',
          'application/vnd.openxmlformats-officedocument.presentationml.presentation',
          'application/zip',
          'application/x-7z-compressed',
          'application/x-msi',
          'video/x-ms-wmv',
          'video/mp2t',
          'audio/flac',
          'image/x-icon',
        ]),
      );
      expect(
        clipboardAttachmentMimeTypes.toSet().length,
        clipboardAttachmentMimeTypes.length,
      );
    });

    test('prefers concrete image types before wildcards', () {
      expect(clipboardAttachmentMimeTypes.first, 'image/png');
      expect(
        clipboardAttachmentMimeTypes.indexOf('image/png'),
        lessThan(clipboardAttachmentMimeTypes.indexOf('image/tiff')),
      );
      expect(
        clipboardAttachmentMimeTypes.indexOf('application/pdf'),
        lessThan(clipboardAttachmentMimeTypes.indexOf('image/*')),
      );
    });
  });

  group('clipboardItemToXFile', () {
    test('returns path-backed files with the native name', () async {
      final XFile? file = await clipboardItemToXFile(
        NativeClipboardItem(
          path: '/tmp/report.pdf',
          name: 'report.pdf',
          mimeType: 'application/pdf',
        ),
      );
      expect(file, isNotNull);
      expect(file!.path, '/tmp/report.pdf');
      expect(file.name, 'report.pdf');
      expect(file.mimeType, 'application/pdf');
    });

    test('uses the path basename when no name is given', () async {
      final XFile? file = await clipboardItemToXFile(
        NativeClipboardItem(path: '/tmp/photo.jpg'),
      );
      expect(file!.name, 'photo.jpg');
    });

    test('returns null for empty data', () async {
      expect(
        await clipboardItemToXFile(
          NativeClipboardItem(data: Uint8List(0), mimeType: 'image/png'),
        ),
        isNull,
      );
      expect(await clipboardItemToXFile(NativeClipboardItem()), isNull);
    });

    test('keeps the native mime type for in-memory data', () async {
      final XFile? file = await clipboardItemToXFile(
        NativeClipboardItem(
          data: Uint8List.fromList(<int>[0x47, 0x49, 0x46, 0x38]),
          mimeType: 'image/gif',
        ),
      );
      expect(file!.mimeType, 'image/gif');
    });

    test('sniffs a mime type when the native side gave none', () async {
      final XFile? file = await clipboardItemToXFile(
        NativeClipboardItem(
          data: Uint8List.fromList(<int>[0x25, 0x50, 0x44, 0x46, 0x2D]),
        ),
      );
      expect(file!.mimeType, 'application/pdf');
    });

    test('converts BMP data to PNG', () async {
      final Uint8List bmp = img.encodeBmp(img.Image(width: 2, height: 2));
      final XFile? file = await clipboardItemToXFile(
        NativeClipboardItem(data: bmp, mimeType: 'image/bmp'),
      );
      expect(file!.mimeType, 'image/png');
      final Uint8List bytes = await file.readAsBytes();
      expect(bytes.sublist(0, 4), <int>[0x89, 0x50, 0x4E, 0x47]);
    });
  });
}
