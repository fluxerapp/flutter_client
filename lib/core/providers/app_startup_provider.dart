import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/deep_links/deep_link_handler.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/premium/premium_state_sync_provider.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/fluxer_sfx_provider.dart';
import 'package:fluxer_app/core/providers/gateway_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/push/fcm/fcm_entrypoint.dart';
import 'package:fluxer_app/core/push/fcm/fcm_mobile_device_registration.dart';
import 'package:fluxer_app/core/push/fcm/fcm_notification_tap_binding.dart';
import 'package:fluxer_app/core/push/fcm/fcm_pending_notification_tap.dart';
import 'package:fluxer_app/core/push/local_push_notifications.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/push/push_notification_tap_handler.dart';
import 'package:fluxer_app/core/push/services/firebase_messaging_push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_mobile_device_registration.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_gateway_listener_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_sync_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_relationships_sync_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_sync_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/profile/providers/status_expiry_scheduler.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/default_apps_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/shell/providers/current_user_private_provider.dart';
import 'package:fluxer_app/features/shell/providers/service_status_maintenance_provider.dart';
import 'package:fluxer_app/features/voice/services/voice_callkit_coordinator.dart';
import 'package:fluxer_app/features/voice/tts/fluxer_tts_provider.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_provider.g.dart';

@Riverpod(keepAlive: true)
class AppStartup extends _$AppStartup {
  @override
  Future<void> build() async {
    if (PushProviderGuard.isFirebaseMessaging && Platform.isAndroid) {
      ref.read(fcmNotificationTapBindingProvider);
    }
    debugPrint('[AppStartup] Starting…');
    await _restoreOrThrow();
    if (!ref.mounted) {
      return;
    }
    debugPrint('[AppStartup] Completed');
  }

  Future<void> retry() async {
    _invalidateGatewayBindings();
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(_restoreOrThrow);
  }

  Future<void> _restoreOrThrow() async {
    try {
      await _validateAndRestore();
    } catch (e, st) {
      talker.error('[AppStartup] Startup failed', e, st);
      rethrow;
    }
  }

  void _invalidateGatewayBindings() {
    ref
      ..invalidate(gatewayConnectBindingProvider)
      ..invalidate(gatewayEventListenerProvider)
      ..invalidate(gatewayStateListenerProvider)
      ..invalidate(gatewayForegroundListenerProvider)
      ..invalidate(gatewayReconnectBannerListenerProvider)
      ..invalidate(gatewayConnectionProvider);
  }

  void _attachAuthenticatedBindings() {
    ref
      ..read(gatewayConnectBindingProvider)
      ..read(gatewayEventListenerProvider)
      ..read(gatewayStateListenerProvider)
      ..read(gatewayForegroundListenerProvider)
      ..read(gatewayReconnectBannerListenerProvider)
      ..read(connectivityListenerProvider)
      ..read(gatewayEphemeralStateRecoveryListenerProvider)
      ..read(ackBatcherGatewayListenerProvider)
      ..read(fluxerSfxIncomingRingBindingProvider)
      ..read(fluxerMessageSfxBindingProvider)
      ..read(fluxerTtsBindingProvider)
      ..read(voiceCallKitCoordinatorProvider)
      ..read(friendRelationshipsSyncProvider)
      ..read(guildListSyncProvider)
      ..read(slowmodeSyncProvider)
      ..read(statusExpiryBindingProvider)
      ..read(premiumStateSyncBindingProvider);
  }

  Future<void> _validateAndRestore() async {
    final Stopwatch startupStopwatch = Stopwatch()..start();
    await ref.read(appRuntimeInfoProvider.future);
    if (!ref.mounted) {
      return;
    }
    final database = ref.read(fluxerDatabaseProvider);
    final authRepository = ref.read(authRepositoryProvider);
    final InstanceConfigSnapshot? activeSnapshot = await authRepository
        .resolveActiveInstanceSnapshot();
    if (!ref.mounted) {
      return;
    }
    if (activeSnapshot != null) {
      ref.read(activeInstanceProvider.notifier).applySnapshot(activeSnapshot);
    }

    final Future<void> emojiPreload = EmojiRegistry.preload();
    unawaited(FluxerHaptics.warmSend());
    unawaited(ref.read(wellKnownProvider.future));
    unawaited(EmojiSpriteSheet.preload());
    unawaited(bootstrapFcmAfterRunApp());
    debugPrint('[AppStartup] Database obtained, migrating legacy tokens…');
    await authRepository.migrateLegacyTokens();
    await authRepository.pruneTokenlessSessions();
    debugPrint('[AppStartup] Querying session…');

    var session = await authRepository.getActiveSession();
    debugPrint('[AppStartup] Session: ${session != null ? 'found' : 'none'}');

    if (session == null) {
      await emojiPreload;
      return;
    }

    UserPrivateResponse? validatedUser;
    while (session != null) {
      if (!ref.mounted) {
        return;
      }
      ref.read(fluxerAuthTokenProvider.notifier).setToken(session.token);

      try {
        final client = ref.read(fluxerClientProvider);
        final user = await client.users.getCurrentUser();
        if (!ref.mounted) {
          return;
        }
        validatedUser = user;

        await database.authSessionDao.updateUserData(
          userId: session.userId,
          username: user.username,
          discriminator: user.discriminator,
          avatar: user.avatar,
        );
        if (!ref.mounted) {
          return;
        }
        ref
            .read(currentUserEntitlementsProvider.notifier)
            .applyUserProfile(user);
        ref
            .read(currentUserPremiumTypeProvider.notifier)
            .set(user.premiumType?.json ?? 0);
        unawaited(refreshPremiumState(ref));
        break;
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
        debugPrint('[AppStartup] Server unreachable: $e');
        break;
      }
    }

    if (!ref.mounted) {
      return;
    }
    if (session == null) {
      ref.read(fluxerAuthTokenProvider.notifier).setToken(null);
      await emojiPreload;
      return;
    }

    ref.read(authStateProvider.notifier).setAuthenticated(value: true);
    ref.read(currentUserIdProvider.notifier).set(session.userId);
    if (validatedUser != null) {
      ref
          .read(userSettingsViewModelProvider.notifier)
          .applyStartupProfile(validatedUser);
      ref.read(currentUserPrivateReadProvider.notifier).startupUser =
          validatedUser;
      unawaited(
        ref
            .read(sensitiveContentProvider.notifier)
            .hydrateFromLocal(validatedUser: validatedUser),
      );
    } else {
      unawaited(ref.read(userSettingsViewModelProvider.notifier).loadProfile());
      unawaited(ref.read(currentUserPrivateReadProvider.notifier).refresh());
      unawaited(ref.read(sensitiveContentProvider.notifier).hydrateFromLocal());
    }
    unawaited(ref.read(accountManagerProvider.notifier).loadAccounts());
    final String? token = ref.read(fluxerAuthTokenProvider);
    if (token == null || token.isEmpty) {
      talker.error('[AppStartup] Auth token missing before gateway bind');
      ref.read(authStateProvider.notifier).setAuthenticated(value: false);
      await emojiPreload;
      return;
    }
    _attachAuthenticatedBindings();
    await Future.wait<void>([
      ref.read(themePreferenceProvider.notifier).load(session.userId),
      ref.read(appearancePreferencesProvider.notifier).load(session.userId),
      ref.read(chatPreferencesProvider.notifier).load(session.userId),
      ref.read(advancedPreferencesProvider.notifier).load(session.userId),
      ref.read(defaultAppsPreferencesProvider.notifier).load(session.userId),
      ref.read(voiceSettingsProvider.notifier).load(session.userId),
    ]);
    if (!ref.mounted) {
      return;
    }
    unawaited(ref.read(matureContentAgreementsProvider.notifier).reload());

    unawaited(
      ref.read(serviceStatusMaintenanceReadProvider.notifier).refresh(),
    );

    ref.read(deepLinkHandlerProvider.notifier).processPendingDeepLink();
    ref.read(pendingPushNotificationPathProvider.notifier).flushIfReady();

    debugPrint(
      '[AppStartup] Completed in ${startupStopwatch.elapsedMilliseconds}ms',
    );

    if (PushProviderGuard.isFirebaseMessaging && Platform.isAndroid) {
      ref.read(pendingPushNotificationPathProvider);
      await LocalPushNotifications().ensureInitialized(
        onNotificationTap: ref
            .read(pushNotificationTapHandlerProvider.notifier)
            .handlePayloadJson,
      );
      if (!ref.mounted) {
        return;
      }
      await FcmPendingNotificationTap.flushToHandler(
        ref.read(pushNotificationTapHandlerProvider.notifier).handlePayloadJson,
      );
      unawaited(FirebaseMessagingPushService.bootstrapAfterAuth());
    }
    if (!ref.mounted) {
      return;
    }
    if (PushProviderGuard.isFirebaseMessaging) {
      ref.read(fcmMobileDeviceRegistrationProvider);
    }
    if (PushProviderGuard.isUnifiedPush) {
      ref.read(unifiedPushMobileDeviceRegistrationProvider);
    }

    await emojiPreload;

    debugPrint(
      '[AppStartup] Session restored '
      'for user ${session.userId}',
    );
  }
}
