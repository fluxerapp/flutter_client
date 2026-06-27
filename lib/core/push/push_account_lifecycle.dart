import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_service.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/push/apns/apns_mobile_device_registration.dart';
import 'package:fluxer_app/core/push/fcm/fcm_mobile_device_registration.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/push/push_notification_clear.dart';
import 'package:fluxer_app/core/push/services/unified_push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_mobile_device_registration.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';

enum LeavePushAccountMode { switchAccount, signOut }

final class PushAccountLifecycle {
  const PushAccountLifecycle._();

  static Future<void> leaveActiveAccount(
    Ref ref, {
    required LeavePushAccountMode mode,
  }) async {
    final String? userId = ref.read(currentUserIdProvider);
    final bool isAuthenticated = ref.read(authStateProvider);
    if (userId == null || !isAuthenticated) {
      return;
    }
    ref.read(pendingPushNotificationPathProvider.notifier).clear();
    await AppIconBadgeService.clear();
    await PushNotificationClear.clearAllDelivered();
    if (PushProviderGuard.isApple) {
      await ref
          .read(apnsMobileDeviceRegistrationProvider.notifier)
          .unregisterCurrentToken();
    }
    if (PushProviderGuard.isFirebaseMessaging) {
      await ref
          .read(fcmMobileDeviceRegistrationProvider.notifier)
          .unregisterCurrentToken();
    }
    if (PushProviderGuard.isUnifiedPush) {
      await ref
          .read(unifiedPushMobileDeviceRegistrationProvider.notifier)
          .unregisterCurrentEndpoint();
      if (mode == LeavePushAccountMode.signOut) {
        await UnifiedPushService.instance.unregisterFromDistributor();
      }
    }
  }
}
