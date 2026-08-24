import 'package:fluxer_app/features/chat/utils/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String? fileUploadValidationMessage(
  FluxerLocalizations l10n,
  FileUploadValidationResult result,
) {
  if (result.isValid || result.error == null) {
    return null;
  }
  final String message = switch (result.error!) {
    FileUploadValidationError.tooManyAttachments =>
      l10n.chatAttachmentTooMany(kMaxAttachmentsPerMessage),
    FileUploadValidationError.fileTooLarge => l10n.chatAttachmentFileTooLarge,
    FileUploadValidationError.multipartRequestTooLarge =>
      l10n.chatAttachmentPayloadTooLarge,
    FileUploadValidationError.noFiles => '',
  };
  if (message.isEmpty) {
    return null;
  }
  return message;
}
