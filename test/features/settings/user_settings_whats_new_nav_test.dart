import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/constants/external_urls.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_nav.dart';
import 'package:fluxer_app/features/ui/ui.dart';

import '../../helpers/test_l10n.dart';

void main() {
  test('patch notes live on the marketing site', () {
    expect(ExternalUrls.fluxerPatchNotes, 'https://fluxer.app/patch-notes');
  });

  test("desktop nav lists what's new as a link, not a page", () {
    final List<UserSettingsDesktopNavEntry> nav = buildUserSettingsDesktopNav(
      showBilling: false,
      showGiveFeedback: false,
      showJoinFluxerLabs: false,
      isTouchPrimary: true,
    );

    final UserSettingsDesktopNavEntry entry = nav.singleWhere(
      (UserSettingsDesktopNavEntry entry) => entry.isWhatsNew,
    );
    expect(entry.section, isNull);
    expect(entry.displayLabel(testL10n), testL10n.userSettingsNavWhatsNew);
    expect(
      entry.toSidebarItem(testL10n).label,
      testL10n.userSettingsNavWhatsNew,
    );
  });

  test("mobile what's new row opens the link callback", () {
    var opened = 0;
    final List<FluxerSettingsNavGroup> groups =
        buildUserSettingsMobileNavGroups(
          l10n: testL10n,
          onOpenSection: (_) => fail('opened a settings page'),
          onOpenAppLogs: () {},
          onOpenWhatsNew: () => opened++,
          onJoinFluxerLabs: () {},
          onGiveFeedback: () {},
          onLogout: () {},
          showBilling: false,
          showGiveFeedback: false,
          showJoinFluxerLabs: false,
          isTouchPrimary: true,
        );

    final FluxerSettingsNavItem row = groups
        .expand((FluxerSettingsNavGroup group) => group.items)
        .singleWhere(
          (FluxerSettingsNavItem item) =>
              item.label == testL10n.userSettingsNavWhatsNew,
        );
    row.onTap();

    expect(opened, 1);
  });
}
