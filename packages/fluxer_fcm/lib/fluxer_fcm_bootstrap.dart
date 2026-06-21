import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluxer_fcm/fcm_background_handler.dart';
import 'package:fluxer_fcm/firebase_options.dart';
import 'package:fluxer_fcm/fluxer_fcm_push_service.dart';

typedef FcmTapPayloadEnricher = Future<Map<String, String>> Function({
  required Map<String, String> mappedPayload,
  String? gcmMessageId,
  Map<String, String> tapData,
});

typedef FcmTapPayloadCacheSaver = Future<void> Function({
  required Map<String, String> payload,
  String? gcmMessageId,
});

typedef FcmTapPayloadCachePredicate = bool Function(Map<String, String> payload);

class FluxerFcmBootstrap {
  FluxerFcmBootstrap._();

  static FcmTapPayloadCachePredicate? _shouldSaveTapPayloadCache;
  static FcmTapPayloadCacheSaver? _saveTapPayloadCache;

  static void configure({
    required FcmTapPayloadEnricher enrichTapPayload,
    required FcmTapPayloadCachePredicate shouldSaveTapPayloadCache,
    required FcmTapPayloadCacheSaver saveTapPayloadCache,
  }) {
    _shouldSaveTapPayloadCache = shouldSaveTapPayloadCache;
    _saveTapPayloadCache = saveTapPayloadCache;
    FluxerFcmPushService.instance.tapPayloadEnricher = (
      RemoteMessage message,
      Map<String, String> mappedPayload,
    ) {
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
    return _shouldSaveTapPayloadCache?.call(payload) ?? false;
  }

  static Future<void> saveTapPayloadCache({
    required Map<String, String> payload,
    String? gcmMessageId,
  }) async {
    final FcmTapPayloadCacheSaver? saver = _saveTapPayloadCache;
    if (saver == null) {
      return;
    }
    await saver(payload: payload, gcmMessageId: gcmMessageId);
  }

  static Future<void> bootstrapIfNeeded() async {
    FirebaseMessaging.onBackgroundMessage(fcmBackgroundMessageHandler);
  }

  static Future<void> bootstrapAfterRunApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FluxerFcmPushService.instance.initialize();
  }
}
