import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';

void main() {
  group('resolveMaxAttachmentFileBytes', () {
    test('returns non-premium limit for free users', () {
      expect(
        resolveMaxAttachmentFileBytes(isPremium: false),
        kNonPremiumMaxAttachmentBytes,
      );
    });

    test('returns premium limit for plutonium users', () {
      expect(
        resolveMaxAttachmentFileBytes(isPremium: true),
        kPremiumMaxAttachmentBytes,
      );
    });
  });
}
