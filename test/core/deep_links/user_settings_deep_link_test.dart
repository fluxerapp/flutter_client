import 'package:test/test.dart';
import 'package:fluxer_app/core/deep_links/user_settings_deep_link.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';

void main() {
  Uri uri(String path) => Uri.parse('https://web.fluxer.app$path');

  group('parseUserSettingsDeepLink', () {
    test('returns null for non-settings paths', () {
      expect(parseUserSettingsDeepLink(uri('/channels/@me')), isNull);
    });

    test('opens settings root when tab is missing or invalid', () {
      expect(
        parseUserSettingsDeepLink(uri('/settings/user'))?.section,
        isNull,
      );
      expect(
        parseUserSettingsDeepLink(uri('/settings/user?tab=unknown_tab'))?.section,
        isNull,
      );
      expect(
        parseUserSettingsDeepLink(uri('/settings/user?tab=bad tab'))?.section,
        isNull,
      );
    });

    test('maps appearance tab to look and feel', () {
      expect(
        parseUserSettingsDeepLink(
          uri('/settings/user?tab=appearance'),
        )?.section,
        UserSettingsSection.lookAndFeel,
      );
    });

    test('maps account security password section to security login', () {
      expect(
        parseUserSettingsDeepLink(
          uri('/settings/user?tab=account_security&section=password'),
        )?.section,
        UserSettingsSection.securityLogin,
      );
    });

    test('resolves nested authorized apps tab', () {
      expect(
        parseUserSettingsDeepLink(
          uri('/settings/user?tab=authorized_apps'),
        )?.section,
        UserSettingsSection.authorizedApps,
      );
    });

    test('resolves legacy authorized apps section under account security', () {
      expect(
        parseUserSettingsDeepLink(
          uri('/settings/user?tab=account_security&section=authorized_apps'),
        )?.section,
        UserSettingsSection.authorizedApps,
      );
    });

    test('rejects invalid account security section', () {
      expect(
        parseUserSettingsDeepLink(
          uri('/settings/user?tab=account_security&section=not_real'),
        )?.section,
        isNull,
      );
    });
  });

  group('mapUserSettingsDeepLinkToSection', () {
    test('returns null for unsupported web-only tabs', () {
      expect(
        mapUserSettingsDeepLinkToSection('desktop_settings', null),
        isNull,
      );
      expect(
        mapUserSettingsDeepLinkToSection('plutonium', null),
        isNull,
      );
    });
  });
}
