import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/cloud_composer_attachments.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/providers/upload/user_upload_limits_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer_upload_file.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:path/path.dart' as path_lib;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  ProviderContainer createContainer() {
    return ProviderContainer(
      overrides: [
        maxAttachmentFileBytesProvider.overrideWithValue(25 * 1024 * 1024),
      ],
    );
  }

  group('CloudUploadController staging filenames', () {
    test('uses real filename for in-memory files', () async {
      final ProviderContainer container = createContainer();
      addTearDown(container.dispose);
      final FileUploadValidationResult result = await container
          .read(cloudUploadControllerProvider('channel-1').notifier)
          .addFiles(<ComposerUploadFile>[
            composerUploadFile(
              XFile.fromData(
                Uint8List.fromList(<int>[1, 2, 3]),
                path: 'photo.jpg',
                mimeType: 'image/jpeg',
              ),
            ),
          ]);
      expect(result.isValid, isTrue);
      final CloudComposerAttachments attachments = container.read(
        cloudUploadControllerProvider('channel-1'),
      );
      expect(attachments.items, hasLength(1));
      expect(attachments.items.single.filename, 'photo.jpg');
      expect(attachments.items.single.file.name, 'photo.jpg');
      expect(
        path_lib.basename(attachments.items.single.file.path),
        'photo.jpg',
      );
      expect(
        attachments.items.single.file.path,
        isNot(contains('fluxer_upload_')),
      );
    });

    test('keeps real filename from image picker cache path', () async {
      final Directory tempDir = await Directory.systemTemp.createTemp(
        'upload_staging_test_',
      );
      addTearDown(() => tempDir.delete(recursive: true));
      final Directory cacheDir = Directory('${tempDir.path}/cache-uuid')
        ..createSync();
      final File pickerFile = File('${cacheDir.path}/vacation.jpg')
        ..writeAsBytesSync(<int>[1, 2, 3]);
      final ProviderContainer container = createContainer();
      addTearDown(container.dispose);
      final FileUploadValidationResult result = await container
          .read(cloudUploadControllerProvider('channel-1').notifier)
          .addFiles(<ComposerUploadFile>[
            composerUploadFile(XFile(pickerFile.path, mimeType: 'image/jpeg')),
          ]);
      expect(result.isValid, isTrue);
      final CloudComposerAttachments attachments = container.read(
        cloudUploadControllerProvider('channel-1'),
      );
      expect(attachments.items.single.filename, 'vacation.jpg');
      expect(attachments.items.single.file.path, pickerFile.path);
    });

    test('sanitizes generic image_picker temp basename', () async {
      final Directory tempDir = await Directory.systemTemp.createTemp(
        'upload_staging_test_',
      );
      addTearDown(() => tempDir.delete(recursive: true));
      final File pickerFile = File('${tempDir.path}/image_picker_abc123.jpg')
        ..writeAsBytesSync(<int>[1, 2, 3]);
      final ProviderContainer container = createContainer();
      addTearDown(container.dispose);
      final FileUploadValidationResult result = await container
          .read(cloudUploadControllerProvider('channel-1').notifier)
          .addFiles(<ComposerUploadFile>[
            composerUploadFile(XFile(pickerFile.path, mimeType: 'image/jpeg')),
          ]);
      expect(result.isValid, isTrue);
      final CloudComposerAttachments attachments = container.read(
        cloudUploadControllerProvider('channel-1'),
      );
      expect(attachments.items.single.filename, 'image.jpg');
      expect(
        path_lib.basename(attachments.items.single.file.path),
        'image.jpg',
      );
      expect(attachments.items.single.file.path, isNot(pickerFile.path));
    });

    test('stages duplicate basenames in separate directories', () async {
      final ProviderContainer container = createContainer();
      addTearDown(container.dispose);
      final FileUploadValidationResult result = await container
          .read(cloudUploadControllerProvider('channel-1').notifier)
          .addFiles(<ComposerUploadFile>[
            composerUploadFile(
              XFile.fromData(
                Uint8List.fromList(<int>[1]),
                path: 'photo.jpg',
                mimeType: 'image/jpeg',
              ),
            ),
            composerUploadFile(
              XFile.fromData(
                Uint8List.fromList(<int>[2]),
                path: 'photo.jpg',
                mimeType: 'image/jpeg',
              ),
            ),
          ]);
      expect(result.isValid, isTrue);
      final CloudComposerAttachments attachments = container.read(
        cloudUploadControllerProvider('channel-1'),
      );
      expect(attachments.items, hasLength(2));
      expect(attachments.items.map((item) => item.filename).toList(), <String>[
        'photo.jpg',
        'photo.jpg',
      ]);
      final String firstPath = attachments.items[0].file.path;
      final String secondPath = attachments.items[1].file.path;
      expect(firstPath, isNot(equals(secondPath)));
      expect(path_lib.dirname(firstPath), isNot(path_lib.dirname(secondPath)));
      expect(path_lib.basename(firstPath), 'photo.jpg');
      expect(path_lib.basename(secondPath), 'photo.jpg');
    });
  });
}
