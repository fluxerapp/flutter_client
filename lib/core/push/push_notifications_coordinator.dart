import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/push_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
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
import 'package:fluxer_app/core/push/push_notification_tap_handler.dart';
import 'package:fluxer_app/core/push/push_service.dart';
import 'package:fluxer_app/core/push/push_tray_registry_provider.dart';
import 'package:fluxer_app/core/push/services/apple_push_service.dart';
import 'package:fluxer_app/core/push/services/unified_push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_distributor_setup.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_mobile_device_registration.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_no_distributor_dismissal_provider.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_vapid_cache.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/voice/utils/voice_call_ring.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_notifications_coordinator.g.dart';

@Riverpod(keepAlive: true)
class PushNotificationsCoordinator extends _$PushNotificationsCoordinator {
  StreamSubscription<PushMessage>? _messageSubscription;
  final LocalPushNotifications _localPush = LocalPushNotifications();
  bool _bootstrapScheduled = false;

  @override
  bool build() {
    ref
      ..read(applePushNotificationTapBindingProvider)
      ..read(fcmNotificationTapBindingProvider)
      ..listen<String?>(currentUserIdProvider, (String? _, String? next) {
        unawaited(ApplePushService.syncActiveUserId(next));
      }, fireImmediately: true);
    if (!_bootstrapScheduled) {
      _bootstrapScheduled = true;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        unawaited(_runBootstrap());
      });
    }
    ref.onDispose(() {
      unawaited(_messageSubscription?.cancel());
      _messageSubscription = null;
    });
    return false;
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
      if (PushProviderGuard.isUnifiedPush) {
        final UnifiedPushService unifiedPush =
            pushService as UnifiedPushService;
        await _initializeUnifiedPush(unifiedPush);
      } else {
        await pushService.initialize();
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
      if (PushProviderGuard.isUnifiedPush) {
        unawaited(
          ref
              .read(unifiedPushMobileDeviceRegistrationProvider.notifier)
              .syncFromCurrentEndpoint(),
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

  Future<void> _initializeUnifiedPush(UnifiedPushService pushService) async {
    pushService.vapidNetworkResolver = () async {
      try {
        return (await ref.read(wellKnownProvider.future)).push.publicVapidKey;
      } on Object catch (e) {
        if (kDebugMode) {
          debugPrint('[PushNotificationsCoordinator] VAPID fetch failed: $e');
        }
        return null;
      }
    };
    final String? vapid = await pushService.ensureVapidPublicKey();
    if (hasUnifiedPushVapid(vapid)) {
      final String? userId = ref.read(currentUserIdProvider);
      if (userId != null) {
        await pushService.persistVapidForUser(
          userId: userId,
          vapidPublicKey: vapid!,
        );
      }
    }
    await pushService.initializeWithOptions(vapid: vapid);
    await pushService.applyVapidAndReregisterIfNeeded(vapid);
    if (pushService.needsDistributorPicker) {
      final bool dismissed = await ref
          .read(unifiedPushNoDistributorDismissalStorageProvider)
          .isDismissed();
      if (!dismissed) {
        ref.read(unifiedPushDistributorSetupProvider.notifier).requestPicker();
      }
    } else {
      final bool hasPersisted = await ref
          .read(unifiedPushMobileDeviceRegistrationProvider.notifier)
          .hasPersistedSubscriptionForCurrentUser();
      await pushService.syncRegistration(
        hasPersistedSubscription: hasPersisted,
      );
    }
  }
}
