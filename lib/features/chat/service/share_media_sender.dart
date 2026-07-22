import 'dart:async';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/utils/client_nonce.dart';
import 'package:fluxer_app/features/chat/utils/composer_upload_file.dart';

/// Sends shared media to selected channels using the existing upload pipeline.
class ShareMediaSender {
  const ShareMediaSender({required this.ref});

  final WidgetRef ref;

  Future<int> send({
    required List<String> channelIds,
    required List<XFile> files,
    String? message,
  }) async {
    if (channelIds.isEmpty) {
      return 0;
    }

    final String outgoingText = (message ?? '').trim();
    if (files.isEmpty) {
      return _sendTextOnly(channelIds: channelIds, outgoingText: outgoingText);
    }

    final List<ComposerUploadFile> uploadFiles = composerUploadFiles(files);
    int successCount = 0;

    for (final String channelId in channelIds) {
      final bool sent = await _sendToChannel(
        channelId: channelId,
        uploadFiles: uploadFiles,
        outgoingText: outgoingText,
      );
      if (sent) {
        successCount++;
        ref.read(slowmodeTrackerProvider.notifier).recordSend(channelId);
      }
    }

    return successCount;
  }

  Future<int> _sendTextOnly({
    required List<String> channelIds,
    required String outgoingText,
  }) async {
    if (outgoingText.isEmpty) {
      return 0;
    }

    int successCount = 0;
    for (final String channelId in channelIds) {
      try {
        await ref
            .read(messageRepositoryProvider)
            .sendMessage(
              channelId: channelId,
              content: outgoingText,
              clientNonce: clientNonceGenerator.next(),
            );
        successCount++;
        ref.read(slowmodeTrackerProvider.notifier).recordSend(channelId);
      } on Object catch (error, stackTrace) {
        talker.error(
          '[ShareMediaSender] Failed to send text to channel $channelId',
          error,
          stackTrace,
        );
      }
    }
    return successCount;
  }

  Future<bool> _sendToChannel({
    required String channelId,
    required List<ComposerUploadFile> uploadFiles,
    required String outgoingText,
  }) async {
    final CloudUploadController uploadNotifier = ref.read(
      cloudUploadControllerProvider(channelId).notifier,
    );
    String? clientNonce;

    try {
      final validation = await uploadNotifier.addFiles(uploadFiles);
      if (!validation.isValid) {
        uploadNotifier.clearComposerAttachments();
        return false;
      }

      clientNonce = clientNonceGenerator.next();
      final claimed = uploadNotifier.claimForMessage(clientNonce);
      if (claimed.isEmpty) {
        return false;
      }

      final prepared = await uploadNotifier.prepareSessionForSend(
        nonce: clientNonce,
        favoriteMemePayload: false,
      );

      await ref
          .read(messageRepositoryProvider)
          .sendMessage(
            channelId: channelId,
            content: outgoingText,
            clientNonce: clientNonce,
            attachmentMetadata: prepared.attachmentMetadata,
            attachmentFiles: prepared.attachmentFiles,
          );

      uploadNotifier.removeMessageUpload(clientNonce);
      return true;
    } on Object catch (error, stackTrace) {
      if (clientNonce != null) {
        uploadNotifier.cancelMessageUpload(clientNonce);
      }
      talker.error(
        '[ShareMediaSender] Failed to send to channel $channelId',
        error,
        stackTrace,
      );
      return false;
    }
  }
}
