import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';

void main() {
  group('attachmentEffectiveUrl', () {
    test('prefers proxyUrl when present', () {
      const Attachment attachment = Attachment(
        id: '1',
        filename: 'image.png',
        url: 'https://cdn.example.com/image.png',
        proxyUrl: 'https://proxy.example.com/image.png',
      );
      expect(
        attachmentEffectiveUrl(attachment),
        'https://proxy.example.com/image.png',
      );
    });

    test('falls back to url when proxyUrl is absent', () {
      const Attachment attachment = Attachment(
        id: '1',
        filename: 'image.png',
        url: 'https://cdn.example.com/image.png',
      );
      expect(
        attachmentEffectiveUrl(attachment),
        'https://cdn.example.com/image.png',
      );
    });
  });

  group('attachmentHasLoadableUrl', () {
    test('returns true when proxyUrl is present', () {
      const Attachment attachment = Attachment(
        id: '1',
        filename: 'image.png',
        url: '',
        proxyUrl: 'https://proxy.example.com/image.png',
      );
      expect(attachmentHasLoadableUrl(attachment), isTrue);
    });

    test('returns false when both urls are empty', () {
      const Attachment attachment = Attachment(
        id: '1',
        filename: 'image.png',
        url: '',
      );
      expect(attachmentHasLoadableUrl(attachment), isFalse);
    });
  });

  group('isVideoAttachment', () {
    test('detects common video extensions', () {
      expect(isVideoAttachment(filename: 'clip.mp4'), isTrue);
      expect(isVideoAttachment(filename: 'clip.MOV'), isTrue);
    });

    test('detects video content type', () {
      expect(
        isVideoAttachment(filename: 'attachment', contentType: 'video/mp4'),
        isTrue,
      );
    });

    test('returns false for images', () {
      expect(
        isVideoAttachment(filename: 'CleanShot_2026-07-27_at_19.49.162x.png'),
        isFalse,
      );
      expect(isVideoAttachment(filename: 'attachment'), isFalse);
    });
  });
}
