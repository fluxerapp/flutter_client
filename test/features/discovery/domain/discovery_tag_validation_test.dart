import 'package:fluxer_app/features/discovery/domain/discovery_constants.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_tag_validation.dart';
import 'package:test/test.dart';

void main() {
  group('normalizeDiscoveryTag', () {
    test('trims and lowercases', () {
      expect(normalizeDiscoveryTag('  Gaming  '), 'gaming');
    });

    test('collapses whitespace', () {
      expect(normalizeDiscoveryTag('table   top'), 'table top');
    });
  });

  group('isValidDiscoveryTag', () {
    test('accepts valid tags', () {
      expect(isValidDiscoveryTag('gaming'), isTrue);
      expect(isValidDiscoveryTag('art-music'), isTrue);
      expect(isValidDiscoveryTag('fps+mmo'), isTrue);
    });

    test('rejects too short tags', () {
      expect(isValidDiscoveryTag('a'), isFalse);
    });

    test('rejects too long tags', () {
      expect(
        isValidDiscoveryTag('a' * (DiscoveryConstants.tagMaxLength + 1)),
        isFalse,
      );
    });

    test('rejects invalid characters', () {
      expect(isValidDiscoveryTag('bad@tag'), isFalse);
    });
  });
}
