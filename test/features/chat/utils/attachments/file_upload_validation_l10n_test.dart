import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validation_l10n.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validator.dart';

import '../../../../helpers/test_l10n.dart';

FileUploadValidationCopy? _copy(FileUploadValidationResult result) {
  return fileUploadValidationCopy(
    testL10n,
    result,
    maxAttachments: 10,
    maxFileBytes: 25 * 1024 * 1024,
  );
}

void main() {
  group('fileUploadValidationCopy', () {
    test('returns null when the result is valid', () {
      expect(_copy(const FileUploadValidationResult.success()), isNull);
    });

    test('returns null for noFiles', () {
      expect(
        _copy(
          const FileUploadValidationResult.failure(
            FileUploadValidationError.noFiles,
          ),
        ),
        isNull,
      );
    });

    test('explains the attachment count limit', () {
      final FileUploadValidationCopy? copy = _copy(
        const FileUploadValidationResult.failure(
          FileUploadValidationError.tooManyAttachments,
        ),
      );
      expect(copy?.title, 'Whoa, this is heavy');
      expect(
        copy?.body,
        'You can only upload 10 files at a time. Try again with fewer files.',
      );
    });

    test('names the size limit, not the file size', () {
      final FileUploadValidationCopy? copy = _copy(
        const FileUploadValidationResult.failure(
          FileUploadValidationError.fileTooLarge,
        ),
      );
      expect(copy?.title, 'File size too large');
      expect(copy?.body, contains('25'));
      expect(copy?.body, startsWith('One or more files'));
    });
  });
}
