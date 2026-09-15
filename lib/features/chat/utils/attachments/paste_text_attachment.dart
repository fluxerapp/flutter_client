import 'dart:convert';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show WidgetRef;
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';

Future<FileUploadValidationResult> addPastedTextAsAttachment({
  required WidgetRef ref,
  required String channelId,
  required String text,
}) async {
  if (text.trim().isEmpty) {
    return const FileUploadValidationResult.failure(
      FileUploadValidationError.noFiles,
    );
  }
  return ref
      .read(cloudUploadControllerProvider(channelId).notifier)
      .addFiles(<ComposerUploadFile>[
        composerUploadFile(
          XFile.fromData(
            utf8.encode(text),
            name: 'message.txt',
            mimeType: 'text/plain',
          ),
          displayFilename: 'message.txt',
        ),
      ]);
}
