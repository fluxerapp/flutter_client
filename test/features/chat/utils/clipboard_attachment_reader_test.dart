import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/clipboard_attachment_reader.dart';
import 'package:fluxer_app/features/chat/utils/composer_clipboard_paste.dart';
import 'package:super_clipboard/super_clipboard.dart';

void main() {
  group('extensionForClipboardFormat', () {
    test('maps common image formats', () {
      expect(extensionForClipboardFormat(Formats.png), 'png');
      expect(extensionForClipboardFormat(Formats.jpeg), 'jpg');
      expect(extensionForClipboardFormat(Formats.gif), 'gif');
      expect(extensionForClipboardFormat(Formats.webp), 'webp');
    });

    test('maps document formats', () {
      expect(extensionForClipboardFormat(Formats.pdf), 'pdf');
      expect(extensionForClipboardFormat(Formats.docx), 'docx');
      expect(extensionForClipboardFormat(Formats.zip), 'zip');
    });

    test('falls back to bin for unknown formats', () {
      expect(extensionForClipboardFormat(Formats.webUnknown), 'bin');
    });
  });

  group('mimeForClipboardFormat', () {
    test('maps common image formats', () {
      expect(mimeForClipboardFormat(Formats.png), 'image/png');
      expect(mimeForClipboardFormat(Formats.jpeg), 'image/jpeg');
      expect(mimeForClipboardFormat(Formats.heic), 'image/heic');
    });

    test('maps document formats', () {
      expect(mimeForClipboardFormat(Formats.pdf), 'application/pdf');
      expect(mimeForClipboardFormat(Formats.json), 'application/json');
    });

    test('falls back to null for unknown formats', () {
      expect(mimeForClipboardFormat(Formats.webUnknown), isNull);
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

    test('sniffs PNG bytes from webUnknown into clipboard.png', () {
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: pngBytes,
            format: Formats.webUnknown,
            name: 'clipboard.bin',
          );
      expect(metadata.name, 'clipboard.png');
      expect(metadata.mime, 'image/png');
    });

    test('sniffs PNG bytes with suggested name into Screenshot.png', () {
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: pngBytes,
            format: Formats.webUnknown,
            name: 'Screenshot',
          );
      expect(metadata.name, 'Screenshot.png');
      expect(metadata.mime, 'image/png');
    });

    test('sniffs JPEG bytes from webUnknown', () {
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: jpegBytes,
            format: Formats.webUnknown,
            name: 'clipboard.bin',
          );
      expect(metadata.name, 'clipboard.jpg');
      expect(metadata.mime, 'image/jpeg');
    });

    test('keeps known format metadata unchanged', () {
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: pngBytes,
            format: Formats.png,
            name: 'screenshot.png',
          );
      expect(metadata.name, 'screenshot.png');
      expect(metadata.mime, 'image/png');
    });

    test('returns clipboard.bin with null mime for unidentifiable bytes', () {
      final Uint8List randomBytes = Uint8List.fromList(<int>[0x00, 0x01, 0x02]);
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: randomBytes,
            format: Formats.webUnknown,
            name: 'clipboard.bin',
          );
      expect(metadata.name, 'clipboard.bin');
      expect(metadata.mime, isNull);
    });
  });

  group('resolveClipboardFilename', () {
    test('prefers file name from clipboard reader', () {
      expect(
        resolveClipboardFilename(
          format: Formats.png,
          fileName: 'screenshot.png',
          suggestedName: 'other.png',
        ),
        'screenshot.png',
      );
    });

    test('uses suggested name when file name is missing', () {
      expect(
        resolveClipboardFilename(
          format: Formats.pdf,
          suggestedName: 'report.pdf',
        ),
        'report.pdf',
      );
    });

    test('falls back to clipboard extension', () {
      expect(resolveClipboardFilename(format: Formats.gif), 'clipboard.gif');
    });

    test('appends extension when suggested name has none', () {
      expect(
        resolveClipboardFilename(format: Formats.png, suggestedName: 'image'),
        'image.png',
      );
    });

    test('appends extension when file name has none', () {
      expect(
        resolveClipboardFilename(format: Formats.jpeg, fileName: 'Screenshot'),
        'Screenshot.jpg',
      );
    });

    test('keeps filename when extension is already present', () {
      expect(
        resolveClipboardFilename(
          format: Formats.png,
          fileName: 'screenshot.png',
        ),
        'screenshot.png',
      );
    });
  });

  group('orderClipboardFileFormats', () {
    test('prefers image formats over webUnknown', () {
      final List<DataFormat<Object>> available = <DataFormat<Object>>[
        Formats.webUnknown,
        Formats.png,
        Formats.plainTextFile,
      ];
      final List<DataFormat<Object>> ordered = orderClipboardFileFormats(
        available,
      );
      expect(ordered.first, Formats.png);
      expect(ordered, contains(Formats.webUnknown));
    });
  });

  group('shouldSkipClipboardFileFormat', () {
    test('skips text file formats when plain text value is available', () {
      final ClipboardDataReader item = _FakeClipboardDataReader(
        providedFormats: <DataFormat<Object>>[
          Formats.plainText,
          Formats.plainTextFile,
        ],
      );
      expect(
        shouldSkipClipboardFileFormat(item, Formats.plainTextFile),
        isTrue,
      );
      expect(shouldSkipClipboardFileFormat(item, Formats.png), isFalse);
    });

    test('keeps text file formats when only a file was copied', () {
      final ClipboardDataReader item = _FakeClipboardDataReader(
        providedFormats: <DataFormat<Object>>[Formats.plainTextFile],
      );
      expect(
        shouldSkipClipboardFileFormat(item, Formats.plainTextFile),
        isFalse,
      );
    });
  });

  group('pastePlainTextIntoComposer', () {
    test('inserts clipboard text at the current selection', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final TextEditingController controller = TextEditingController(
        text: 'hello world',
      );
      controller.selection = const TextSelection.collapsed(offset: 5);
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, (
            MethodCall methodCall,
          ) async {
            if (methodCall.method == 'Clipboard.getData') {
              return <String, String>{'text': ' there'};
            }
            return null;
          });
      await pastePlainTextIntoComposer(controller);
      expect(controller.text, 'hello there world');
      expect(controller.selection, const TextSelection.collapsed(offset: 11));
    });
  });
}

class _FakeClipboardDataReader implements ClipboardDataReader {
  _FakeClipboardDataReader({required this.providedFormats});

  final List<DataFormat<Object>> providedFormats;

  @override
  bool canProvide(DataFormat<Object> format) =>
      providedFormats.contains(format);

  @override
  List<DataFormat<Object>> getFormats(List<DataFormat<Object>> allFormats) {
    return allFormats.where(canProvide).toList();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
