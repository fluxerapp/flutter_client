import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/premium/user_entitlements.dart';

void main() {
  group('computeIsEffectivelyPremium', () {
    test('returns false when premium perks are disabled', () {
      expect(
        computeIsEffectivelyPremium(
          premiumType: 1,
          traits: const <String>['premium'],
          premiumPerksDisabled: true,
        ),
        isFalse,
      );
    });

    test('returns true for paid premium type', () {
      expect(
        computeIsEffectivelyPremium(
          premiumType: 1,
          traits: const <String>[],
          premiumPerksDisabled: false,
        ),
        isTrue,
      );
    });

    test('returns true for premium trait without subscription type', () {
      expect(
        computeIsEffectivelyPremium(
          premiumType: 0,
          traits: const <String>['premium'],
          premiumPerksDisabled: false,
        ),
        isTrue,
      );
    });

    test('returns false without subscription or premium trait', () {
      expect(
        computeIsEffectivelyPremium(
          premiumType: 0,
          traits: const <String>[],
          premiumPerksDisabled: false,
        ),
        isFalse,
      );
    });
  });

  group('mergeTraitsWithEffectivePremium', () {
    test('adds premium trait when effective premium is true', () {
      expect(
        mergeTraitsWithEffectivePremium(
          traits: const <String>[],
          effectiveIsPremium: true,
        ),
        <String>['premium'],
      );
    });

    test('removes premium trait when effective premium is false', () {
      expect(
        mergeTraitsWithEffectivePremium(
          traits: const <String>['premium', 'beta'],
          effectiveIsPremium: false,
        ),
        <String>['beta'],
      );
    });
  });
}
