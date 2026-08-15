import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_field_registry.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_nav_l10n.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

typedef UserSettingsSearchLabel = String Function(FluxerLocalizations l10n);

final class UserSettingsSearchDescriptor {
  const UserSettingsSearchDescriptor({
    required this.id,
    required this.section,
    required this.label,
    this.fieldId,
    this.keywords = const [],
    this.description,
  });

  final String id;
  final UserSettingsSection section;
  final String? fieldId;
  final UserSettingsSearchLabel label;
  final List<UserSettingsSearchLabel> keywords;
  final UserSettingsSearchLabel? description;
}

List<UserSettingsSearchDescriptor>? _cachedDescriptors;

List<UserSettingsSearchDescriptor> userSettingsSearchDescriptors() {
  return _cachedDescriptors ??= _buildDescriptors();
}

List<UserSettingsSearchDescriptor> _buildDescriptors() {
  final Set<String> seenIds = {};
  final List<UserSettingsSearchDescriptor> descriptors = [];

  void add(UserSettingsSearchDescriptor descriptor) {
    if (!seenIds.add(descriptor.id)) {
      return;
    }
    descriptors.add(descriptor);
  }

  for (final UserSettingsSection section in UserSettingsSection.values) {
    add(
      UserSettingsSearchDescriptor(
        id: 'section:${section.name}',
        section: section,
        label: (l10n) => userSettingsSectionLabel(l10n, section),
      ),
    );
  }

  for (final _UserSettingsSearchOption option in _userSettingsSearchOptions) {
    add(
      UserSettingsSearchDescriptor(
        id: option.id,
        section: option.section,
        fieldId: option.fieldId,
        label: option.label,
        keywords: option.keywords,
        description: option.description,
      ),
    );
  }

  for (final String tab in _searchableTabs) {
    for (final String rawFieldId in knownUserSettingsFieldIdsForTab(tab)) {
      final String? scrollId = normalizeUserSettingsScrollFieldId(
        tab,
        rawFieldId,
      );
      if (scrollId == null) {
        continue;
      }
      final String id = 'field:$tab:$scrollId';
      if (seenIds.contains(id)) {
        continue;
      }
      add(
        UserSettingsSearchDescriptor(
          id: id,
          section: _sectionForScrollField(tab, scrollId),
          fieldId: scrollId,
          label: (l10n) => userSettingsFieldLabel(l10n, tab, scrollId) ?? '',
          keywords: _extraKeywordsForScrollField(scrollId),
          description: _descriptionForScrollField(scrollId),
        ),
      );
    }
  }

  return descriptors;
}

const List<String> _searchableTabs = [
  'account_security',
  'appearance',
  'accessibility',
  'chat_settings',
  'voice_video',
  'notifications',
  'privacy_safety',
  'advanced_settings',
];

UserSettingsSection _sectionForScrollField(String tab, String scrollId) {
  return switch (tab) {
    'account_security' => switch (scrollId) {
      'account' ||
      'security' ||
      'danger_zone' => UserSettingsSection.securityLogin,
      _ => UserSettingsSection.securityLogin,
    },
    'appearance' => UserSettingsSection.lookAndFeel,
    'accessibility' => UserSettingsSection.accessibility,
    'chat_settings' => UserSettingsSection.chat,
    'voice_video' => UserSettingsSection.audioAndVideo,
    'notifications' => UserSettingsSection.notifications,
    'privacy_safety' => switch (scrollId) {
      'active-now' => UserSettingsSection.privacyDashboard,
      _ => UserSettingsSection.privacyDashboard,
    },
    'advanced_settings' => UserSettingsSection.advanced,
    _ => UserSettingsSection.advanced,
  };
}

final class _UserSettingsSearchOption {
  const _UserSettingsSearchOption({
    required this.id,
    required this.section,
    required this.label,
    this.fieldId,
    this.keywords = const [],
    this.description,
  });

  final String id;
  final UserSettingsSection section;
  final String? fieldId;
  final UserSettingsSearchLabel label;
  final List<UserSettingsSearchLabel> keywords;
  final UserSettingsSearchLabel? description;
}

UserSettingsSearchLabel _l(String Function(FluxerLocalizations l10n) label) =>
    label;

final List<_UserSettingsSearchOption> _userSettingsSearchOptions = [
  // Look & feel
  _UserSettingsSearchOption(
    id: 'look-and-feel:sync-theme',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'theme',
    label: _l((l10n) => l10n.lookAndFeelSyncThemeAcrossDevicesLabel),
    description: _l(
      (l10n) => l10n.lookAndFeelSyncThemeAcrossDevicesDescription,
    ),
    keywords: [
      _l((l10n) => l10n.lookAndFeelThemeDark),
      _l((l10n) => l10n.lookAndFeelThemeLight),
    ],
  ),
  _UserSettingsSearchOption(
    id: 'look-and-feel:chat-font-size',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'messages',
    label: _l((l10n) => l10n.lookAndFeelChatFontSizeLabel),
  ),
  _UserSettingsSearchOption(
    id: 'look-and-feel:message-spacing',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'messages',
    label: _l((l10n) => l10n.lookAndFeelMessageGroupSpacingLabel),
  ),
  _UserSettingsSearchOption(
    id: 'look-and-feel:message-display',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'messages',
    label: _l((l10n) => l10n.lookAndFeelMessageDisplayModeLabel),
    keywords: [
      _l((l10n) => l10n.lookAndFeelMessageDisplayComfyName),
      _l((l10n) => l10n.lookAndFeelMessageDisplayDenseName),
    ],
  ),
  _UserSettingsSearchOption(
    id: 'look-and-feel:hide-avatars',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'messages',
    label: _l((l10n) => l10n.lookAndFeelHideUserAvatarsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'look-and-feel:typing-indicators',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'interface',
    label: _l((l10n) => l10n.lookAndFeelChannelTypingIndicatorsTitle),
  ),
  _UserSettingsSearchOption(
    id: 'look-and-feel:selected-channel-typing',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'interface',
    label: _l(
      (l10n) => l10n.lookAndFeelShowSelectedChannelTypingIndicatorLabel,
    ),
  ),
  _UserSettingsSearchOption(
    id: 'look-and-feel:keyboard-hints',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'interface',
    label: _l((l10n) => l10n.lookAndFeelHideKeyboardHintsLabel),
    keywords: [_l((l10n) => l10n.lookAndFeelKeyboardHintsTitle)],
  ),
  _UserSettingsSearchOption(
    id: 'look-and-feel:collapse-dms',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'interface',
    label: _l((l10n) => l10n.lookAndFeelCollapseDMsLabel),
    keywords: [_l((l10n) => l10n.lookAndFeelGuildSidebarTitle)],
  ),
  _UserSettingsSearchOption(
    id: 'look-and-feel:muted-unread',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'channel-list',
    label: _l((l10n) => l10n.lookAndFeelShowFadedUnreadOnMutedChannelsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'look-and-feel:active-now',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'active-now',
    label: _l((l10n) => l10n.lookAndFeelShowActiveNowLabel),
  ),
  _UserSettingsSearchOption(
    id: 'look-and-feel:favorites',
    section: UserSettingsSection.lookAndFeel,
    fieldId: 'channel-list',
    label: _l((l10n) => l10n.lookAndFeelEnableFavoritesLabel),
    keywords: [_l((l10n) => l10n.lookAndFeelFavoritesSectionTitle)],
  ),
  // Notifications
  _UserSettingsSearchOption(
    id: 'notifications:enable',
    section: UserSettingsSection.notifications,
    fieldId: 'notifications',
    label: _l((l10n) => l10n.notificationsEnableNotificationsLabel),
    keywords: [_l((l10n) => l10n.notificationsEnableDesktopNotificationsLabel)],
  ),
  _UserSettingsSearchOption(
    id: 'notifications:push-timeout',
    section: UserSettingsSection.notifications,
    fieldId: 'notifications',
    label: _l((l10n) => l10n.notificationsPushInactiveTimeoutLabel),
  ),
  _UserSettingsSearchOption(
    id: 'notifications:mention-preference',
    section: UserSettingsSection.notifications,
    fieldId: 'mention-preference',
    label: _l((l10n) => l10n.notificationsReplyMentionPreferenceAriaLabel),
  ),
  _UserSettingsSearchOption(
    id: 'notifications:tts-command',
    section: UserSettingsSection.notifications,
    fieldId: 'text-to-speech',
    label: _l((l10n) => l10n.notificationsTtsEnableCommandLabel),
  ),
  _UserSettingsSearchOption(
    id: 'notifications:disable-sounds',
    section: UserSettingsSection.notifications,
    fieldId: 'sounds',
    label: _l((l10n) => l10n.notificationsDisableAllSoundsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'notifications:per-sound-volume',
    section: UserSettingsSection.notifications,
    fieldId: 'sounds',
    label: _l((l10n) => l10n.notificationsPerSoundVolumeTitle),
  ),
  // Security
  _UserSettingsSearchOption(
    id: 'security:email',
    section: UserSettingsSection.securityLogin,
    fieldId: 'account',
    label: _l((l10n) => l10n.securityLoginEmailSectionTitle),
  ),
  _UserSettingsSearchOption(
    id: 'security:password',
    section: UserSettingsSection.securityLogin,
    fieldId: 'account',
    label: _l((l10n) => l10n.securityLoginPasswordSectionTitle),
  ),
  _UserSettingsSearchOption(
    id: 'security:two-factor',
    section: UserSettingsSection.securityLogin,
    fieldId: 'security',
    label: _l((l10n) => l10n.securityTfaSectionTitle),
  ),
  _UserSettingsSearchOption(
    id: 'security:passkeys',
    section: UserSettingsSection.securityLogin,
    fieldId: 'security',
    label: _l((l10n) => l10n.securityPasskeysSectionTitle),
  ),
  _UserSettingsSearchOption(
    id: 'security:danger-zone',
    section: UserSettingsSection.securityLogin,
    fieldId: 'danger_zone',
    label: _l((l10n) => l10n.dangerZoneSectionTitle),
  ),
  // Chat
  _UserSettingsSearchOption(
    id: 'chat:inline-embeds',
    section: UserSettingsSection.chat,
    fieldId: 'display',
    label: _l((l10n) => l10n.messagesMediaDisplayInlineEmbedLabel),
  ),
  _UserSettingsSearchOption(
    id: 'chat:inline-attachments',
    section: UserSettingsSection.chat,
    fieldId: 'display',
    label: _l((l10n) => l10n.messagesMediaDisplayInlineAttachmentLabel),
  ),
  _UserSettingsSearchOption(
    id: 'chat:link-previews',
    section: UserSettingsSection.chat,
    fieldId: 'display',
    label: _l((l10n) => l10n.messagesMediaLinkPreviewsToggleLabel),
  ),
  _UserSettingsSearchOption(
    id: 'chat:reactions',
    section: UserSettingsSection.chat,
    fieldId: 'display',
    label: _l((l10n) => l10n.messagesMediaReactionsToggleLabel),
  ),
  _UserSettingsSearchOption(
    id: 'chat:spoilers',
    section: UserSettingsSection.chat,
    fieldId: 'display',
    label: _l((l10n) => l10n.messagesMediaSpoilersRadioLabel),
  ),
  _UserSettingsSearchOption(
    id: 'chat:gif-autoplay',
    section: UserSettingsSection.chat,
    fieldId: 'media',
    label: _l((l10n) => l10n.messagesMediaGifsAutoSendLabel),
  ),
  _UserSettingsSearchOption(
    id: 'chat:expression-autocomplete',
    section: UserSettingsSection.chat,
    fieldId: 'input',
    label: _l((l10n) => l10n.messagesMediaAutocompleteDefaultEmojisLabel),
    keywords: [
      _l((l10n) => l10n.messagesMediaAutocompleteCustomEmojisLabel),
      _l((l10n) => l10n.messagesMediaAutocompleteStickersLabel),
    ],
  ),
  _UserSettingsSearchOption(
    id: 'chat:trust-links',
    section: UserSettingsSection.chat,
    label: _l((l10n) => l10n.externalLinkTrustAllLabel),
    keywords: [_l((l10n) => l10n.externalLinksSectionTitle)],
  ),
  _UserSettingsSearchOption(
    id: 'chat:strip-tracking',
    section: UserSettingsSection.chat,
    label: _l((l10n) => l10n.externalLinkStripTrackingLabel),
  ),
  _UserSettingsSearchOption(
    id: 'chat:hide-muted',
    section: UserSettingsSection.chat,
    label: _l((l10n) => l10n.messagesMediaDefaultHideMutedChannelsLabel),
  ),
  // Accessibility
  _UserSettingsSearchOption(
    id: 'accessibility:saturation',
    section: UserSettingsSection.accessibility,
    fieldId: 'visual',
    label: _l((l10n) => l10n.accessibilitySaturationTitle),
  ),
  _UserSettingsSearchOption(
    id: 'accessibility:underline-links',
    section: UserSettingsSection.accessibility,
    fieldId: 'visual',
    label: _l((l10n) => l10n.accessibilityAlwaysUnderlineLinksLabel),
  ),
  _UserSettingsSearchOption(
    id: 'accessibility:strikethrough',
    section: UserSettingsSection.accessibility,
    fieldId: 'visual',
    label: _l((l10n) => l10n.accessibilityDimStrikethroughTextLabel),
  ),
  _UserSettingsSearchOption(
    id: 'accessibility:dm-preview',
    section: UserSettingsSection.accessibility,
    fieldId: 'visual',
    label: _l((l10n) => l10n.accessibilityDmMessagePreviewModeLabel),
  ),
  _UserSettingsSearchOption(
    id: 'accessibility:screen-reader',
    section: UserSettingsSection.accessibility,
    fieldId: 'screen-reader',
    label: _l((l10n) => l10n.accessibilityScreenReaderAnnounceNewMessagesLabel),
  ),
  _UserSettingsSearchOption(
    id: 'accessibility:focus-ring',
    section: UserSettingsSection.accessibility,
    fieldId: 'keyboard',
    label: _l((l10n) => l10n.accessibilityShowTextareaFocusRingLabel),
  ),
  _UserSettingsSearchOption(
    id: 'accessibility:escape-keyboard',
    section: UserSettingsSection.accessibility,
    fieldId: 'keyboard',
    label: _l((l10n) => l10n.accessibilityEscapeExitsKeyboardModeLabel),
  ),
  _UserSettingsSearchOption(
    id: 'accessibility:context-menu-shortcuts',
    section: UserSettingsSection.accessibility,
    fieldId: 'keyboard',
    label: _l((l10n) => l10n.accessibilityShowContextMenuShortcutsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'accessibility:confirm-calls',
    section: UserSettingsSection.accessibility,
    fieldId: 'keyboard',
    label: _l((l10n) => l10n.accessibilityConfirmBeforeStartingCallsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'accessibility:reduced-motion',
    section: UserSettingsSection.accessibility,
    fieldId: 'motion',
    label: _l((l10n) => l10n.accessibilitySyncReducedMotionWithSystemLabel),
  ),
  _UserSettingsSearchOption(
    id: 'accessibility:emoji-animation',
    section: UserSettingsSection.accessibility,
    fieldId: 'animation',
    label: _l((l10n) => l10n.accessibilityPlayAnimatedEmojisLabel),
  ),
  // Audio & video
  _UserSettingsSearchOption(
    id: 'av:input-device',
    section: UserSettingsSection.audioAndVideo,
    fieldId: 'audio',
    label: _l((l10n) => l10n.audioAndVideoInputDeviceLabel),
  ),
  _UserSettingsSearchOption(
    id: 'av:output-device',
    section: UserSettingsSection.audioAndVideo,
    fieldId: 'audio',
    label: _l((l10n) => l10n.audioAndVideoOutputDeviceLabel),
  ),
  _UserSettingsSearchOption(
    id: 'av:speaker',
    section: UserSettingsSection.audioAndVideo,
    fieldId: 'audio',
    label: _l((l10n) => l10n.audioAndVideoUseSpeakerLabel),
  ),
  _UserSettingsSearchOption(
    id: 'av:input-volume',
    section: UserSettingsSection.audioAndVideo,
    fieldId: 'audio',
    label: _l((l10n) => l10n.audioAndVideoInputVolumeLabel),
  ),
  _UserSettingsSearchOption(
    id: 'av:output-volume',
    section: UserSettingsSection.audioAndVideo,
    fieldId: 'audio',
    label: _l((l10n) => l10n.audioAndVideoOutputVolumeLabel),
  ),
  _UserSettingsSearchOption(
    id: 'av:voice-processing',
    section: UserSettingsSection.audioAndVideo,
    fieldId: 'audio',
    label: _l((l10n) => l10n.audioAndVideoVoiceProcessingSectionTitle),
  ),
  _UserSettingsSearchOption(
    id: 'av:camera',
    section: UserSettingsSection.audioAndVideo,
    fieldId: 'video',
    label: _l((l10n) => l10n.audioAndVideoCameraQualitySectionTitle),
  ),
  _UserSettingsSearchOption(
    id: 'av:screen-share',
    section: UserSettingsSection.audioAndVideo,
    fieldId: 'video',
    label: _l((l10n) => l10n.audioAndVideoScreenShareQualitySectionTitle),
  ),
  // Privacy
  _UserSettingsSearchOption(
    id: 'privacy:profile',
    section: UserSettingsSection.privacyDashboard,
    fieldId: 'profile-privacy',
    label: _l((l10n) => l10n.privacyDashboardProfilePrivacyTitle),
  ),
  _UserSettingsSearchOption(
    id: 'privacy:friend-requests',
    section: UserSettingsSection.privacyDashboard,
    fieldId: 'connections',
    label: _l((l10n) => l10n.privacyDashboardFriendRequestsTitle),
  ),
  _UserSettingsSearchOption(
    id: 'privacy:direct-messages',
    section: UserSettingsSection.privacyDashboard,
    fieldId: 'connections',
    label: _l((l10n) => l10n.privacyDashboardDirectMessagesTitle),
  ),
  _UserSettingsSearchOption(
    id: 'privacy:incoming-calls',
    section: UserSettingsSection.privacyDashboard,
    fieldId: 'communication',
    label: _l((l10n) => l10n.privacyDashboardIncomingCallsTitle),
  ),
  _UserSettingsSearchOption(
    id: 'privacy:group-dm',
    section: UserSettingsSection.privacyDashboard,
    fieldId: 'communication',
    label: _l((l10n) => l10n.privacyDashboardGroupDmTitle),
  ),
  _UserSettingsSearchOption(
    id: 'privacy:sensitive-content',
    section: UserSettingsSection.privacyDashboard,
    fieldId: 'sensitive-content',
    label: _l((l10n) => l10n.sensitiveContentFriendDmLabel),
  ),
  _UserSettingsSearchOption(
    id: 'privacy:voice-activity',
    section: UserSettingsSection.privacyDashboard,
    fieldId: 'active-now',
    label: _l((l10n) => l10n.privacyDashboardShareVoiceActivity),
  ),
  // Language
  _UserSettingsSearchOption(
    id: 'language:app-language',
    section: UserSettingsSection.languageAndTime,
    label: _l((l10n) => l10n.languageAndTimeLanguageSectionTitle),
  ),
  _UserSettingsSearchOption(
    id: 'language:time-format',
    section: UserSettingsSection.languageAndTime,
    label: _l((l10n) => l10n.languageAndTimeTimeFormatSectionTitle),
  ),
  // Advanced
  _UserSettingsSearchOption(
    id: 'advanced:preupload',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-privacy',
    label: _l((l10n) => l10n.advancedSettingPreuploadAttachmentsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:strip-tracking',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-privacy',
    label: _l((l10n) => l10n.advancedSettingStripTrackingLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:trust-links',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-privacy',
    label: _l((l10n) => l10n.advancedSettingTrustAllLinksLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:screen-share-preview',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-privacy',
    label: _l((l10n) => l10n.advancedSettingScreenSharePreviewBehaviorLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:neko',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-appearance',
    label: _l((l10n) => l10n.advancedSettingShowNekoLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:splash-animation',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-appearance',
    label: _l((l10n) => l10n.advancedSettingMobileSplashZoomAnimationLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:keyboard-hints',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-appearance',
    label: _l((l10n) => l10n.advancedSettingKeyboardHintsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:favorites',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-appearance',
    label: _l((l10n) => l10n.advancedSettingEnableFavoritesLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:voice-join',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-appearance',
    label: _l((l10n) => l10n.advancedSettingVoiceChannelJoinBehaviorLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:text-selection',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-accessibility',
    label: _l((l10n) => l10n.advancedSettingEnableTextSelectionLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:seek-thumbnails',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-accessibility',
    label: _l((l10n) => l10n.advancedSettingVideoSeekThumbnailsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:auto-send-gifs',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-chat',
    label: _l((l10n) => l10n.advancedSettingAutoSendGifsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:save-gif-favorites',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-chat',
    label: _l((l10n) => l10n.advancedSettingSaveGifFavoritesLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:search-engines',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-chat',
    label: _l((l10n) => l10n.advancedSettingSearchEnginesLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:translators',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-chat',
    label: _l((l10n) => l10n.advancedSettingTranslatorsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:reverse-image-search',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-chat',
    label: _l((l10n) => l10n.advancedSettingReverseImageSearchLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:scroll-on-send',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-chat',
    label: _l((l10n) => l10n.advancedSettingScrollToBottomOnSendLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:skip-mark-read',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-chat',
    label: _l((l10n) => l10n.advancedSettingSkipMarkAllAsReadLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:hide-muted',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-chat',
    label: _l((l10n) => l10n.advancedSettingHideMutedChannelsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:screen-share-codec',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-media',
    label: _l((l10n) => l10n.advancedSettingScreenShareCodecLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:new-device-alerts',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-voice',
    label: _l((l10n) => l10n.advancedSettingNewDeviceAlertsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:connection-volume',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-voice',
    label: _l((l10n) => l10n.advancedSettingConnectionVolumeControlsLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:developer-mode',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-settings-developer',
    label: _l((l10n) => l10n.advancedSettingDeveloperModeLabel),
  ),
  _UserSettingsSearchOption(
    id: 'advanced:performance-reporting',
    section: UserSettingsSection.advanced,
    fieldId: 'advanced-performance',
    label: _l((l10n) => l10n.advancedPerformanceReportingLabel),
  ),
];

List<UserSettingsSearchLabel> _extraKeywordsForScrollField(String scrollId) {
  switch (scrollId) {
    case 'theme':
      return [
        _l((l10n) => l10n.lookAndFeelThemeDark),
        _l((l10n) => l10n.lookAndFeelThemeLight),
        _l((l10n) => l10n.lookAndFeelThemeCoal),
        _l((l10n) => l10n.lookAndFeelThemeSystem),
      ];
    case 'account':
      return [
        _l((l10n) => l10n.securityLoginEmailSectionTitle),
        _l((l10n) => l10n.securityLoginPasswordSectionTitle),
      ];
    case 'security':
      return [
        _l((l10n) => l10n.securityTfaSectionTitle),
        _l((l10n) => l10n.securityPasskeysSectionTitle),
      ];
    case 'interface':
      return [
        _l((l10n) => l10n.lookAndFeelKeyboardHintsTitle),
        _l((l10n) => l10n.lookAndFeelHideKeyboardHintsLabel),
      ];
    case 'channel-list':
      return [_l((l10n) => l10n.lookAndFeelChannelTypingIndicatorsTitle)];
    case 'keyboard':
      return [
        _l((l10n) => l10n.lookAndFeelKeyboardHintsTitle),
        _l((l10n) => l10n.userSettingsNavShortcuts),
      ];
    case 'notifications':
      return [_l((l10n) => l10n.notificationsEnableNotificationsLabel)];
    default:
      return const [];
  }
}

UserSettingsSearchLabel? _descriptionForScrollField(String scrollId) {
  switch (scrollId) {
    case 'theme':
      return _l((l10n) => l10n.lookAndFeelThemeSectionDescription);
    case 'hdr':
      return _l((l10n) => l10n.lookAndFeelHdrSectionDescription);
    case 'app-zoom-level':
      return _l((l10n) => l10n.lookAndFeelAppZoomDescription);
    case 'messages':
      return _l((l10n) => l10n.lookAndFeelMessagesSectionDescription);
    case 'interface':
      return _l((l10n) => l10n.lookAndFeelInterfaceDescription);
    case 'account':
      return _l((l10n) => l10n.securityAccountDescription);
    case 'security':
      return _l((l10n) => l10n.securitySectionDescription);
    default:
      return null;
  }
}
