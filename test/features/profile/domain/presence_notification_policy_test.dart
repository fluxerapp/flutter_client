import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/profile/domain/presence_notification_policy.dart';

void main() {
  group('isPresenceDoNotDisturb', () {
    test('only dnd suppresses notification sounds', () {
      expect(isPresenceDoNotDisturb('dnd'), isTrue);
      expect(isPresenceDoNotDisturb('online'), isFalse);
      expect(isPresenceDoNotDisturb('idle'), isFalse);
      expect(isPresenceDoNotDisturb('invisible'), isFalse);
      expect(isPresenceDoNotDisturb('offline'), isFalse);
      expect(isPresenceDoNotDisturb(null), isFalse);
    });
  });
}
