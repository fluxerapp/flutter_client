import 'dart:convert';

import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:test/test.dart';

void main() {
  group('normalizeCustomStatus', () {
    test('returns null for expired status', () {
      final CustomStatusResponse expired = CustomStatusResponse(
        text: 'Away',
        expiresAt: DateTime.utc(2020),
        emojiAnimated: false,
      );
      expect(normalizeCustomStatus(expired), isNull);
    });

    test('returns active status with text', () {
      final CustomStatusResponse active = CustomStatusResponse(
        text: 'Coffee',
        expiresAt: DateTime.utc(2099),
        emojiAnimated: false,
      );
      expect(normalizeCustomStatus(active)?.text, 'Coffee');
    });

    test('returns active status with emoji id only', () {
      const CustomStatusResponse active = CustomStatusResponse(
        emojiId: '123456789',
        emojiAnimated: true,
      );
      expect(normalizeCustomStatus(active)?.emojiId?.toString(), '123456789');
    });
  });

  group('serializeCustomStatus', () {
    test('stores plain text for text-only status', () {
      final String? stored = serializeCustomStatus(
        const CustomStatusResponse(text: 'busy', emojiAnimated: false),
      );
      expect(stored, 'busy');
    });

    test('stores json for custom emoji status', () {
      final String? stored = serializeCustomStatus(
        const CustomStatusResponse(emojiId: '123456789', emojiAnimated: true),
      );
      expect(stored, isNotNull);
      expect(stored!.startsWith('{'), isTrue);
      final Map<String, dynamic> decoded =
          jsonDecode(stored) as Map<String, dynamic>;
      expect(decoded['emoji_id'], '123456789');
    });

    test('round-trips text and custom emoji', () {
      const CustomStatusResponse status = CustomStatusResponse(
        text: 'Gaming',
        emojiId: '999',
        emojiAnimated: false,
      );
      final CustomStatusResponse? parsed = parseStoredCustomStatus(
        serializeCustomStatus(status),
      );
      expect(parsed?.text, 'Gaming');
      expect(parsed?.emojiId?.toString(), '999');
    });
  });

  group('parseStoredCustomStatus', () {
    test('parses legacy plain text', () {
      final CustomStatusResponse? parsed = parseStoredCustomStatus('busy');
      expect(parsed?.text, 'busy');
      expect(parsed?.emojiId, isNull);
    });

    test('parses emoji-only json', () {
      final CustomStatusResponse? parsed = parseStoredCustomStatus(
        jsonEncode(<String, dynamic>{
          'emoji_id': '123',
          'emoji_animated': true,
        }),
      );
      expect(parsed?.emojiId?.toString(), '123');
      expect(parsed?.emojiAnimated, isTrue);
    });

    test('never surfaces stored json as status text', () {
      const String stored =
          '{"emoji_id":"","emoji_name":"\u{1F916}","text":null,'
          '"expires_at":null}';
      final CustomStatusResponse? parsed = parseStoredCustomStatus(stored);
      expect(parsed?.text, isNull);
      expect(parsed?.emojiName, '\u{1F916}');
      expect(parsed?.emojiId, isNull);
      expect(parsed?.emojiAnimated, isFalse);
    });

    test('returns null when json has neither text nor emoji', () {
      const String stored = '{"emoji_id":"","text":null,"expires_at":null}';
      expect(parseStoredCustomStatus(stored), isNull);
    });

    test('keeps text from json missing emoji_animated', () {
      const String stored = '{"emoji_id":"","text":"hello"}';
      final CustomStatusResponse? parsed = parseStoredCustomStatus(stored);
      expect(parsed?.text, 'hello');
    });

    test('treats a brace-prefixed non-json string as plain text', () {
      final CustomStatusResponse? parsed = parseStoredCustomStatus('{not json');
      expect(parsed?.text, '{not json');
    });

    test('keeps a json object without status keys as plain text', () {
      const String stored = '{"a":1}';
      expect(parseStoredCustomStatus(stored)?.text, stored);
    });
  });

  group('hasVisibleCustomStatus', () {
    test('is true for emoji-only stored status', () {
      expect(
        hasVisibleCustomStatus(
          serializeCustomStatus(
            const CustomStatusResponse(emojiId: '42', emojiAnimated: false),
          ),
        ),
        isTrue,
      );
    });
  });

  group('buildCustomStatusPayload', () {
    test('prefers emoji id over emoji name', () {
      final CustomStatusPayload payload = buildCustomStatusPayload(
        text: 'Hi',
        emojiId: '123',
        emojiName: '☕',
        expiresAt: null,
      );
      expect(payload.emojiId, '123');
      expect(payload.emojiName, isNull);
    });
  });
}
