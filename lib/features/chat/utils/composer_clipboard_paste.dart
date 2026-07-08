import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/utils/clipboard_attachment_reader.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:super_clipboard/super_clipboard.dart';

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
      .addFiles(files);
}

Future<String?> readClipboardPlainText() async {
  final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
  final String? platformText = data?.text;
  if (platformText != null && platformText.isNotEmpty) {
    return platformText;
  }
  final SystemClipboard? clipboard = SystemClipboard.instance;
  if (clipboard == null) {
    return null;
  }
  final ClipboardReader reader = await clipboard.read();
  for (final ClipboardDataReader item in reader.items) {
    if (!item.canProvide(Formats.plainText)) {
      continue;
    }
    final String? text = await item.readValue(Formats.plainText);
    if (text != null && text.isNotEmpty) {
      return text;
    }
  }
  return null;
}

Future<void> pastePlainTextIntoComposer(
  TextEditingController controller,
) async {
  final String? text = await readClipboardPlainText();
  if (text == null || text.isEmpty) {
    return;
  }
  final TextEditingValue oldValue = controller.value;
  final TextSelection selection = oldValue.selection;
  if (!selection.isValid) {
    return;
  }
  final String newText = oldValue.text.replaceRange(
    selection.start,
    selection.end,
    text,
  );
  controller.value = oldValue.copyWith(
    text: newText,
    selection: TextSelection.collapsed(offset: selection.start + text.length),
    composing: TextRange.empty,
  );
}

Future<void> handleComposerPaste({
  required WidgetRef ref,
  required String channelId,
  required TextEditingController controller,
  required bool isAttachEnabled,
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
  await pastePlainTextIntoComposer(controller);
}
