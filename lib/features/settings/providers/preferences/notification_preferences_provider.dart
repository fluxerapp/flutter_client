import 'dart:async';

import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/features/settings/domain/tts_notification_mode.dart';
import 'package:fluxer_app/features/shell/providers/nagbar/push_notification_permission_status_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_preferences_provider.g.dart';

enum NotificationEnableResult {
  success,
  permissionDenied,
  requiresSystemSettings,
}

class NotificationPreferencesState {
  const NotificationPreferencesState({
    this.notificationsEnabled = true,
    this.ttsNotificationMode = TtsNotificationMode.never,
    this.unreadMessageBadgeEnabled = true,
  });

  final bool notificationsEnabled;
  final TtsNotificationMode ttsNotificationMode;
  final bool unreadMessageBadgeEnabled;

  NotificationPreferencesState copyWith({
    bool? notificationsEnabled,
    TtsNotificationMode? ttsNotificationMode,
    bool? unreadMessageBadgeEnabled,
  }) {
    return NotificationPreferencesState(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      ttsNotificationMode: ttsNotificationMode ?? this.ttsNotificationMode,
      unreadMessageBadgeEnabled:
          unreadMessageBadgeEnabled ?? this.unreadMessageBadgeEnabled,
    );
  }
}

@Riverpod(keepAlive: true)
class NotificationPreferences extends _$NotificationPreferences {
  @override
  NotificationPreferencesState build() {
    final LocalSettingsStore store = ref.watch(localSettingsStoreProvider);
    final int modeIndex = store.read(LocalSettingKeys.ttsNotificationMode);
    return NotificationPreferencesState(
      notificationsEnabled: store.read(LocalSettingKeys.notificationsEnabled),
      ttsNotificationMode: TtsNotificationMode
          .values[modeIndex.clamp(0, TtsNotificationMode.values.length - 1)],
      unreadMessageBadgeEnabled: store.read(
        LocalSettingKeys.unreadMessageBadge,
      ),
    );
  }

  Future<NotificationEnableResult> setNotificationsEnabled({
    required bool value,
  }) async {
    if (value) {
      final SystemPermissionOutcome outcome = await requestSystemPermission(
        SystemPermissionKind.notifications,
      );
      ref
        ..invalidate(pushNotificationPermissionGrantedProvider)
        ..invalidate(pushNotificationRequiresSystemSettingsProvider);
      if (outcome != SystemPermissionOutcome.granted) {
        if (outcome == SystemPermissionOutcome.requiresSettings) {
          return NotificationEnableResult.requiresSystemSettings;
        }
        return NotificationEnableResult.permissionDenied;
      }
    }
    ref
        .read(localSettingsStoreProvider)
        .write(LocalSettingKeys.notificationsEnabled, value);
    state = state.copyWith(notificationsEnabled: value);
    return NotificationEnableResult.success;
  }

  Future<void> setTtsNotificationMode(TtsNotificationMode mode) async {
    ref
        .read(localSettingsStoreProvider)
        .write(LocalSettingKeys.ttsNotificationMode, mode.index);
    state = state.copyWith(ttsNotificationMode: mode);
  }

  Future<void> setUnreadMessageBadgeEnabled({required bool value}) async {
    ref
        .read(localSettingsStoreProvider)
        .write(LocalSettingKeys.unreadMessageBadge, value);
    state = state.copyWith(unreadMessageBadgeEnabled: value);
  }
}
