import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/utils/clipboard_attachment_reader.dart';
import 'package:fluxer_app/features/chat/utils/composer_upload_file.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';

export 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart'
    show readClipboardPlainText;

Future<FileUploadValidationResult?> tryPasteClipboardAttachments({
  required WidgetRef ref,
  required String channelId,
  required bool isAttachEnabled,
}) async {
  if (!isAttachEnabled) {
    return null;
  }
  final List<XFile> files = await readClipboardAttachmentFiles();
  if (files.isEmpty) {
    return null;
  }
  return ref
      .read(cloudUploadControllerProvider(channelId).notifier)
      .addFiles(composerUploadFiles(files));
}

Future<void> pastePlainTextIntoComposer(
  TextEditingController controller,
) async {
  await pasteIntoTextController(controller);
}

Future<void> pasteIntoComposer({
  required ComposerMentionController controller,
  required int maxLength,
  required bool canAttachOnExceed,
  required void Function(String pastedText) onPasteExceedsLimit,
}) async {
  final String? clipboardText = await readClipboardPlainText();
  if (clipboardText == null || clipboardText.isEmpty) {
    return;
  }
  final String sanitized = stripPrivateUseCharacters(clipboardText);
  if (sanitized.isEmpty) {
    return;
  }
  if (canAttachOnExceed) {
    final int projectedLength = projectedWireLengthAfterPaste(
      controller,
      clipboardText,
    );
    if (projectedLength > maxLength) {
      onPasteExceedsLimit(sanitized);
      return;
    }
  }
  await pasteWireTextIntoInlineTokenController(controller, clipboardText);
}

Future<void> handleComposerPaste({
  required WidgetRef ref,
  required String channelId,
  required TextEditingController controller,
  required bool isAttachEnabled,
  int? maxMessageLength,
  bool Function()? canAttachOnExceed,
  void Function(String pastedText)? onPasteExceedsLimit,
  void Function(FileUploadValidationResult result)? onValidationResult,
}) async {
  final FileUploadValidationResult? attachmentResult =
      await tryPasteClipboardAttachments(
        ref: ref,
        channelId: channelId,
        isAttachEnabled: isAttachEnabled,
      );
  if (attachmentResult != null) {
    onValidationResult?.call(attachmentResult);
    return;
  }
  if (controller is ComposerMentionController &&
      maxMessageLength != null &&
      canAttachOnExceed != null &&
      onPasteExceedsLimit != null) {
    await pasteIntoComposer(
      controller: controller,
      maxLength: maxMessageLength,
      canAttachOnExceed: canAttachOnExceed(),
      onPasteExceedsLimit: onPasteExceedsLimit,
    );
    return;
  }
  await pasteIntoTextController(controller);
}
