import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_fcm/firebase_options.dart';
import 'package:fluxer_fcm/fluxer_fcm_push_service.dart';

class FluxerFcmBootstrap {
  FluxerFcmBootstrap._();

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
