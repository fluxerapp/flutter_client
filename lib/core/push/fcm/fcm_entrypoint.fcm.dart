import 'dart:io';
import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/push/android/android_push_pipeline.dart';
import 'package:fluxer_fcm/fcm_background_handler.dart';
import 'package:fluxer_fcm/fcm_ciphertext_hooks.dart';
import 'package:fluxer_fcm/fluxer_fcm_bootstrap.dart';

@pragma('vm:entry-point')
Future<void> fcmBackgroundMessageHandlerEntry(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  _configureFcmBootstrap();
  await fcmBackgroundMessageHandler(message);
}

void _configureFcmBootstrap() {
  FcmCiphertextHooks.onCiphertext =
      ({required String ciphertextBase64, required bool backgroundMode}) async {
        await AndroidPushPipeline.handleCiphertext(
          ciphertextBase64: ciphertextBase64,
          backgroundMode: backgroundMode,
        );
      };
}

Future<void> bootstrapFcmIfNeeded() async {
  if (!PushProviderGuard.isFirebaseMessaging || !Platform.isAndroid) {
    return;
  }
  try {
    _configureFcmBootstrap();
    await FluxerFcmBootstrap.bootstrapIfNeeded(
      onBackgroundMessage: fcmBackgroundMessageHandlerEntry,
    );
  } on Object catch (error, stackTrace) {
    if (kDebugMode) {
      debugPrint('[FCM] bootstrapIfNeeded failed: $error\n$stackTrace');
    }
    rethrow;
  }
}

Future<void> bootstrapFcmAfterRunApp() async {
  if (!PushProviderGuard.isFirebaseMessaging || !Platform.isAndroid) {
    return;
  }
  try {
    await FluxerFcmBootstrap.bootstrapAfterRunApp();
  } on Object catch (error, stackTrace) {
    if (kDebugMode) {
      debugPrint('[FCM] bootstrapAfterRunApp failed: $error\n$stackTrace');
    }
    rethrow;
  }
}
