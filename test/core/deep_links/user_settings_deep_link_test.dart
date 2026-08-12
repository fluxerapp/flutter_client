import 'package:fluxer_app/core/deep_links/user_settings_deep_link.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/utils/open_user_settings_deep_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Uri uri(String path) => Uri.parse('https://web.fluxer.app$path');

  group('parseUserSettingsDeepLink', () {
    test('returns null for non-settings paths', () {
      expect(parseUserSettingsDeepLink(uri('/channels/@me')), isNull);
    });

    test('opens settings root when tab is missing or invalid', () {
      expect(parseUserSettingsDeepLink(uri('/settings/user'))?.section, isNull);
      expect(
        parseUserSettingsDeepLink(
          uri('/settings/user?tab=unknown_tab'),
        )?.section,
        isNull,
      );
      expect(
        parseUserSettingsDeepLink(uri('/settings/user?tab=bad tab'))?.section,
        isNull,
      );
    });

    test('maps appearance tab to look and feel', () {
      final UserSettingsDeepLinkTarget? target = parseUserSettingsDeepLink(
        uri('/settings/user?tab=appearance'),
      );
      expect(target?.section, UserSettingsSection.lookAndFeel);
      expect(target?.tab, 'appearance');
      expect(target?.fieldId, isNull);
    });

    test('maps appearance theme section to look and feel with field id', () {
      final UserSettingsDeepLinkTarget? target = parseUserSettingsDeepLink(
        uri('/settings/user?tab=appearance&section=theme'),
      );
      expect(target?.section, UserSettingsSection.lookAndFeel);
      expect(target?.tab, 'appearance');
      expect(target?.fieldId, 'theme');
    });

    test('maps account security password section to security login', () {
      final UserSettingsDeepLinkTarget? target = parseUserSettingsDeepLink(
        uri('/settings/user?tab=account_security&section=password'),
      );
      expect(target?.section, UserSettingsSection.securityLogin);
      expect(target?.fieldId, 'password');
    });

    test('opens security login for unknown account security section', () {
      final UserSettingsDeepLinkTarget? target = parseUserSettingsDeepLink(
        uri('/settings/user?tab=account_security&section=not_real'),
      );
      expect(target?.section, UserSettingsSection.securityLogin);
      expect(target?.fieldId, isNull);
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

    test('unsupported tab has no section mapping', () {
      expect(isUserSettingsDeepLinkTabSupported('desktop_settings'), isFalse);
      expect(
        parseUserSettingsDeepLink(
          uri('/settings/user?tab=desktop_settings'),
        )?.section,
        isNull,
      );
    });
  });

  group('userSettingsDeepLinkTabLabel', () {
    testWidgets('unsupported tab uses generic user settings label', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              final label = userSettingsDeepLinkTabLabel(
                FluxerLocalizations.of(context),
                const UserSettingsDeepLinkTarget(
                  tab: 'desktop_settings',
                  section: null,
                ),
              );
              expect(label, 'User settings');
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  });

  group('mapUserSettingsDeepLinkToSection', () {
    test('returns null for unsupported web-only tabs', () {
      expect(
        mapUserSettingsDeepLinkToSection('desktop_settings', null),
        isNull,
      );
      expect(mapUserSettingsDeepLinkToSection('plutonium', null), isNull);
      expect(
        mapUserSettingsDeepLinkToSection('client_developer_settings', null),
        isNull,
      );
    });
  });
}
