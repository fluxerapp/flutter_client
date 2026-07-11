import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';

void main() {
  group('FileUploadValidator.validateAddFiles', () {
    test('returns noFiles when list is empty', () async {
      const FileUploadValidator validator = FileUploadValidator(
        maxAttachments: 10,
        maxFileBytes: 25 * 1024 * 1024,
        maxMultipartRequestBytes: 25 * 1024 * 1024,
      );
      final FileUploadValidationResult actual = await validator
          .validateAddFiles(currentCount: 0, newFiles: const <XFile>[]);
      expect(actual.isValid, false);
      expect(actual.error, FileUploadValidationError.noFiles);
    });

    test('returns tooManyAttachments when count would exceed max', () async {
      const FileUploadValidator validator = FileUploadValidator(
        maxAttachments: 2,
        maxFileBytes: 1024,
        maxMultipartRequestBytes: 1024,
      );
      final List<XFile> inputFiles = <XFile>[
        XFile.fromData(Uint8List(1), name: 'a.bin'),
        XFile.fromData(Uint8List(1), name: 'b.bin'),
      ];
      final FileUploadValidationResult actual = await validator
          .validateAddFiles(currentCount: 1, newFiles: inputFiles);
      expect(actual.isValid, false);
      expect(actual.error, FileUploadValidationError.tooManyAttachments);
    });

    test('returns fileTooLarge when a file exceeds maxFileBytes', () async {
      const FileUploadValidator validator = FileUploadValidator(
        maxAttachments: 10,
        maxFileBytes: 10,
        maxMultipartRequestBytes: 10,
      );
      final List<XFile> inputFiles = <XFile>[
        XFile.fromData(Uint8List(11), name: 'big.bin'),
      ];
      final FileUploadValidationResult actual = await validator
          .validateAddFiles(currentCount: 0, newFiles: inputFiles);
      expect(actual.isValid, false);
      expect(actual.error, FileUploadValidationError.fileTooLarge);
    });

    test('returns success when within limits', () async {
      const FileUploadValidator validator = FileUploadValidator(
        maxAttachments: 10,
        maxFileBytes: 1024,
        maxMultipartRequestBytes: 1024,
      );
      final List<XFile> inputFiles = <XFile>[
        XFile.fromData(Uint8List(100), name: 'ok.bin'),
      ];
      final FileUploadValidationResult actual = await validator
          .validateAddFiles(currentCount: 0, newFiles: inputFiles);
      expect(actual.isValid, true);
      expect(actual.error, null);
    });
  });

  group('FileUploadValidator.guessContentTypeFromName', () {
    test('maps known extensions', () {
      expect(
        FileUploadValidator.guessContentTypeFromName('x.PNG'),
        'image/png',
      );
      expect(
        FileUploadValidator.guessContentTypeFromName('doc.JPEG'),
        'image/jpeg',
      );
      expect(
        FileUploadValidator.guessContentTypeFromName('a.pdf'),
        'application/pdf',
      );
      expect(
        FileUploadValidator.guessContentTypeFromName('unknown.bin'),
        'application/octet-stream',
      );
    });
  });

  group('FileUploadValidator.resolveContentTypeForUpload', () {
    test('prefers mime type over extension-less filename', () {
      expect(
        FileUploadValidator.resolveContentTypeForUpload(
          filename: 'image',
          mimeType: 'image/png',
        ),
        'image/png',
      );
    });

    test('falls back to filename when mime is octet-stream', () {
      expect(
        FileUploadValidator.resolveContentTypeForUpload(
          filename: 'photo.png',
          mimeType: 'application/octet-stream',
        ),
        'image/png',
      );
    });

    test('falls back to filename when mime is null', () {
      expect(
        FileUploadValidator.resolveContentTypeForUpload(filename: 'photo.jpg'),
        'image/jpeg',
      );
    });
  });
}
