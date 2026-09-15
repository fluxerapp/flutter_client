import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_session.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/utils/attachments/uploading_attachment_utils.dart';

void main() {
  group('isUploadingPlaceholderAttachment', () {
    test('returns true for uploading placeholder without url', () {
      const Attachment attachment = Attachment(
        id: kUploadingAttachmentPlaceholderId,
        filename: 'doc.pdf',
        url: '',
        size: 100,
      );
      expect(isUploadingPlaceholderAttachment(attachment), isTrue);
    });

    test('returns false when url is present', () {
      const Attachment attachment = Attachment(
        id: kUploadingAttachmentPlaceholderId,
        filename: 'doc.pdf',
        url: 'https://cdn.example/doc.pdf',
        size: 100,
      );
      expect(isUploadingPlaceholderAttachment(attachment), isFalse);
    });
  });

  group('buildUploadingPlaceholderAttachments', () {
    PendingAttachment buildPending({required String name, required int size}) {
      return PendingAttachment(
        id: 1,
        channelId: 'ch1',
        file: XFile.fromData(Uint8List.fromList(<int>[1]), name: name),
        filename: name,
        size: size,
        contentType: 'application/pdf',
        status: PendingAttachmentStatus.pending,
        uploadProgress: 0,
      );
    }

    test('returns empty list when claimed is empty', () {
      expect(
        buildUploadingPlaceholderAttachments(
          claimed: const <PendingAttachment>[],
          labelForMultiple: (_) => 'Uploading files',
        ),
        isEmpty,
      );
    });

    test('uses single file name for one attachment', () {
      final List<Attachment> result = buildUploadingPlaceholderAttachments(
        claimed: <PendingAttachment>[
          buildPending(name: 'report.pdf', size: 42),
        ],
        labelForMultiple: (_) => 'Uploading files',
      );
      expect(result, hasLength(1));
      expect(result.first.filename, 'report.pdf');
      expect(result.first.size, 42);
      expect(isUploadingPlaceholderAttachment(result.first), isTrue);
    });

    test('uses summary label and summed size for multiple attachments', () {
      final List<Attachment> result = buildUploadingPlaceholderAttachments(
        claimed: <PendingAttachment>[
          buildPending(name: 'a.png', size: 10),
          buildPending(name: 'b.png', size: 20),
        ],
        labelForMultiple: (int count) => 'Uploading $count files',
      );
      expect(result, hasLength(1));
      expect(result.first.filename, 'Uploading 2 files');
      expect(result.first.size, 30);
    });
  });

  group('computeMessageUploadSendingProgress', () {
    PendingAttachment pendingAttachment({
      required int id,
      required int size,
      required double progress,
      PendingAttachmentStatus status = PendingAttachmentStatus.uploading,
    }) {
      return PendingAttachment(
        id: id,
        channelId: 'ch',
        file: XFile.fromData(Uint8List.fromList(<int>[1]), name: 'f$id'),
        filename: 'f$id',
        size: size,
        contentType: 'application/octet-stream',
        status: status,
        uploadProgress: progress,
      );
    }

    test('uses sendingProgress when set on session', () {
      const MessageUploadSession session = MessageUploadSession(
        nonce: 'n',
        channelId: 'ch',
        attachments: <PendingAttachment>[],
        sendingProgress: 42,
      );
      expect(computeMessageUploadSendingProgress(session), 42);
    });

    test('computes byte-weighted progress from attachments', () {
      final MessageUploadSession session = MessageUploadSession(
        nonce: 'n',
        channelId: 'ch',
        attachments: <PendingAttachment>[
          pendingAttachment(id: 1, size: 100, progress: 1),
          pendingAttachment(id: 2, size: 100, progress: 0.5),
        ],
      );
      expect(computeMessageUploadSendingProgress(session), 75);
    });
  });
}
