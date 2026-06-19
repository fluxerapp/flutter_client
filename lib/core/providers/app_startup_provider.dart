import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/deep_links/deep_link_handler.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/fluxer_sfx_provider.dart';
import 'package:fluxer_app/core/providers/gateway_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/push/apns/apns_mobile_device_registration.dart';
import 'package:fluxer_app/core/push/fcm/fcm_entrypoint.dart';
import 'package:fluxer_app/core/push/fcm/fcm_mobile_device_registration.dart';
import 'package:fluxer_app/core/push/fcm/fcm_notification_tap_binding.dart';
import 'package:fluxer_app/core/push/local_push_notifications.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/push/push_notification_tap_handler.dart';
import 'package:fluxer_app/core/push/services/firebase_messaging_push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_mobile_device_registration.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_gateway_listener_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_relationships_sync_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_sync_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/profile/providers/status_expiry_scheduler.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_provider.g.dart';

@Riverpod(keepAlive: true)
class AppStartup extends _$AppStartup {
  @override
  Future<void> build() async {
    try {
      debugPrint('[AppStartup] Starting…');
      await _validateAndRestore();
      debugPrint('[AppStartup] Completed');
    } on Exception catch (e, st) {
      debugPrint('[AppStartup] Unhandled error during startup: $e\n$st');
      rethrow;
    }
  }

  Future<void> retry() async {
    await _validateAndRestore();
  }

  Future<void> _validateAndRestore() async {
    final Stopwatch startupStopwatch = Stopwatch()..start();
    await ref.read(appRuntimeInfoProvider.future);
    unawaited(EmojiRegistry.preload());
    unawaited(ref.read(wellKnownProvider.future));
    unawaited(EmojiSpriteSheet.preload());
    unawaited(bootstrapFcmAfterRunApp());
    final database = ref.read(fluxerDatabaseProvider);
    final authRepository = ref.read(authRepositoryProvider);
    debugPrint('[AppStartup] Database obtained, migrating legacy tokens…');
    await authRepository.migrateLegacyTokens();
    debugPrint('[AppStartup] Querying session…');

    var session = await authRepository.getActiveSession();
    debugPrint('[AppStartup] Session: ${session != null ? 'found' : 'none'}');

    if (session == null) {
      return;
    }

    // Validate the session and try fallback sessions on 401.
    while (session != null) {
      ref.read(fluxerAuthTokenProvider.notifier).setToken(session.token);

      try {
        final client = ref.read(fluxerClientProvider);
        final user = await client.users.getCurrentUser();

        // Cache user data for account selector.
        await database.authSessionDao.updateUserData(
          userId: session.userId,
          username: user.username,
          discriminator: user.discriminator,
          avatar: user.avatar,
        );
        ref
            .read(currentUserPremiumTypeProvider.notifier)
            .set(user.premiumType?.json ?? 0);
        break; // Session is valid.
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          debugPrint(
            '[AppStartup] Session invalid for ${session.userId}, '
            'trying next…',
          );
          await database.authSessionDao.markInvalid(session.userId);
          session = await authRepository.getActiveSession();
          continue;
        }
        // Other errors — server unreachable, proceed authenticated.
        debugPrint('[AppStartup] Server unreachable: $e');
        break;
      }
    }

    if (session == null) {
      ref.read(fluxerAuthTokenProvider.notifier).setToken(null);
      return;
    }

    ref.read(authStateProvider.notifier).setAuthenticated(value: true);
    ref.read(currentUserIdProvider.notifier).set(session.userId);
    await Future.wait<void>([
      ref.read(themePreferenceProvider.notifier).load(session.userId),
      ref.read(appearancePreferencesProvider.notifier).load(session.userId),
      ref.read(chatPreferencesProvider.notifier).load(session.userId),
    ]);
    unawaited(ref.read(sensitiveContentProvider.notifier).load());
    unawaited(ref.read(matureContentAgreementsProvider.notifier).reload());

    ref
      ..read(gatewayConnectBindingProvider)
      ..read(gatewayEventListenerProvider)
      ..read(gatewayStateListenerProvider)
      ..read(gatewayForegroundListenerProvider)
      ..read(gatewayReconnectToastListenerProvider)
      ..read(connectivityListenerProvider)
      ..read(gatewayEphemeralStateRecoveryListenerProvider)
      ..read(ackBatcherGatewayListenerProvider)
      ..read(fluxerSfxIncomingRingBindingProvider)
      ..read(fluxerMessageSfxBindingProvider)
      ..read(friendRelationshipsSyncProvider)
      ..read(guildListSyncProvider)
      ..read(statusExpiryBindingProvider);

    ref.read(deepLinkHandlerProvider.notifier).processPendingDeepLink();
    ref.read(pendingPushNotificationPathProvider.notifier).flushIfReady();

    debugPrint(
      '[AppStartup] Completed in ${startupStopwatch.elapsedMilliseconds}ms',
    );

    if (PushProviderGuard.isFirebaseMessaging && Platform.isAndroid) {
      ref
        ..read(pendingPushNotificationPathProvider)
        ..read(fcmNotificationTapBindingProvider);
      await LocalPushNotifications().ensureInitialized(
        onNotificationTap: ref
            .read(pushNotificationTapHandlerProvider.notifier)
            .handlePayloadJson,
      );
      unawaited(FirebaseMessagingPushService.bootstrapAfterAuth());
    }
    if (PushProviderGuard.isApple) {
      ref.read(apnsMobileDeviceRegistrationProvider);
    }
    if (PushProviderGuard.isFirebaseMessaging) {
      ref.read(fcmMobileDeviceRegistrationProvider);
    }
    if (PushProviderGuard.isUnifiedPush) {
      ref.read(unifiedPushMobileDeviceRegistrationProvider);
    }

    debugPrint(
      '[AppStartup] Session restored '
      'for user ${session.userId}',
    );
  }
}
