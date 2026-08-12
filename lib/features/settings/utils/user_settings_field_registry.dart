import 'package:flutter/widgets.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_nav_l10n.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const Set<String> _advancedCategorySectionIds = {
  'advanced-settings-account',
  'advanced-settings-privacy',
  'advanced-settings-appearance',
  'advanced-settings-accessibility',
  'advanced-settings-chat',
  'advanced-settings-media',
  'advanced-settings-voice',
  'advanced-settings-notifications',
  'advanced-settings-desktop',
  'advanced-settings-developer',
};

Set<String> knownUserSettingsFieldIdsForTab(String tab) {
  switch (tab) {
    case 'account_security':
      return {
        'account',
        'security',
        'password',
        'two-factor',
        'passkeys',
        'danger_zone',
        'blocked_users',
        'authorized_apps',
        'authorized-applications',
        'blocked-users',
        'devices',
        'signed-in-devices',
      };
    case 'appearance':
      return {
        'theme',
        'hdr',
        'app-zoom-level',
        'messages',
        'chat-font-scaling',
        'interface',
        'channel-list',
        'active-now',
        'streamer-mode',
      };
    case 'accessibility':
      return {
        'visual',
        'screen-reader',
        'tts',
        'keyboard',
        'animation',
        'motion',
      };
    case 'chat_settings':
      return {'display', 'input', 'media'};
    case 'voice_video':
      return {'audio', 'video'};
    case 'notifications':
      return {
        'notifications',
        'mention-preference',
        'sounds',
        'text-to-speech',
      };
    case 'privacy_safety':
      return {
        'profile-privacy',
        'connections',
        'communication',
        'active-now',
        'sensitive-content',
        'data-export',
        'data-deletion',
      };
    case 'advanced_settings':
      return {
        'developer',
        'experiments',
        'logging',
        ..._advancedCategorySectionIds,
        'advanced-performance',
      };
    default:
      return const {};
  }
}

bool isKnownUserSettingsFieldId(String tab, String fieldId) {
  return knownUserSettingsFieldIdsForTab(tab).contains(fieldId);
}

String? normalizeUserSettingsScrollFieldId(String tab, String fieldId) {
  switch (tab) {
    case 'account_security':
      switch (fieldId) {
        case 'password':
          return 'account';
        case 'two-factor':
        case 'passkeys':
          return 'security';
        case 'authorized_apps':
        case 'authorized-applications':
        case 'blocked_users':
        case 'blocked-users':
        case 'devices':
        case 'signed-in-devices':
          return null;
      }
    case 'advanced_settings':
      switch (fieldId) {
        case 'developer':
        case 'experiments':
        case 'logging':
          return 'advanced-settings-developer';
      }
      if (fieldId.startsWith('advanced-settings-')) {
        return fieldId;
      }
  }
  return fieldId;
}

String? userSettingsFieldLabel(
  FluxerLocalizations l10n,
  String tab,
  String fieldId,
) {
  final String? scrollId = normalizeUserSettingsScrollFieldId(tab, fieldId);
  if (scrollId == null) {
    return null;
  }
  if (fieldId == 'active-now') {
    return switch (tab) {
      'privacy_safety' => l10n.privacyDashboardActivitySharingSection,
      'appearance' => l10n.lookAndFeelActiveNowSectionTitle,
      _ => _scrollFieldLabel(l10n, scrollId),
    };
  }
  return _scrollFieldLabel(l10n, scrollId);
}

String? _scrollFieldLabel(FluxerLocalizations l10n, String scrollId) {
  switch (scrollId) {
    case 'theme':
      return l10n.lookAndFeelThemeSectionTitle;
    case 'chat-font-scaling':
      return l10n.lookAndFeelChatFontScalingTitle;
    case 'interface':
      return l10n.lookAndFeelInterfaceTitle;
    case 'channel-list':
      return l10n.lookAndFeelChannelListSectionTitle;
    case 'active-now':
      return l10n.lookAndFeelActiveNowSectionTitle;
    case 'display':
      return l10n.messagesMediaDisplayGroupTitle;
    case 'media':
      return l10n.messagesMediaMediaGroupTitle;
    case 'input':
      return l10n.messagesMediaInputGroupTitle;
    case 'audio':
      return l10n.audioAndVideoAudioSectionTitle;
    case 'video':
      return l10n.audioAndVideoVideoSectionTitle;
    case 'visual':
      return l10n.accessibilityVisualGroupTitle;
    case 'screen-reader':
      return l10n.accessibilityScreenReaderGroupTitle;
    case 'tts':
      return l10n.accessibilityTtsGroupTitle;
    case 'keyboard':
      return l10n.accessibilityKeyboardGroupTitle;
    case 'animation':
      return l10n.accessibilityAnimationGroupTitle;
    case 'motion':
      return l10n.accessibilityMotionGroupTitle;
    case 'notifications':
      return l10n.notificationsGeneralSectionTitle;
    case 'mention-preference':
      return l10n.notificationsMentionPreferenceSectionTitle;
    case 'sounds':
      return l10n.notificationsSoundsSectionTitle;
    case 'text-to-speech':
      return l10n.notificationsTtsSectionTitle;
    case 'profile-privacy':
      return l10n.privacyDashboardProfilePrivacySection;
    case 'connections':
      return l10n.privacyDashboardFriendsAndDirectMessagesSection;
    case 'communication':
      return l10n.privacyDashboardCommunicationSection;
    case 'sensitive-content':
      return l10n.privacyDashboardSensitiveContentSection;
    case 'data-export':
      return l10n.privacyDashboardDataExportSection;
    case 'data-deletion':
      return l10n.privacyDashboardDataDeletionSection;
    case 'account':
      return l10n.securityAccountTitle;
    case 'security':
      return l10n.securitySectionTitle;
    case 'danger_zone':
      return l10n.dangerZoneSectionTitle;
    case 'advanced-settings-privacy':
      return l10n.advancedSettingsCategoryPrivacy;
    case 'advanced-settings-appearance':
      return l10n.advancedSettingsCategoryAppearance;
    case 'advanced-settings-accessibility':
      return l10n.advancedSettingsCategoryAccessibility;
    case 'advanced-settings-chat':
      return l10n.advancedSettingsCategoryChat;
    case 'advanced-settings-media':
      return l10n.advancedSettingsCategoryMedia;
    case 'advanced-settings-voice':
      return l10n.advancedSettingsCategoryVoice;
    case 'advanced-settings-developer':
      return l10n.advancedSettingsCategoryDeveloper;
    case 'advanced-performance':
      return l10n.advancedPerformanceReportingTitle;
    default:
      return null;
  }
}

bool isUserSettingsScrollFieldVisible({
  required BuildContext context,
  required bool isTouchPrimary,
  required UserSettingsSection? section,
  required String scrollFieldId,
}) {
  if (section == null) {
    return false;
  }
  switch (scrollFieldId) {
    case 'hdr':
    case 'app-zoom-level':
    case 'messages':
    case 'streamer-mode':
      return false;
    case 'keyboard':
      return !isTouchPrimary;
    case 'advanced-settings-desktop':
      return false;
    case 'advanced-settings-notifications':
    case 'advanced-settings-account':
      return false;
    default:
      break;
  }
  return true;
}

String? resolveUserSettingsScrollFieldId({
  required BuildContext context,
  required bool isTouchPrimary,
  required String tab,
  required String? fieldId,
  required UserSettingsSection? section,
}) {
  if (fieldId == null || section == null) {
    return null;
  }
  final String? scrollId = normalizeUserSettingsScrollFieldId(tab, fieldId);
  if (scrollId == null) {
    return null;
  }
  if (!isUserSettingsScrollFieldVisible(
    context: context,
    isTouchPrimary: isTouchPrimary,
    section: section,
    scrollFieldId: scrollId,
  )) {
    return null;
  }
  return scrollId;
}

String userSettingsTabLabel(FluxerLocalizations l10n, String tab) {
  switch (tab) {
    case 'my_profile':
      return userSettingsSectionLabel(l10n, UserSettingsSection.profile);
    case 'account_security':
      return userSettingsSectionLabel(l10n, UserSettingsSection.securityLogin);
    case 'privacy_safety':
      return userSettingsSectionLabel(
        l10n,
        UserSettingsSection.privacyDashboard,
      );
    case 'appearance':
      return userSettingsSectionLabel(l10n, UserSettingsSection.lookAndFeel);
    case 'accessibility':
      return userSettingsSectionLabel(l10n, UserSettingsSection.accessibility);
    case 'chat_settings':
      return userSettingsSectionLabel(l10n, UserSettingsSection.chat);
    case 'voice_video':
      return userSettingsSectionLabel(l10n, UserSettingsSection.audioAndVideo);
    case 'notifications':
      return userSettingsSectionLabel(l10n, UserSettingsSection.notifications);
    case 'language':
      return userSettingsSectionLabel(
        l10n,
        UserSettingsSection.languageAndTime,
      );
    case 'linked_accounts':
      return userSettingsSectionLabel(l10n, UserSettingsSection.connections);
    case 'applications':
      return userSettingsSectionLabel(l10n, UserSettingsSection.applications);
    case 'advanced_settings':
      return userSettingsSectionLabel(l10n, UserSettingsSection.advanced);
    case 'authorized_apps':
      return userSettingsSectionLabel(l10n, UserSettingsSection.authorizedApps);
    case 'blocked_users':
      return userSettingsSectionLabel(l10n, UserSettingsSection.blockedUsers);
    case 'devices':
      return userSettingsSectionLabel(l10n, UserSettingsSection.linkedDevices);
    case 'keybinds':
      return userSettingsSectionLabel(l10n, UserSettingsSection.keybinds);
    default:
      return l10n.userAreaUserSettings;
  }
}
