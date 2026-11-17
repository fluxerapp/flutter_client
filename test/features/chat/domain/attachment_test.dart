import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

void main() {
  group('Attachment.isAnimated', () {
    test('is true for an image carrying the animated flag', () {
      const Attachment attachment = Attachment(
        id: '1',
        filename: 'spin.jxl',
        url: 'https://cdn.example/spin.jxl',
        contentType: 'image/jxl',
        flags: 1 << 5,
      );
      expect(attachment.isAnimated, isTrue);
    });

    test('is false for a video carrying the animated flag', () {
      const Attachment attachment = Attachment(
        id: '1',
        filename: 'loop.mp4',
        url: 'https://cdn.example/loop.mp4',
        contentType: 'video/mp4',
        flags: 1 << 5,
      );
      expect(attachment.isAnimated, isFalse);
    });
  });
}
