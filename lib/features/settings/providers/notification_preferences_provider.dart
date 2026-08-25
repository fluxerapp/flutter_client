import 'dart:async';

import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/features/settings/domain/tts_notification_mode.dart';
import 'package:fluxer_app/features/shell/providers/push_notification_permission_status_provider.dart';
import 'package:fluxer_app/features/ui/system_permissions/system_permission_settings_prompt.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notification_preferences_provider.g.dart';

const String _kNotificationsEnabledKey = 'notification_prefs_enabled';
const String _kTtsNotificationModeKey = 'notification_prefs_tts_mode';

enum NotificationEnableResult {
  success,
  permissionDenied,
  requiresSystemSettings,
}

class NotificationPreferencesState {
  const NotificationPreferencesState({
    this.notificationsEnabled = true,
    this.ttsNotificationMode = TtsNotificationMode.never,
    this.isLoaded = false,
  });

  final bool notificationsEnabled;
  final TtsNotificationMode ttsNotificationMode;
  final bool isLoaded;

  NotificationPreferencesState copyWith({
    bool? notificationsEnabled,
    TtsNotificationMode? ttsNotificationMode,
    bool? isLoaded,
  }) {
    return NotificationPreferencesState(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      ttsNotificationMode: ttsNotificationMode ?? this.ttsNotificationMode,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}

@riverpod
class NotificationPreferences extends _$NotificationPreferences {
  @override
  NotificationPreferencesState build() {
    unawaited(_load());
    return const NotificationPreferencesState();
  }

  Future<void> _load() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool enabled = preferences.getBool(_kNotificationsEnabledKey) ?? true;
    final int modeIndex =
        preferences.getInt(_kTtsNotificationModeKey) ??
        TtsNotificationMode.never.index;
    final TtsNotificationMode mode = TtsNotificationMode
        .values[modeIndex.clamp(0, TtsNotificationMode.values.length - 1)];
    state = state.copyWith(
      notificationsEnabled: enabled,
      ttsNotificationMode: mode,
      isLoaded: true,
    );
  }

  Future<NotificationEnableResult> setNotificationsEnabled({
    required BuildContext context,
    required bool value,
  }) async {
    if (value) {
      final BuildContext? modalContext = resolveSystemPermissionContext(
        context,
      );
      final SystemPermissionOutcome outcome = await requestSystemPermission(
        SystemPermissionKind.notifications,
      );
      ref
        ..invalidate(pushNotificationPermissionGrantedProvider)
        ..invalidate(pushNotificationRequiresSystemSettingsProvider);
      if (outcome != SystemPermissionOutcome.granted) {
        if (outcome == SystemPermissionOutcome.requiresSettings) {
          if (modalContext != null && modalContext.mounted) {
            await SystemPermissionSettingsPrompt.show(
              modalContext,
              kind: SystemPermissionKind.notifications,
            );
          }
          return NotificationEnableResult.requiresSystemSettings;
        }
        return NotificationEnableResult.permissionDenied;
      }
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kNotificationsEnabledKey, value);
    state = state.copyWith(notificationsEnabled: value);
    return NotificationEnableResult.success;
  }

  Future<void> setTtsNotificationMode(TtsNotificationMode mode) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(_kTtsNotificationModeKey, mode.index);
    state = state.copyWith(ttsNotificationMode: mode);
  }
}
