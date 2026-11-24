import 'package:fluxer_app/core/local_settings/local_setting_codec.dart';
import 'package:fluxer_app/core/local_settings/local_setting_key.dart';

abstract final class LocalSettingKeys {
  static const DeviceFlag hapticsEnabled = DeviceFlag(
    'haptics_enabled',
    defaultValue: true,
  );
  static const DeviceFlag splashQuotesEnabled = DeviceFlag(
    'splash_quotes_enabled',
  );
  static const DeviceFlag openCommunitiesToLastChannel = DeviceFlag(
    'open_communities_to_last_channel',
  );

  static const DeviceFlag streamerModeManualEnabled = DeviceFlag(
    'streamer_mode_manual_enabled',
  );
  static const DeviceFlag streamerModeAutoEnable = DeviceFlag(
    'streamer_mode_auto_enable',
    defaultValue: true,
  );
  static const DeviceFlag streamerModeHidePersonalInformation = DeviceFlag(
    'streamer_mode_hide_personal',
    defaultValue: true,
  );
  static const DeviceFlag streamerModeHideInviteLinks = DeviceFlag(
    'streamer_mode_hide_invite_links',
    defaultValue: true,
  );
  static const DeviceFlag streamerModeDisableSounds = DeviceFlag(
    'streamer_mode_disable_sounds',
    defaultValue: true,
  );
  static const DeviceFlag streamerModeDisableNotifications = DeviceFlag(
    'streamer_mode_disable_notifications',
    defaultValue: true,
  );

  static const DeviceFlag messageDoubleClickActions = DeviceFlag(
    'interface_message_double_click_actions',
  );
  static const DeviceFlag animateGifPicker = DeviceFlag(
    'interface_animate_gif_picker',
    defaultValue: true,
  );
  static const DeviceFlag hideBlockedMessages = DeviceFlag(
    'interface_hide_blocked_messages',
  );
  static const DeviceFlag keepAttachmentsOnEmptyEdit = DeviceFlag(
    'interface_keep_attachments_on_empty_edit',
  );
  static const DeviceFlag sequentialFileSend = DeviceFlag(
    'interface_sequential_file_send',
  );

  static const DeviceFlag notificationsEnabled = DeviceFlag(
    'notification_prefs_enabled',
    defaultValue: true,
  );
  static const DeviceSettingKey<int> ttsNotificationMode =
      DeviceSettingKey<int>(
        'notification_prefs_tts_mode',
        defaultValue: 2,
        codec: IntSettingCodec(),
      );
  static const DeviceFlag unreadMessageBadge = DeviceFlag(
    'notification_prefs_unread_badge',
    defaultValue: true,
  );

  static const DeviceFlag desktopShowTrayIcon = DeviceFlag(
    'desktop_show_tray_icon',
    defaultValue: true,
  );
  static const DeviceFlag desktopMinimizeToTray = DeviceFlag(
    'desktop_minimize_to_tray',
  );
  static const DeviceFlag desktopCloseToTray = DeviceFlag(
    'desktop_close_to_tray',
    defaultValue: true,
  );
  static const DeviceFlag desktopStartMinimized = DeviceFlag(
    'desktop_start_minimized',
  );
  static const DeviceFlag desktopRememberWindowState = DeviceFlag(
    'desktop_remember_window_state',
    defaultValue: true,
  );
  static const DeviceFlag desktopColoredTrayIcon = DeviceFlag(
    'desktop_colored_tray_icon',
  );
  static const DeviceSettingKey<String?> desktopMonochromeTrayIconTone =
      DeviceSettingKey<String?>(
        'desktop_monochrome_tray_icon_tone',
        defaultValue: null,
        codec: NullableStringSettingCodec(),
      );
  static const DeviceFlag desktopUnreadLauncherBadge = DeviceFlag(
    'desktop_unread_launcher_badge',
  );
  static const DeviceFlag desktopDarkTaskbarBadge = DeviceFlag(
    'desktop_dark_taskbar_badge',
  );
  static const DeviceFlag desktopUseNativeTitleBar = DeviceFlag(
    'desktop_use_native_title_bar',
  );
  static const DeviceSettingKey<LocalSettingJson> desktopWindowState =
      DeviceSettingKey<LocalSettingJson>(
        'desktop_window_state_v1',
        defaultValue: <String, Object?>{},
        codec: JsonSettingCodec(),
      );

  static const DeviceSettingKey<LocalSettingJson> keybindPreferences =
      DeviceSettingKey<LocalSettingJson>(
        'keybind_preferences_v1',
        defaultValue: <String, Object?>{},
        codec: JsonSettingCodec(),
      );

  static const DeviceFlag selfMute = DeviceFlag('persistedSelfMute');
  static const DeviceFlag selfDeaf = DeviceFlag('persistedSelfDeaf');
  static const DeviceSettingKey<LocalSettingJson> voiceDevice =
      DeviceSettingKey<LocalSettingJson>(
        'voice_device_settings',
        defaultValue: <String, Object?>{},
        codec: JsonSettingCodec(),
      );
  static const AccountSettingKey<LocalSettingJson> voiceDeviceOverrides =
      AccountSettingKey<LocalSettingJson>(
        'voice_device_overrides',
        defaultValue: <String, Object?>{},
        codec: JsonSettingCodec(),
      );
  static const AccountSettingKey<LocalSettingJson> voiceAccount =
      AccountSettingKey<LocalSettingJson>(
        'voice_account_settings',
        defaultValue: <String, Object?>{},
        codec: JsonSettingCodec(),
      );

  static const AccountFlag spellcheckEnabled = AccountFlag(
    'synced_extras_spellcheck_enabled',
    defaultValue: true,
  );
  static const AccountFlag convertEmoticons = AccountFlag(
    'synced_extras_convert_emoticons',
  );
  static const AccountFlag hideHelpButton = AccountFlag(
    'synced_extras_hide_help_button',
  );
  static const AccountFlag hideDownloadButton = AccountFlag(
    'synced_extras_hide_download_button',
  );

  static const AccountSettingKey<double?> shellSidebarWidth =
      AccountSettingKey<double?>(
        'shell_sidebar_width',
        defaultValue: null,
        codec: NullableDoubleSettingCodec(),
      );
  static const AccountSettingKey<String?> mentionSeenBoundary =
      AccountSettingKey<String?>(
        'mention_seen_boundary',
        defaultValue: null,
        codec: NullableStringSettingCodec(),
      );
  static const AccountFlag recoveryKitPromptShown = AccountFlag(
    'recovery_kit_prompt_shown',
  );

  static const DeviceSettingKey<List<String>> dismissedScheduledMaintenance =
      DeviceSettingKey<List<String>>(
        'dismissed_scheduled_maintenance',
        defaultValue: <String>[],
        codec: StringListSettingCodec(),
      );
  static const DeviceFlag unifiedPushNoDistributorDismissed = DeviceFlag(
    'fluxer_UnifiedPushUi_asked',
  );
}
