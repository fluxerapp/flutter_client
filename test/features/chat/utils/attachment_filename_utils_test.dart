import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/attachment_filename_utils.dart';

void main() {
  group('isGenericImagePickerTempBasename', () {
    test('matches plugin temp names', () {
      expect(isGenericImagePickerTempBasename('image_picker.jpg'), isTrue);
      expect(
        isGenericImagePickerTempBasename('image_picker_abc123.jpg'),
        isTrue,
      );
      expect(isGenericImagePickerTempBasename('image_picker.ABC.JPG'), isTrue);
    });

    test('does not match real filenames', () {
      expect(isGenericImagePickerTempBasename('vacation.jpg'), isFalse);
      expect(
        isGenericImagePickerTempBasename('my_image_picker_tool.jpg'),
        isFalse,
      );
    });
  });

  group('resolveUploadFilename', () {
    test('uses explicit picker name over temp path basename', () {
      final XFile file = XFile(
        '/tmp/image_picker_abc123.jpg',
        mimeType: 'image/jpeg',
      );
      expect(
        resolveUploadFilename(file: file, explicitName: 'Family Photo.jpg'),
        'Family Photo.jpg',
      );
    });

    test('uses real basename from image picker cache path', () {
      final XFile file = XFile(
        '/data/cache/550e8400-e29b-41d4-a716-446655440000/vacation.jpg',
        mimeType: 'image/jpeg',
      );
      expect(resolveUploadFilename(file: file), 'vacation.jpg');
    });

    test('falls back for generic image picker temp names', () {
      final XFile file = XFile(
        '/tmp/image_picker_abc123.jpg',
        mimeType: 'image/jpeg',
      );
      expect(resolveUploadFilename(file: file), 'image.jpg');
    });

    test('replaces bin extension when mime type is image', () {
      final XFile file = XFile.fromData(
        Uint8List(0),
        name: 'clipboard.bin',
        mimeType: 'image/png',
      );
      expect(resolveUploadFilename(file: file), 'attachment.png');
    });

    test('replaces attachment.bin when mime type is image', () {
      final XFile file = XFile.fromData(
        Uint8List(0),
        name: 'attachment.bin',
        mimeType: 'image/jpeg',
      );
      expect(resolveUploadFilename(file: file), 'attachment.jpg');
    });

    test('replaces bin extension for supported pdf mime type', () {
      expect(
        filenameForMimeType('clipboard.bin', mimeType: 'application/pdf'),
        'clipboard.pdf',
      );
    });
  });

  group('filenameForMimeType', () {
    test('replaces bin extension from mime type', () {
      expect(
        filenameForMimeType('clipboard.bin', mimeType: 'image/png'),
        'clipboard.png',
      );
    });

    test('appends extension when name has none', () {
      expect(
        filenameForMimeType('Screenshot', mimeType: 'image/png'),
        'Screenshot.png',
      );
    });

    test('uses default stem when name is empty', () {
      expect(
        filenameForMimeType(
          '',
          mimeType: 'image/png',
          defaultStem: 'clipboard',
        ),
        'clipboard.png',
      );
    });

    test('falls back to bin when mime type is unknown', () {
      expect(filenameForMimeType(''), 'attachment.bin');
      expect(filenameForMimeType('clipboard.bin'), 'clipboard.bin');
    });

    test('keeps non-bin extensions', () {
      expect(
        filenameForMimeType('photo.jpg', mimeType: 'image/png'),
        'photo.jpg',
      );
    });
  });

  group('uploadFilenameOverrideFromPickerXFile', () {
    test('returns null for generic plugin temp names', () {
      final XFile file = XFile('/tmp/image_picker_abc123.jpg');
      expect(uploadFilenameOverrideFromPickerXFile(file), isNull);
    });

    test('returns basename for real picker filenames', () {
      final XFile file = XFile(
        '/data/cache/uuid/Sunset at the beach.png',
        mimeType: 'image/png',
      );
      expect(
        uploadFilenameOverrideFromPickerXFile(file),
        'Sunset at the beach.png',
      );
    });
  });
}
