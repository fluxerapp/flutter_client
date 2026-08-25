import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/utils/gallery_attachment_selection.dart';

PendingAttachment _pending({required int id, String? galleryAssetId}) {
  return PendingAttachment(
    id: id,
    channelId: 'ch1',
    file: XFile.fromData(Uint8List.fromList(<int>[1]), name: '$id.bin'),
    filename: '$id.bin',
    size: 1,
    contentType: 'application/octet-stream',
    status: PendingAttachmentStatus.pending,
    uploadProgress: 0,
    galleryAssetId: galleryAssetId,
  );
}

void main() {
  group('selectedGalleryAssetIds', () {
    test('includes only attachments that came from the gallery', () {
      expect(
        selectedGalleryAssetIds(<PendingAttachment>[
          _pending(id: 1, galleryAssetId: 'asset-a'),
          _pending(id: 2),
          _pending(id: 3, galleryAssetId: 'asset-b'),
        ]),
        <String>{'asset-a', 'asset-b'},
      );
    });
  });

  group('pendingAttachmentForGalleryAsset', () {
    test('returns the matching pending attachment', () {
      final PendingAttachment match = _pending(
        id: 7,
        galleryAssetId: 'asset-a',
      );
      expect(
        pendingAttachmentForGalleryAsset(
          attachments: <PendingAttachment>[_pending(id: 1), match],
          galleryAssetId: 'asset-a',
        ),
        same(match),
      );
    });

    test('returns null when the asset is not selected', () {
      expect(
        pendingAttachmentForGalleryAsset(
          attachments: <PendingAttachment>[_pending(id: 1)],
          galleryAssetId: 'missing',
        ),
        isNull,
      );
    });
  });

  group('formatGalleryVideoDuration', () {
    test('formats minutes and zero-padded seconds', () {
      expect(formatGalleryVideoDuration(const Duration(seconds: 5)), '0:05');
      expect(formatGalleryVideoDuration(const Duration(seconds: 75)), '1:15');
    });
  });
}
