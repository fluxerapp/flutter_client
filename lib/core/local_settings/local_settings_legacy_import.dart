import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/local_settings/local_setting_codec.dart';
import 'package:fluxer_app/core/local_settings/local_setting_id.dart';
import 'package:fluxer_app/core/local_settings/local_setting_key.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

const LocalSettingId kLocalSettingsLegacyImportId = (
  scope: kDeviceLocalSettingScope,
  key: 'meta.legacy_import',
);

const String _kSidebarWidthPrefix = 'fluxer:ui:sidebar-width:';
const String _kMentionSeenPrefix = 'notifications_mentions_seen_';
const String _kRecoveryKitPrefix = 'fluxer_recovery_kit_prompt_shown_';
const String _kMaintenancePrefix = 'fluxer_scheduled_maintenance_dismissed:';

const List<DeviceSettingKey<Object?>> _kDeviceValues =
    <DeviceSettingKey<Object?>>[
      LocalSettingKeys.hapticsEnabled,
      LocalSettingKeys.splashQuotesEnabled,
      LocalSettingKeys.openCommunitiesToLastChannel,
      LocalSettingKeys.streamerModeManualEnabled,
      LocalSettingKeys.streamerModeAutoEnable,
      LocalSettingKeys.streamerModeHidePersonalInformation,
      LocalSettingKeys.streamerModeHideInviteLinks,
      LocalSettingKeys.streamerModeDisableSounds,
      LocalSettingKeys.streamerModeDisableNotifications,
      LocalSettingKeys.messageDoubleClickActions,
      LocalSettingKeys.animateGifPicker,
      LocalSettingKeys.hideBlockedMessages,
      LocalSettingKeys.keepAttachmentsOnEmptyEdit,
      LocalSettingKeys.sequentialFileSend,
      LocalSettingKeys.notificationsEnabled,
      LocalSettingKeys.ttsNotificationMode,
      LocalSettingKeys.unreadMessageBadge,
      LocalSettingKeys.desktopShowTrayIcon,
      LocalSettingKeys.desktopMinimizeToTray,
      LocalSettingKeys.desktopCloseToTray,
      LocalSettingKeys.desktopStartMinimized,
      LocalSettingKeys.desktopRememberWindowState,
      LocalSettingKeys.desktopColoredTrayIcon,
      LocalSettingKeys.desktopMonochromeTrayIconTone,
      LocalSettingKeys.desktopUnreadLauncherBadge,
      LocalSettingKeys.desktopDarkTaskbarBadge,
      LocalSettingKeys.desktopUseNativeTitleBar,
      LocalSettingKeys.selfMute,
      LocalSettingKeys.selfDeaf,
      LocalSettingKeys.unifiedPushNoDistributorDismissed,
    ];

const List<DeviceSettingKey<LocalSettingJson>> _kDeviceDocuments =
    <DeviceSettingKey<LocalSettingJson>>[
      LocalSettingKeys.desktopWindowState,
      LocalSettingKeys.keybindPreferences,
    ];

const List<AccountFlag> _kActiveAccountFlags = <AccountFlag>[
  LocalSettingKeys.spellcheckEnabled,
  LocalSettingKeys.convertEmoticons,
  LocalSettingKeys.hideHelpButton,
  LocalSettingKeys.hideDownloadButton,
];

Future<void> importLegacyLocalSettings(FluxerDatabase database) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final String? activeUserId = await _mostRecentUserId(database);
  final Map<LocalSettingId, Object?> values = <LocalSettingId, Object?>{
    ..._deviceValues(preferences),
    ..._accountValues(preferences, activeUserId: activeUserId),
    ...await _voiceValues(database, activeUserId: activeUserId),
    kLocalSettingsLegacyImportId: 1,
  };
  await database.localSettingsDao.insertMissing(
    values.map(
      (LocalSettingId id, Object? value) => MapEntry(id, jsonEncode(value)),
    ),
  );
}

Future<String?> _mostRecentUserId(FluxerDatabase database) async {
  final List<AuthSession> sessions =
      await (database.select(database.authSessions)
            ..orderBy([
              ($AuthSessionsTable table) => OrderingTerm.desc(table.isValid),
              ($AuthSessionsTable table) => OrderingTerm.desc(table.lastActive),
            ])
            ..limit(1))
          .get();
  return sessions.firstOrNull?.userId;
}

Map<LocalSettingId, Object?> _deviceValues(SharedPreferences preferences) {
  final List<String> dismissedMaintenance = <String>[
    for (final String key in preferences.getKeys())
      if (key.startsWith(_kMaintenancePrefix) && preferences.get(key) == '1')
        key.substring(_kMaintenancePrefix.length),
  ];
  return <LocalSettingId, Object?>{
    for (final DeviceSettingKey<Object?> key in _kDeviceValues)
      deviceSettingId(key): ?preferences.get(key.name),
    for (final DeviceSettingKey<LocalSettingJson> key in _kDeviceDocuments)
      deviceSettingId(key): ?_decodeDocument(preferences.get(key.name)),
    if (dismissedMaintenance.isNotEmpty)
      deviceSettingId(LocalSettingKeys.dismissedScheduledMaintenance):
          dismissedMaintenance,
  };
}

Map<LocalSettingId, Object?> _accountValues(
  SharedPreferences preferences, {
  required String? activeUserId,
}) {
  return <LocalSettingId, Object?>{
    if (activeUserId != null)
      for (final AccountFlag key in _kActiveAccountFlags)
        accountSettingId(key, activeUserId): ?preferences.get(key.name),
    for (final (String userId, Object value) in _valuesWithPrefix(
      preferences,
      _kSidebarWidthPrefix,
    ))
      if (double.tryParse('$value') case final double width when width.isFinite)
        accountSettingId(LocalSettingKeys.shellSidebarWidth, userId): width,
    for (final (String userId, Object value) in _valuesWithPrefix(
      preferences,
      _kMentionSeenPrefix,
    ))
      accountSettingId(LocalSettingKeys.mentionSeenBoundary, userId): value,
    for (final (String userId, Object value) in _valuesWithPrefix(
      preferences,
      _kRecoveryKitPrefix,
    ))
      accountSettingId(LocalSettingKeys.recoveryKitPromptShown, userId): value,
  };
}

Iterable<(String, Object)> _valuesWithPrefix(
  SharedPreferences preferences,
  String prefix,
) sync* {
  for (final String key in preferences.getKeys()) {
    final Object? value = preferences.get(key);
    if (value != null && key.length > prefix.length && key.startsWith(prefix)) {
      yield (key.substring(prefix.length), value);
    }
  }
}

Future<Map<LocalSettingId, Object?>> _voiceValues(
  FluxerDatabase database, {
  required String? activeUserId,
}) async {
  final List<UserPreferencesTableData> rows = await database
      .select(database.userPreferencesTable)
      .get();
  final Map<String, VoiceSettingsState> byUser = <String, VoiceSettingsState>{
    for (final UserPreferencesTableData row in rows)
      if (_decodeDocument(row.voiceSettingsJson) case final document?)
        row.userId: ?VoiceSettingsState.tryFromJson(document),
  };
  final VoiceSettingsState? device =
      byUser[activeUserId] ?? byUser.values.firstOrNull;
  if (device == null) {
    return const <LocalSettingId, Object?>{};
  }
  final LocalSettingJson deviceJson = device.deviceJson();
  return <LocalSettingId, Object?>{
    deviceSettingId(LocalSettingKeys.voiceDevice): deviceJson,
    for (final MapEntry<String, VoiceSettingsState> entry
        in byUser.entries) ...{
      accountSettingId(LocalSettingKeys.voiceAccount, entry.key): entry.value
          .accountJson(),
      if (changedVoiceFields(deviceJson, entry.value.deviceJson())
          case final overrides when overrides.isNotEmpty)
        accountSettingId(LocalSettingKeys.voiceDeviceOverrides, entry.key):
            overrides,
    },
  };
}

LocalSettingJson? _decodeDocument(Object? raw) {
  if (raw is! String || raw.isEmpty) {
    return null;
  }
  try {
    final Object? json = jsonDecode(raw);
    return json is LocalSettingJson ? json : null;
  } on FormatException {
    return null;
  }
}
