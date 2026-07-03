import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_fcm/fcm_background_handler.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';
import 'package:fluxer_fcm/fcm_background_display_hooks.dart';
import 'package:fluxer_fcm/fcm_background_notification_tap_hooks.dart';
import 'package:fluxer_fcm/fcm_system_notification_cancel_hooks.dart';
import 'package:fluxer_fcm/firebase_options.dart';
import 'package:fluxer_fcm/fcm_tap_payload_cache_hooks.dart';
import 'package:fluxer_fcm/fluxer_fcm_push_service.dart';

typedef FcmTapPayloadEnricher =
    Future<Map<String, String>> Function({
      required Map<String, String> mappedPayload,
      String? gcmMessageId,
      Map<String, String> tapData,
    });

typedef FcmTapPayloadCacheSaver =
    Future<void> Function({
      required Map<String, String> payload,
      String? gcmMessageId,
    });

typedef FcmTapPayloadCachePredicate =
    bool Function(Map<String, String> payload);

typedef FcmBackgroundNotificationTapHandler =
    void Function(String? payloadJson);

typedef FcmBackgroundDisplayPredicate = bool Function(FcmPushMessage message);

class FluxerFcmBootstrap {
  FluxerFcmBootstrap._();

  static void configure({
    required FcmTapPayloadEnricher enrichTapPayload,
    required FcmTapPayloadCachePredicate shouldSaveTapPayloadCache,
    required FcmTapPayloadCacheSaver saveTapPayloadCache,
    FcmBackgroundNotificationTapHandler? onBackgroundNotificationTap,
    FcmNativeSystemNotificationCancelHandler? cancelFcmSystemDuplicates,
    FcmBackgroundDisplayPredicate? shouldDisplayBackgroundLocalNotification,
  }) {
    FcmTapPayloadCacheHooks.shouldSave = shouldSaveTapPayloadCache;
    FcmTapPayloadCacheHooks.save = saveTapPayloadCache;
    FcmBackgroundNotificationTapHooks.onTap = onBackgroundNotificationTap;
    FcmSystemNotificationCancelHooks.cancelDuplicates =
        cancelFcmSystemDuplicates;
    FcmBackgroundDisplayHooks.shouldDisplay =
        shouldDisplayBackgroundLocalNotification;
    FluxerFcmPushService.instance.tapPayloadEnricher =
        (RemoteMessage message, Map<String, String> mappedPayload) {
          return enrichTapPayload(
            mappedPayload: mappedPayload,
            gcmMessageId: message.messageId,
            tapData: message.data.map(
              (String key, dynamic value) =>
                  MapEntry<String, String>(key, value.toString()),
            ),
          );
        };
  }

  static bool shouldSaveTapPayloadCache(Map<String, String> payload) {
    return FcmTapPayloadCacheHooks.shouldSaveTapPayloadCache(payload);
  }

  static Future<void> saveTapPayloadCache({
    required Map<String, String> payload,
    String? gcmMessageId,
  }) async {
    await FcmTapPayloadCacheHooks.saveTapPayloadCache(
      payload: payload,
      gcmMessageId: gcmMessageId,
    );
  }

  static Future<void> bootstrapIfNeeded({
    required Future<void> Function(RemoteMessage message) onBackgroundMessage,
  }) async {
    try {
      FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    } on Object catch (error, stackTrace) {
      if (kDebugMode) {
        debugPrint(
          '[FluxerFcmBootstrap] background handler registration failed: '
          '$error\n$stackTrace',
        );
      }
      rethrow;
    }
  }

  static Future<void> bootstrapAfterRunApp() async {
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }
      await FluxerFcmPushService.instance.initialize();
    } on Object catch (error, stackTrace) {
      if (kDebugMode) {
        debugPrint(
          '[FluxerFcmBootstrap] bootstrapAfterRunApp failed: '
          '$error\n$stackTrace',
        );
      }
      rethrow;
    }
  }
}
