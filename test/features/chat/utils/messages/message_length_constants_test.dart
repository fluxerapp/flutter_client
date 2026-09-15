import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_length_constants.dart';

void main() {
  group('resolveMaxMessageLength', () {
    test('returns non-premium fallback', () {
      expect(
        resolveMaxMessageLength(isPremium: false),
        kMaxMessageLengthNonPremium,
      );
    });

    test('returns premium fallback', () {
      expect(
        resolveMaxMessageLength(isPremium: true),
        kMaxMessageLengthPremium,
      );
    });
  });
}
