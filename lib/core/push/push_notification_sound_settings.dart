import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class PushNotificationSoundSettings {
  const PushNotificationSoundSettings({
    required this.message,
    required this.directMessage,
  });

  factory PushNotificationSoundSettings.fromPreferences(
    SoundPreferencesState prefs,
  ) {
    return PushNotificationSoundSettings(
      message: prefs.isSoundTypeEnabled(kSoundTypeMessage),
      directMessage: prefs.isSoundTypeEnabled(kSoundTypeDirectMessage),
    );
  }

  final bool message;
  final bool directMessage;

  bool allows(Map<String, String> payload) {
    return isDmPushPayload(payload) ? directMessage : message;
  }

  @override
  bool operator ==(Object other) {
    return other is PushNotificationSoundSettings &&
        other.message == message &&
        other.directMessage == directMessage;
  }

  @override
  int get hashCode => Object.hash(message, directMessage);
}

String _messageKey(String userId) => 'push_notification_sound.$userId.message';

String _directMessageKey(String userId) =>
    'push_notification_sound.$userId.direct_message';

Future<PushNotificationSoundSettings?> _readPushNotificationSoundSettings(
  String? userId,
) async {
  if (userId == null || userId.isEmpty) {
    return null;
  }
  try {
    final SharedPreferencesAsync store = SharedPreferencesAsync();
    final bool? message = await store.getBool(_messageKey(userId));
    final bool? directMessage = await store.getBool(_directMessageKey(userId));
    if (message == null || directMessage == null) {
      return null;
    }
    return PushNotificationSoundSettings(
      message: message,
      directMessage: directMessage,
    );
  } on Object {
    return null;
  }
}

Future<void> writePushNotificationSoundSettings(
  String userId,
  PushNotificationSoundSettings settings,
) async {
  try {
    final SharedPreferencesAsync store = SharedPreferencesAsync();
    await store.setBool(_messageKey(userId), settings.message);
    await store.setBool(_directMessageKey(userId), settings.directMessage);
  } on Object {
    return;
  }
}

Future<bool> isPushNotificationSoundEnabled(Map<String, String> payload) async {
  final PushNotificationSoundSettings? settings =
      await _readPushNotificationSoundSettings(payload['target_user_id']);
  return settings?.allows(payload) ?? true;
}

typedef PushNotificationSoundSettingsWriter =
    Future<void> Function(
      String userId,
      PushNotificationSoundSettings settings,
    );

class PushNotificationSoundSettingsMirror {
  PushNotificationSoundSettingsMirror(this._write);

  final PushNotificationSoundSettingsWriter _write;
  String? _userId;
  PushNotificationSoundSettings? _settings;

  void sync({required String? userId, required SoundPreferencesState prefs}) {
    if (userId == null || userId.isEmpty) {
      return;
    }
    final PushNotificationSoundSettings next =
        PushNotificationSoundSettings.fromPreferences(prefs);
    if (userId == _userId && next == _settings) {
      return;
    }
    _userId = userId;
    _settings = next;
    unawaited(_write(userId, next));
  }
}
