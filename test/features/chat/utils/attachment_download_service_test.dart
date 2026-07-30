import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/attachment_download_service.dart';

const String _testAttachmentImageUrl =
    'https://fluxerusercontent.com/attachments/1427764813854588943/1531388054034460672/CleanShot_2026-07-27_at_19.49.162x.png';
const String _testAttachmentImageFilename =
    'CleanShot_2026-07-27_at_19.49.162x.png';

void main() {
  group('resolveAttachmentDownloadFilename', () {
    test('prefers explicit filename', () {
      expect(
        resolveAttachmentDownloadFilename(
          url: _testAttachmentImageUrl,
          filename: 'photo.jpg',
        ),
        'photo.jpg',
      );
    });

    test('falls back to url path segment', () {
      expect(
        resolveAttachmentDownloadFilename(
          url: '$_testAttachmentImageUrl?width=1200',
        ),
        _testAttachmentImageFilename,
      );
    });

    test('uses generic name when filename cannot be resolved', () {
      expect(
        resolveAttachmentDownloadFilename(url: 'https://example.com/download'),
        'attachment',
      );
    });
  });
}
