import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/spoiler_utils.dart';
import 'package:test/test.dart';

void main() {
  group('spoilerSyncKeysForAttachment', () {
    test('returns empty list for non-spoiler attachments', () {
      expect(
        spoilerSyncKeysForAttachment(
          messageId: 'message-1',
          attachment: const Attachment(
            id: 'attachment-1',
            filename: 'image.png',
            url: 'https://cdn.example/image.png',
          ),
        ),
        isEmpty,
      );
    });

    test('uses attachment id in sync key', () {
      expect(
        spoilerSyncKeysForAttachment(
          messageId: 'message-1',
          attachment: const Attachment(
            id: 'attachment-1',
            filename: 'secret.png',
            url: 'https://cdn.example/secret.png',
            flags: attachmentFlagIsSpoiler,
          ),
        ),
        <String>['attachment:message-1:attachment-1'],
      );
    });

    test('falls back to url when attachment id is empty', () {
      expect(
        spoilerSyncKeysForAttachment(
          messageId: 'message-1',
          attachment: const Attachment(
            id: '',
            filename: 'secret.png',
            url: 'https://cdn.example/secret.png',
            flags: attachmentFlagIsSpoiler,
          ),
        ),
        <String>['attachment:message-1:https://cdn.example/secret.png'],
      );
    });
  });
}
