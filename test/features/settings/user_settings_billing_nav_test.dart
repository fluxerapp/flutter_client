import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_nav.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_billing_utils.dart';

void main() {
  group('isUserSettingsBillingSectionAvailable', () {
    test('allows non-billing sections regardless of billing flag', () {
      expect(
        isUserSettingsBillingSectionAvailable(
          UserSettingsSection.profile,
          showBilling: false,
        ),
        isTrue,
      );
    });

    test('hides billing sections when billing nav is disabled', () {
      expect(
        isUserSettingsBillingSectionAvailable(
          UserSettingsSection.fluxerPlutonium,
          showBilling: false,
        ),
        isFalse,
      );
      expect(
        isUserSettingsBillingSectionAvailable(
          UserSettingsSection.giftsAndCodes,
          showBilling: false,
        ),
        isFalse,
      );
    });
  });

  group('buildUserSettingsDesktopNav', () {
    test('includes billing entries only when showBilling is true', () {
      final List<UserSettingsDesktopNavEntry> withoutBilling =
          buildUserSettingsDesktopNav(
            showBilling: false,
            showJoinFluxerLabs: false,
            isTouchPrimary: false,
          );
      final List<UserSettingsDesktopNavEntry> withBilling =
          buildUserSettingsDesktopNav(
            showBilling: true,
            showJoinFluxerLabs: false,
            isTouchPrimary: false,
          );

      expect(
        withoutBilling.any(
          (entry) => entry.section == UserSettingsSection.fluxerPlutonium,
        ),
        isFalse,
      );
      expect(
        withBilling.any(
          (entry) => entry.section == UserSettingsSection.fluxerPlutonium,
        ),
        isTrue,
      );
      expect(
        withBilling.any(
          (entry) => entry.section == UserSettingsSection.giftsAndCodes,
        ),
        isTrue,
      );
    });

    test('hides shortcuts entry on touch-primary devices', () {
      final touchNav = buildUserSettingsDesktopNav(
        showBilling: false,
        showJoinFluxerLabs: false,
        isTouchPrimary: true,
      );
      expect(
        touchNav.any((entry) => entry.section == UserSettingsSection.shortcuts),
        isFalse,
      );

      final pointerNav = buildUserSettingsDesktopNav(
        showBilling: false,
        showJoinFluxerLabs: false,
        isTouchPrimary: false,
      );
      expect(
        pointerNav.any(
          (entry) => entry.section == UserSettingsSection.shortcuts,
        ),
        isTrue,
      );
    });
  });

  group('indexForUserSettingsSection', () {
    test('returns null for billing sections when billing nav is disabled', () {
      expect(
        indexForUserSettingsSection(
          UserSettingsSection.giftsAndCodes,
          showBilling: false,
          showJoinFluxerLabs: false,
          isTouchPrimary: false,
        ),
        isNull,
      );
    });

    test('returns null for shortcuts section on touch-primary devices', () {
      expect(
        indexForUserSettingsSection(
          UserSettingsSection.shortcuts,
          showBilling: false,
          showJoinFluxerLabs: false,
          isTouchPrimary: true,
        ),
        isNull,
      );
    });
  });
}
