import 'dart:async';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_immunity_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:fluxer_app/features/chat/utils/composer/slowmode_utils.dart';
import 'package:fluxer_app/features/chat/utils/messages/client_nonce.dart';

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
      if (!await _canSendToChannel(channelId)) {
        continue;
      }
      if (await _sendToChannel(
        channelId: channelId,
        uploadFiles: uploadFiles,
        outgoingText: outgoingText,
      )) {
        successCount++;
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
      if (!await _canSendToChannel(channelId)) {
        continue;
      }
      final DateTime sendStartedAt = DateTime.now();
      try {
        final Message sent = await ref
            .read(messageRepositoryProvider)
            .sendMessage(
              channelId: channelId,
              content: outgoingText,
              clientNonce: clientNonceGenerator.next(),
            );
        successCount++;
        await _recordSendIfNeeded(channelId, sent.timestamp, sendStartedAt);
      } on Object catch (error, stackTrace) {
        _handleSendError(channelId, error, stackTrace);
      }
    }
    return successCount;
  }

  Future<bool> _canSendToChannel(String channelId) async {
    if (await ref.read(isSlowmodeImmuneProvider(channelId).future)) {
      return true;
    }
    final row = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(channelId);
    final int rateLimit = row?.rateLimitPerUser ?? 0;
    if (rateLimit <= 0) {
      return true;
    }
    return !isSlowmodeCoolingDown(
      tracker: ref.read(slowmodeTrackerProvider.notifier),
      channelId: channelId,
      rateLimitPerUser: rateLimit,
    );
  }

  Future<void> _recordSendIfNeeded(
    String channelId,
    DateTime serverSentAt,
    DateTime sendStartedAt,
  ) async {
    if (await ref.read(isSlowmodeImmuneProvider(channelId).future)) {
      return;
    }
    ref
        .read(slowmodeTrackerProvider.notifier)
        .updateSendTimestamp(
          channelId,
          serverSentAt.isAfter(sendStartedAt) ? serverSentAt : sendStartedAt,
        );
  }

  void _handleSendError(String channelId, Object error, StackTrace stackTrace) {
    applySlowmodeRateLimitError(
      tracker: ref.read(slowmodeTrackerProvider.notifier),
      channelId: channelId,
      error: error,
    );
    talker.error(
      '[ShareMediaSender] Failed to send to channel $channelId',
      error,
      stackTrace,
    );
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

      final DateTime sendStartedAt = DateTime.now();
      final Message sent = await ref
          .read(messageRepositoryProvider)
          .sendMessage(
            channelId: channelId,
            content: outgoingText,
            clientNonce: clientNonce,
            attachmentMetadata: prepared.attachmentMetadata,
            attachmentFiles: prepared.attachmentFiles,
          );

      uploadNotifier.removeMessageUpload(clientNonce);
      await _recordSendIfNeeded(channelId, sent.timestamp, sendStartedAt);
      return true;
    } on Object catch (error, stackTrace) {
      if (clientNonce != null) {
        uploadNotifier.cancelMessageUpload(clientNonce);
      }
      _handleSendError(channelId, error, stackTrace);
      return false;
    }
  }
}
