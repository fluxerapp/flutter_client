import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_settings_tab.dart';

void main() {
  const String guildId = 'guild-1';
  const Channel textChannel = Channel(
    id: 'text-1',
    guildId: guildId,
    name: 'general',
  );
  const Channel voiceChannel = Channel(
    id: 'voice-1',
    guildId: guildId,
    name: 'voice',
    type: ChannelType.guildVoice,
  );
  const Channel linkChannel = Channel(
    id: 'link-1',
    guildId: guildId,
    name: 'links',
    type: ChannelType.guildLink,
    url: 'https://example.com',
  );
  const Channel categoryChannel = Channel(
    id: 'cat-1',
    guildId: guildId,
    name: 'Category',
    type: ChannelType.guildCategory,
  );

  group('visibleChannelSettingsTabs', () {
    test('shows overview with manageChannels', () {
      final List<ChannelSettingsTab> tabs = visibleChannelSettingsTabs(
        channel: textChannel,
        permissions: Permission.manageChannels.value,
      );
      expect(tabs, contains(ChannelSettingsTab.overview));
      expect(tabs, contains(ChannelSettingsTab.invites));
      expect(tabs, isNot(contains(ChannelSettingsTab.permissions)));
    });

    test('shows overview with updateRtcRegion on voice only', () {
      final List<ChannelSettingsTab> tabs = visibleChannelSettingsTabs(
        channel: voiceChannel,
        permissions: Permission.updateRtcRegion.value,
      );
      expect(tabs, equals(<ChannelSettingsTab>[ChannelSettingsTab.overview]));
    });

    test('shows permissions with manageRoles', () {
      final List<ChannelSettingsTab> tabs = visibleChannelSettingsTabs(
        channel: textChannel,
        permissions: Permission.manageRoles.value,
      );
      expect(
        tabs,
        equals(<ChannelSettingsTab>[ChannelSettingsTab.permissions]),
      );
    });

    test('hides webhooks for link channels', () {
      final int permissions =
          Permission.manageChannels.value | Permission.manageWebhooks.value;
      final List<ChannelSettingsTab> tabs = visibleChannelSettingsTabs(
        channel: linkChannel,
        permissions: permissions,
      );
      expect(tabs, isNot(contains(ChannelSettingsTab.webhooks)));
      expect(tabs, contains(ChannelSettingsTab.overview));
      expect(tabs, contains(ChannelSettingsTab.invites));
    });

    test('shows webhooks for text channels with manageWebhooks', () {
      final int permissions =
          Permission.manageChannels.value | Permission.manageWebhooks.value;
      final List<ChannelSettingsTab> tabs = visibleChannelSettingsTabs(
        channel: textChannel,
        permissions: permissions,
      );
      expect(tabs, contains(ChannelSettingsTab.webhooks));
    });

    test('categories only get overview and permissions', () {
      final int permissions =
          Permission.manageChannels.value |
          Permission.manageRoles.value |
          Permission.manageWebhooks.value;
      final List<ChannelSettingsTab> tabs = visibleChannelSettingsTabs(
        channel: categoryChannel,
        permissions: permissions,
      );
      expect(
        tabs,
        equals(<ChannelSettingsTab>[
          ChannelSettingsTab.overview,
          ChannelSettingsTab.permissions,
        ]),
      );
    });
  });

  group('canAccessChannelSettings', () {
    test('returns true when any tab is visible', () {
      expect(
        canAccessChannelSettings(
          channel: textChannel,
          permissions: Permission.manageChannels.value,
        ),
        isTrue,
      );
    });

    test('returns true when only delete is available', () {
      expect(
        canAccessChannelSettings(
          channel: textChannel,
          permissions: Permission.manageChannels.value,
        ),
        isTrue,
      );
      expect(
        canDeleteChannel(permissions: Permission.manageChannels.value),
        isTrue,
      );
    });

    test('returns false without any settings access', () {
      expect(
        canAccessChannelSettings(channel: textChannel, permissions: 0),
        isFalse,
      );
    });
  });

  group('canAccessChannelSettingsTab', () {
    test('allows overview with manageChannels', () {
      expect(
        canAccessChannelSettingsTab(
          channel: textChannel,
          tab: ChannelSettingsTab.overview,
          permissions: Permission.manageChannels.value,
        ),
        isTrue,
      );
    });

    test('denies webhooks without manageWebhooks', () {
      expect(
        canAccessChannelSettingsTab(
          channel: textChannel,
          tab: ChannelSettingsTab.webhooks,
          permissions: Permission.manageChannels.value,
        ),
        isFalse,
      );
    });

    test('denies webhooks on link channels even with manageWebhooks', () {
      expect(
        canAccessChannelSettingsTab(
          channel: linkChannel,
          tab: ChannelSettingsTab.webhooks,
          permissions:
              Permission.manageChannels.value | Permission.manageWebhooks.value,
        ),
        isFalse,
      );
    });
  });

  group('resolveChannelSettingsTab', () {
    test('falls back to first visible tab', () {
      expect(
        resolveChannelSettingsTab(
          requested: ChannelSettingsTab.webhooks,
          visibleTabs: <ChannelSettingsTab>[
            ChannelSettingsTab.overview,
            ChannelSettingsTab.invites,
          ],
        ),
        ChannelSettingsTab.overview,
      );
    });

    test('keeps requested tab when visible', () {
      expect(
        resolveChannelSettingsTab(
          requested: ChannelSettingsTab.invites,
          visibleTabs: <ChannelSettingsTab>[
            ChannelSettingsTab.overview,
            ChannelSettingsTab.invites,
          ],
        ),
        ChannelSettingsTab.invites,
      );
    });
  });
}
