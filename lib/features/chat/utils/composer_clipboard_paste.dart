import 'package:cross_file/cross_file.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/utils/attachment_filename_utils.dart';
import 'package:fluxer_app/features/chat/utils/clipboard_attachment_reader.dart';
import 'package:fluxer_app/features/chat/utils/composer_upload_file.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';
import 'package:fluxer_app/material_ui.dart';

export 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart'
    show readClipboardPlainText;

bool clipboardLikelyHasFileAttachments({required bool? hasStrings}) =>
    hasStrings != true;

Future<bool> readClipboardLikelyHasFileAttachments() async {
  try {
    return clipboardLikelyHasFileAttachments(
      hasStrings: await Clipboard.hasStrings(),
    );
  } on Object {
    return true;
  }
}

Future<FileUploadValidationResult?> tryPasteClipboardAttachments({
  required WidgetRef ref,
  required String channelId,
  required bool isAttachEnabled,
}) async {
  if (!isAttachEnabled) {
    return null;
  }
  if (!await readClipboardLikelyHasFileAttachments()) {
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

Future<bool> pasteIntoComposer({
  required ComposerMentionController controller,
  required int maxLength,
  required bool canAttachOnExceed,
  required void Function(String pastedText) onPasteExceedsLimit,
  void Function()? onPasteLostContent,
}) async {
  final String? clipboardText = await readClipboardPlainText();
  if (clipboardText == null || clipboardText.isEmpty) {
    return false;
  }
  return finishComposerWireTextPaste(
    controller: controller,
    clipboardText: clipboardText,
    maxLength: maxLength,
    canAttachOnExceed: canAttachOnExceed,
    onPasteExceedsLimit: onPasteExceedsLimit,
    onPasteLostContent: onPasteLostContent,
  );
}

Future<bool> finishComposerNativeTextPaste({
  required TextEditingController controller,
  required String textBefore,
  required TextSelection selectionBefore,
  int? maxMessageLength,
  bool Function()? canAttachOnExceed,
  void Function(String pastedText)? onPasteExceedsLimit,
  void Function()? onPasteLostContent,
}) {
  return reprocessNativeTextPaste(
    controller: controller,
    textBefore: textBefore,
    selectionBefore: selectionBefore,
    applyPaste: (String inserted) {
      if (controller is ComposerMentionController &&
          maxMessageLength != null &&
          canAttachOnExceed != null &&
          onPasteExceedsLimit != null) {
        return finishComposerWireTextPaste(
          controller: controller,
          clipboardText: inserted,
          maxLength: maxMessageLength,
          canAttachOnExceed: canAttachOnExceed(),
          onPasteExceedsLimit: onPasteExceedsLimit,
          onPasteLostContent: onPasteLostContent,
        );
      }
      if (controller is InlineTokenTextEditingController) {
        return pasteWireTextIntoInlineTokenController(controller, inserted);
      }
      return Future<bool>.value(true);
    },
  );
}

Future<bool> finishComposerWireTextPaste({
  required ComposerMentionController controller,
  required String clipboardText,
  required int maxLength,
  required bool canAttachOnExceed,
  required void Function(String pastedText) onPasteExceedsLimit,
  void Function()? onPasteLostContent,
}) async {
  final String sanitized = stripPrivateUseCharacters(clipboardText);
  if (sanitized.isEmpty) {
    if (wireTextLostContentAfterSanitize(
      rawWireText: clipboardText,
      sanitizedWireText: sanitized,
    )) {
      onPasteLostContent?.call();
    }
    return false;
  }
  if (canAttachOnExceed) {
    final int projectedLength = projectedWireLengthAfterPaste(
      controller,
      clipboardText,
    );
    if (projectedLength > maxLength) {
      onPasteExceedsLimit(sanitized);
      return true;
    }
  }
  return pasteWireTextIntoInlineTokenController(controller, clipboardText);
}

Future<bool> handleComposerPaste({
  required WidgetRef ref,
  required String channelId,
  required TextEditingController controller,
  required bool isAttachEnabled,
  int? maxMessageLength,
  bool Function()? canAttachOnExceed,
  void Function(String pastedText)? onPasteExceedsLimit,
  void Function()? onPasteLostContent,
  void Function(FileUploadValidationResult result)? onValidationResult,
  bool attachmentsOnly = false,
}) async {
  if (!attachmentsOnly) {
    final bool pastedText = await _tryPasteComposerText(
      controller: controller,
      maxMessageLength: maxMessageLength,
      canAttachOnExceed: canAttachOnExceed,
      onPasteExceedsLimit: onPasteExceedsLimit,
      onPasteLostContent: onPasteLostContent,
    );
    if (pastedText) {
      return true;
    }
  }
  final FileUploadValidationResult? attachmentResult =
      await tryPasteClipboardAttachments(
        ref: ref,
        channelId: channelId,
        isAttachEnabled: isAttachEnabled,
      );
  if (attachmentResult != null) {
    onValidationResult?.call(attachmentResult);
    return true;
  }
  return false;
}

Future<bool> _tryPasteComposerText({
  required TextEditingController controller,
  int? maxMessageLength,
  bool Function()? canAttachOnExceed,
  void Function(String pastedText)? onPasteExceedsLimit,
  void Function()? onPasteLostContent,
}) {
  if (controller is ComposerMentionController &&
      maxMessageLength != null &&
      canAttachOnExceed != null &&
      onPasteExceedsLimit != null) {
    return pasteIntoComposer(
      controller: controller,
      maxLength: maxMessageLength,
      canAttachOnExceed: canAttachOnExceed(),
      onPasteExceedsLimit: onPasteExceedsLimit,
      onPasteLostContent: onPasteLostContent,
    );
  }
  return pasteIntoTextController(controller);
}

Future<FileUploadValidationResult?> handleComposerContentInserted({
  required WidgetRef ref,
  required String channelId,
  required KeyboardInsertedContent content,
  required bool isAttachEnabled,
}) async {
  if (!isAttachEnabled || !content.hasData) {
    return null;
  }
  final String? mimeType = content.mimeType.trim().isEmpty
      ? null
      : content.mimeType;
  final String filename = filenameForMimeType(
    'keyboard-insert',
    mimeType: mimeType,
    defaultStem: 'clipboard',
  );
  final XFile file = XFile.fromData(
    content.data!,
    name: filename,
    mimeType: mimeType,
  );
  return ref
      .read(cloudUploadControllerProvider(channelId).notifier)
      .addFiles(composerUploadFiles(<XFile>[file]));
}
