import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';

void main() {
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
