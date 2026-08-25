import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validation_l10n.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';

import '../../../helpers/test_l10n.dart';

void main() {
  group('fileUploadValidationMessage', () {
    test('returns null when the result is valid', () {
      expect(
        fileUploadValidationMessage(
          testL10n,
          const FileUploadValidationResult.success(),
        ),
        isNull,
      );
    });

    test('returns null for noFiles', () {
      expect(
        fileUploadValidationMessage(
          testL10n,
          const FileUploadValidationResult.failure(
            FileUploadValidationError.noFiles,
          ),
        ),
        isNull,
      );
    });

    test('returns the too-many-attachments copy', () {
      expect(
        fileUploadValidationMessage(
          testL10n,
          const FileUploadValidationResult.failure(
            FileUploadValidationError.tooManyAttachments,
          ),
        ),
        testL10n.chatAttachmentTooMany(kMaxAttachmentsPerMessage),
      );
    });

    test('returns file name and size for fileTooLarge', () {
      expect(
        fileUploadValidationMessage(
          testL10n,
          const FileUploadValidationResult.failure(
            FileUploadValidationError.fileTooLarge,
            fileName: 'big.bin',
            fileSizeBytes: 11,
          ),
        ),
        testL10n.chatAttachmentFileTooLarge('big.bin', '11 B'),
      );
    });
  });
}
