import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/push_provider.dart';
import 'package:fluxer_app/core/push/android/android_push_pipeline.dart';
import 'package:fluxer_app/core/push/apns/apns_mobile_device_registration.dart';
import 'package:fluxer_app/core/push/apns/apns_voip_mobile_device_registration.dart';
import 'package:fluxer_app/core/push/apns/apple_push_notification_tap_binding.dart';
import 'package:fluxer_app/core/push/fcm/fcm_mobile_device_registration.dart';
import 'package:fluxer_app/core/push/fcm/fcm_notification_tap_binding.dart';
import 'package:fluxer_app/core/push/foreground_push_notification_policy.dart';
import 'package:fluxer_app/core/push/local_push_notifications.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_clear.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/push/push_notification_permission.dart';
import 'package:fluxer_app/core/push/push_notification_sound_settings.dart';
import 'package:fluxer_app/core/push/push_notification_tap_handler.dart';
import 'package:fluxer_app/core/push/push_service.dart';
import 'package:fluxer_app/core/push/push_tray_registry_provider.dart';
import 'package:fluxer_app/core/push/services/apple_push_service.dart';
import 'package:fluxer_app/core/push/services/unified_push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_distributor_setup.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_mobile_device_registration.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_call_ring.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_notifications_coordinator.g.dart';

@Riverpod(keepAlive: true)
class PushNotificationsCoordinator extends _$PushNotificationsCoordinator {
  StreamSubscription<PushMessage>? _messageSubscription;
  StreamSubscription<void>? _pickerSubscription;
  StreamSubscription<void>? _hydrationSubscription;
  final PushNotificationSoundSettingsMirror _soundSettingsMirror =
      PushNotificationSoundSettingsMirror(_writeSoundSettings);
  final LocalPushNotifications _localPush = LocalPushNotifications();
  bool _bootstrapScheduled = false;

  @override
  bool build() {
    ref
      ..read(applePushNotificationTapBindingProvider)
      ..read(fcmNotificationTapBindingProvider)
      ..listen<String?>(currentUserIdProvider, (String? _, String? next) {
        unawaited(ApplePushService.syncActiveUserId(next));
      }, fireImmediately: true)
      ..listen<SoundPreferencesState>(soundPreferencesProvider, (_, _) {
        _syncSoundSettings();
      });
    unawaited(_hydrationSubscription?.cancel());
    _hydrationSubscription = ref
        .read(syncedPreferencesStoreProvider)
        .hydrations
        .listen((_) => _syncSoundSettings());
    _syncSoundSettings();
    if (PushProviderGuard.isUnifiedPush) {
      unawaited(_pickerSubscription?.cancel());
      _pickerSubscription = UnifiedPushService
          .instance
          .distributorPickerRequests
          .listen((_) {
            _requestUnifiedPushDistributorPicker();
          });
      if (UnifiedPushService.instance.needsDistributorPicker) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _requestUnifiedPushDistributorPicker();
        });
      }
    }
    if (!_bootstrapScheduled) {
      _bootstrapScheduled = true;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        unawaited(_runBootstrap());
      });
    }
    ref.onDispose(() {
      unawaited(_messageSubscription?.cancel());
      _messageSubscription = null;
      unawaited(_pickerSubscription?.cancel());
      _pickerSubscription = null;
      unawaited(_hydrationSubscription?.cancel());
      _hydrationSubscription = null;
    });
    return false;
  }

  void _syncSoundSettings() {
    if (!ref.read(syncedPreferencesStoreProvider).hasHydrated) {
      return;
    }
    _soundSettingsMirror.sync(
      userId: ref.read(currentUserIdProvider),
      prefs: ref.read(soundPreferencesProvider),
    );
  }

  static Future<void> _writeSoundSettings(
    String userId,
    PushNotificationSoundSettings settings,
  ) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => ApplePushService.syncNotificationSoundSettings(
        userId,
        settings,
      ),
      TargetPlatform.android => writePushNotificationSoundSettings(
        userId,
        settings,
      ),
      _ => Future<void>.value(),
    };
  }

  Future<void> _runBootstrap() async {
    try {
      ref.read(fcmNotificationTapBindingProvider);
      final bool granted = await requestPushNotificationPermission();
      if (kDebugMode) {
        debugPrint(
          '[PushNotificationsCoordinator] notification permission: $granted',
        );
      }
      await _localPush.ensureInitialized(
        onNotificationTap: ref
            .read(pushNotificationTapHandlerProvider.notifier)
            .handlePayloadJson,
      );
      final PushService pushService = ref.read(pushServiceProvider);
      await _messageSubscription?.cancel();
      _messageSubscription = pushService.watchMessages().listen(
        _onIncomingPush,
        onError: (Object err, StackTrace st) {
          if (kDebugMode) {
            debugPrint('[PushNotificationsCoordinator] message stream: $err');
          }
        },
      );
      await pushService.initialize();
      if (PushProviderGuard.isUnifiedPush) {
        await ref
            .read(unifiedPushMobileDeviceRegistrationProvider.notifier)
            .syncAllAccounts();
      }
      if (PushProviderGuard.isApple) {
        unawaited(
          ref.read(apnsMobileDeviceRegistrationProvider.notifier).sync(),
        );
        unawaited(
          ref.read(apnsVoipMobileDeviceRegistrationProvider.notifier).sync(),
        );
      }
      if (PushProviderGuard.isFirebaseMessaging) {
        unawaited(
          ref.read(fcmMobileDeviceRegistrationProvider.notifier).sync(),
        );
      }
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[PushNotificationsCoordinator] bootstrap failed: $e\n$st');
      }
    }
  }

  void _onIncomingPush(PushMessage message) {
    final bool isForeground = ref.read(appUiForegroundProvider);
    final String? activeUserId = ref.read(currentUserIdProvider);
    if (!ForegroundPushNotificationPolicy.shouldProcessPush(
      isAppForeground: isForeground,
      payload: message.payload,
      activeUserId: activeUserId,
    )) {
      if (!isNotificationClearPayload(message.payload)) {
        ref
            .read(pushTrayRegistryProvider)
            .markForegroundPushSuppressed(message.payload);
      }
      if (kDebugMode) {
        debugPrint(
          '[PushNotificationsCoordinator] skip foreground push '
          'id=${message.id}',
        );
      }
      return;
    }
    if (isNotificationClearPayload(message.payload)) {
      unawaited(PushNotificationClear.handleClearPayload(message.payload));
      return;
    }
    if (PushProviderGuard.isApple) {
      return;
    }
    final Map<String, String> payload =
        ForegroundPushNotificationPolicy.notificationPayloadForDisplay(
          payload: message.payload,
          isAppForeground: isForeground,
          activeUserId: activeUserId,
        );
    final PushMessage toShow = identical(payload, message.payload)
        ? message
        : PushMessage(
            id: message.id,
            title: message.title,
            body: message.body,
            payload: payload,
          );
    unawaited(_showAndroidPushIfNotRinging(toShow));
  }

  Future<void> _showAndroidPushIfNotRinging(PushMessage message) async {
    if (isCallRingPayload(message.payload) ||
        await AndroidPushPipeline.collidesWithVisibleCall(message.payload)) {
      return;
    }
    await _localPush.showPushMessage(message);
  }

  void _requestUnifiedPushDistributorPicker() {
    if (!ref.mounted || !UnifiedPushService.instance.needsDistributorPicker) {
      return;
    }
    ref.read(unifiedPushDistributorSetupProvider.notifier).requestPicker();
  }
}
