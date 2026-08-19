import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer_sendable_content.dart';

void main() {
  group('composerHasSendableContentFromParts', () {
    test('returns false when channel id is empty', () {
      expect(
        composerHasSendableContentFromParts(
          channelId: '',
          wireText: 'hello',
          hasPendingUploads: false,
        ),
        isFalse,
      );
    });

    test('returns false when wire text is whitespace only', () {
      expect(
        composerHasSendableContentFromParts(
          channelId: 'channel-1',
          wireText: '   ',
          hasPendingUploads: false,
        ),
        isFalse,
      );
    });

    test('returns false when wire text is invisible only', () {
      const List<String> invisibleOnly = <String>[
        '\u200b',
        '\u200e \u200b\ufeff',
        '\u2800\u3164\u{E0100}',
        '\u00a0',
      ];

      for (final String wireText in invisibleOnly) {
        expect(
          composerHasSendableContentFromParts(
            channelId: 'channel-1',
            wireText: wireText,
            hasPendingUploads: false,
          ),
          isFalse,
          reason: 'wireText was $wireText',
        );
      }
    });

    test('returns true when wire text has visible characters', () {
      expect(
        composerHasSendableContentFromParts(
          channelId: 'channel-1',
          wireText: 'hello',
          hasPendingUploads: false,
        ),
        isTrue,
      );
    });

    test('returns true when pending uploads exist without text', () {
      expect(
        composerHasSendableContentFromParts(
          channelId: 'channel-1',
          wireText: '',
          hasPendingUploads: true,
        ),
        isTrue,
      );
    });
  });
}
