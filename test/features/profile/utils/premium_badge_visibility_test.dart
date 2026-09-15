import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/profile/utils/premium_badge_visibility.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart';

UserSettingsViewState _settings({
  int? premiumType,
  String? premiumSince = '2024-01-15T00:00:00.000Z',
  int? premiumLifetimeSequence = 42,
  bool premiumBadgeHidden = false,
  bool premiumBadgeMasked = false,
  bool premiumBadgeTimestampHidden = false,
  bool premiumBadgeSequenceHidden = false,
}) {
  return UserSettingsViewState(
    userId: '1',
    username: 'tester',
    displayName: 'Tester',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: const <String>[],
    premiumType: premiumType,
    premiumSince: premiumSince,
    premiumLifetimeSequence: premiumLifetimeSequence,
    premiumBadgeHidden: premiumBadgeHidden,
    premiumBadgeMasked: premiumBadgeMasked,
    premiumBadgeTimestampHidden: premiumBadgeTimestampHidden,
    premiumBadgeSequenceHidden: premiumBadgeSequenceHidden,
  );
}

void main() {
  group('PremiumBadgeVisibility.fromSettings', () {
    test('shows full Visionary badge when nothing is hidden', () {
      final PremiumBadgeVisibility visibility =
          PremiumBadgeVisibility.fromSettings(
            _settings(premiumType: UserPremiumTypes.lifetime.json),
          );

      expect(visibility.hasPlutonium, isTrue);
      expect(visibility.isLifetimePlutonium, isTrue);
      expect(visibility.premiumSince, '2024-01-15T00:00:00.000Z');
      expect(visibility.premiumLifetimeSequence, 42);
    });

    test('hides the badge entirely', () {
      final PremiumBadgeVisibility visibility =
          PremiumBadgeVisibility.fromSettings(
            _settings(
              premiumType: UserPremiumTypes.lifetime.json,
              premiumBadgeHidden: true,
            ),
          );

      expect(visibility.hasPlutonium, isFalse);
      expect(visibility.isLifetimePlutonium, isFalse);
      expect(visibility.premiumSince, isNull);
      expect(visibility.premiumLifetimeSequence, isNull);
    });

    test('hides the purchase date', () {
      final PremiumBadgeVisibility visibility =
          PremiumBadgeVisibility.fromSettings(
            _settings(
              premiumType: UserPremiumTypes.subscription.json,
              premiumBadgeTimestampHidden: true,
            ),
          );

      expect(visibility.hasPlutonium, isTrue);
      expect(visibility.isLifetimePlutonium, isFalse);
      expect(visibility.premiumSince, isNull);
    });

    test('masks Visionary as a subscription and hides the ID', () {
      final PremiumBadgeVisibility visibility =
          PremiumBadgeVisibility.fromSettings(
            _settings(
              premiumType: UserPremiumTypes.lifetime.json,
              premiumBadgeMasked: true,
            ),
          );

      expect(visibility.hasPlutonium, isTrue);
      expect(visibility.isLifetimePlutonium, isFalse);
      expect(visibility.premiumLifetimeSequence, isNull);
      expect(visibility.premiumSince, isNotNull);
    });

    test('hides the Visionary ID only', () {
      final PremiumBadgeVisibility visibility =
          PremiumBadgeVisibility.fromSettings(
            _settings(
              premiumType: UserPremiumTypes.lifetime.json,
              premiumBadgeSequenceHidden: true,
            ),
          );

      expect(visibility.hasPlutonium, isTrue);
      expect(visibility.isLifetimePlutonium, isTrue);
      expect(visibility.premiumLifetimeSequence, isNull);
    });
  });

  group('PremiumBadgeVisibility.fromProfile', () {
    test('uses the public profile payload as-is', () {
      final PremiumBadgeVisibility visibility =
          PremiumBadgeVisibility.fromProfile(
            premiumType: UserPremiumTypes.lifetime,
            premiumSince: '2024-01-15T00:00:00.000Z',
            premiumLifetimeSequence: 7,
          );

      expect(visibility.hasPlutonium, isTrue);
      expect(visibility.isLifetimePlutonium, isTrue);
      expect(visibility.premiumLifetimeSequence, 7);
    });

    test('treats none as no Plutonium badge', () {
      final PremiumBadgeVisibility visibility =
          PremiumBadgeVisibility.fromProfile(
            premiumType: UserPremiumTypes.none,
            premiumSince: '2024-01-15T00:00:00.000Z',
            premiumLifetimeSequence: 7,
          );

      expect(visibility.hasPlutonium, isFalse);
      expect(visibility.isLifetimePlutonium, isFalse);
      expect(visibility.premiumLifetimeSequence, isNull);
    });
  });
}
